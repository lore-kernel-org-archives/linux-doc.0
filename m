Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013023;
	b=SWWmuOa9O6oWKiW3ONUIzYuLLPyt9ZKb0uPAnKhBdXNsnIOPNb6gTFt/1s4WnTSj/Cno
	 bWGXYPwqwM8vGRpgn5qWqy/gZ34yNOkgGAl8U0BJynjpBbtcgbHZcWuV/Rv5xQOeDe1yD
	 4LgixNn3EfJJ6bPy1Ub0w7wAGTXX57xvRYNV9UF9dtgg5WBQFsQifkj4sxaXq6fTZCn5z
	 aa+eFzzkTixDYOLdz8kt6eKOCIgcvoeQ7jbZORjYj7yKLal4GRYyBri2I0oH5xTWW5qmO
	 fDJgtTCh+MP0qeFUB4DHa9/GOZnQCZSzw6TXQ51/H1hIWrktOE3cSgsZGnAlslUeExw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013023;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=M2Z0RCPtboYFZ+IjaCc+zjd7qHKNjhm/LRlubdPohDY=;
	b=1DWat1fB84/svNJ9UqJF7IFydVkM9oYQKwZD99Yl5kkSQV+/Yx8XT1z/JgDpsoo3gB+I
	 ST6tg3oA3uJoGRMiUjRaSdIFNDAdbUuJk+ktZ663HEvnCusMQoy8wfLHC5zEcsCp6XE73
	 EPwrcda+wkAxiPQb7L86CKNvZjitp5oZkXlk/Yl/2Jb7IoPZSB7WwC9D/4iGKK5ln4tUD
	 FeyAyYZndeNrBP4hfKj6X+Rm/9PFHLJBq2Z93EwTvoB3jPUZdNjhlUCl6eW5h9h1xZ2GQ
	 gwZQ9rVV31pu2perM53SolIJef3dnkGR12625HNCYvcEAU1z/SfbVKGiZBi0WT/XTXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I+rhtZ0u;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QDeQDjjq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A676606A31A
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A676606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I+rhtZ0u;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QDeQDjjq
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtOnv2009963
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M2Z0RCPtboYFZ+IjaCc+zjd7qHKNjhm/LRlubdPohDY=; b=I+rhtZ0uENob/eM6
	rPFxa/Lxq/hRo634DX6rAq2ZBsVROCaRhUBCwfOpvUSidtqm1pMdnTIICnBeAQJ6
	9lCqPVosXfFpkxSUDqnfjw/1DbtEOM+eMbulvKMRIU2/KwtfqROsWmSPi9d/h8NW
	gFjnc5H22kumYOcEUALN5IlhQScuSpHqbEqkXTeQbRHcPwZrVhAFISMnVvHi2ZBz
	XyI07fF0J3xyiSqoyWSz9EeaN+D6vYmludcMOjXHOYJ488n6Y9RinkEAOf8/WdTf
	v4EmQKlNrvvXX5CmHQRK5V6ByNyIpkC3n8Ki4C++uqyCOH5Rdix9JEzciaYHIaSu
	EbLNSg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgn27x2pr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so640360685a.2
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 04:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013021; x=1793617821; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M2Z0RCPtboYFZ+IjaCc+zjd7qHKNjhm/LRlubdPohDY=;
        b=QDeQDjjquwWKZWvG6+ayjxYO+SWbT01sNs9jsHnF94onUTw8lFyqiYIfZZeMzwZZrI
         kzXH7ANJSJOjCdpy/bbFihvVhaytQochNgd/UfVNVSvtcgG0P21WZgQZhGZK3HPg9Bf6
         bnW86R4NR1wu595mpSSCSPFy+dvD1INlzyJEUp5KBKxmNN7z+b8Chf8TDfPJ25H/dkA1
         jgIeszOWjyvBFa6pEEdutJJ64tfoHpWFlG4uZqWr42PKctKXelnPLERKtxLeIA/GD11p
         yR/O6agp6tCskKhfbAQI0V3aeN3KUAU6A6nTEOjwf823SOa+PCBa1i4yqeCUiHfeysf3
         l5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013021; x=1793617821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M2Z0RCPtboYFZ+IjaCc+zjd7qHKNjhm/LRlubdPohDY=;
        b=qHRogpShrRD4NUiqaHRQ16IQaHGUkYj8El8ARj+fz3e2p3noK5/bUoZsi+yp9rf/GT
         oUkzKLlabXGPviE2eD+TK8LcsZHMC8a8fgSImZt5GTzWWEZ4yGK75Wh0tdcoZnAwX3Qd
         49ok0OyPOlTNBMjFZlKYcDfGJSIuVb5XWxP9iAwLBX6xFFOvbaUXjJ8KgpihLkuX0Efk
         JhuQUZIA7rU2aI2XJbgB7vPLl3F6EyJ63srSj0uFIXvtN1rxcrLm2WymAmhsqW1ZKkJI
         ibY5yB2qv3xM+nod6CDK3PwWLCe64GCHj8cAIJot1wP340Kypb5MkHGMf15UoGDZvo+/
         LoIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxoYAJ4JbxJPP5eE9v9W1xE2gC5eCWsAjeavyLh1gBC3jymp2TQ0MD123iZNRcjZlqvOOezwJI7+dk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4F7C+c3U/4EPHB6hi3e5DacNS8vyjh2dn5SR8jLDRBgcFM9mG
	+ika8gLyiuJgq5LrAJXZN2L16SlIqXoGFFczLmHxgZb3+Qc6u6d+tOs4RubNKOqLXdKaewIDwW8
	2qSpWGKWh6LsT9SC3PgQsRrDTg6nHnVqckTucTLa66b9BnTm+MvgEmybE+F1wwcU=
X-Gm-Gg: AYBFou0ezjrVB994B1Q6vEAjSKoYPzRXVCEYwcfXaegl/XYliJ4ds4LDeLoi9S7brcv
	axuG8hktJRweBly9qfBYHyKyNp4skgPNlFmwjRRUVfonTrJZ72Qd6DE5GDEttZBibzOyiH+QGSa
	qbcf1NjaFbFZNmKNX8miC66LUClFotD34WHA1dhgl7QFaRcDXN7QHz3VQw1bHcxK7jjQUHUqQmU
	oKv3htjRVuDFfo4K/a7i+vfIl3sJp4sgo+K7ftset8C98uE1VcpHdeMemKr5SRVVi0S+RF67rXS
	muEp4CjmHgR3shrbe7+lmR5EMOtGYtXL/FicLqMmOweQY0G4kaGAAaKBtuJfLl2qH2yqugq818f
	6nBQwlXWz5ECF4aYHmHVm0c459qtf3mps4Z7hF5WLfFk2HVz8VhDBwTZWOssDE3+yfShz3n7W6C
	1WcxywKeb5IWJ5
X-Received: by 2002:a05:620a:4515:b0:93f:22c4:e92f with SMTP id af79cd13be357-940ef90f7dfmr883921285a.54.1793013021185;
        Mon, 26 Oct 2026 04:10:21 -0700 (PDT)
X-Received: by 2002:a05:620a:4515:b0:93f:22c4:e92f with SMTP id af79cd13be357-940ef90f7dfmr883910785a.54.1793013020579;
        Mon, 26 Oct 2026 04:10:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:09:50 +0200
Subject: [PATCH 01/35] drm/panel: remove the get_timings() callback
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
Message-Id: <20261026-drm-panel-funcs-v1-1-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4897;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=QyWrgkY6ZnjVq5h1vZAiS6oNrgNf9gieSUM/aLO7szw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUFn2LL/a3hpHcwUKprTutBJKRl30JANmhZI
 0sNo9qgoQGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81BQAKCRCLPIo+Aiko
 1QZ7CACHPPW5AOWGSWzAkI4CS6eiI6km5J70phewHDz5Me8KZKsKWKw1PhMGtKDYABWXJwZXprM
 w1Mwd9MLWmGKuMjvgeaX4BeaBWHIE9lqWcZAtAP4hPjvlewyNVCHzjfVPcHKj2bonTPYAZjLyY/
 Kdm+x/ZpB27J3/76XA9ckLf29X3++gUnrIeLIWML9atz39KUXpQjHWpkY7+9hWVMrSjbh9ThgFM
 cL5NwHUlDYhgA7cwESIzgVIe+Nd3mxrmtqtqcgMUM/W3YqRnhngxGcvEyfeJXucilRevgZN2w9p
 9t/l3xlE2Eo7+p7jGCAPfnMTN331Xx7JQWECasKBfom/i3JO
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=G7GJgNk5 c=1 sm=1 tr=0 ts=6adf351e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=6bBJhzG1MskExv8IbyMA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: VmpRt_aNPahowVfIhJOI1nnhgmSFN7lD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX3g2f0LlsyEgL
 afMFudOHyoeRrLp8Hi+6ZP+pQ17avg0LbCYyWnijPM8aE70rQeeDCguwvt6ISPzO9luXFRf7OjM
 9o0zR2wjzINOZz93FqI57Xb1n6HLNs0=
X-Proofpoint-GUID: VmpRt_aNPahowVfIhJOI1nnhgmSFN7lD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX2Yi6/9+IVgys
 BmUITmFG4puemYmwDnMJstwIFG6Cd62CA3Zi5tu98zsHiLebyNzEiIXKFGnipDd226SLYtP4fDW
 oXRPkHIN0hdwlW615vHm09bqbtQ5jHb4qriB2lCuxgU7j23uux6hnTa5swzESSGXAc8dJOgkI1T
 KPOsrhJUXjP1ZfLw1dznRWZmiTcr8sLdtu2MIXydPLPM4MwpuAyB2eYY9vjZCCP1XIAYA0tPc7Y
 YTpHE2SDqvDKlkn1uw1MOaHjF5CH5SDGoFifCRwCOzV9YYUHUK5PjgeEnHMP+YnLYyWVHI5Pmv/
 doSqoqlyM73S0DHpgyv42oARjElqaoC+8XlL4UbqYOgjABx+whXQ9exa932JIs2bXxW1DwSALak
 zo2kNVgiAECzqBC0/BlIOstKBRCQCkHBTwCs6u4nJYnDuiMHAJx3rniDLal78ORyp8wXsBFp1Ss
 Qre8MMaSKSlRqF9NS9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260044

Nothing has ever called get_timings() since it was introduced in commit
2938931f3732 ("drm/panel: Add display timing support"). Remove it
together with its three implementations.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-edp.c           | 18 ------------------
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c | 18 ------------------
 drivers/gpu/drm/panel/panel-simple.c        | 18 ------------------
 include/drm/drm_panel.h                     | 12 ------------
 4 files changed, 66 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 94bc54c3833a..d3a4cf9b1760 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -646,23 +646,6 @@ static int panel_edp_get_modes(struct drm_panel *panel,
 	return num;
 }
 
-static int panel_edp_get_timings(struct drm_panel *panel,
-				 unsigned int num_timings,
-				 struct display_timing *timings)
-{
-	struct panel_edp *p = to_panel_edp(panel);
-	unsigned int i;
-
-	if (p->desc->num_timings < num_timings)
-		num_timings = p->desc->num_timings;
-
-	if (timings)
-		for (i = 0; i < num_timings; i++)
-			timings[i] = p->desc->timings[i];
-
-	return p->desc->num_timings;
-}
-
 static enum drm_panel_orientation panel_edp_get_orientation(struct drm_panel *panel)
 {
 	struct panel_edp *p = to_panel_edp(panel);
@@ -699,7 +682,6 @@ static const struct drm_panel_funcs panel_edp_funcs = {
 	.enable = panel_edp_enable,
 	.get_modes = panel_edp_get_modes,
 	.get_orientation = panel_edp_get_orientation,
-	.get_timings = panel_edp_get_timings,
 	.debugfs_init = panel_edp_debugfs_init,
 };
 
diff --git a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
index 0935d83ee2db..99b3895a1b28 100644
--- a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
+++ b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
@@ -174,28 +174,10 @@ static int seiko_panel_get_modes(struct drm_panel *panel,
 	return seiko_panel_get_fixed_modes(p, connector);
 }
 
-static int seiko_panel_get_timings(struct drm_panel *panel,
-				    unsigned int num_timings,
-				    struct display_timing *timings)
-{
-	struct seiko_panel *p = to_seiko_panel(panel);
-	unsigned int i;
-
-	if (p->desc->num_timings < num_timings)
-		num_timings = p->desc->num_timings;
-
-	if (timings)
-		for (i = 0; i < num_timings; i++)
-			timings[i] = p->desc->timings[i];
-
-	return p->desc->num_timings;
-}
-
 static const struct drm_panel_funcs seiko_panel_funcs = {
 	.unprepare = seiko_panel_unprepare,
 	.prepare = seiko_panel_prepare,
 	.get_modes = seiko_panel_get_modes,
-	.get_timings = seiko_panel_get_timings,
 };
 
 static int seiko_panel_probe(struct device *dev,
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index a944c34642dc..e4629428b1b2 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -405,23 +405,6 @@ static int panel_simple_get_modes(struct drm_panel *panel,
 	return num;
 }
 
-static int panel_simple_get_timings(struct drm_panel *panel,
-				    unsigned int num_timings,
-				    struct display_timing *timings)
-{
-	struct panel_simple *p = to_panel_simple(panel);
-	unsigned int i;
-
-	if (p->desc->num_timings < num_timings)
-		num_timings = p->desc->num_timings;
-
-	if (timings)
-		for (i = 0; i < num_timings; i++)
-			timings[i] = p->desc->timings[i];
-
-	return p->desc->num_timings;
-}
-
 static enum drm_panel_orientation panel_simple_get_orientation(struct drm_panel *panel)
 {
 	struct panel_simple *p = to_panel_simple(panel);
@@ -436,7 +419,6 @@ static const struct drm_panel_funcs panel_simple_funcs = {
 	.enable = panel_simple_enable,
 	.get_modes = panel_simple_get_modes,
 	.get_orientation = panel_simple_get_orientation,
-	.get_timings = panel_simple_get_timings,
 };
 
 static struct panel_desc *panel_dpi_probe(struct device *dev)
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 58113ea7d63a..deae4753a594 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -40,7 +40,6 @@ struct drm_connector;
 struct drm_device;
 struct drm_panel_follower;
 struct drm_panel;
-struct display_timing;
 
 enum drm_panel_orientation;
 
@@ -131,17 +130,6 @@ struct drm_panel_funcs {
 	 */
 	enum drm_panel_orientation (*get_orientation)(struct drm_panel *panel);
 
-	/**
-	 * @get_timings:
-	 *
-	 * Copy display timings into the provided array and return
-	 * the number of display timings available.
-	 *
-	 * This function is optional.
-	 */
-	int (*get_timings)(struct drm_panel *panel, unsigned int num_timings,
-			   struct display_timing *timings);
-
 	/**
 	 * @debugfs_init:
 	 *

-- 
2.47.3

