Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577AF1D0F77
	for <linux-doc@vger.kernel.org>; Fri,  1 Nov 2024 20:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730493667; cv=none; b=U60Xe+JmRXaQ5VLCIXUajyUvw+QFpKPbRuuOFNYv84e509yim4tJcGlzNC71Q6qAQt8d0k5+Wquso+xj5f3Ye2Ix1BkJZMJC1DviwUMyVZGlmzcZaTWsw6O9hxqxAWKfM4SjzemZKUoAranB4rOCqST8y6FxANr1rvCCoZQIiLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730493667; c=relaxed/simple;
	bh=QnZ9NtjUbdQTJvpttaHRdaRqT9o2KWoYfK1rOy0QK5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TVTj7kNigF0kUD2JyxYwfsH9SeOW2pCdLAJbq2QZiy7hSH4t7rrDrjpXhj2jwZ1GVwX0u574Nc451iWnQzvC35vL9kvlR7OqZfSL0JBBa1vWWxDnllmFKBR+sP+YpK0oQExvRgArzi8kM5qIxYpAaROjqALGFNIdfenKhfAAnjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jVm02lnN; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jVm02lnN"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-460b295b9eeso17511cf.1
        for <linux-doc@vger.kernel.org>; Fri, 01 Nov 2024 13:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730493663; x=1731098463; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cWDY3NSGHiCMXI2nz1acGMypfvF/NU2Y53NaKDsy0s=;
        b=jVm02lnN8pB9N5B2eS+ZuHYukaQQD3tXkTNG3eQfEr99qJSgo/aBqr/mG/UbsAFo0N
         PKv14VgFZhVY/FNHiixVKIFrW3hwE60+ZKAg6fV6GCWlULb0k9N2AN0HY1jPwUeXH+Gx
         5wipCyb09zw0gnE2bKZVtIXvNz0O0dc4CeM5TYSjVeKTu7Br7vanqAOPAsUGIXfETChV
         LhMrYvCSJ71+xBPMaUcwCoY/Ng08s0JTfNVQNNqpKH5Ts72rmnuT0Ri0wYGuyhqZzBnY
         wuP1b2BCnZT7kX54hZtWMyhZuP7ZMVyaFc/QE+re+vu/B0Wg42puhsUJGKpku3fhlEEM
         mQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730493663; x=1731098463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4cWDY3NSGHiCMXI2nz1acGMypfvF/NU2Y53NaKDsy0s=;
        b=UghgRO06Dz7dLOj/RJz3s6Q1WJmZmsOI6gEiA+ojui4LMB9EXmbs5VVzAX4H226HDs
         nTVYTnT7o0XJQNQrdeM6K9UlPZj0zp5COs5aPOCszXocHluFbhc7cxw+P2tZR+NMY6Od
         P2sOHfvy5pTaxKTi6eZtGzaJABxDyywIPISz5mKS11aOBQoS1LxIByAtKaFrqjdP0KG3
         f5MaSmbEAOaNDGPfNMw7WVejc7ARak0Xp4GF0CayIRDAMnmf3wjyzNDKbJebixs5I90M
         KALyaSeQvGIcdgkV6DJRxOcl09MRx6gdX8O+JmCLbzB93mfCnwYeV/67D3Uw6PFoBb0T
         T5Vw==
X-Forwarded-Encrypted: i=1; AJvYcCV2DCnq9zNN8jJDzVYxfD5GGiJUFyg8b9BXdGbXtENL/r20pMXCtUSCwN5tPLUPbfxjS9zjxVXmEOk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLM/Sy0JyADGRkLZEVNZd58ivlP6XmeB3qZ7+wdbq+ReLWaeTf
	su9+jhu5ctNah8JiOeFn9HzbZG88Gn+IIyA3X3uIfPjgzLns8OnRXmw7t2636OXTERWPbAh94LI
	AE3daJRvq4+ChYyozPAkIEJZ45c6V3NKpVG52
X-Gm-Gg: ASbGncuZpKKaWqPefv0gn1ooIduK2jS8cdGL8+QDESEF8Pof0EYnFd3Om7LAIgNAw/a
	tHEZ7Ub8HzlpF7mQRLMWlXE172j50vBosLw092MYxbHODzp6LoLbEwYHNQ+g2iw==
X-Google-Smtp-Source: AGHT+IHQx73scTifKy/me2Cyi0Y+euncHKvBIpySAjRUMBxZGYBYJh/Kcv4YekjCYJP7ayAIXMrsTrsGu3mbqoHIrJU=
X-Received: by 2002:a05:622a:2a10:b0:461:4467:14c7 with SMTP id
 d75a77b69052e-462c5d3126cmr905151cf.0.1730493662840; Fri, 01 Nov 2024
 13:41:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022162359.2713094-1-ap420073@gmail.com> <20241022162359.2713094-6-ap420073@gmail.com>
 <CAHS8izNbS4i+ke0bK07-rNLuq6RGXD-H73DhVb1-tsUOzSCBog@mail.gmail.com> <CAMArcTUGTF2Qr9=W_mcrA9au2jhm0Ru6hC+Nt3V2tk=LODQs+A@mail.gmail.com>
In-Reply-To: <CAMArcTUGTF2Qr9=W_mcrA9au2jhm0Ru6hC+Nt3V2tk=LODQs+A@mail.gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 1 Nov 2024 13:40:51 -0700
Message-ID: <CAHS8izN0_v0UTNT9Xu8yJcvStvAYBQW3kadMG_0d4xr7Ta-VVQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4 5/8] net: devmem: add ring parameter filtering
To: Taehee Yoo <ap420073@gmail.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Ziwei Xiao <ziweixiao@google.com>
Cc: Praveen Kaligineedi <pkaligineedi@google.com>, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, edumazet@google.com, donald.hunter@gmail.com, 
	corbet@lwn.net, michael.chan@broadcom.com, andrew+netdev@lunn.ch, 
	hawk@kernel.org, ilias.apalodimas@linaro.org, ast@kernel.org, 
	daniel@iogearbox.net, john.fastabend@gmail.com, dw@davidwei.uk, 
	sdf@fomichev.me, asml.silence@gmail.com, brett.creeley@amd.com, 
	linux-doc@vger.kernel.org, netdev@vger.kernel.org, kory.maincent@bootlin.com, 
	maxime.chevallier@bootlin.com, danieller@nvidia.com, hengqi@linux.alibaba.com, 
	ecree.xilinx@gmail.com, przemyslaw.kitszel@intel.com, hkallweit1@gmail.com, 
	ahmed.zaki@intel.com, rrameshbabu@nvidia.com, idosch@nvidia.com, 
	jiri@resnulli.us, bigeasy@linutronix.de, lorenzo@kernel.org, 
	jdamato@fastly.com, aleksander.lobakin@intel.com, kaiyuanz@google.com, 
	willemb@google.com, daniel.zahka@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 11:03=E2=80=AFAM Taehee Yoo <ap420073@gmail.com> wro=
te:
>
> On Fri, Nov 1, 2024 at 11:29=E2=80=AFPM Mina Almasry <almasrymina@google.=
com> wrote:
> >
> > Hi Taehee, sorry for the late reply. I was out on vacation and needed
> > to catch up on some stuff when I got back.
>
> Hi Mina,
> Thank you so much for your review :)
>
> >
> > On Tue, Oct 22, 2024 at 9:25=E2=80=AFAM Taehee Yoo <ap420073@gmail.com>=
 wrote:
> > >
> > > If driver doesn't support ring parameter or tcp-data-split configurat=
ion
> > > is not sufficient, the devmem should not be set up.
> > > Before setup the devmem, tcp-data-split should be ON and
> > > header-data-split-thresh value should be 0.
> > >
> > > Tested-by: Stanislav Fomichev <sdf@fomichev.me>
> > > Signed-off-by: Taehee Yoo <ap420073@gmail.com>
> > > ---
> > >
> > > v4:
> > >  - Check condition before __netif_get_rx_queue().
> > >  - Separate condition check.
> > >  - Add Test tag from Stanislav.
> > >
> > > v3:
> > >  - Patch added.
> > >
> > >  net/core/devmem.c | 18 ++++++++++++++++++
> > >  1 file changed, 18 insertions(+)
> > >
> > > diff --git a/net/core/devmem.c b/net/core/devmem.c
> > > index 11b91c12ee11..3425e872e87a 100644
> > > --- a/net/core/devmem.c
> > > +++ b/net/core/devmem.c
> > > @@ -8,6 +8,8 @@
> > >   */
> > >
> > >  #include <linux/dma-buf.h>
> > > +#include <linux/ethtool.h>
> > > +#include <linux/ethtool_netlink.h>
> > >  #include <linux/genalloc.h>
> > >  #include <linux/mm.h>
> > >  #include <linux/netdevice.h>
> > > @@ -131,6 +133,8 @@ int net_devmem_bind_dmabuf_to_queue(struct net_de=
vice *dev, u32 rxq_idx,
> > >                                     struct net_devmem_dmabuf_binding =
*binding,
> > >                                     struct netlink_ext_ack *extack)
> > >  {
> > > +       struct kernel_ethtool_ringparam kernel_ringparam =3D {};
> > > +       struct ethtool_ringparam ringparam =3D {};
> > >         struct netdev_rx_queue *rxq;
> > >         u32 xa_idx;
> > >         int err;
> > > @@ -140,6 +144,20 @@ int net_devmem_bind_dmabuf_to_queue(struct net_d=
evice *dev, u32 rxq_idx,
> > >                 return -ERANGE;
> > >         }
> > >
> > > +       if (!dev->ethtool_ops->get_ringparam)
> > > +               return -EOPNOTSUPP;
> > > +
> >
> > Maybe an error code not EOPNOTSUPP. I think that gets returned when
> > NET_DEVMEM is not compiled in and other situations like that. Lets
> > pick another error code? Maybe ENODEV.
>
> There are several same code in the ethtool core.
> It returns EOPNOTSUPP consistently.
> In the v3 series, Brett reviewed it.
> So, I changed it from EINVAL to EOPNOTSUPP it was reasonable to me.
> So I prefer EOPNOTSUPP but I will follow your decision.
> What do you think?
>
> >
> > Also consider extack error message. But it's very unlikely to hit this
> > error, so maybe not necessary.
>
> I removed extack from the v3. because ethtool doesn't use extack for
> the same logic. It was reasonable to me.
>

Ah, looks like I accidentally re-opened discussion on a couple of
items that you're already aligned on. Not critical. This is fine by
me.

> >
> > > +       dev->ethtool_ops->get_ringparam(dev, &ringparam, &kernel_ring=
param,
> > > +                                       extack);
> > > +       if (kernel_ringparam.tcp_data_split !=3D ETHTOOL_TCP_DATA_SPL=
IT_ENABLED) {
> > > +               NL_SET_ERR_MSG(extack, "tcp-data-split is disabled");
> > > +               return -EINVAL;
> > > +       }
> > > +       if (kernel_ringparam.hds_thresh) {
> > > +               NL_SET_ERR_MSG(extack, "header-data-split-thresh is n=
ot zero");
> > > +               return -EINVAL;
> > > +       }
> > > +
> >
> > Thinking about drivers that support tcp-data-split, but don't support
> > any kind of hds_thresh. For us (GVE), the hds_thresh is implicitly
> > always 0.
> >
> > Does the driver need to explicitly set hds_thresh to 0? If so, that
> > adds a bit of churn to driver code. Is it possible to detect in this
> > function that the driver doesn't support hds_thresh and allow the
> > binding if so?
> >
> > I see in the previous patch you do something like:
> >
> > supported_ring_params & ETHTOOL_RING_USE_HDS_THRS
> >
> > To detect there is hds_thresh support. I was wondering if something
> > like this is possible so we don't have to update GVE and all future
> > drivers to explicitly set thresh to 0.
>
> How about setting maximum hds_threshold to 0?
> The default value of hds_threshold of course 0.
> I think gve code does not need to change much, just adding like below
> will be okay.
>
> I think if drivers don't support setting hds_threshold explicitly, it
> is actually the same as support only 0.
> So, there is no problem I think.
>
> I didn't analyze gve driver code, So I might think it too optimistically.
>
> #define GVE_HDS_THRESHOLD_MAX 0
> kernel_ering->hds_thresh =3D GVE_HDS_THRESHOLD_MAX;
> kernel_ering->hds_thresh_max =3D GVE_HDS_THRESHOLD_MAX;
> ...
> .supported_ring_params  =3D ETHTOOL_RING_USE_TCP_DATA_SPLIT |
> ETHTOOL_RING_USE_HDS_THRS,
>

OK, if you can think of a way to do this without any churn to other
drivers, that would be better, but this is fine by me either way.

Reviewed-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
