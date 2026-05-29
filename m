Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB773DA7D7
	for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 11:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780055024; cv=pass; b=JGd6lZxYZHrfSOOsm9mcdmebWPwVn081B2Q1qnRl7aWsHbj9L1IFFJ7zo4CJ4VvlAc0nqbvwjGVlhg69nZk9u3HvvNrTKUySpzOb2oQpAyiPWg7KIOuCiiS5dLWPS9EWdW9GYe88MMG/dWFL8WuRiHp5gEvFA9BXzVjWn0idJuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780055024; c=relaxed/simple;
	bh=r7r0VCZ3BbHVlEYX/S4Fb3KdGS6LX7XAVFmaM7m95Q0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tAYGBf6e+dMdEewzivZ4OKF9+3sJ5OMAdF7t4Zl527mzzXoSVnTs5KS59xrpal4JxZ4T7XM26bGGeWPtOstKNpqjZIN60tNNgxqzmMN803a4kL1gyaDoxkVMC+JaRkLALeZx7WP9OF4F221zdhqsOpP4WyIAgbwr6hPAnolx5js=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fu2xW87Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HuH+CX1G; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fu2xW87Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HuH+CX1G"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T88HSa1495603
	for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 11:43:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fyuHx5/5ZvH1qgXlQ0SO3dmToxgjn2GMPokfTYgcJgE=; b=Fu2xW87YYyD+4yeW
	KDg4YEwTK1yKM6c34f+6/pxqjBETi2zXuZLZ7Vbd7nCqyIHkTWdzz2S6U8JNvFzR
	V79yctXtNO8+RiYESsy1Am1J+AoaBWVTaYEqPoF7/EELwXQsMHuYPvopds/Gwzkm
	ffpF6F1n/2wtxTER/MqlSN6zm7uTPXijiZqKhEG0hkEhowZgcgQ3/guY+t/QBfo6
	63Yj1qtmZuv+8dXufp919UlzBbfWBj98E05nf43soX/b3MmLCT89LRbCs2X7MoR+
	2gICN3w3XG7przi1xNh2UA4rl0Su45BZ8XWmK3hVP5x4PEHy+8suox0IzvSj/Vrk
	S/Inow==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef015aenf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 11:43:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-90cbd806004so2809383785a.0
        for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 04:43:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780055021; cv=none;
        d=google.com; s=arc-20240605;
        b=WptFmIC+8/RG1IjkvPluEhGoXUNDWWtGeaHXwxGyq5OYb7vdY+er9MOhZBkywlQufV
         nKqxz8hI6ee+VDB94ic/gr83DRcrNRdMScBGj6V1LR14/1Jf8jGC6TX3KxSjM3mftp/E
         vD5ECT4xMpi+i79KVGNfI2VECSGoBNrMFrrM6NwBnL2EJqy++Y1ReqTC+ubbY/OH7srn
         v236RdzEFzZeUOMi95nS4YS7YaBicbFc0MUbkWelMjilsk/hEh54b3D9W+W0RerGthyk
         407OtWN9G3979FiuvLI9KGaFDWkV940VfVISSY8ik9e+cSL2O1Bv6mBsQxSPvPlhCDcZ
         OXZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fyuHx5/5ZvH1qgXlQ0SO3dmToxgjn2GMPokfTYgcJgE=;
        fh=/JRDpMN2zE+hyKv1rJ91x+npaPWCJI7Ijs1WMPQvtv0=;
        b=KQXpR6pZwx88QAPPZdgzM3JK9J1IJ+VqjVvYnUj53+sUpp1JifKZXrAikCgExOwMt6
         ObVADnnUaQjVszj8Q1wkHOzAf9HqAv+bjRK+KtPBt1Rnr147iakzn9KITD4lp+nmfeFX
         dkyETf/7B12Oty9jKP5SnL3PmLLUZLHm7I6yLbBnuno7paOo88CUoUYtjRJKJhRrW647
         NKoiMNc2uymTEJa42SlourucZlZvczumVD49jpA99WmuRKpQsckMw1nw0DzZkJzoYAX7
         74zRxkQPwfQDQNTZf8ZIan638aZ+i4BN+N0tOuuLNbKNsMul/ctvPQOHYKHn64hpcmPX
         K81w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780055021; x=1780659821; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fyuHx5/5ZvH1qgXlQ0SO3dmToxgjn2GMPokfTYgcJgE=;
        b=HuH+CX1GdQb8EmQoRMKwUGGI8OSpPk14BLhQjgP3nk9PuBCLmLpw5YKddOw9h79RUQ
         6c3n3cAfdkiCZs6A9U5cERBKwpitSD6upHOdflo0AF19crgbCjLzeSRddjFZwEzeaLO0
         kLkkEUs0EMeGtYrZucu5QEj7vSuDHARpCEwQI6psx7daq7KPIQwIrd57n7J3uto36RHn
         qZfUT5Kr0xLaN8yFb4ayMmbqdYgAa+2rZnUXPGs48oGyr5zGv1lwfEqHEEFL6Y9PCQeP
         FX44AexA4yezEr2V8KNrSv16pZn5ft9HxGQCoN7FdEMjEO+VsLpJdRnH4Fe+llc7ZP9H
         ALOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780055021; x=1780659821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fyuHx5/5ZvH1qgXlQ0SO3dmToxgjn2GMPokfTYgcJgE=;
        b=YkC2HKyg4VYoPeyJDBy2sJOxUttxvKU73UZo0IkHxC7RA0/oQhL4OV3sO93OHEHouL
         0H4impsYwb9WBBVheL95SphXBX4JKnZ4Uj9QR1X4gkjJUKKImtc/4FhpcWtd+8qZJRRy
         5Tg7rXTXhI3N8W9n7RXHCr5Hr7vfFeszDdBY8rp1XIcqQG4wSSM6n5NYU8Sp2jOxd7vS
         0cmIbhx37m2ATsngRYpepuwda4faI7nSpTsaM0jw5m5Hzzn925ohJzooC/jCwQteDlFy
         xIjVucd11oJ5sheE1GK3YawCdujaYS7rSzRDqF+tsrbHHck98EBKycsFMxukGKAY2z2o
         AXyw==
X-Forwarded-Encrypted: i=1; AFNElJ8b2WVlnmwkroV4pEZoGKHbzw42hTx2gDMDQpvEX7wt0BDMGc42R+k8Vpyz3fwhNINxNikRuoQWqzY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3FiocnTOSpRfj4hg9IPABehMT5FYw3D48euOsrP0aXFW7kvpf
	lR24Ey7TGfNOjlsNG8t/EcOsJh4wMdufmZF3IrbAxkusorW52WW/anmH6yy00B28W941Bq3KQgC
	0DdkTwzOiY5VaUDIng4JS/gKAEhSiNO6H3hzAihFVO9OJAftZETvwnBP3RvWKZAj0cnB+uNWhZi
	sGtYSkmD6qWLZ+CNArkp0/J6c6mbygpugxD+yW1A==
X-Gm-Gg: Acq92OH718ELKQibW7NWr5Qxx/idlgIcoGf+3U0WXPXQrR+Tms7I7DG2XxawsPcqagw
	6GsUTouSuhL6VpFDjVeEykCKg47KJjAA36/1OqXs+FBaLYqvYslLQRoBcb0j7sqZ+/w+0MEeMu9
	re6O6IaSH2un/xxRtEjAF8yvHMtCsvxzewSORNAPGLNrHLfo4ob01pWVcMX5w9Nqi5gDfDJiHSP
	SLVYcwUB+i1fn36kRBPShjE1Mew/R7W9wwWCRyqhZSeLyVFV58=
X-Received: by 2002:a05:620a:46ab:b0:8cb:9975:cba8 with SMTP id af79cd13be357-915300d1513mr314025585a.62.1780055021091;
        Fri, 29 May 2026 04:43:41 -0700 (PDT)
X-Received: by 2002:a05:620a:46ab:b0:8cb:9975:cba8 with SMTP id
 af79cd13be357-915300d1513mr314021885a.62.1780055020581; Fri, 29 May 2026
 04:43:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529-t9xx_driver_v1-v1-0-bdbfe2c01e57@compal.com>
In-Reply-To: <20260529-t9xx_driver_v1-v1-0-bdbfe2c01e57@compal.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 29 May 2026 13:43:29 +0200
X-Gm-Features: AVHnY4IbpeWPy4_nKNjQp3G-zFolj0rVyObyJjw9IsO8YU5DydMGzXKXSO_M7DM
Message-ID: <CAFEp6-0ntknHnpsj99YUHpD8R5SMDHf8Upn+yaED-A-sxonscw@mail.gmail.com>
Subject: Re: [PATCH 00/11] net: wwan: t9xx: Add MediaTek T9XX WWAN driver
To: jackbb_wu@compal.com
Cc: Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Wen-Zhi Huang <wen-zhi.huang@mediatek.com>,
        Shi-Wei Yeh <shi-wei.yeh@mediatek.com>,
        Minano Tseng <Minano.tseng@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: GtvR0iwu1YAQFMu5tQRYCAEOpkCcTjGm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDExNiBTYWx0ZWRfXznBvlKT3n/PG
 X/tquA6X2Krx7tei4wmYqlVA8XOdldCBEglnA9Nn82aeuZWgGr2vXHU/A3jR2aM/JYJ4/IlDp6g
 sFENbglQRD1LXlVXbodTgf0gEvXPUDDgfY34ETtAySBr86e5h+sBcRc5x7gzECAgNzHerIskGAI
 zlV14IfG+BIc5yb88raB0IMVjXeeKyrYe8cEl5cnFUSFFzxNFJyQ/YStDkJggR8kN/LseUDmDh5
 D9b6/8vYhkwEcECVOCkCPWq7GNcKmFYvxX1ZUucck4L5JalGBgGKIul079/JUn9hRXafyBlrLpt
 QJIkMX6/V1HY7dYB4SQrQkb0XPyUpn9crB4Ts/WnBKuYpYAd7pOUEdmLHJVO10U4mkt97F45AhZ
 mbo7Ih31WS0cuX6z5gntyRmQO18sJR2/6YPSg+P3C2qAhQLZqcvzQUpovxq6yYKovk3E89X9La6
 6Pp4tGVfv1y1eEqm05Q==
X-Authority-Analysis: v=2.4 cv=DIG/JSNb c=1 sm=1 tr=0 ts=6a197bee cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=3D83DlupAAAA:8
 a=GQ8KfrVOiNvgsdg8hPQA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=LLo2LcjZcqwTTUQ_I4Ao:22
X-Proofpoint-GUID: GtvR0iwu1YAQFMu5tQRYCAEOpkCcTjGm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290116

Hi Jack,

On Fri, May 29, 2026 at 12:31=E2=80=AFPM Jack Wu via B4 Relay
<devnull+jackbb_wu.compal.com@kernel.org> wrote:
>
> T9XX is the PCIe host device driver for MediaTek's
> t900 modem. The driver uses the WWAN framework
> infrastructure to create the following control ports
> and network interfaces for data transactions.
> * /dev/wwan0at0 - Interface that supports AT commands.
> * /dev/wwan0mbim0 - Interface conforming to the MBIM
>   protocol.
> * wwan0-X - Primary network interface for IP traffic.
>
> The main blocks in the T9XX driver are:
> * HW layer - Abstracts the hardware bus operations for
>    the device, and provides generic interfaces for the
>    transaction layer to get the device's information and
>    control the device's behavior. It includes:
>
>    * PCIe - Implements probe, removal and interrupt
>      handling.
>    * MHCCIF (Modem Host Cross-Core Interface) - Provides
>      interrupt channels for bidirectional event
>      notification such as handshake and port enumeration.
>
> * Transaction layer - Implements data transactions for
>    the control plane and the data plane. It includes:
>
>    * DPMAIF (Data Plane Modem AP Interface) - Controls
>      the hardware that provides uplink and downlink
>      queues for the data path. The data exchange takes
>      place using circular buffers to share data buffer
>      addresses and metadata to describe the packets.
>    * CLDMA (Cross Layer DMA) - Manages the hardware
>      used by the port layer to send control messages to
>      the device using MediaTek's CCCI (Cross-Core
>      Communication Interface) protocol.
>    * TX Services - Dispatch packets from the port layer
>      to the device.
>    * RX Services - Dispatch packets to the port layer
>      when receiving packets from the device.
>
> * Port layer - Provides control plane and data plane
>    interfaces to userspace. It includes:
>
>    * Control Plane - Provides device node interfaces
>      for controlling data transactions.
>    * Data Plane - Provides network link interfaces
>      wwanX (0, 1, 2...) for IP data transactions.
>
> * Core logic - Contains the core logic to keep the
>    device working. It includes:
>
>    * FSM (Finite State Machine) - Monitors the state
>      of the device, and notifies each module when the
>      state changes.
>
> The compilation of the T9XX driver is enabled by the
> CONFIG_MTK_T9XX and CONFIG_MTK_T9XX_PCI config option
> which depends on CONFIG_WWAN.

Can you specify which userspace counterpart you need (e.g., a
ModemManager version or a link to the relevant patch series)?


>
> ---
> Jack Wu (11):
>       net: wwan: t9xx: Add PCIe core
>       net: wwan: t9xx: Add control plane transaction layer
>       net: wwan: t9xx: Add control DMA interface
>       net: wwan: t9xx: Add control port
>       net: wwan: t9xx: Add FSM thread
>       net: wwan: t9xx: Add AT & MBIM WWAN ports
>       net: wwan: t9xx: Introduce data plane hardware
>       net: wwan: t9xx: Add data plane transaction layer
>       net: wwan: t9xx: Introduce WWAN interface
>       net: wwan: t9xx: Add power management support
>       net: wwan: t9xx: Add maintainers and documentation
>
>  .../networking/device_drivers/wwan/t9xx.rst        |   48 +
>  MAINTAINERS                                        |   10 +
>  drivers/net/wwan/Kconfig                           |   17 +
>  drivers/net/wwan/Makefile                          |    1 +
>  drivers/net/wwan/t9xx/Makefile                     |   16 +
>  drivers/net/wwan/t9xx/mtk_ctrl_plane.c             |   95 +
>  drivers/net/wwan/t9xx/mtk_ctrl_plane.h             |   88 +
>  drivers/net/wwan/t9xx/mtk_data_plane.c             |  104 +
>  drivers/net/wwan/t9xx/mtk_data_plane.h             |  105 +
>  drivers/net/wwan/t9xx/mtk_dev.c                    |   55 +
>  drivers/net/wwan/t9xx/mtk_dev.h                    |  114 +
>  drivers/net/wwan/t9xx/mtk_fsm.c                    |  931 +++++++
>  drivers/net/wwan/t9xx/mtk_fsm.h                    |  140 +
>  drivers/net/wwan/t9xx/mtk_port.c                   |  967 +++++++
>  drivers/net/wwan/t9xx/mtk_port.h                   |  176 ++
>  drivers/net/wwan/t9xx/mtk_port_io.c                |  576 +++++
>  drivers/net/wwan/t9xx/mtk_port_io.h                |   41 +
>  drivers/net/wwan/t9xx/mtk_utility.h                |   33 +
>  drivers/net/wwan/t9xx/mtk_wwan.c                   |  475 ++++
>  drivers/net/wwan/t9xx/mtk_wwan.h                   |   17 +
>  drivers/net/wwan/t9xx/pcie/Makefile                |   19 +
>  drivers/net/wwan/t9xx/pcie/mtk_cldma.c             | 1527 +++++++++++
>  drivers/net/wwan/t9xx/pcie/mtk_cldma.h             |  176 ++
>  drivers/net/wwan/t9xx/pcie/mtk_cldma_drv.c         |  373 +++
>  drivers/net/wwan/t9xx/pcie/mtk_cldma_drv.h         |  174 ++
>  drivers/net/wwan/t9xx/pcie/mtk_cldma_drv_m9xx.c    |  177 ++
>  drivers/net/wwan/t9xx/pcie/mtk_cldma_drv_m9xx.h    |  101 +
>  drivers/net/wwan/t9xx/pcie/mtk_ctrl_cfg_m9xx.c     |   55 +
>  drivers/net/wwan/t9xx/pcie/mtk_dpmaif.c            | 2714 ++++++++++++++=
++++++
>  drivers/net/wwan/t9xx/pcie/mtk_dpmaif.h            |   16 +
>  drivers/net/wwan/t9xx/pcie/mtk_dpmaif_drv.c        | 1586 ++++++++++++
>  drivers/net/wwan/t9xx/pcie/mtk_dpmaif_drv.h        |  268 ++
>  drivers/net/wwan/t9xx/pcie/mtk_dpmaif_drv_m9xx.c   |  687 +++++
>  drivers/net/wwan/t9xx/pcie/mtk_dpmaif_reg.h        |  387 +++
>  drivers/net/wwan/t9xx/pcie/mtk_dpmaif_reg_m9xx.h   |   37 +
>  drivers/net/wwan/t9xx/pcie/mtk_dpmaif_ring.c       |  168 ++
>  drivers/net/wwan/t9xx/pcie/mtk_dpmaif_ring.h       |  161 ++
>  drivers/net/wwan/t9xx/pcie/mtk_pci.c               | 1067 ++++++++
>  drivers/net/wwan/t9xx/pcie/mtk_pci.h               |  219 ++
>  drivers/net/wwan/t9xx/pcie/mtk_pci_drv_m9xx.c      |   70 +
>  drivers/net/wwan/t9xx/pcie/mtk_pci_reg.h           |   72 +
>  drivers/net/wwan/t9xx/pcie/mtk_trans_ctrl.c        |  593 +++++
>  drivers/net/wwan/t9xx/pcie/mtk_trans_ctrl.h        |  105 +
>  43 files changed, 14761 insertions(+)
> ---
> base-commit: eb3f4b7426cfd2b79d65b7d37155480b32259a11
> change-id: 20260529-t9xx_driver_v1-1744f8af7739
>
> Best regards,
> --
> Jack Wu <jackbb_wu@compal.com>
>
>
