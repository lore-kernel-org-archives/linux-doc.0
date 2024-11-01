Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49DB1A4F02
	for <linux-doc@vger.kernel.org>; Fri,  1 Nov 2024 14:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730471359; cv=none; b=TRpW7GKEZqDoSk3+2drE22CpVul5A6YUNzLVBBnZnh2XzyGXI7HGWFz0XuS4g2a3bK7PbyUtEKtO0JSBGcCGwIAOBFlfgOfQqCpr7mORzw1wuSlCSLCNv0RtVc1z9kM/yvCM2fQfH4DH8TpPTABqP5hh6JMT56sQQmvgly7rNkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730471359; c=relaxed/simple;
	bh=eJVNvJnZLTG4PpxBtX9b0krF09fZgAY5tkl/hJZTlyI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B6ljGwBbqVGkuoqubr6axEPgSuJ1/KLmfsAfvrNVKoPEG2sNQCITpJq+NuKmQbce4Psd1QuFE4ZNWTdpRNA6yrGOGyAF8VdfvoEJc+UAmDF+vr3jA7vAUPmsSxWnJ8+NLuRJvE1HwbM9tOyHkn+xeMzpJE/pp9/Bhbeh7SNSous=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KU9Hw65+; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KU9Hw65+"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-460b295b9eeso138741cf.1
        for <linux-doc@vger.kernel.org>; Fri, 01 Nov 2024 07:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730471356; x=1731076156; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71rDrn/xSyrSel5+3YD+U/lkEjJUJKYWwLFn/ivmxck=;
        b=KU9Hw65+obka9tr/pM5cR/jNGsgQzIcHig0dyxxDBX0kh1mHE5/auhSDDlvO4KWOZ4
         i25/rSX7cwnOjYoE912O+SnQhhBdrNsXIdnhwuGrWrrjJnqy+0XP/kJliUymcNUCmIc7
         Yv/lC/lztn8oZtGzzhQ/i4SP1eabCNQMyVPfdtEInRhsUQ0Lp9al8J/oONCi1pxFaxXZ
         ArdQ0DZRylzVCkOubQ3Hia4GOf+jy2NEJgGHuJW+xWp0cxTb9rJXm2nZBwU+FPbmbqnm
         XbIzmbjRbz3T8y4ycgNpbVmzqBSExGHH8K9LzqIGSfrJsvxtRlBLD+8cLjo/qnjk33m0
         R6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730471356; x=1731076156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=71rDrn/xSyrSel5+3YD+U/lkEjJUJKYWwLFn/ivmxck=;
        b=PYZAQ90in5ojpFGmdf1L++LN9MtVnYtCLq31ex0R3byG2i81zCjT8eTSUSLCl5BQBh
         KeQPxEZXd1U46iGgIcaCvqmyGl73C347iv3h2lJXG7smjS5fv/w9sljsrbP/TrYMn5NN
         5N5gVqsvpsMi6WIrmNx9PgCB6YX+Qxx0XZtTZIVwOkHtnNbEEVUUw+nr2cWaXcNyPR5P
         HSfPduXYexqXUCsNFGWKnsBeSzHJ6dLDCbT6BFyqHvF6lf2MvozZq9hucjNSIu4laHqF
         Gh3rTsj9ZB2TSJ85SHQX53jPeg/5tamcFmRwYEFvEV67BPCaLuZoytugURMFHay4pl6y
         bMeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOyW+NwSaQFGzyW/Upamkw88Vv+ybwxPBcpaGJMeESGJMwaSmR7L5D0p0hQSMjVFcBndTG5fkB7NA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiO9TfzVcOO9T/VdpGY0Yg4TU16Uj18HDHgXiCRnZbxNEvfKg6
	smhsuTp+0p/7m5q2QrFjVvx3SxMZphDOaUjwsE6D6BPQKLLWHYfokuAWa096r1lZWrH8puCYoAL
	J98hr3kU3f9xwUDHfDkUysMVTsD8eukYEbEPS
X-Gm-Gg: ASbGncuxh4D3T3SGH2DWzDL4uSQg++a/8pYW9+wsvOmAevZPQYW4tGHzH3NCBwbFOcR
	8MjgqF+qxkyrqtK8x83BioXlOo1Odz8s=
X-Google-Smtp-Source: AGHT+IHfPf4efEtalOK8WUuB9JdEhR5RMnc0VUPGI/FfzKul0egqfNyIe0EJS2sbq6VHEkHbfxIaYbjkGSJgcXA7P3I=
X-Received: by 2002:a05:622a:614:b0:461:4be1:c612 with SMTP id
 d75a77b69052e-462ad2da722mr6592141cf.21.1730471356319; Fri, 01 Nov 2024
 07:29:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022162359.2713094-1-ap420073@gmail.com> <20241022162359.2713094-6-ap420073@gmail.com>
In-Reply-To: <20241022162359.2713094-6-ap420073@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 1 Nov 2024 07:29:04 -0700
Message-ID: <CAHS8izNbS4i+ke0bK07-rNLuq6RGXD-H73DhVb1-tsUOzSCBog@mail.gmail.com>
Subject: Re: [PATCH net-next v4 5/8] net: devmem: add ring parameter filtering
To: Taehee Yoo <ap420073@gmail.com>, Praveen Kaligineedi <pkaligineedi@google.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, 
	edumazet@google.com, donald.hunter@gmail.com, corbet@lwn.net, 
	michael.chan@broadcom.com, andrew+netdev@lunn.ch, hawk@kernel.org, 
	ilias.apalodimas@linaro.org, ast@kernel.org, daniel@iogearbox.net, 
	john.fastabend@gmail.com, dw@davidwei.uk, sdf@fomichev.me, 
	asml.silence@gmail.com, brett.creeley@amd.com, linux-doc@vger.kernel.org, 
	netdev@vger.kernel.org, kory.maincent@bootlin.com, 
	maxime.chevallier@bootlin.com, danieller@nvidia.com, hengqi@linux.alibaba.com, 
	ecree.xilinx@gmail.com, przemyslaw.kitszel@intel.com, hkallweit1@gmail.com, 
	ahmed.zaki@intel.com, rrameshbabu@nvidia.com, idosch@nvidia.com, 
	jiri@resnulli.us, bigeasy@linutronix.de, lorenzo@kernel.org, 
	jdamato@fastly.com, aleksander.lobakin@intel.com, kaiyuanz@google.com, 
	willemb@google.com, daniel.zahka@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Taehee, sorry for the late reply. I was out on vacation and needed
to catch up on some stuff when I got back.

On Tue, Oct 22, 2024 at 9:25=E2=80=AFAM Taehee Yoo <ap420073@gmail.com> wro=
te:
>
> If driver doesn't support ring parameter or tcp-data-split configuration
> is not sufficient, the devmem should not be set up.
> Before setup the devmem, tcp-data-split should be ON and
> header-data-split-thresh value should be 0.
>
> Tested-by: Stanislav Fomichev <sdf@fomichev.me>
> Signed-off-by: Taehee Yoo <ap420073@gmail.com>
> ---
>
> v4:
>  - Check condition before __netif_get_rx_queue().
>  - Separate condition check.
>  - Add Test tag from Stanislav.
>
> v3:
>  - Patch added.
>
>  net/core/devmem.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/net/core/devmem.c b/net/core/devmem.c
> index 11b91c12ee11..3425e872e87a 100644
> --- a/net/core/devmem.c
> +++ b/net/core/devmem.c
> @@ -8,6 +8,8 @@
>   */
>
>  #include <linux/dma-buf.h>
> +#include <linux/ethtool.h>
> +#include <linux/ethtool_netlink.h>
>  #include <linux/genalloc.h>
>  #include <linux/mm.h>
>  #include <linux/netdevice.h>
> @@ -131,6 +133,8 @@ int net_devmem_bind_dmabuf_to_queue(struct net_device=
 *dev, u32 rxq_idx,
>                                     struct net_devmem_dmabuf_binding *bin=
ding,
>                                     struct netlink_ext_ack *extack)
>  {
> +       struct kernel_ethtool_ringparam kernel_ringparam =3D {};
> +       struct ethtool_ringparam ringparam =3D {};
>         struct netdev_rx_queue *rxq;
>         u32 xa_idx;
>         int err;
> @@ -140,6 +144,20 @@ int net_devmem_bind_dmabuf_to_queue(struct net_devic=
e *dev, u32 rxq_idx,
>                 return -ERANGE;
>         }
>
> +       if (!dev->ethtool_ops->get_ringparam)
> +               return -EOPNOTSUPP;
> +

Maybe an error code not EOPNOTSUPP. I think that gets returned when
NET_DEVMEM is not compiled in and other situations like that. Lets
pick another error code? Maybe ENODEV.

Also consider extack error message. But it's very unlikely to hit this
error, so maybe not necessary.

> +       dev->ethtool_ops->get_ringparam(dev, &ringparam, &kernel_ringpara=
m,
> +                                       extack);
> +       if (kernel_ringparam.tcp_data_split !=3D ETHTOOL_TCP_DATA_SPLIT_E=
NABLED) {
> +               NL_SET_ERR_MSG(extack, "tcp-data-split is disabled");
> +               return -EINVAL;
> +       }
> +       if (kernel_ringparam.hds_thresh) {
> +               NL_SET_ERR_MSG(extack, "header-data-split-thresh is not z=
ero");
> +               return -EINVAL;
> +       }
> +

Thinking about drivers that support tcp-data-split, but don't support
any kind of hds_thresh. For us (GVE), the hds_thresh is implicitly
always 0.

Does the driver need to explicitly set hds_thresh to 0? If so, that
adds a bit of churn to driver code. Is it possible to detect in this
function that the driver doesn't support hds_thresh and allow the
binding if so?

I see in the previous patch you do something like:

supported_ring_params & ETHTOOL_RING_USE_HDS_THRS

To detect there is hds_thresh support. I was wondering if something
like this is possible so we don't have to update GVE and all future
drivers to explicitly set thresh to 0.

Other than that, looks fine to me.


--=20
Thanks,
Mina
