Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793662688;
	b=byWj0cfkuAJEjq7lbcprdWkZwXK53FvGARu2Dr2kYpEBRZpEh5moEoQ2YmmnN0KNKR8d
	 LwFua/P4UbVRCgZOCF8QvfRyRHt8w7byNinkhX+qkmS+Px5sH6O8ezpZ8qLPfSaDpTZv8
	 1CR6L7iJPjHtsoa2s0Uu2b2nz6M7qpW1YB9an6tK2BCeb+hz0qCh5wppE37OZAGqrhTOy
	 H6Ax+DggTxcTtdv86IsMtW8NgtYylBAh++Yhqv0LtBXuyVkO8xWlYvyiZpRFVGpBE/PjY
	 3po1csuiQW434xVVZ0ITISeS0qvMpotYS8OY2mdvWnF4f/OEQIEPrGhrtd/CphuvY4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793662688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=CpN0nyOlHAAHfSUiOBw/jygsiBzrfum7qcPzJKfy0Js=;
	b=LfYalu75zx0C1yqPOJ5vvAhYhlG5oDMMyQOlh+Myr/ssiQAGMajWZiDnm6Gtdy3Mh8rX
	 hwR2QY27OGh3P9odB1dXwR3Fqc3TL92B5iiPTxW656/lxoPoy0wu6bBSFqv66j4cpiwAw
	 qa+AEKserbEIxZRAPneVLkzlqZUdVPf8h5fsm8TW8dCRTecXHKfl24rNMrgyt0BDTxU7x
	 el4Px5IBCN7G8UZkGa3f1dj0HjgvnEiVzmdKgJR14sBz4e2+Farbjvskio7TsNvlC/sB4
	 kx4TWkMDY5yop6gWFuXY/8QGP35qlI/dWb8o8VekUEG8/kckNRFE1b+zNty82kUbwuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=npq2+qmp;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7358F606D802
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 23:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7358F606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=npq2+qmp
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-36a6ce64b95so845825eec.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 15:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793662687; x=1794267487; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CpN0nyOlHAAHfSUiOBw/jygsiBzrfum7qcPzJKfy0Js=;
        b=npq2+qmpq5UBVj3/fLPNaAEtiZsX+I+usrWfMdIJiPyxvpqaN6KTNnBj/Gxiokhb9U
         cz1BQpDAcWByapX4YJsWk+wnj5jyqb4re2eEcV3kRqJAyS1d9pNhCbJRD6+dPKUdJaNU
         b5uEEciepNPVX4EYXpaWjIyva23a438fCWxNH/08NriXyQDXO8dmAJ0h4umVYBMy1OK7
         E5iFPI1a6Ont6Q+jrRPFOrp30fh3eX8Ix1g3fETarH2jkCHwRA3LZKjKpASrWJWT+6TB
         r6Hxgfv1qEP+/lvZuMfR8Ht+MORI/VHkgXwFkujpSiO/9HI+GDL3JjQ+eM4wxCO5eqtq
         n57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793662687; x=1794267487;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CpN0nyOlHAAHfSUiOBw/jygsiBzrfum7qcPzJKfy0Js=;
        b=TweOpYMKj/MxxfkZwxoSTbwO8PP+URLh6o2Fd/IyOALo9pDjXyUrmc0pgfbun0e6Qv
         7gE5kNhx/QOR9NI6HcOb7VHrHHJ6Z0+uU/RKeuGsrh+zZx0hC9Ix0kxLvkYlwt8oTpZg
         eUPtgKTkUUZR7FRnHN/uEp7rc1kd3Cw6HNrfVbTh4LCNpRSjmZPSES8o9YnKUOMq6gUM
         g6MkSSgQf2X0leyQxCmeSIlXlgweTTDOgn+ZGcQ0JgDt3HkUSTyuMd7HaZ5Qp7WhIPYA
         OP1cp0Boutqqbk6dDa4xbadSo/kr+4yzitrE9wNA8Bo6hESAlJtenx9ByDEhWqo9/557
         OxkQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9TzUdx5t7Hpg+5sFnJtTClOCKoVYYkzCOTt79EHJlM7MgaDgvcbcWx+9uzdz97jmxHXchxG9OS+I=@vger.kernel.org
X-Gm-Message-State: AFq9FYKBk52yKTMXUflImiE5hJOwAq45CcIP0QkMcjXB/AdcNudQKcxO
	djcoSR1//Z3zWAb9X++ZUEuNTECcyjVshF//YHIsWQq1CP/JAfGQ8Lxk
X-Gm-Gg: AYBFou06JvOq3TuTvRSo7Vc6ejH/MWD/1oO3Du2v/AvP3xb36VTLF++U3v38pqK+gBj
	JpUICSW0EyVgoX3HQEGTxqH0UkPsbBrL27/5mQDbLzdDIletSXzlbqcq5RsZ5tIBzqF0nf+vBqR
	UxYb+rMGnHy+PszJs4oIBmlVkyV0yLfTrEmyTevP8Hk6rF4vCZPmV55e1V3XppIhgXWOC3MkSso
	Vq/MJHbEKVRNa0V4YGCA4mZ/Wamq2w8sM8dlUuHGE1IvNsDD9LHIxVd+krIePVfFn0VJj7+WSnM
	7HnuwKEJJzMpjMZie6yOj24hoN9YzTDt4om04On2mdAabiOLsRNZpO7T/5z2F/8dfRj8VlbV9LW
	tZY/FWIt/DWSYE8I+XFNx2K7sxO5TSL/vaXC872h9L1869S40LHwv4fPKL16p+ezsLbhDCXc/0c
	zfnU9/9pO7j0YcIZuDjevxc8tYujo2nTtHVNQPwKxMeS3mgarz3eN1iVKTarfpiWe2Pa80ecOVV
	p0QeZSDK3LdTFqFoGZMDgZlSjSSO2+Vz6nGfxbvXcZQeBP1E7FhiYlEXrn4aK+K57tF2MAyfkgG
	hAVvMIBPkdqf/m/mit0DxQ==
X-Received: by 2002:a05:7022:3b88:b0:143:54c6:6a5 with SMTP id a92af1059eb24-1ac5c8379a3mr17375543c88.37.1793662687477;
        Mon, 02 Nov 2026 15:38:07 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:44::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b23f20d36csm580363c88.11.2026.11.02.15.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:38:07 -0800 (PST)
Date: Mon, 2 Nov 2026 15:37:54 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch, edumazet@kernel.org, 
	horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	michael.chan@broadcom.com, pavan.chebbi@broadcom.com, sdf@fomichev.me, 
	bobbyeshleman@meta.com, asml.silence@gmail.com, daniel@iogearbox.net, 
	razor@blackwall.org, leitao@debian.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 6/7] net: devmem: size TX net_iovs from the
 dmabuf sg table
Message-ID: <aukcZBLBir_91hPr@devvm16445.scu0.facebook.com>
References: <20261102191438.1059771-1-sdf@fomichev.me>
 <20261102191438.1059771-7-sdf@fomichev.me>
 <CAHS8izMRtaL=kZaM29XQBodT8e+srppnK_DjNSTJnxFfNgG9aw@mail.gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHS8izMRtaL=kZaM29XQBodT8e+srppnK_DjNSTJnxFfNgG9aw@mail.gmail.com>

On 11/02, Mina Almasry wrote:
> On Mon, Nov 2, 2026 at 11:14 AM Stanislav Fomichev <sdf.kernel@gmail.com> wrote:
> >
> > PAGE_SIZE TX net_iovs cap devmem skbs at MAX_SKB_FRAGS pages (~68KB),
> > which makes BIG TCP ineffective.
> >
> > TX net_iovs only need to be DMA contiguous. Use the largest power of 2,
> > up to 2MB, which aligns every DMA segment of the dmabuf:
> > - 2MB hugepage-backed udmabufs get 2MB net_iovs
> > - no UAPI change, TX addresses are dmabuf offsets
> > - skbs are still bounded by TCP's size_goal, only frags get larger
> >
> > Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> > ---
> >  net/core/devmem.c      | 28 ++++++++++++++++++++++++++--
> >  net/core/netdev-genl.c |  2 +-
> >  2 files changed, 27 insertions(+), 3 deletions(-)
> >
> > diff --git a/net/core/devmem.c b/net/core/devmem.c
> > index 19c039ed2cb2..98c9594dbf99 100644
> > --- a/net/core/devmem.c
> > +++ b/net/core/devmem.c
> > @@ -181,6 +181,20 @@ int net_devmem_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
> >         return err;
> >  }
> >
> > +static bool net_devmem_sgt_aligned(struct sg_table *sgt, size_t size)
> > +{
> > +       struct scatterlist *sg;
> > +       unsigned int i;
> > +
> > +       for_each_sgtable_dma_sg(sgt, sg, i) {
> > +               if (!IS_ALIGNED(sg_dma_address(sg), size) ||
> > +                   !IS_ALIGNED(sg_dma_len(sg), size))
> > +                       return false;
> > +       }
> > +       return true;
> > +}
> > +
> > +/* niov_shift == 0 picks the net_iov size from the dmabuf, TX only */
> >  struct net_devmem_dmabuf_binding *
> >  net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
> >                        struct device *dma_dev,
> > @@ -191,11 +205,11 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
> >                        struct netlink_ext_ack *extack)
> >  {
> >         struct net_devmem_dmabuf_binding *binding;
> > -       size_t niov_size = 1UL << niov_shift;
> >         static u32 id_alloc_next;
> >         struct scatterlist *sg;
> >         struct dma_buf *dmabuf;
> >         unsigned int sg_idx;
> > +       size_t niov_size;
> >         size_t niov_idx;
> >         size_t i;
> >         long err;
> > @@ -221,7 +235,6 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
> >         binding->tx_max_frag_size = dev->netmem_tx_max_frag_size;
> >         write_pnet(&binding->net, sock_net(nl_sk));
> >         binding->uid = sk_uid(nl_sk);
> > -       binding->niov_shift = niov_shift;
> >         xa_init_flags(&binding->bound_rxqs, XA_FLAGS_ALLOC);
> >
> >         err = percpu_ref_init(&binding->ref,
> > @@ -266,6 +279,17 @@ net_devmem_bind_dmabuf(struct net_device *dev, void *vdev,
> >                 goto err_unmap;
> >         }
> >
> > +       if (!niov_shift) {
> > +               niov_size = SZ_2M;
> > +               while (niov_size > PAGE_SIZE &&
> > +                      (!IS_ALIGNED(dmabuf->size, niov_size) ||
> > +                       !net_devmem_sgt_aligned(binding->sgt, niov_size)))
> > +                       niov_size /= 2;
> > +               niov_shift = ilog2(niov_size);
> > +       }
> > +       binding->niov_shift = niov_shift;
> > +       niov_size = 1UL << niov_shift;
> > +
> 
> How come we're not checknig the largest supported size of the netdev here?
> 
> Also, maybe should clarify in the cl with the largest supported size,
> is it actually only powers of 2 up to that power of 2? Or all sizes up
> to that (not-necassirly) power of 2 size?

I think these are a bit orthogonal, no? We can have niovs larger than
the HW can tx. If that's the case, we'll just sub-divide when we build
the skb. If we limit to the same chunk the device can handle here,
we might use 2 frags to send single chunk worth of data more often (offset
doesn't have to be aligned to the chunk size).


Assuming device can only send 16K, current patch:

[       2MB        ] 2BM niov
     [ 16K ]         sending 16K from that 2MB will use one chunk


Limiting chunks to device's chunk size:

[ 16K ][ 16K ]       16K niov
    [ 16K ]          sending 16K from offset 8K will have to use 2 frags

(obviously, the same thing can happen with 2MB chunks, but less often)

LMK if it does not sound convincing.
