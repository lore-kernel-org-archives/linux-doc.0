Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793673200;
	b=nS++jvQdYlCzdWvPA0EtTWCp6hTR3yi+/NT6R0Oy+cDyVBqZxVk+HY8HhZ/aPga3k8m1
	 vh/7wibN8xhNwPOKg0+wYMHQDIbkgS47+m50O20wgwLXNQtW3rqOQhomhtdR+eYJ8xZQ9
	 tpr2CnkTAwgpyTwOB+EXo4taLfFYvZ0Ld9tdX95H0i1ouqH+j88aKbV8f8aXCr3MnzmBB
	 d6FA4axfNF9MvyiBkqkBC0ww+piHo/L8wI89gC9wvXjUdcFye4ow7vSJHgadaVPjVviTv
	 mM7fgEANQUZ8mH2kQDj/JLWLGLKomseNi32QelTX2mOZ3zEVgw1mPRFbFGBZnCh1q7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793673200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ej64xMS8kGq5PBAWKWEJuwz7p+48gcc+V/GA+vPZ96I=;
	b=2fnEJkGBDFZrpwUpSK6++NvKUN6Y8C5n1GFG30iThI9Ox0oN2sSc52JNe3q5E0UQEjQ2
	 cHKmYxRsOpjTVNC5Eb8ZrW/UrSrM+iX7MKn8J85G1BNRS8vNJARKsiySra1iiLIEoJW3B
	 hmOe7+26K4F3UF75+GTlVyibq5e+tK0Fz7KK/j0nObJLnJPt8YkKIbdAJe77F/j4Iud28
	 dDlo/brHHByRtkr/bHTfH04WC32wvEoyDZVpQIEftgykTs9ry4OyhNGZOKuBV3gsUo6uR
	 a3+zjWS+fIyb9ZHuGAX/47yOPHX0Hud5uvciEa54wj2XJ/kRj9ey4jIEw0ChtT3uM1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=W+Y8XdQ6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA92606A327
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 02:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BA92606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=W+Y8XdQ6
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so2446a12.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 18:33:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793673197; cv=none;
        d=google.com; s=arc-20260327;
        b=THBbTNbxo86A24CYjkdmqtA5HQ9ExZeLF7RfD9yD3BeYdV6bRPNYcawmbLK1d0n0+U
         98iz/Ja0iBHNg8ewI182PYG7EwXYVj1QEoEm+QtPVYi0MBNMXGzePu+38BL1bkMDHKL6
         F8hAyWvfAe6L/zixNZJIKQPaRn5y/L1XOlUVfnh4+Yluo9jZPbh1dqThEZdW4DowKCuC
         /s5tjkMSRow778apS4CLCV7Ph6QQLexYHfW6ZBuNrrMXntt7fDzwgBzf+Fe6HnLSbbrm
         gbfZYQUCivCB8JfrcEyBEjAbUfAPuZQiSrx6Ys6n7PPoXRYy2nLJ01wL3+dQiNMIct6Y
         C0Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ej64xMS8kGq5PBAWKWEJuwz7p+48gcc+V/GA+vPZ96I=;
        fh=d1tKP5NCQoceq2dng2t081i8XqxcOZdiKbisDjbKfZw=;
        b=Laui7WB3REgrekXNfhCmbKmRwsGm9UUE//8BmmDmDwbgc1IeNAJQXTWLfa8iPoc/8S
         Nvy5M0aoPO5rSiIT3brfsc5lyIhqZfh1R7acJr5fe73PJWzhrl2RNqsC+RyD+f5jYQQE
         PYz2iYTFzMM3KI0J0Ga7YipiBazXmmnVoSFsZv06DfrMD/lGrP/qkNy5x4PABCQJuWPo
         UBlRKOTl1zHENKQR8hK1cWkV0ul8gm3HdrBy0bO6GZjxc9WG+9g/bV7PshZkqQbM0S/n
         XE4EWLL159fXvgBEo9EC4qqSATlIXUV90R1zlZTvgUl9SGKioIXMi2rPQiJe+wQTnHrn
         C+5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793673197; x=1794277997; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ej64xMS8kGq5PBAWKWEJuwz7p+48gcc+V/GA+vPZ96I=;
        b=W+Y8XdQ6mttNbu5uRt0Dl67uj5l4yIeG3+XlCGU8Y19J3q2isuYsf496D9tYXoyuyg
         13BBujovgk6uH/rSYkCLG19C99Sn88E7jLu6cOsZrqsuNvX7rN7cL+yHX7gV1v9fgM54
         4HUZhm3qaJCQGrcQWeCIGW4fHew8JWeDkGQyKL1fShzm85CINcbTxCPTfQHMFFNFYIy3
         YVzxjePngUrxjUDNYVne2nqa1lLRM9s4UMYrEBNdeYs6VKbpR6cU2ON1/hJu+Lf8TZFe
         Aw+IQ1Fy5lfdDe1PEIpvqWeKoZatrCP0JuzQ053+UDCA3FIorYE4ToJ5Hgo3M6j4/4zy
         jF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793673197; x=1794277997;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ej64xMS8kGq5PBAWKWEJuwz7p+48gcc+V/GA+vPZ96I=;
        b=FVc1szI41K6BS2hE0PB1GTs1ejmVdde9UqGhhgSABaKFmlA//Bl/6FCC/muOHZ2lBW
         ffVApHwBbxDUuRs4Gn8plPaNyifA8hJSZGfU9jc/wTGA4OkhIg21MOa5rhT8zINHA6vj
         OnTRKZeoGgXISYBkNGdIRTTfInU+dMSmSWf0dunbXPpz1/zn11RoxvLS86NrXnwIs2IZ
         Gcfq8UWx6Vk569tTwPHVpxkOoT0CQXxRfWlAfiHGH07Dd8Vhr4cwOgq+xButXZoYIlgl
         Gh/jQTJp2F3qzWCCeWl4raVbolZPf+cgLHpx7KcmZAP2QS+0jd64DbGiJWcY6/wJtv51
         qi+g==
X-Forwarded-Encrypted: i=1; AKwUvBymv/Y2GIZWWnq6OeWbBFvebF0XC5qagfn2QBI/1SW+O4/wclYvtomXUnUhhavBCEN88O1CKgAhZvA=@vger.kernel.org
X-Gm-Message-State: APuU4Z96JQFcStLzIaEiEkaCyAq4vlaWYiIiLSGtNZ4pRNbl5aEEy+F2
	J2TFnLoXcd+zw6rbHddIDx/0JJMn+N2qUmzPe3FaaR/1u0kAh2TZsTU4vbKke1SYouqO3KvJ8x9
	WgrOfbn+fY+g2clpbYilGr2dEDGtn7R4hGxGmDrRG
X-Gm-Gg: AYBFou0H3KST+6Xy50v01cYBrSVWOzHPSn7GE07YyJPxPgMw7oRsR6P3RKGHG4fPrQx
	HGzMR7w89NaruKrAgeTORqjX26b7UT8WzJEAKICDzcQwgkkvbOslICx3z6fmj+8tgURaToCrhBK
	5Eh3iwPkcIIqDaUANYDcrZmqgFPzNEUNMP7D0dmAezE0/q1jVrfEzwEPVYoJVb4xxKK56cwpP5k
	GJR4pZu+4ApGevMrjpEMC4hmbTkUYWPkAARoo3XFZLNVv7amkNYNBkFQKboiM06ht4hefZO8OJ/
	7EzMasEcbRwfjh74Qz0/2XelgyXY6MTbVVk5oxXRjuikhZnxBjNRNQvzPiw7CTLkxFLmGLky/Eb
	9WXZOtJa9Qasa4mUoVVNBFb+ISfOoSDkoNGPui5o=
X-Received: by 2002:a05:6402:312c:b0:6b4:597f:50ed with SMTP id
 4fb4d7f45d1cf-6b539d10cc7mr27911a12.5.1793673197149; Mon, 02 Nov 2026
 18:33:17 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102191438.1059771-1-sdf@fomichev.me> <20261102191438.1059771-7-sdf@fomichev.me>
 <CAHS8izMRtaL=kZaM29XQBodT8e+srppnK_DjNSTJnxFfNgG9aw@mail.gmail.com> <aukcZBLBir_91hPr@devvm16445.scu0.facebook.com>
In-Reply-To: <aukcZBLBir_91hPr@devvm16445.scu0.facebook.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 2 Nov 2026 18:33:05 -0800
X-Gm-Features: AclHuK821CTY_RbKAnEbXzfa7MUQLlmGp2kVuevnXDs5zsd5kldlK8Q3AHE6hIM
Message-ID: <CAHS8izMSpG-ng8WFi6K5oAuJP=Jq=vuxshuktObe3AM_iJRgvg@mail.gmail.com>
Subject: Re: [PATCH net-next 6/7] net: devmem: size TX net_iovs from the
 dmabuf sg table
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch, 
	edumazet@kernel.org, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, michael.chan@broadcom.com, 
	pavan.chebbi@broadcom.com, sdf@fomichev.me, bobbyeshleman@meta.com, 
	asml.silence@gmail.com, daniel@iogearbox.net, razor@blackwall.org, 
	leitao@debian.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 3:38=E2=80=AFPM Stanislav Fomichev <sdf.kernel@gmail=
.com> wrote:
>
> On 11/02, Mina Almasry wrote:
> > On Mon, Nov 2, 2026 at 11:14=E2=80=AFAM Stanislav Fomichev <sdf.kernel@=
gmail.com> wrote:
> > >
> > > PAGE_SIZE TX net_iovs cap devmem skbs at MAX_SKB_FRAGS pages (~68KB),
> > > which makes BIG TCP ineffective.
> > >
> > > TX net_iovs only need to be DMA contiguous. Use the largest power of =
2,
> > > up to 2MB, which aligns every DMA segment of the dmabuf:
> > > - 2MB hugepage-backed udmabufs get 2MB net_iovs
> > > - no UAPI change, TX addresses are dmabuf offsets
> > > - skbs are still bounded by TCP's size_goal, only frags get larger
> > >
> > > Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> > > ---
> > >  net/core/devmem.c      | 28 ++++++++++++++++++++++++++--
> > >  net/core/netdev-genl.c |  2 +-
> > >  2 files changed, 27 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/net/core/devmem.c b/net/core/devmem.c
> > > index 19c039ed2cb2..98c9594dbf99 100644
> > > --- a/net/core/devmem.c
> > > +++ b/net/core/devmem.c
> > > @@ -181,6 +181,20 @@ int net_devmem_bind_dmabuf_to_queue(struct net_d=
evice *dev, u32 rxq_idx,
> > >         return err;
> > >  }
> > >
> > > +static bool net_devmem_sgt_aligned(struct sg_table *sgt, size_t size=
)
> > > +{
> > > +       struct scatterlist *sg;
> > > +       unsigned int i;
> > > +
> > > +       for_each_sgtable_dma_sg(sgt, sg, i) {
> > > +               if (!IS_ALIGNED(sg_dma_address(sg), size) ||
> > > +                   !IS_ALIGNED(sg_dma_len(sg), size))
> > > +                       return false;
> > > +       }
> > > +       return true;
> > > +}
> > > +
> > > +/* niov_shift =3D=3D 0 picks the net_iov size from the dmabuf, TX on=
ly */
> > >  struct net_devmem_dmabuf_binding *
> > >  net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
> > >                        struct device *dma_dev,
> > > @@ -191,11 +205,11 @@ net_devmem_bind_dmabuf(struct net_device *dev, =
void *vdev,
> > >                        struct netlink_ext_ack *extack)
> > >  {
> > >         struct net_devmem_dmabuf_binding *binding;
> > > -       size_t niov_size =3D 1UL << niov_shift;
> > >         static u32 id_alloc_next;
> > >         struct scatterlist *sg;
> > >         struct dma_buf *dmabuf;
> > >         unsigned int sg_idx;
> > > +       size_t niov_size;
> > >         size_t niov_idx;
> > >         size_t i;
> > >         long err;
> > > @@ -221,7 +235,6 @@ net_devmem_bind_dmabuf(struct net_device *dev, vo=
id *vdev,
> > >         binding->tx_max_frag_size =3D dev->netmem_tx_max_frag_size;
> > >         write_pnet(&binding->net, sock_net(nl_sk));
> > >         binding->uid =3D sk_uid(nl_sk);
> > > -       binding->niov_shift =3D niov_shift;
> > >         xa_init_flags(&binding->bound_rxqs, XA_FLAGS_ALLOC);
> > >
> > >         err =3D percpu_ref_init(&binding->ref,
> > > @@ -266,6 +279,17 @@ net_devmem_bind_dmabuf(struct net_device *dev, v=
oid *vdev,
> > >                 goto err_unmap;
> > >         }
> > >
> > > +       if (!niov_shift) {
> > > +               niov_size =3D SZ_2M;
> > > +               while (niov_size > PAGE_SIZE &&
> > > +                      (!IS_ALIGNED(dmabuf->size, niov_size) ||
> > > +                       !net_devmem_sgt_aligned(binding->sgt, niov_si=
ze)))
> > > +                       niov_size /=3D 2;
> > > +               niov_shift =3D ilog2(niov_size);
> > > +       }
> > > +       binding->niov_shift =3D niov_shift;
> > > +       niov_size =3D 1UL << niov_shift;
> > > +
> >
> > How come we're not checknig the largest supported size of the netdev he=
re?
> >
> > Also, maybe should clarify in the cl with the largest supported size,
> > is it actually only powers of 2 up to that power of 2? Or all sizes up
> > to that (not-necassirly) power of 2 size?
>
> I think these are a bit orthogonal, no? We can have niovs larger than
> the HW can tx. If that's the case, we'll just sub-divide when we build
> the skb. If we limit to the same chunk the device can handle here,
> we might use 2 frags to send single chunk worth of data more often (offse=
t
> doesn't have to be aligned to the chunk size).
>
>
> Assuming device can only send 16K, current patch:
>
> [       2MB        ] 2BM niov
>      [ 16K ]         sending 16K from that 2MB will use one chunk
>
>
> Limiting chunks to device's chunk size:
>
> [ 16K ][ 16K ]       16K niov
>     [ 16K ]          sending 16K from offset 8K will have to use 2 frags
>
> (obviously, the same thing can happen with 2MB chunks, but less often)
>
> LMK if it does not sound convincing.

Ah, I see, the skb gets segmented somewhere else of course. Derp

Reviewed-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
