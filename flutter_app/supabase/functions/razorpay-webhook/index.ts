import { createClient } from 'https://esm.sh/@supabase/supabase-js@2';

async function hmacHex(secret: string, payload: string): Promise<string> {
  const key = await crypto.subtle.importKey('raw', new TextEncoder().encode(secret), { name: 'HMAC', hash: 'SHA-256' }, false, ['sign']);
  const sig = await crypto.subtle.sign('HMAC', key, new TextEncoder().encode(payload));
  return [...new Uint8Array(sig)].map((b) => b.toString(16).padStart(2, '0')).join('');
}

Deno.serve(async (req) => {
  try {
    const raw = await req.text();
    const signature = req.headers.get('x-razorpay-signature') ?? '';
    const secret = Deno.env.get('RAZORPAY_WEBHOOK_SECRET')!;
    const expected = await hmacHex(secret, raw);
    if (signature !== expected) return new Response('invalid signature', { status: 401 });

    const body = JSON.parse(raw);
    const supabase = createClient(Deno.env.get('SUPABASE_URL')!, Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!);
    const entity = body?.payload?.payment_link?.entity ?? body?.payload?.payment?.entity;
    const orderId = entity?.notes?.order_id;
    if (!orderId) return new Response('ok');

    const paymentId = entity?.payment_id ?? entity?.id ?? null;
    const status = body?.event === 'payment_link.paid' || body?.event === 'payment.captured' ? 'paid' : body?.event ?? 'updated';
    await supabase.from('payments').update({ payment_id: paymentId, status, raw_payload: body, updated_at: new Date().toISOString() }).eq('order_id', orderId);
    if (status === 'paid') await supabase.from('orders').update({ status: 'paid' }).eq('id', orderId);
    return new Response('ok');
  } catch (e) {
    return new Response(String(e), { status: 400 });
  }
});
