Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013025;
	b=WgSFSNyDcy/RbLPCY9nmUINpveu9kzK5lLFyBltpgzcmsDgU+TuAlUUESqw8RElhZTa9
	 PzB0h+teweWYLDHSYsVKsyAm0PWZHCElCaUEI+fKw3jbCoub2DIIgbU/RlrDYEzCeIsdR
	 rm/kF/9/OgrdNVvFD+jYqiea90mRsfgWXtepLfa0yL1g8LAUNpCN6zKLmySWL6Qf4zuTg
	 /rF2VLzq/K7EedyN4Z5fPbhah7+P5Qps/Ph/AyTFmhwuEK/nyktCJUKUfrYiILboZjJag
	 weJVz5cuhoJhEq0LzFPEs3kxP3nI92NYNCp4WN5xyvJxKkx2Xi8mUu+msWdjMT4oTeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013025;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hTtxD17fDeW72YOw3DHdOk7y8aNR2m8TdFLwBF4pj4Q=;
	b=eduB2SSJw+acTjdIv03UX58ZOu53wNVJKO1uXoEuimGW4ncWLuRQoRO4Jg/6C35I54JN
	 rhx+EALJZSuomtuN6dx2Uzw/hV/Qbj/NLhXPebymND4aL+24nKyNPlQk1B0h2A8SXa/xL
	 AT151EtOhbi24hUmMopCzQJBPsqJt8Cb9I3oaf9rY6gTT7B/jM+Ll/5pFpM4plhMItUNX
	 2bPkuleb8b7tY9dkBs289R+9PSt8ZSEPMbqde1vQEtuRSV3foQJIv4gMOoK8UguujJq5R
	 Ent3CyY22nltZn8O7rJ8nK/llnBdSCgepJGHtP0Nn4TFvqHBm5LyRVSBGFJUrhC1wAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J0YP207V;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EsGlWkIp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32762606A31E
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32762606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J0YP207V;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EsGlWkIp
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt6IQ4126385
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hTtxD17fDeW72YOw3DHdOk7y8aNR2m8TdFLwBF4pj4Q=; b=J0YP207Vsr8a41lL
	AjZTyKZDrAyn6bMHQJEp6Ht/FIehVV8eEF5YoNyoeaCmc+rNObWKjQv04DCUX2Cl
	VzBO5vsuY1C0jjwasjHYfSjKhp+pYBppemRDlZLoeyl4HiG8CbqT5feR0nzz+DT4
	EXdRZ/rt4k08qFVuNJzDRn3JQAYr2ZH/EkhSsvcLfrueanalun4EA9pfys3hT+JN
	cPyncc/64E8luL/m3DfyPGWFUjze2XB0vIJ5q40Hz82xHoa0llHpl5i0Ghdq3WZ7
	RmliTjsI0u41dBQAdUx/R/Q7iaj8HSOhMQhLXhNVQYIAju56QTXiXiaS6x8FSj28
	SDLxZA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhshpt3jx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb7f9bb86so564913285a.2
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 04:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013023; x=1793617823; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hTtxD17fDeW72YOw3DHdOk7y8aNR2m8TdFLwBF4pj4Q=;
        b=EsGlWkIpbkrsI199mfcGZXi8WD0cYo/YDxYPnq6Y20fTpZ6kHfbLmw8LtRYRXUNP2A
         sJz2D9S6kofeQnuC4isgMJ8TdndHZLgbwHBMZANe0SJoWUmcIbbLiKkRYaiWLWTH4nXk
         Y2C1ydQZHxLxC8alohtLtUANapQTqtZ+8mzwE4stjyfKH+PNIiHGPznhwIHiTwgWND7X
         CZaLPPbr5b/NUpfq7RdTmDqXgtUmE492Dm+LEmY0KErAqTg0/kL1G/J4mgNDsLcLs+HJ
         CpwtZAq2uyXYltCEa54iSDftbWt+qAlqeFEpbqB3vziXB3928/aG9tLO1SQnc7297o5k
         mkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013023; x=1793617823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hTtxD17fDeW72YOw3DHdOk7y8aNR2m8TdFLwBF4pj4Q=;
        b=0eEyuYCpl2Wgvh38Qh8K1L9aVdyw45cnQt05emKn9saXwh+1lM1pzfE1ZM6qHipJpl
         25fYHFXX1kN67NYz5LZBCn4eUaFBBx6XSQRNyi9xxSTz5cvNGHvb5ryGAFf05m9UqxXs
         CysON4yvsfuG46bj40lZvvSL2divWZqQwvSdxMH7xjf8kF0WKgUdpqAWmx7ZFsdnhdZQ
         CeTz7DbovCDk1M1tBEZYl1ddKxfn+tcAFCoATovm4aJZd7HYgpklvYMy+kyoEwkKBsXg
         c+nenE5TH5jrFeqIv22dev7QzSG01YmivbHEWAigKTQJFgZig7MP/YCQoffGN6QVBEOR
         dRCw==
X-Forwarded-Encrypted: i=1; AKwUvBz1uIjM2XO/l8Kokl47aSa4ySDK01tOxXXh6s78B1bcEaQnW5kkNY3e6XsieKtS0d2kz9ZbOLxwYQI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJS/lrtVLvPtmVvlmiWuCAJ0Xuri5anj2dvlGEtDsZNeYaKBXUq
	TAcUIcgKISM5/VQNIdDCI8sHcsigu39lvhTfOSNejXPB0MCPttcrFnTpGGWrN322lX5MSAUX1/Q
	RMzTHZcnizwqncYdnDZj6ZBGKOKYtjNGm0CJ8/qPIPeBGvYY/0wLxHMWVbhxxc5E=
X-Gm-Gg: AYBFou35VDjs1xiwCuvc8ZcjMcVZ2dFLdtcanuYTu1CwvGJ1ZzPE+TKsA7zqPrCWHjC
	D/Borgd+yDPKcSHCTJET7RQYQI09R9AZ+vRBv/267wSOirHebHYAXRxaIVWxrxiP2fPx1YYOXm6
	99mGQ9+Q3n2cvX1+s4cmWKut2FmrIeZ1FSHMMXVa54LPxI4uyPcjIaHcvLyY7m/SZBeNxqNiB/m
	XHxo9kwITUW7Qd0RTcrTcHqsFz9a4C4iWnnJsyQPiBn45C3aGUKF9pu5C8q9QZzQxY1nv1TuAuX
	oLMjWevYVnXE62laldsXWQ5Ipk51NH9FE8Z3Am4StDB7vkcj5tEytMtFxHjHz/WkXa1XahUxeuh
	3R4uHagwqChYFmj2LpK49/Xy1cGuPJkR3yV+U/7fgp7OZ560ZsaToq5w78G66JRzawD2PF/dC6i
	51XxrmPM9S/xhU
X-Received: by 2002:a05:620a:6009:b0:93c:c2d5:1ae5 with SMTP id af79cd13be357-940ef79f4b8mr835906085a.7.1793013023239;
        Mon, 26 Oct 2026 04:10:23 -0700 (PDT)
X-Received: by 2002:a05:620a:6009:b0:93c:c2d5:1ae5 with SMTP id af79cd13be357-940ef79f4b8mr835894685a.7.1793013022577;
        Mon, 26 Oct 2026 04:10:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:09:51 +0200
Subject: [PATCH 02/35] drm/panel: remove the unused struct panel_bridge
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-drm-panel-funcs-v1-2-5e3070a3478f@oss.qualcomm.com>
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
In-Reply-To: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
To: Douglas Anderson <dianders@chromium.org>,
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
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
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
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
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
        =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
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
        Yedaya Katsman <yedaya.ka@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=919;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=sZu+gCCAPK/+XC2UapLGIknKvJV9j0SOSwR5V3S29Kg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUGKchAASinmtwtPvMmwc3Sq3F9KCOYzdxgN
 pt0G7G3yiiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81BgAKCRCLPIo+Aiko
 1Q8ZB/9UTlwRaNEBaGZxc0IwmW24VtC9wkBG+oXCJSl5rdTbX9zSnAGHOPU42S8Nlb1GuDWUcCd
 u8AC1Glm1GPXlGJRPo0AbB3a7ktQTdDgK6JaD+b2r9Hoc47OdhOBGIVXM4vYHqFgZiSHqjhnvzx
 Dhv7BjRRQ3C0W/HD15S/GIPnlNoNiLX5I8xbdFlTSl6S5wJ50QKkOO1Mc9a5yef6o+FVeOZDDE2
 1OOg1OrJ+lx2dkO0aE0ZEz3LFOlpM1pJsE0AeR+twAepe3OIl00+EzUnqQKGESS355y8wohb7lg
 43i2QjbtSdWp/qaxCdogJSgBLYlMQGzeD9sI+8HSJPnUZO0R
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX5CQ/ksKbYsdb
 5y7/04eEIPVWd1L1r4taRUfkJETeexZwTmSjT/+yv0KRCO1YQK3LS8/tXCilzdcVjrA4Ms6myrC
 bTdSQ69qckg6XC2L2kG8cZa6/6ayRoA=
X-Proofpoint-GUID: yLypQXntT316Y0BQAJCGrBiOiHVCG2pA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX49RRpHH0zffI
 sJFsZtmvgsAJJa5FuVv0AoN1U6IziGO9xDr7V2YmH021GRtpdVX/6kcGPlK2uXfHk2sD0PhL5bV
 DH/qZnp95OsMBwHZjfHtuXQ2M4PxnvZnm7cVbR21dSwtQJSAB5PqGf/Qo1bafzmjYRve6Gz6McL
 wtPElIJPsotmiBSYpNem8uqBMeWs4zQjP+HlCmJ+ifluWG3lwE7xUUmE8OJ/6ZcllMijcQs5Jqm
 AWpxJtWhgLYFbLwftBwm50/Pkk6n02GK8CAGs83JSkuRffFIT0RDxScMd67ky1IeoAa9mgjDkrD
 Up6gVQQvMVCX/wmCgAhT9ZMmdGsCgOWvAoqfjCEEjEix+hMRCy98uPBidJC+dYikwc4MnbuTL8D
 agN7c1A2oCzAeJGzQmT6egP65fHrK/pe2G3TzUaXh0QrJNsX3QPKMa65Sr2m7YGceCsTxjJtRNT
 AN/GhjdKwY+1Kq9Nifg==
X-Authority-Analysis: v=2.4 cv=HZWB3SE8 c=1 sm=1 tr=0 ts=6adf3520 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=a_a0KNV-W32lKMFKthYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: yLypQXntT316Y0BQAJCGrBiOiHVCG2pA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

The bridge is embedded into struct drm_panel now, nothing uses the
separate wrapper struct any more.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_panel.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index c00529bfb706..268e655140ac 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -50,13 +50,6 @@ drm_connector_to_panel(const struct drm_connector *connector)
 	return container_of(connector, struct drm_panel, connector);
 }
 
-struct panel_bridge {
-	struct drm_bridge bridge;
-	struct drm_connector connector;
-	struct drm_panel *panel;
-	u32 connector_type;
-};
-
 static int panel_bridge_connector_get_modes(struct drm_connector *connector)
 {
 	struct drm_panel *panel = drm_connector_to_panel(connector);

-- 
2.47.3

