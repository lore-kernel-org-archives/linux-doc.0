Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463459;
	b=B9JU8blbirLXG84mDiDUiNhQGygxataw1P7QEjvKpmH8W6wfmW0GGNFnQD7yzLMhomxp
	 4fEuuzgJN7b7Yon7GVQ7bBBAPU6JkjdWqPbRicfwUprI0avposJdiVpTNd/wBqDC6MFZx
	 WaltJowWpFMCNkoWZs11AVd4YY3OtdjhsSaRus0jKSGMbZMyRBn8uW3stzHeopSUdB8dW
	 oMET2AlXCin9Yj4XBGFxrEGeuT7SCbBRqyXnuDmKLCm6U9A8MuKVnMhhgFMm2AuEsWvP4
	 QuKx/bJgqi+oJUnv1iJ05OtrBjcbIq/LbGo2hyOHUCEN/KfzdzxN33Q+9BWJYz0T3NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463459;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MKAF1yU3dsH3xPiGgQsiz0cRqHhH3deT2s3XLmIxZNU=;
	b=n/BWAch4N7bF9M9p1vhiCjzxSK6mvMwfRJV79rhjGOsXhqg8KsGDtDgcM3XN7cH8ySdB
	 xLrZv/llxw2pmPbGBgKlE03ft6b5YaWJ5WCMkrZWvrge9YAH3JgvFv73+i+1Gh82hp166
	 BdU7iOQ9KfJScbd6u6nnirFBieUt4WP7PANv/2ji0FMVKj89XQZVUZiPQOhRy+PtUCNZi
	 8QDqrBZUY9YiFziBg3gzQy0M5GXqyOHHsyRfiuHqTz80DG2IqVevXsPMATdRgrjwCst6U
	 KuGOUmyUpXhkRFowYzqalQ4QG1/twJhJ3kPw2S3vFFILIdUrANzXnJ15YS3Reun7ONw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QvB72mTU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X1B1nkDD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544D2606A31C
	for <linux-doc@vger.kernel.org>; Sat, 31 Oct 2026 16:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 544D2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QvB72mTU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X1B1nkDD
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD04n93208646
	for <linux-doc@vger.kernel.org>; Sat, 31 Oct 2026 16:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MKAF1yU3dsH3xPiGgQsiz0cR
	qHhH3deT2s3XLmIxZNU=; b=QvB72mTUHo6A4AVKQ/l4aWjqbBPj3k6hKKiOrc3L
	hko/uvjFzffkl1HUVLsn5ygrIgBumEyYSAVqFoS5aJIevbhKEHAu796ZnnnZ8dte
	SvtYqrSdcjlBgoZ8S9M5uuspxv7l/6ZJmNA4sFZxFlXWJ+FiRqRzwDFR7/GhOH+f
	8ZOsbpZABNQI3W9MRx7TIR6NnX8pGG7emNpI2f8NPIVfY3gVJOXVQc+DSlIl4IMf
	wBvsxmZeSV6Z8DoU6RwYuiI0ETAPT+13/Q7K3AfOhuTPOx7ShiQh51tFKZG81jv8
	oSaQjjIY7haoqZJB6sKeTaasKeplqJxhafHFUC2I7BAZFg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn79rsnhy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Sat, 31 Oct 2026 16:17:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2373e9b4so167964385a.1
        for <linux-doc@vger.kernel.org>; Sat, 31 Oct 2026 09:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793463456; x=1794068256; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MKAF1yU3dsH3xPiGgQsiz0cRqHhH3deT2s3XLmIxZNU=;
        b=X1B1nkDD3lntu+lQKt36KSiqEnEBaAnn/4i182Ku3jaVSgFLRyDkhNtO6kJaTpAGzM
         O6vtX9TO0coqnV0aqtFxNV9szAdFsarBaptWAIRe9n8od/P1AIb2Gwdn9kA/TYVQcknT
         A9oXnH1zcBsUSpHb3g+D5lmIo35bGLYPS/jRucC7ynef/8YzndV/NHAbFGdnhd2uIehK
         Ifdb5fdZozmUijnRHi9eUEXJnkRNi7JgfXuEavsPhfWYEnOWnvy3/6P8tuBi3WAbFxBH
         dEvpiHpPvn/m+P7DBvVE/NgXRNVUs9nlTX0zzQbDKv/9qsCIw0bYVEeZv1d3blWeWDHM
         nWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463456; x=1794068256;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MKAF1yU3dsH3xPiGgQsiz0cRqHhH3deT2s3XLmIxZNU=;
        b=qfQxE7ayWY+4+E9WmueDpuZDL430HfBCT5wtpF/bYwqdRwFASeGnRQbf0+MjYz1eOw
         w5VOrvYt0zJIqrzQX3lOZQ+Pc2PtTmkIxw3pkYUT9m2w0q4keTLXXCCN1sKAxQoMoN/A
         9PkWDWmI9znJ8ffjRw3hw4l5sA9eHVp019P8jHU1M215OS5UoEOfKi8WXvhSI6wQQmRr
         xM2zfEDphG0KbXqI5dr/keqj7jGIowSjbFup+EwFtjtGbLZkMC8U7hRXX0UMwDkd+EWP
         qTCUaZvEjxHQCYhBohlhaxQOaquFGH/gLSPfrgG7poiAgEIf6qHcPJsTFVR+m/9zoBvE
         ddPw==
X-Forwarded-Encrypted: i=1; AKwUvByfPJ9Sxfmk7hpFyKUeaWC0r1eGH77h6QJRGq1R1wi9UgZL7jNM6xhmpMP0a4m07vcQj8iIinKfdlM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMgTQ2RO0dRuOVUXU7FfSVvDGfpVPQMWyL3gW9pI346K7hqCoJ
	qW3hMjnoZE4CCxjTgoM9xTw1HE24MPzjhUwgLq+1EKPAWZvzq9cYlC/ePH8mVN8GsutkAiQ1pWm
	xE27p7wTJz5yuaWKV9FoDT9IeZEUB0/h55Tdl1Gz43+MHbvLGKIHRY6BjTTkTBvM=
X-Gm-Gg: AYBFou2qPPugNcMdY1K1b6Vvhm18KS5ltgFNCDtWdaGVpl+TNPCaPawomguJH/IrWZD
	Ck9TrHmMT28vHzPG/GMBz6f7uE1JnFma4hbscjjtrPAUccpUrzI2gESV9mT7Ht4+bYARU8b+zaW
	YOUKMNm2X/y23FVSO8suTrc7nOG6NjKx5Yps/kA1tl1un/NAgyouXBp/LHpOKT/5lleI/GC73lX
	G6vNwBvbhql31EcyIkeXnjxtjT6f1GvjcN37oSmi0oIF0u2JlA2e1YQpW4MxIQ561PESpFAHvaY
	6aZih6uM8OFDn2ZGK0cWmZ5XmnCNCG471/I9bvAjTSb7c+olv5XtZkHy6UnGz6dLVz06WLIB5/S
	joCjyKoRx21vhZyBfdvBJwy7m2CWNDWAhsxxabXXx4eYN0NRZZjckjHM/SvvsjPK8ezIa8Jpt7w
	alffuTiIKdRE/B0l7geUbF0ZGufftKfmmJNYVItcpt+oKW4s2uM/c8UBS+lt2TDA==
X-Received: by 2002:a05:620a:8385:b0:93e:48fc:aa88 with SMTP id af79cd13be357-944217118e3mr880669685a.44.1793463456243;
        Sat, 31 Oct 2026 09:17:36 -0700 (PDT)
X-Received: by 2002:a05:620a:8385:b0:93e:48fc:aa88 with SMTP id af79cd13be357-944217118e3mr880663185a.44.1793463455660;
        Sat, 31 Oct 2026 09:17:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe07403cesm624624e87.58.2026.10.31.09.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:17:33 -0700 (PDT)
Date: Sat, 31 Oct 2026 18:17:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marex@denx.de>,
        Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linus Walleij <linusw@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Alison Wang <alison.wang@nxp.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jagan Teki <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Igor Reznichenko <igor@reznichenko.net>,
        Michael Walle <mwalle@kernel.org>,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Jagan Teki <jagan@edgeble.ai>, Jianhua Lu <lujianhua000@gmail.com>,
        Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
        Purism Kernel Team <kernel@puri.sm>,
        Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
        Joel Selvaraj <jo@jsfamily.in>, Icenowy Zheng <icenowy@aosc.io>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Cristian Cozzolino <cristian_ci@protonmail.com>,
        Junjie Cao <junjie.cao@linux.dev>, Ryan Brue <ryanbrue.dev@gmail.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Stefan Mavrodiev <stefan@olimex.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Robert Chiras <robert.chiras@nxp.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Markuss Broks <markuss.broks@gmail.com>,
        Artur Weber <aweber.kernel@gmail.com>,
        David Heidelberg <david@ixit.cz>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Yedaya Katsman <yedaya.ka@gmail.com>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 04/35] drm/bridge: lvds-codec: use
 devm_drm_panel_bridge_add()
Message-ID: <dj5k6rjb2dcta3gq4jpimkhqimtx3cs2j3ghtgr3c7kofjnwqq@hsnx5km7bszj>
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
 <20261026-drm-panel-funcs-v1-4-5e3070a3478f@oss.qualcomm.com>
 <179338130512.3009485.15498623134248772053.b4-review@b4>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179338130512.3009485.15498623134248772053.b4-review@b4>
X-Proofpoint-ORIG-GUID: RoTIJO5BFUqvez_XmzBl2VCe0qINuBCY
X-Authority-Analysis: v=2.4 cv=Wtq+otfv c=1 sm=1 tr=0 ts=6ae614a1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=rdXaneg_s35KUMNfVVkA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA2NCBTYWx0ZWRfX3UCfbZWrG3lg
 zmLk06xLHieQf7bs2uC6LZ6IeOSPXLPTN614C48nIbFIB6WtLqGyrE9VjVAErG+/MG1t1ZuqSUW
 mXTq0nnLp35Z9Q6AQd2nwl3PPNqD3ys=
X-Proofpoint-GUID: RoTIJO5BFUqvez_XmzBl2VCe0qINuBCY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA2NCBTYWx0ZWRfX7hUQNXLcjg/x
 5ZmwSuxyqRZZmrgvddIzYiNMd2JcpLnHAiFejnBlsscjVUsCJs7km2ITpJtElnN4xVV/+lmPxxz
 0yc00ldjgvxAfFQZCENErr4luxz7+DkPF8tBvPtV/Sku/bxe8w4agLtbVR1LCuxTrr4JHtj0D+/
 HwufxePi43ZQrvIDI4bCWzbF9B/mE+SY9XTfa9O88PeRxzfeU7qpRnTZpkqQnQLb56BJ4WHv4/U
 8yVdWdMNB8l4fZQ3i3wxiSl3ttwbY+Dzol6E+g0MJIthgW2Y0G6xXYD5bo6NB0V95PS+L6eWhwm
 DZMqNUcUC/jHJke1tg+dgutovgJ1q3ioXPgmi1Q3LPuvDccyXFtHnqtma2A2GyFQxxbhXhgPWA/
 wF4F6NX/ytGNROJz1hY5OpoDGOt6N8oLxtbc4lGqO+OB6DSfe2GrrVxllWKk+CYZrWeIGQLmYqu
 CJTz/ICiu7Yu8e2vexg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310064

On Fri, Oct 30, 2026 at 06:28:25PM +0100, Luca Ceresoli wrote:
> > The connector type passed to devm_drm_panel_bridge_add_typed() has been
> > ignored since commit b7797081ccfe ("drm/panel: embed a drm_bridge into
> > every drm_panel"), the bridge always has the type of the panel.
> >
> > Assisted-by: LLM
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >
> > diff --git a/drivers/gpu/drm/bridge/lvds-codec.c b/drivers/gpu/drm/bridge/lvds-codec.c
> > index f97c8586273d..d25d8d777191 100644
> > --- a/drivers/gpu/drm/bridge/lvds-codec.c
> > +++ b/drivers/gpu/drm/bridge/lvds-codec.c
> > @@ -154,8 +154,7 @@ static int lvds_codec_probe(struct platform_device *pdev)
> >  	}
> >
> >  	lvds_codec->panel_bridge =
> > -		devm_drm_panel_bridge_add_typed(dev, panel,
> > -						lvds_codec->connector_type);
> > +		devm_drm_panel_bridge_add(dev, panel);
> >  	drm_panel_put(panel);
> >  	if (IS_ERR(lvds_codec->panel_bridge))
> >  		return PTR_ERR(lvds_codec->panel_bridge);
> 
> By now drm_of_find_panel_or_bridge() + devm_drm_panel_bridge_add_typed() is
> jsut a complicated wrapper to drm_bridge_get(), so this driver and those in
> the following commits could be simplified dramatically, without adding the
> deprecated devm_drm_panel_bridge_add().
> 
> However devm_drm_panel_bridge_add_typed() is _more_ deprecated than
> devm_drm_panel_bridge_add(), so this is already a good step forward.

Yes, I wanted to do a minimal steps, to simplify the reviews.

> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> Luca
> 
> -- 
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 

-- 
With best wishes
Dmitry
