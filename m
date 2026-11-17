Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794929524;
	b=0hpTeGQ3A7feuo5R63wed53ZDXbAsVVPZXQzF8v62NA3YDbqDWudtLMVmx1UNIa5avhd
	 SGSGNtccQwlOEq5OAQwaHK7/USeWzSxBu5HRig/ithveQuqWIkTbqxNKMnpXLok9i3YNX
	 oxqSgSS6mcAUiT4ScieHy2LrtxipabI99EmX+9A+Cvzns7LAxbhZiZmTHrAY6+9vjKBPE
	 PMCkZdKva4/c05oulBCnrlsIDHRYvJw4rGdt2FdbTfv2K2l7+yjEqke+4KbfXU+EabJID
	 7bWdbLM52Z39TbWwiX7RWEv528nV+Bxq6PL8jsHHv9iAp2D2gdIaIGmF/6k7S3I42LQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794929524;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rvqbXhDVk4eAuTewQMcNRxrpZoO2UE6gkhrkk4bilQ0=;
	b=33WQCiZcT2dCPfSnxbjNVkjcxl8VdntGWEqz4EvrWuUKhyJJZF2F14Bpfvp2dHlK3Q/W
	 RPXC7HbKs6JFwoqX9uRamvkO20sruOCxtOVW8DkTh//nmGAup21HozmeARsIFCf4z52oL
	 AjBzOMIiyPBghIKUMFx+Kr6/TQTGTUdQ2yZPQIVdhVG+Rqbs46SrhL2c9dwrP9bD39KVx
	 6VtoRJzPp/FdEuHYLR1sKxvpKRU174SOjXdgWtq48qOENeQH3WkiSjRbK4wCJSKoIPPKu
	 3t6s0d/vpQNM3vrgKyUrLSbfTvCsoEiFVNJ/yevft6yqZmxk21nLHUDvOl9diJbIW5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dAzwO2sp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XzMoZm8b;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826E3606A32C
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 15:32:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 826E3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dAzwO2sp;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XzMoZm8b
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHFQhrC923918
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 15:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rvqbXhDVk4eAuTewQMcNRxrpZoO2UE6gkhrkk4bilQ0=; b=dAzwO2spMjFA52YP
	lWfm1fMR9YkERhc8Qme5ieeIMcKp8DTbFKHz3g+J/qI9d4lfz9FKE1n5G7LZFAfk
	oeMOa3vGAFr9C7IU7MBa3dnNMI/IjnjNURZByNs6v03+je/pSd9LhyQzrPn68mTh
	oRIjUzuMixpoZZ/WEHhriOKux5nPPCjxGGXHmlkCGFC7Dim4cRaPXHqcx7CZkPm/
	ox+dHFzPKc4bNVncWmkCcruNWtEGvLtJq5esi8U+Rt5ipLgEN6eZ1ZYaebrNwz5o
	JpUTEEMGES6T9LIVpjW3l7XGajRTzhPAQuNmxRpxjtugzbcYICFHS5ih+l7nBqzg
	eMHVMg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0qms0mv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 15:32:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f33438950so474609385a.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 07:32:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794929521; cv=none;
        d=google.com; s=arc-20260327;
        b=godkE93HDAYnp9LjD2ZeMjwrkjB/9V5tyAQ9Smx9dv8SAjwSzCsenu6bQBEpJJ26VG
         yracjA6hpb1IAlYgaA+Lwuh6oed336f4j9WKlFbkYAMgLQgbncQ7CGW6t3Fi0kiTDhtc
         vrATZwp0RKBIkl5qcJnm53e7LCBth8gDCvu4oiKiXZ06s7RIK+dmCJ5bLAYXKOYXoaY+
         gQOin0MeVo8qqbVBGI61JFT1pU7ol5LBMH6gwtz5CrgJ7feqas/Yt4k8fscOvGSQvy1N
         8ue1sLpFU/tMqBU+JPqRJQf6Wg9PlsYqf4hp/34nsS8QxE30v9o1d4bX2Ucy751t+VUV
         QSfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rvqbXhDVk4eAuTewQMcNRxrpZoO2UE6gkhrkk4bilQ0=;
        fh=7na+E1Tu6fDTxmtIGnAArnTiLvldD/9zJEX/smfarH0=;
        b=pKcmkXCfAFlv0GBvG/Dgg3BZdrCNUkh9s+1lOlnbHgb0UPdkRIctv4y9D+wTd1RaE2
         eRoU82WFmpzOJStvGLzcK9if6vWBFVI1CE2Pa9PvFgLYwKWdUJ5FDNxE25KCOhX6TaWJ
         gkS/b9xjRpzabnsCZ3k0/+ieyuIrMYCrLw6jfq+QAzNaiiA2f2+0UckcTxy0IfoZ7l+g
         S4akkPo0qqJkn27mOMcVKLH6qZy5+FxMd+IAF4wFLDw2KUuAyCCcztPoW4HXQzbLKAxX
         6+9n1zyJswkSZoN7wK3tXHsesswSELePlEmccVItx+uTrIzJr3e09lzV1Z2QxaV/i9ar
         Kk+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794929521; x=1795534321; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rvqbXhDVk4eAuTewQMcNRxrpZoO2UE6gkhrkk4bilQ0=;
        b=XzMoZm8bwc99KeKWDbAqZP5FDIZNAkZMO35UvAEE3IusdNg1CWOJPj+MCF7m37atHo
         vFGGuvM2SghCX6A4LSubZ0CYF7KVRgoKj6C/GyslZrepHxOf503VLy861uLKbMxMY1Ff
         8FbGGD+y7Afvx7VBB64Tp9sh2pbaNJ6+bE+fZalGBA6gvapKFXVlBHNMESEpIm2Jfg4a
         mgWyH1oURQ2hvWVHJ7ckcIdpgr9PTCoW5JZLWKa1TIyL1Woqr8tF49n4C3t/CEGJoEMh
         TyKldlKhgetDiRFMJX10eq0tBRhikacoM9yqgCCYjgBeEy/x3L158wJRn85lSd0T8gSd
         ytGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794929521; x=1795534321;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rvqbXhDVk4eAuTewQMcNRxrpZoO2UE6gkhrkk4bilQ0=;
        b=G9u4fnHKo10Rtcbbt4Gg+3xwbtGEVy6u2WAjkTQ3Zv0a0Vdm9U/VI19Pu+LHVgkm7O
         SCc2MZZ0VqpF1aGJalhWRxs1N9dDSKEx1gsAImLUZATGl5RnFx/PWGbUk6gK26cMHJfT
         EJC2lAfM6p+p/ARcc+CpbqO2UNPGhexdihqlJZuhmnexxRhgIMurZDj6CLixJphTVlM1
         I0lbzM0y/waPHmmSrRYGxe+htoCVCmJyTIeiajeEGewLeo5U85YoMslCPsdXINvMQBzE
         weVlnrFv89CSP95PjvLuXaJtoZOxo49UFr0HuwANFsnYYdVqqwtIa2tQw03KYgxpY00l
         6wFw==
X-Forwarded-Encrypted: i=1; AL+hErFzYcdSCLaJFsmLuuGVaASxfhMllvXlEWLqApmxSaI67gcYp6NEW/j1yQwve728SZD2RiaXRzHt74M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KKTi75umOPC4ULm6Pso9ehi24x53A4vUg0X1S0AfQsTPXwFnu
	UGMczs2VfW8i74d5KjRBTxWo/gDgczG2r8i95DD8wChWsELKZ2mhWZKs50M1mSNXoDh5j0Bd70s
	a7fzUlUI8ZPIFJfO0+p16nrCkL2Ul6J6T1spFx083C1ofLNpHXCtRW2nKfF6ekEQqF7FZRQ4G7w
	T+iYDf+/flD4gMOPFfDfy5Lfja4wQbzGY87ujWcw==
X-Gm-Gg: AYBFou0phsopLnEminInjZ03SA2ZORuG8ubhT5mplQJOUl8wFWxLIKFfVbE5dhoXcxV
	tot5xTZ3qNAB2eU2XYgNEvK9MoYkE5p8UoWX2yoItF/gMu9AvXsWQXtorBkLHsvjRe42tyaa7sM
	xaiFK9/INP5mRC0E1SzQRchaxzTYUvQqgd/3ovGF0HpivhUjxeb8G1D+aqHModSRdkWHRZB8ekG
	4TL4OU4Fw14lm7cRSJKBEK1pf8EnBuHPdlpu1JtOIEJPZ1rGmq4skJE2iXJDXJraOd+VOUgo4uc
X-Received: by 2002:a05:620a:2548:b0:949:7b51:2dc1 with SMTP id af79cd13be357-949994ae281mr2618685a.2.1794929520987;
        Tue, 17 Nov 2026 07:32:00 -0800 (PST)
X-Received: by 2002:a05:620a:2548:b0:949:7b51:2dc1 with SMTP id
 af79cd13be357-949994ae281mr2612285a.2.1794929520342; Tue, 17 Nov 2026
 07:32:00 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-t9xx_driver_v1-v12-0-e181b616b820@compal.com> <20261117-t9xx_driver_v1-v12-2-e181b616b820@compal.com>
In-Reply-To: <20261117-t9xx_driver_v1-v12-2-e181b616b820@compal.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 16:31:48 +0100
X-Gm-Features: AclHuK_lDMCUZMYyFfncaim5uPRYhhiPBMrtwbTDrTdo14SKGBiqnZxhh1KjEuo
Message-ID: <CAFEp6-2Ru8=dMA=ra3r+ShvxWoLAa0i-xw0e8vhQ+QxRah3f3Q@mail.gmail.com>
Subject: Re: [PATCH net-next v12 2/6] net: wwan: t9xx: Add control plane
 transaction layer framework
To: jackbb_wu@compal.com
Cc: Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Wen-Zhi Huang <wen-zhi.huang@mediatek.com>,
        Shi-Wei Yeh <shi-wei.yeh@mediatek.com>,
        Minano Tseng <Minano.tseng@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Robert Yu <robert_yu@compal.com>, Jeff Chang <Jeff_Chang@compal.com>,
        Eric Dumazet <edumazet@kernel.org>, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2MSBTYWx0ZWRfX6gin33LoZ9D7
 dcLUtHRQEGGwQXjvzZxFjbNuRAbfEmfCZ10n+FrZY/L3cz2Ku52/UfXeJsR73YPg+VDIag8W1BT
 6tA8geeeZ4q0zEdDYzmzrN03E5HFFb8=
X-Proofpoint-ORIG-GUID: cSZFRGYYAhdKeM1WRZFIKeKlttLeara5
X-Proofpoint-GUID: cSZFRGYYAhdKeM1WRZFIKeKlttLeara5
X-Authority-Analysis: v=2.4 cv=BIEmP1QG c=1 sm=1 tr=0 ts=6afc7372 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=3D83DlupAAAA:8
 a=qgzm9M8pbGeJEq2Y9kQA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=LLo2LcjZcqwTTUQ_I4Ao:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2MSBTYWx0ZWRfX7rElIPVtniPP
 Bj2DXcvemR0F4xVnVHrTz6YQgV/NV/TPCsmcGqZnnPVuxaEC5B9tSncdRS1LD2v5fsc658dXLuQ
 rc9r7sbj0BP+zKD/OkL7wNZmrmZydEGbe/dK93V+u9jgDfhKRsxUVmZitqgzQfRYbsY1Bg/BjGy
 OVq4GGNoUYPlpiEVjaMtCehXBz46oKopLuRAf5pqRECaVmhOzzUCm2L4XNsNDklc2HGwltmfoV3
 BwMkd/RCbOlUcJ2oGNt7dpauzAsOsIiZC5/K1Ei1+DKpWJVS/S+qEIG1dQe/j3uPZQRx4Jz55B4
 0kbPtFrnDmnbDTRknhUfzSSyNpls0Lm2ghJ5DeUYveUsoejwZlEQ0fF3CaTQWrU5+Xeh0Nn4Hcf
 wY6Y7SEdx+bgePXWNy1C9mGJ7IJX+k7vSY7brtfFDSwC3pESjCsE/pCKWRkpS4SQeTP1Cp91Nzg
 Syvm9vBjZQiV8oW85cQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170061

On Tue, Nov 17, 2026 at 11:51=E2=80=AFAM Jack Wu via B4 Relay
<devnull+jackbb_wu.compal.com@kernel.org> wrote:
>
> From: Jack Wu <jackbb_wu@compal.com>
>
> Introduce the control plane and transaction layer framework
> for the T9XX WWAN driver. This patch adds the core data
> structures (mtk_ctrl_blk, mtk_ctrl_trans) and initialization
> entry points that subsequent patches build upon.
>
> The control plane block (ctrl_blk) starts out with only the
> device back-pointer and an opaque pointer to the transport
> context; later patches add the port layer and FSM hooks to
> it. The actual DMA engine and TX/RX service
> implementations are added in subsequent patches, and
> mtk_ctrl_init() and mtk_ctrl_exit() get their first callers
> there, in pcie/mtk_trans_ctrl.c.
>
> Signed-off-by: Jack Wu <jackbb_wu@compal.com>
> ---
>  drivers/net/wwan/t9xx/Makefile              |  1 +
>  drivers/net/wwan/t9xx/mtk_ctrl_plane.c      | 45 +++++++++++++++++++++++=
++++++
>  drivers/net/wwan/t9xx/mtk_ctrl_plane.h      | 21 ++++++++++++++
>  drivers/net/wwan/t9xx/mtk_dev.h             |  3 ++
>  drivers/net/wwan/t9xx/pcie/mtk_pci.c        |  1 +
>  drivers/net/wwan/t9xx/pcie/mtk_trans_ctrl.h | 19 ++++++++++++
>  6 files changed, 90 insertions(+)
>
> diff --git a/drivers/net/wwan/t9xx/Makefile b/drivers/net/wwan/t9xx/Makef=
ile
> index bd6063c85c2b..0a07507f1ddf 100644
> --- a/drivers/net/wwan/t9xx/Makefile
> +++ b/drivers/net/wwan/t9xx/Makefile
> @@ -6,4 +6,5 @@ ccflags-y +=3D -I$(src)
>  obj-$(CONFIG_MTK_T9XX) +=3D mtk_t9xx.o
>
>  mtk_t9xx-y :=3D \
> +       mtk_ctrl_plane.o \
>         pcie/mtk_pci.o
> diff --git a/drivers/net/wwan/t9xx/mtk_ctrl_plane.c b/drivers/net/wwan/t9=
xx/mtk_ctrl_plane.c
> new file mode 100644
> index 000000000000..18f0573ac653
> --- /dev/null
> +++ b/drivers/net/wwan/t9xx/mtk_ctrl_plane.c
> @@ -0,0 +1,45 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022, MediaTek Inc.
> + */
> +
> +#include <linux/device.h>
> +
> +#include "mtk_ctrl_plane.h"
> +
> +/**
> + * mtk_ctrl_init() - Initialize the control plane block.
> + * @mdev: Pointer to the MTK modem device.
> + *
> + * Allocates and initializes the control plane block
> + * associated with @mdev.  Runs once per bind; the allocation is
> + * devres managed and is released at unbind, not by
> + * mtk_ctrl_exit().
> + *
> + * Return: 0 on success, -ENOMEM on allocation failure.
> + */
> +int mtk_ctrl_init(struct mtk_md_dev *mdev)
> +{
> +       struct mtk_ctrl_blk *ctrl_blk;
> +
> +       ctrl_blk =3D devm_kzalloc(mdev->dev, sizeof(*ctrl_blk), GFP_KERNE=
L);
> +       if (!ctrl_blk)
> +               return -ENOMEM;
> +
> +       ctrl_blk->mdev =3D mdev;
> +       mdev->ctrl_blk =3D ctrl_blk;
> +
> +       return 0;
> +}
> +
> +/**
> + * mtk_ctrl_exit() - Clean up the control plane block.
> + * @mdev: Pointer to the MTK modem device.
> + *
> + * Clears the control plane block pointer. The allocation
> + * itself is managed by devres and freed on driver detach.
> + */
> +void mtk_ctrl_exit(struct mtk_md_dev *mdev)
> +{
> +       mdev->ctrl_blk =3D NULL;
> +}
> diff --git a/drivers/net/wwan/t9xx/mtk_ctrl_plane.h b/drivers/net/wwan/t9=
xx/mtk_ctrl_plane.h
> new file mode 100644
> index 000000000000..46f1ab9f0551
> --- /dev/null
> +++ b/drivers/net/wwan/t9xx/mtk_ctrl_plane.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0-only
> + *
> + * Copyright (c) 2022, MediaTek Inc.
> + */
> +
> +#ifndef __MTK_CTRL_PLANE_H__
> +#define __MTK_CTRL_PLANE_H__
> +
> +#include <linux/skbuff.h>

Is it actually unused here?

> +
> +#include "mtk_dev.h"
> +
> +struct mtk_ctrl_blk {
> +       struct mtk_md_dev *mdev;
> +       void *ctrl_hw_priv;
> +};
> +
> +int mtk_ctrl_init(struct mtk_md_dev *mdev);
> +void mtk_ctrl_exit(struct mtk_md_dev *mdev);
> +
> +#endif /* __MTK_CTRL_PLANE_H__ */
> diff --git a/drivers/net/wwan/t9xx/mtk_dev.h b/drivers/net/wwan/t9xx/mtk_=
dev.h
> index fc25418bb957..ff3cbaa4329e 100644
> --- a/drivers/net/wwan/t9xx/mtk_dev.h
> +++ b/drivers/net/wwan/t9xx/mtk_dev.h
> @@ -28,12 +28,15 @@ enum mtk_dev_evt_d2h {
>         DEV_EVT_D2H_ASYNC_HS_NOTIFY_MD  =3D BIT(6),
>  };
>
> +struct mtk_ctrl_blk;
> +
>  /* mtk_md_dev defines the structure of MTK modem device */
>  struct mtk_md_dev {
>         struct device *dev;
>         void *hw_priv;
>         u32 hw_ver;
>         char dev_str[MTK_DEV_STR_LEN];
> +       struct mtk_ctrl_blk *ctrl_blk;
>  };
>
>  #endif /* __MTK_DEV_H__ */
> diff --git a/drivers/net/wwan/t9xx/pcie/mtk_pci.c b/drivers/net/wwan/t9xx=
/pcie/mtk_pci.c
> index cf59038f0906..3dd8efa374ff 100644
> --- a/drivers/net/wwan/t9xx/pcie/mtk_pci.c
> +++ b/drivers/net/wwan/t9xx/pcie/mtk_pci.c
> @@ -13,6 +13,7 @@
>  #include <linux/module.h>
>
>  #include "mtk_dev.h"
> +#include "mtk_trans_ctrl.h"
>  #include "mtk_pci.h"
>  #include "mtk_pci_reg.h"
>
> diff --git a/drivers/net/wwan/t9xx/pcie/mtk_trans_ctrl.h b/drivers/net/ww=
an/t9xx/pcie/mtk_trans_ctrl.h
> new file mode 100644
> index 000000000000..9b42f33bd008
> --- /dev/null
> +++ b/drivers/net/wwan/t9xx/pcie/mtk_trans_ctrl.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0-only
> + *
> + * Copyright (c) 2022, MediaTek Inc.
> + */
> +
> +#ifndef __MTK_TRANS_CTRL_H__
> +#define __MTK_TRANS_CTRL_H__
> +
> +#include <linux/list.h>
> +#include <linux/skbuff.h>
> +#include <linux/types.h>

Same question.

> +
> +#include "mtk_dev.h"
> +
> +struct mtk_ctrl_trans {
> +       struct mtk_md_dev *mdev;
> +};
> +
> +#endif
>
> --
> 2.34.1
>
>
