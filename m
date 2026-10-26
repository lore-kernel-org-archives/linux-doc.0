Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013055;
	b=HMvZddOCd3EPqs/oGy3AJ2Xl87fV+ytU6p8E8SwXyA+7apTVinc+vwApWn/kM5baagSm
	 SjASOmthQokKbAx1qnWTouuSQFCCJ0rFXc+5/yhAhU4jHC8RsfHl8F2b3yTcXviZKZ5EX
	 gSWXnV55YBlEO6c0ZjwVyVlhgNK2wUaoKy8KCcCLHHcRAfO9L43Yrk7+kwUEjDRsLwf5K
	 FOq9CTMpTjsihadHgDQA6ixdL78c3DAx1bOqq1j8GJ8q0G5nuPkwzAuVnTKKIbD5SYVPx
	 7y3m8i9BqLBIa3afZlCF6hbcFyUyd/VDLHkmave9sZ9FkswlE1BPfIyYFKGMWvgfhCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013055;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1Yae7u4iPTCkVtrsNrlio3XtykQ1rkcSFoZWaTvI0TM=;
	b=tRSdHqtQEoqpKHNSSMkIpXdxao2M8lyY73AJNlwldBkjYUANI6yeUu21k4vGDn9bwvch
	 MLwdEuNhpKDVO/zM8WYtTvHaCTpE/cKaGUSZ2Z/VhZvz2KMbsiZMZ9majrh99ZJWwfBCm
	 vajVeUa5gLIBU51lMiRpv15ji5iPCnMXlw46F1bOFOSNHvo+Iupr3Lh+m3z7A9EMftEfq
	 nYXdJFwqmSb06JVmeaDqx5k6M7DsWvjuPSnwRArc8RnBRNg+nCNOoTjGLycgNC0AMsObg
	 +8VHtSjqGzvLs/vwUFyhFgDfLvqZv6j0TcqdfgYan9N+AUSTyan/OboP4Preovqocpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Te8CKCwt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dAam8isy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D96D606D882
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D96D606D882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Te8CKCwt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dAam8isy
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt4e63633158
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Yae7u4iPTCkVtrsNrlio3XtykQ1rkcSFoZWaTvI0TM=; b=Te8CKCwtC2Bm7wAV
	075aGMUOaqQaJUofzvgg4bXSfsGt7kbwDZ+zX1wNVMjvYGBGBxhGTMNvboDKhaeK
	0Q71MC+PkRCjKS0/nSVt78bvOr06d9VforfYXaLdet/RXEHiArN2sciG0qCBEQA0
	UkpXlF3c/LwDNtDmfGlhXurTMcgy5fEg8cjso1DDkqMI0OAbT5BC/a3o7A12QHuP
	fnZJOmHlJ6V5ygi2Apxn+O2mUyZ77hO0HNCsFaczuxFquCKqR/VfNy2HsqqSvMZq
	JLj6kTn8Igk/rAHhMvjPcGv0pNUdxLS+RfeomuBBUfkw0Wr0hS8s52MkmPb/5Ka0
	Y2wIbg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf07kj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1f2fafeaso388456385a.2
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 04:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013053; x=1793617853; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Yae7u4iPTCkVtrsNrlio3XtykQ1rkcSFoZWaTvI0TM=;
        b=dAam8isyCiLhthUFKjSoTR5w1eQesJQYDWTe7nsNCDULGUomAJq9CabLT/c+LOiLpO
         7oNXmaw452AgeoLkRR5ZieYPACBdKp+ZmoYxn9f42QUFUY1gZ6U0LGGjbLP/nhzpN/J4
         bJLzBnrsglVjKkQ5mRJT0H3+owFcsQox6xbqxaptSQb5L8VQz+GzxMGjHgJb/Rmw2JQD
         SCUowu7uPG6umLFeHdtt1zHY+7I8CLvQw1g0z3GZtDsJZ75EbsgAgUJZXkxe+HNRoRCg
         DyfIJyEfvdH11pYjiZW6jPS2AnlJOs3m3zIX01C1BSNYtAnzL5y8Z0foQaKTqR3tWE+g
         ziEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013053; x=1793617853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Yae7u4iPTCkVtrsNrlio3XtykQ1rkcSFoZWaTvI0TM=;
        b=T+23P0rLtjMXQ19jAdaXWfLsrGYOdeugg9nuJtnqjaJYnj9GhvL+S6he6uB4evVrDZ
         Bw2yrdXeMwvnA26a53VgopGg4iW00FzD/lcs/DrIO4lNkauz1B0RHUqf5SQBx6dKUa/z
         0pi7O+gg9uQ7wXwqNsBDRVXp2lxYWNrQIhlruarZp8XYJ1lhDrIVISzkWVeZG3Qip4zp
         W/IiSsSJ4sTQNuSymQSlXjVwDW/I/n5gx+b6viPck9glP2r1MXLvmzr1WJ0hoac/P6N9
         AT2ATw0KMn7w6TaEam7KMe1HWkm3pEXy4kpbdxJtmCNEUnaqf9C99Al//M+El8lmeHHm
         Ua7A==
X-Forwarded-Encrypted: i=1; AKwUvBzxFb2+Vg/wYQKBpYqnxicCv8ZR6X7BY+JsOcUUGDcM6nTV64o8mULuhjesCEubvNYo0ZHzihcB0bE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqjhyrvqiyCMsovTCt0yLASJhyCdJr/vPyedbczQawSoR6RVB/
	0ijJHOs34SfpqiPu9fEuSrO0iUWbs/stEB1UrYv4AmaVHjIf+BM3Lin3t8vs6KOqwBIIifE/b3k
	5pBxUalDJW13nCzsMFaEJYKh0vp2ieJcVoIRiN2tde2FGVFw54r2K8mvH3Qzd+uE=
X-Gm-Gg: AYBFou0DuFtU2lhs2TX1RBZspmZh/TbEAK45t8V6uGGvK1VNeDMUJgAabf4f0orYZ1v
	IQO+h/oMj7XSJB85eJwXexe8HlcngN4Z1zfqZ4Gtz4ic0wERx4VoFulyAXGvfSEZ0aCKaBRjX5B
	K71R2WhFvkdyuMImEXB0t/AqcwUcAumdOS2iplI/mQHlB8I93SvPaOztUN+4MrYHulbP8O5l/rR
	Q2h+7or6OlB88SicGbBmelJb4FeRveTgz/zSAVKtUNC4QYt0aByl2fmUy+xX1dryNOkvIBo1hr4
	nZX0w2XzCXKnZrrAa2lOLs1n6WxPeba8U4UXXqrlAuxqryDTdmIXGWCsSZDjLLEeLmU7CDMq1Wb
	EKUxI7SArs1yX+xq2emqgRO8IxBmZWYbsku1KX6MeZu/gWUrCixBjr70bQofIIMvX52ifWOQQWs
	Ysne70urA9BRbq
X-Received: by 2002:a05:620a:31a1:b0:93f:1e3c:4a3d with SMTP id af79cd13be357-940ef956c10mr863561485a.46.1793013053301;
        Mon, 26 Oct 2026 04:10:53 -0700 (PDT)
X-Received: by 2002:a05:620a:31a1:b0:93f:1e3c:4a3d with SMTP id af79cd13be357-940ef956c10mr863550085a.46.1793013052703;
        Mon, 26 Oct 2026 04:10:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:10:03 +0200
Subject: [PATCH 14/35] drm/panel: remove drm_panel.connector_type
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
Message-Id: <20261026-drm-panel-funcs-v1-14-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2843;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=H8brYvr026sFwdBTY9RxWvYdlcCYPOlDmMVuJvSD6JE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUMaqizdITs0fda3O8tKBo3xGuCEiu/0xJEI
 ascQoHtgWKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81DAAKCRCLPIo+Aiko
 1Wo+B/0WDUqJzv2IDDyhx8xOzsIKbrawnNRv7+uNpMh8u5003kuuc17PuW0A21ddRPPc90JQBQu
 30YOoTNAl71shHXaRzstcHpab5AMmb1Vfl7kVdCyRzYmP/o5/OSuCwVRYyoWfmBZE7kR+bEVeNJ
 IvrNKFA+Hrrv0BIaMDEBIi0K7Rf+tioSmDTSX1oHCQ31fXHzctnmK+U/WK+nUmXK0GX82KykNnj
 gmqIrXn8z7M4wyfK/THNuJgQCeB6SlwdIyWTOPo0+m5T/E6DkqSJ69EBR7pFqvw4RXhAmkYBTs9
 iTwXcvZ/5NUsHwK1FDqsXQFKICNjNGOp7zHGJQxdaLXiWkIb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX3526glr/IGVm
 gPm3BFrYI6D2TgQN95EznOfWmgFKDxOPv40/AkK3DOaNnx8FzAqVfhkEeHAPgwu1RqnqU2FDdOU
 wLQicpnd/uOWe8zbMho/bbucsWLzi88=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6adf353e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=T6n4-d-I4O9jgBeP1XcA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: bFPGsoKtQWTXwWTb1VgXxQsf4gsgbe6V
X-Proofpoint-ORIG-GUID: bFPGsoKtQWTXwWTb1VgXxQsf4gsgbe6V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX58YqCcjtrsEe
 p5GeqdH3Ql1OE9YFD4mdteWjioaDZTMikdE6dvVSzaKxsl2mhEbeOK2XZXTCFf7ETYAGMcb6ymx
 q8mPLXWE6u8ajiCg+Wka/wRUKsJaSNQy6UV7R0MhGZpYxwRZw/clwz4j/ymmdZ03nNpb4cRuxk+
 ipCalkJ75P/bCfmGr//duL4Dw5J1aXP+aHQSxUt/KJxl6xK2Noxv6Y1z81tJ/lDUjFvuHypI5pA
 O8q0GWJN+xDZeWt7lrwqvoIrxR5eKnKg/GM3FEHCwDPk+8wgFPjFFDJaLoRsaaBe8iAgMi7oAef
 APVhzu/W/q8vbiDEY4zGyPejLyQdGA4QOzi8kQpeqr4aHz02WXXKO1KbhYLmi1OsZs0DE5sTtDy
 YvyQuij8FIa+SsVKqJ07YZsYJbvD4sqmVOPckyJJQ2qiH70ZnF+JHhKMBc+s+pyIL3CMNR71cQs
 SQQpuIeiYMszWLZOaDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260044

The connector type is stored twice, in the panel and in the bridge
embedded into it. Keep only the bridge one, which is what the rest of
the DRM core looks at.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_panel.c | 9 ++++-----
 include/drm/drm_panel.h     | 9 ---------
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index ab701a526ef9..5bc97166bcb8 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -86,7 +86,7 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
 
 	ret = drm_connector_init(bridge->dev, connector,
 				 &panel_bridge_connector_funcs,
-				 panel->connector_type);
+				 panel->bridge.type);
 	if (ret) {
 		DRM_ERROR("Failed to initialize connector\n");
 		return ret;
@@ -258,7 +258,7 @@ EXPORT_SYMBOL(drm_bridge_is_panel);
  * drm_mode_config_cleanup() if the bridge has already been attached), then
  * drm_panel_bridge_remove() to free it.
  *
- * The connector type is set to @panel->connector_type, which must be set to a
+ * The connector type is set to @panel->bridge.type, which must be set to a
  * known type. Calling this function with a panel whose connector type is
  * DRM_MODE_CONNECTOR_Unknown will return ERR_PTR(-EINVAL).
  *
@@ -267,7 +267,7 @@ EXPORT_SYMBOL(drm_bridge_is_panel);
  */
 struct drm_bridge *drm_panel_bridge_add(struct drm_panel *panel)
 {
-	if (WARN_ON(panel->connector_type == DRM_MODE_CONNECTOR_Unknown))
+	if (WARN_ON(panel->bridge.type == DRM_MODE_CONNECTOR_Unknown))
 		return ERR_PTR(-EINVAL);
 
 	return drm_bridge_get(&panel->bridge);
@@ -527,7 +527,7 @@ static void drm_panel_init(struct drm_panel *panel, struct device *dev,
 	mutex_init(&panel->follower_lock);
 	panel->dev = dev;
 	panel->funcs = funcs;
-	panel->connector_type = connector_type;
+	panel->bridge.type = connector_type;
 }
 
 /**
@@ -547,7 +547,6 @@ void drm_panel_add(struct drm_panel *panel)
 
 	panel->bridge.of_node = panel->dev->of_node;
 	panel->bridge.ops = DRM_BRIDGE_OP_MODES;
-	panel->bridge.type = panel->connector_type;
 	panel->bridge.pre_enable_prev_first = panel->prepare_prev_first;
 
 	drm_bridge_add(&panel->bridge);
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 07612e9791cd..579b6be855c7 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -236,15 +236,6 @@ struct drm_panel {
 	 */
 	struct drm_connector connector;
 
-	/**
-	 * @connector_type:
-	 *
-	 * Type of the panel as a DRM_MODE_CONNECTOR_* value. This is used to
-	 * initialise the drm_connector corresponding to the panel with the
-	 * correct connector type.
-	 */
-	int connector_type;
-
 	/**
 	 * @list:
 	 *

-- 
2.47.3

