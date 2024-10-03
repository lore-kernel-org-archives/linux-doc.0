Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC579BA41
	for <linux-doc@vger.kernel.org>; Thu,  3 Oct 2024 18:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727980390; cv=none; b=Dcnnnttu2us+65iSnkcnBH6FwNzC7UoWWoE3sQt4O/K0FYxiJsnRNLs7WfzrR3AtmseHq3hHexQQa3iQoUDcLw6fth3bRTgtJ0ykRl0NSWAvrZzYm/Fea+u+BAyJG4BAReJ6aqWVTtOiKCJD00yjVwtx6MB2NxJ2qj6qiB/K6HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727980390; c=relaxed/simple;
	bh=ILmjpQ0zKjjTB7A3mdO7etGqfghkzhM57DEwhovcP+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=usHLcGfAGurZlIUjUTxPou/vu5HAjBrTAoxwb1ap+8odns2K9eFWhiBfgFSb6FoH4Var0/2uqzJZFwROdbejmHQlsDfuMuRzMSELsjJuQ2cyNP9/5UR0JYCwAjp8XTNf9KO+/pXuOlvI9kilHVd4vMmMrrBAI++GOfTo6mMpla4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MRgh6n03; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MRgh6n03"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4582a5b495cso37111cf.1
        for <linux-doc@vger.kernel.org>; Thu, 03 Oct 2024 11:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727980388; x=1728585188; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRiDjEDPS+jnQVOWrHXwLNaJ0K9ReTp7hEjVWXINGQg=;
        b=MRgh6n03jPVxl5BaF7UqiHKJQp0+y1IzbkEheZDMV+B64ye5Ul+JgKCP70AXHLdYQ3
         K1/md8efVjt9WhuPC4rdC7De8+T3Qz349XfaHmDnsfX2HDC2ql0YP5WbTsEkqa2zc5yq
         mRjOYzuoXkCV/Bmcthu7pcXp1Nqtgz3Tbh8shDNuHkct0aqg33UixlF2wjAxO0XGBXQ4
         s4bBtMp/taUlHYTFwaQUpctCwWnBADc4CY5cHlaMJBjiRImn5bBuvWyY0TmGUdyvhOau
         1OBRGPPwrnyDpMhMQ42Gjiep7wIxVdBUoLtifUtDW76DlCJ8f+MpU8rwZuvxLRw0okhq
         W3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727980388; x=1728585188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TRiDjEDPS+jnQVOWrHXwLNaJ0K9ReTp7hEjVWXINGQg=;
        b=KSbgxlnGwNaHjq7ydzZkJ8DfCvZ5eIXvcndrMlSZMjstSM2K5kpfiCvvNxEvFrn8Gs
         s4WVCQB9O7iTeqbp4FFgaOywbF+s/qlx/pu1tOayGGgGO/5uIHIb/TCe2GPM+Rn6BRjp
         HvxrnryHLM1OESC8syfAFUCCikVC+ZXu10LBtSniJYPcvHRUNprWP+EWZcwSIVoPs1eA
         xXnBUdIEuCC8EwiR4EbNNMsSmqNXnl8FxH0HOrSGFdSY/Dler7h3aPeIhGCWiOZvDx+z
         K0fl/PkQ+gItw12bwLUDGLzWE3oJNySUh9QHRlRe1lduUHsUDurwW5SDG+LM/3ZnY4I1
         J0CA==
X-Forwarded-Encrypted: i=1; AJvYcCWy7m0kNFyAbHlmaALIjME61JPgx+MkGeGPZneY4EuKLFPKD77VlydvklG+fKP/PGlhZ0RLC8yKl8s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSgC2qhzerijWuDhgXf7rK7G18Jx7SDufAwY+rcR/0qApi/t0g
	iP+4h0tiAfetZQ6Mu8fyh9KjE6w2INrxOu8+xi4M8MqJtRaX7fTJA/dTweutUsSzDBekHCEO1X4
	GsYCitq+vkVF3skvq+ODMF2qw8r+67zTYTbuD
X-Google-Smtp-Source: AGHT+IEpLjV56VsH8YRSLWLesTXb/qFAN2uwb4LZrTY4gOoBFQ2gTLXCRYIB782dZw29z9Gq2z5Yiy5KA0dHRN1YMN4=
X-Received: by 2002:ac8:6292:0:b0:45c:9e26:ae3 with SMTP id
 d75a77b69052e-45d9bc827e6mr41981cf.27.1727980387586; Thu, 03 Oct 2024
 11:33:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241003160620.1521626-1-ap420073@gmail.com> <20241003160620.1521626-7-ap420073@gmail.com>
In-Reply-To: <20241003160620.1521626-7-ap420073@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 3 Oct 2024 11:32:53 -0700
Message-ID: <CAHS8izMjxvgMwh5MzwDKDw1wy7b_Eyua=LOrB1Kn6wFhcxE5bg@mail.gmail.com>
Subject: Re: [PATCH net-next v3 6/7] net: ethtool: add ring parameter filtering
To: Taehee Yoo <ap420073@gmail.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, 
	edumazet@google.com, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	donald.hunter@gmail.com, corbet@lwn.net, michael.chan@broadcom.com, 
	kory.maincent@bootlin.com, andrew@lunn.ch, maxime.chevallier@bootlin.com, 
	danieller@nvidia.com, hengqi@linux.alibaba.com, ecree.xilinx@gmail.com, 
	przemyslaw.kitszel@intel.com, hkallweit1@gmail.com, ahmed.zaki@intel.com, 
	paul.greenwalt@intel.com, rrameshbabu@nvidia.com, idosch@nvidia.com, 
	asml.silence@gmail.com, kaiyuanz@google.com, willemb@google.com, 
	aleksander.lobakin@intel.com, dw@davidwei.uk, sridhar.samudrala@intel.com, 
	bcreeley@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 9:07=E2=80=AFAM Taehee Yoo <ap420073@gmail.com> wrot=
e:
>
> While the devmem is running, the tcp-data-split and
> tcp-data-split-thresh configuration should not be changed.
> If user tries to change tcp-data-split and threshold value while the
> devmem is running, it fails and shows extack message.
>
> Signed-off-by: Taehee Yoo <ap420073@gmail.com>
> ---
>
> v3:
>  - Patch added
>
>  net/ethtool/common.h |  1 +
>  net/ethtool/rings.c  | 15 ++++++++++++++-
>  2 files changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/net/ethtool/common.h b/net/ethtool/common.h
> index d55d5201b085..beebd4db3e10 100644
> --- a/net/ethtool/common.h
> +++ b/net/ethtool/common.h
> @@ -5,6 +5,7 @@
>
>  #include <linux/netdevice.h>
>  #include <linux/ethtool.h>
> +#include <net/netdev_rx_queue.h>
>
>  #define ETHTOOL_DEV_FEATURE_WORDS      DIV_ROUND_UP(NETDEV_FEATURE_COUNT=
, 32)
>
> diff --git a/net/ethtool/rings.c b/net/ethtool/rings.c
> index c7824515857f..0afc6b29a229 100644
> --- a/net/ethtool/rings.c
> +++ b/net/ethtool/rings.c
> @@ -216,7 +216,8 @@ ethnl_set_rings(struct ethnl_req_info *req_info, stru=
ct genl_info *info)
>         bool mod =3D false, thresh_mod =3D false;
>         struct nlattr **tb =3D info->attrs;
>         const struct nlattr *err_attr;
> -       int ret;
> +       struct netdev_rx_queue *rxq;
> +       int ret, i;
>
>         dev->ethtool_ops->get_ringparam(dev, &ringparam,
>                                         &kernel_ringparam, info->extack);
> @@ -263,6 +264,18 @@ ethnl_set_rings(struct ethnl_req_info *req_info, str=
uct genl_info *info)
>                 return -EINVAL;
>         }
>
> +       if (kernel_ringparam.tcp_data_split !=3D ETHTOOL_TCP_DATA_SPLIT_E=
NABLED ||
> +           kernel_ringparam.tcp_data_split_thresh) {
> +               for (i =3D 0; i < dev->real_num_rx_queues; i++) {
> +                       rxq =3D __netif_get_rx_queue(dev, i);
> +                       if (rxq->mp_params.mp_priv) {
> +                               NL_SET_ERR_MSG(info->extack,
> +                                              "tcp-header-data-split is =
disabled or threshold is not zero");
> +                               return -EINVAL;
> +                       }

Probably worth adding a helper for this. I think the same loop is
checked in a few places.

Other than that, yes, this looks good to me.


--=20
Thanks,
Mina
