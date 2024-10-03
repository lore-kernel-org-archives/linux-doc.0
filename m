Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32998224EA
	for <linux-doc@vger.kernel.org>; Thu,  3 Oct 2024 18:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727981407; cv=none; b=IuaLGpPqjAQI5JavoPymM0BssepfyaZMhOnz3GxqOEuCGvn90ehSwC2ASBeabG2DjZTNlkfIIzbHtOIUWq3sHYE2nvlb0A6Ha1kHNL7xBc08EE5TymnYfanlgWh4rfrPgZXImaoqL88vVWmXJvcpWW0WFGzBMiD6sl07aYyjW8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727981407; c=relaxed/simple;
	bh=Cc2rc24biNT5FidwfDdT2ehpmzoiBj0lvneMp2e8LmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WXP5WiIEG0h7IZrjBUzXLC9KjqWXfZttqji3qP9fkaAGskJlhKEgDAYhbFEi8zF9QxWOIHg33xL+0aBakIilp1N49TNj8rVzc64HHiCFPMQNL59e5YJWcr82F+OcohE6AbclbKrkLTmFwBkWdaHHmFN3dpJvb4xdf4ULUdELs1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nXaSTFEp; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nXaSTFEp"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4581cec6079so47411cf.0
        for <linux-doc@vger.kernel.org>; Thu, 03 Oct 2024 11:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727981405; x=1728586205; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1I8W3N/B/EZ3NCCFlPhihj2D3CtLtqtAkm3xJ/FbH4Q=;
        b=nXaSTFEpZSCGRr/Znz3vwknJRipVVIUrJ6uCptk0U2t/QXYqOTS4b+f2knZ/Iu6k+3
         1zGrC9G5rkCyglFnnNFV0PekzpAzetSDfJo8FEZfkYixHu6rGQil8G6eaQ4IVeycsaId
         NJCmjNs/nY8tzjT4wTJV3qB92CAGkgIcR4lR8Rzp3el03Q9uLAxBmATQ0sJJfuJ3FpA2
         b3pNri9vYRxoFrzxW5xVuUDoRLyiobL/4YLeYa/+GA91IILkobK8Ef1At7QaRONlCrfp
         EfL2NjVkLvnY+pzAY1/Mt9c6f9w7NL6aAPDHYYvuHpcYRZiA9TPcAQMDToAjsilPo1Jz
         soig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727981405; x=1728586205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1I8W3N/B/EZ3NCCFlPhihj2D3CtLtqtAkm3xJ/FbH4Q=;
        b=VsIccfdaUukX/njIH6yAu5iJROBClTuMCECmc6rCxL5wY4vxC3gcRKGj18xyUe4a3J
         xifoGcGjYtfHmazk+DKy93RRtJVm3Ub12tbUfKNhKa1rIIkjdGylCs1cd/BgPZp4UHot
         /rEwNfAhpn+Lu+oaUyxJCXPTMzD4Arwz9XEFLYMMOFywz60cTE2ko3ZwSLoswAp+5DTr
         Oq1TVI3hfL65zLc8QhxU8psGqLR/m3T3dbyt9Yg3WXl2CQfsAL1ycIcgAYdbvynOjU6Z
         YW/rEMNQFbhjF9b9vUz/D+r1r9Cz19r01J0zhe+PiICDSiMWdqacC5k2gUH8d1BB5AUB
         Ihow==
X-Forwarded-Encrypted: i=1; AJvYcCXJWhyhwE371EpQfrlvUDOffClISyJ9x4jB05G5ovsVGtOvXu4LYMbShTfPHo8MZnNx+pWVzw/WUVc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWgJbhwtiioMkOS1reH0Y+jBRm3lZ2T5Uat14yQ43qznv0tFKr
	0IQeqRYTEp5lqbU1CAncLQXmYQqBlim1KSiyibhgryr6f05uYrVm+nFxvlFGx7e0L4cBwi/eSz8
	oEQMD7rswCOb3ik8LUAkdk0mOs+RWIVatzyvq
X-Google-Smtp-Source: AGHT+IEfi69B4j11ef1E/2a7Nfj+fGGfwbLrmyvR/Er5LdQXuT5OJbLFiFkKJXazj8oKbsaxMlmeZMP0PtfuvdQechg=
X-Received: by 2002:a05:622a:838c:b0:456:7d9f:2af8 with SMTP id
 d75a77b69052e-45d9bbdd3d3mr136181cf.7.1727981404822; Thu, 03 Oct 2024
 11:50:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241003160620.1521626-1-ap420073@gmail.com> <20241003160620.1521626-6-ap420073@gmail.com>
 <70c16ec6-c1e8-4de2-8da7-a9cc83df816a@amd.com>
In-Reply-To: <70c16ec6-c1e8-4de2-8da7-a9cc83df816a@amd.com>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 3 Oct 2024 11:49:50 -0700
Message-ID: <CAHS8izPmg8CJNYVQfdJB9BoyE75qf+wrz_68pTDdYffpEWDQMg@mail.gmail.com>
Subject: Re: [PATCH net-next v3 5/7] net: devmem: add ring parameter filtering
To: Brett Creeley <bcreeley@amd.com>
Cc: Taehee Yoo <ap420073@gmail.com>, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, edumazet@google.com, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, donald.hunter@gmail.com, corbet@lwn.net, 
	michael.chan@broadcom.com, kory.maincent@bootlin.com, andrew@lunn.ch, 
	maxime.chevallier@bootlin.com, danieller@nvidia.com, hengqi@linux.alibaba.com, 
	ecree.xilinx@gmail.com, przemyslaw.kitszel@intel.com, hkallweit1@gmail.com, 
	ahmed.zaki@intel.com, paul.greenwalt@intel.com, rrameshbabu@nvidia.com, 
	idosch@nvidia.com, asml.silence@gmail.com, kaiyuanz@google.com, 
	willemb@google.com, aleksander.lobakin@intel.com, dw@davidwei.uk, 
	sridhar.samudrala@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 11:35=E2=80=AFAM Brett Creeley <bcreeley@amd.com> wr=
ote:
>
>
>
> On 10/3/2024 9:06 AM, Taehee Yoo wrote:
> > Caution: This message originated from an External Source. Use proper ca=
ution when opening attachments, clicking links, or responding.
> >
> >
> > If driver doesn't support ring parameter or tcp-data-split configuratio=
n
> > is not sufficient, the devmem should not be set up.
> > Before setup the devmem, tcp-data-split should be ON and
> > tcp-data-split-thresh value should be 0.
> >
> > Signed-off-by: Taehee Yoo <ap420073@gmail.com>
> > ---
> >
> > v3:
> >   - Patch added.
> >
> >   net/core/devmem.c | 18 ++++++++++++++++++
> >   1 file changed, 18 insertions(+)
> >
> > diff --git a/net/core/devmem.c b/net/core/devmem.c
> > index 11b91c12ee11..a9e9b15028e0 100644
> > --- a/net/core/devmem.c
> > +++ b/net/core/devmem.c
> > @@ -8,6 +8,8 @@
> >    */
> >
> >   #include <linux/dma-buf.h>
> > +#include <linux/ethtool.h>
> > +#include <linux/ethtool_netlink.h>
> >   #include <linux/genalloc.h>
> >   #include <linux/mm.h>
> >   #include <linux/netdevice.h>
> > @@ -131,6 +133,8 @@ int net_devmem_bind_dmabuf_to_queue(struct net_devi=
ce *dev, u32 rxq_idx,
> >                                      struct net_devmem_dmabuf_binding *=
binding,
> >                                      struct netlink_ext_ack *extack)
> >   {
> > +       struct kernel_ethtool_ringparam kernel_ringparam =3D {};
> > +       struct ethtool_ringparam ringparam =3D {};
> >          struct netdev_rx_queue *rxq;
> >          u32 xa_idx;
> >          int err;
> > @@ -146,6 +150,20 @@ int net_devmem_bind_dmabuf_to_queue(struct net_dev=
ice *dev, u32 rxq_idx,
> >                  return -EEXIST;
> >          }
> >
> > +       if (!dev->ethtool_ops->get_ringparam) {
> > +               NL_SET_ERR_MSG(extack, "can't get ringparam");
> > +               return -EINVAL;
> > +       }
>
> Is EINVAL the correct return value here? I think it makes more sense as
> EOPNOTSUPP.
>
> > +
> > +       dev->ethtool_ops->get_ringparam(dev, &ringparam,
> > +                                       &kernel_ringparam, extack);
> > +       if (kernel_ringparam.tcp_data_split !=3D ETHTOOL_TCP_DATA_SPLIT=
_ENABLED ||
> > +           kernel_ringparam.tcp_data_split_thresh) {
> > +               NL_SET_ERR_MSG(extack,
> > +                              "tcp-header-data-split is disabled or th=
reshold is not zero");
> > +               return -EINVAL;
> > +       }
> > +
> Maybe just my personal opinion, but IMHO these checks should be separate
> so the error message can be more concise/clear.
>

Good point. The error message in itself is valuable.
