Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793652051;
	b=g6g8VImkX8eJhaqJOd2wWO5Wgw5LM2ksAFQ30nOOQMp3bPsC3KxW9eBC2xDDG+tyL4pN
	 OfU0hBg0EQNwdc/JGTBIquAuHc7FPk/vkPEQDGHw1pfXgVNcxTPFbtDvs2IU976bvw935
	 uRj2vktYWhrKvWiA8SMus9AJUKzNjPApl1cc5lGBvZI186F1KyOKGeS/YXTK5E3CWEvPj
	 nngUyvTt5+lV7iWEzHjzFLnvV8PlSWzm9Gn6sBl003iyRrFo7tjrUSn7s4/CTf4drKcfj
	 g9rwHQZocufg0nZzpNqr6KSOjlQuytKDDqembDSeK5w1HTcHMf7POZGtTekF5zwTQhg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793652051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rii+FZ54nJeZhKcJyKsTY7JZApppPOKhEtvxZ28gkHM=;
	b=Btz+mIxoZJ5gf7MrJJRusFRZWRDQsMRlXSjyO1x0Iknuwq3c8yS8sPVyyw3rPm8X+ubL
	 hcMvNBYV6iknMjT3z3/3Pb0/1idAShX8PWT7/yrJUw53w2XNchxwqCu1oEukaE0+H8UMZ
	 kbB8L4Sf98275tPMRwMs5Q2tx5wGCiNlnSccOfe++F2uU3pkITzbc/ZBv4mztDf8vE7y+
	 wMqhyvuPb8BtbSVu2O7X/qL4lJjS4rRdl6SVXfOEEldxcXlJSDi6GxbFZPG0lWvLZqM+A
	 JsCSghTKI9AL/t11HIqIpwLUDUzQXL5YEzcgfaM2ovDodQqJR3UWuti9ePkg+rATYJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iw8eUhKz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323F6606A329
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 20:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 323F6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iw8eUhKz
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso2227a12.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 12:40:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793652050; cv=none;
        d=google.com; s=arc-20260327;
        b=TVXCp3kXD1K4A3PhBH1r3doB3Qg3Ipl9QI+bW7f+94HLFY4AcWb9Tn6Zs1X7LRaL3y
         QJ/LKPjFioym4DsxQBGHnWG42o2DBd2WmKzI7+IpD6uR1+nP5NZetS9l/Tb5XHe16xXL
         8kP1rPKYiIS72E4C5xyra3KpOb21g/kxFPZq0e6YlDv8HDzNbjseUyIAWx2GCfXV+U5x
         uU/TOM4A44sYSfRmyLsrX3llubrtyEIPPvaC3GhIEneK6PmoOuleAjdsFFaToLe/3Kor
         BnmwoA2T8Hq3jqhDqv10iyWZ8ZHsqdcFP1cRIxvx6r/n2M3S9D/z/ZFeJGg1oz5zf3Oh
         kwFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rii+FZ54nJeZhKcJyKsTY7JZApppPOKhEtvxZ28gkHM=;
        fh=2uIQRuwFB3a1w56ihqIrdINsB0xU/U2G1kRIrYzl4R4=;
        b=izXhtU6ReHHU+P3YCr8IsaGfAVBSqYD4j8SCupfHv5v4RgV5k8QOEHqIxP9XN3YYRS
         Vzsj0BLRDzz8eVgfnrdD7oQjbD7x+AS1FxAXE4LEXVKBy0ZBObFOV9StgAOFC4jt2M6R
         P30FerOfutVBBKzPsGxoXnbxkexfi1WXKvKc+8NPssgWTXLS6hVeqly/xljoPcxBLEDC
         jIVoyyc17wya14U3Zp+rYx0wftp06cc/k/px4S/0isf0xQM4EmlNvwu78rNPq/aSq2pA
         88SWsgH4UyJCoNXAqOJI+nwn0DCh5CrIyC8naQMu0YXK0GSShc5IVtCXxdwVMrl3kAqN
         Pt3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793652050; x=1794256850; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rii+FZ54nJeZhKcJyKsTY7JZApppPOKhEtvxZ28gkHM=;
        b=iw8eUhKzqEV976RIJn4tR2PmiJL9FRIY9Kp51qDXP6argwSfIWngppv1VD1pPIYeYS
         BH484c8g4FTPDFfUvo1UBqhkwdMOkjkU7EaErTIbVhKE9/+vrqDYNXchW6nuJfUL5Q8F
         ufkMKljhW4SigjYFb+NBuzdvrNGKEndbvdzRRLhRt6U8UXSy92FLPg9YiCdpcyz4tz8t
         pTR6LvfWAa+Vwx9M7mlanfBkGTFSkAXhO3coj8bOHKL9NRZoxRxa1hIs0NWwiF5IiB0g
         yVyc2qY4XrVo0Xlyy1GEEOUBC9KTJmqqoBbyaW1nLyzM99OqkQmPztVaklFloR1hl2YO
         +PoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652050; x=1794256850;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rii+FZ54nJeZhKcJyKsTY7JZApppPOKhEtvxZ28gkHM=;
        b=glJ/wUTRE0wvsxBvVZ3Zc4ojQbboFp9o/rL+MsT5d7JtkjqkEE1y9JwuJmmBU1j7L9
         qU8SA4D1/djPJBmb5Xyeq4z65YKppvwsTqcGsf4Ne/CXrkTdiSDf06rKYaLb6L/GijT1
         GHErZJ2gRJHIrXbu5I5ZHWpSE6ee5azk67Bn07DALm6GMbOTRixYNDUz3Z8PI7qXduYB
         sDorrWun6gN2tkgmcxxoXq1vebT+JWNgg7YeM+TCThQbpxf27SCXCfGRZ8JZMRasmpOI
         A7CybIT4Q52OQS97qQO9IpMnH0CbyV5DOKl0ETjA55KpxnTvnMFYXWlVvKsimJNuq7dJ
         zM+w==
X-Forwarded-Encrypted: i=1; AKwUvByl+Ih1fUp5QlducNOlhOZ/nMDzShAqraqAqPMQnn0kAQbbLDXDSbnPeOgYyDCQiNDZZjQEP9K+ilU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gxvo2CWlxIa2SkkFFXNApQqjh7p80haPmMQKLTBUmviYjHgZq
	WGpV5L0oWKIjHVAk1gNa43yPdl5kUzVyh+E7/XvaDYD7KbjVn6ilVK8n2gJ5BKnEWj9pJYgRvO3
	5tUCVDb+lNdCkxUQlh/h05KezwayOToLB99Mu/Rq0
X-Gm-Gg: AYBFou3UHUTJedPfyO31AIx/VmhTzsx6OxwRV/hw4lgzbXO5Oh/dZT9nGREjE2xmAVt
	Fbg56eQQQSHF/Xy6nd1vfytMfWvIesdhfbBi+vJlBmm3BhxcK0LfRHkM2rlttYquTLOZzxze9Pi
	uBBfdEIDaLsikFrpCM2mZhtiDc7nwzzAyb97tSPtK4MWoesLRlqgTxqylbrhASo1KojgKXFlbF0
	H/sfur6Rc8kyytckSZp7NJr3kRaZWlT4MoutixF9Wna1ktRL1dYfZb47Yy8hkJRNL/j0KecVJ81
	mhpEbGb/f2KzCT84pI159ZkP8atayuvZlpxpCHzK8eNVQ/Bm8Ubpge25Tit7tbqti85X8U7+Z7D
	iuMkhq+nYZAESvHCPA90Vk7Rmt5roT4t4vnVzqiicpoxnhZbNtnuUhgO6xdZL7FOIpD4=
X-Received: by 2002:aa7:d794:0:b0:6b4:2188:97d0 with SMTP id
 4fb4d7f45d1cf-6b539d22220mr5870a12.6.1793652049063; Mon, 02 Nov 2026 12:40:49
 -0800 (PST)
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
In-Reply-To: <20261102191438.1059771-7-sdf@fomichev.me>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 2 Nov 2026 12:40:37 -0800
X-Gm-Features: AclHuK-QHSUFwb7InxS-A8g0MGgfg1Hp3eU1afIQI3kknV9M7EMlKPAHYQ2ow5c
Message-ID: <CAHS8izMRtaL=kZaM29XQBodT8e+srppnK_DjNSTJnxFfNgG9aw@mail.gmail.com>
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

On Mon, Nov 2, 2026 at 11:14=E2=80=AFAM Stanislav Fomichev <sdf.kernel@gmai=
l.com> wrote:
>
> PAGE_SIZE TX net_iovs cap devmem skbs at MAX_SKB_FRAGS pages (~68KB),
> which makes BIG TCP ineffective.
>
> TX net_iovs only need to be DMA contiguous. Use the largest power of 2,
> up to 2MB, which aligns every DMA segment of the dmabuf:
> - 2MB hugepage-backed udmabufs get 2MB net_iovs
> - no UAPI change, TX addresses are dmabuf offsets
> - skbs are still bounded by TCP's size_goal, only frags get larger
>
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> ---
>  net/core/devmem.c      | 28 ++++++++++++++++++++++++++--
>  net/core/netdev-genl.c |  2 +-
>  2 files changed, 27 insertions(+), 3 deletions(-)
>
> diff --git a/net/core/devmem.c b/net/core/devmem.c
> index 19c039ed2cb2..98c9594dbf99 100644
> --- a/net/core/devmem.c
> +++ b/net/core/devmem.c
> @@ -181,6 +181,20 @@ int net_devmem_bind_dmabuf_to_queue(struct net_devic=
e *dev, u32 rxq_idx,
>         return err;
>  }
>
> +static bool net_devmem_sgt_aligned(struct sg_table *sgt, size_t size)
> +{
> +       struct scatterlist *sg;
> +       unsigned int i;
> +
> +       for_each_sgtable_dma_sg(sgt, sg, i) {
> +               if (!IS_ALIGNED(sg_dma_address(sg), size) ||
> +                   !IS_ALIGNED(sg_dma_len(sg), size))
> +                       return false;
> +       }
> +       return true;
> +}
> +
> +/* niov_shift =3D=3D 0 picks the net_iov size from the dmabuf, TX only *=
/
>  struct net_devmem_dmabuf_binding *
>  net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
>                        struct device *dma_dev,
> @@ -191,11 +205,11 @@ net_devmem_bind_dmabuf(struct net_device *dev, void=
 *vdev,
>                        struct netlink_ext_ack *extack)
>  {
>         struct net_devmem_dmabuf_binding *binding;
> -       size_t niov_size =3D 1UL << niov_shift;
>         static u32 id_alloc_next;
>         struct scatterlist *sg;
>         struct dma_buf *dmabuf;
>         unsigned int sg_idx;
> +       size_t niov_size;
>         size_t niov_idx;
>         size_t i;
>         long err;
> @@ -221,7 +235,6 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *=
vdev,
>         binding->tx_max_frag_size =3D dev->netmem_tx_max_frag_size;
>         write_pnet(&binding->net, sock_net(nl_sk));
>         binding->uid =3D sk_uid(nl_sk);
> -       binding->niov_shift =3D niov_shift;
>         xa_init_flags(&binding->bound_rxqs, XA_FLAGS_ALLOC);
>
>         err =3D percpu_ref_init(&binding->ref,
> @@ -266,6 +279,17 @@ net_devmem_bind_dmabuf(struct net_device *dev, void =
*vdev,
>                 goto err_unmap;
>         }
>
> +       if (!niov_shift) {
> +               niov_size =3D SZ_2M;
> +               while (niov_size > PAGE_SIZE &&
> +                      (!IS_ALIGNED(dmabuf->size, niov_size) ||
> +                       !net_devmem_sgt_aligned(binding->sgt, niov_size))=
)
> +                       niov_size /=3D 2;
> +               niov_shift =3D ilog2(niov_size);
> +       }
> +       binding->niov_shift =3D niov_shift;
> +       niov_size =3D 1UL << niov_shift;
> +

How come we're not checknig the largest supported size of the netdev here?

Also, maybe should clarify in the cl with the largest supported size,
is it actually only powers of 2 up to that power of 2? Or all sizes up
to that (not-necassirly) power of 2 size?

--=20
Thanks,
Mina
