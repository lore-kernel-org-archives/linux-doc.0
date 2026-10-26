Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013093;
	b=cGnXHGNU4oo0umbWximRGQQ6OFGOLe4vX+eRa7YYh9yendODY8rgTeoVdAOP51gBXzrA
	 l9wtv3hWzhrhCMOfpALF/j20g1T43QugxKXz1mbEamYlZrk/N22CepcKp+ji4ftfM5WAg
	 E/0clv6V346kAl/2M1zsmWwdtgLvz5UhCEd22ACGp41WSp1j4jrJ9GSbC2R1+8aqsjgH2
	 50XQgOEuluxRq9gtNrx7xdciLYMcBldFt4Ev3MGn3AGhUHf77Di6gX7aH9n4CWEs/ojOI
	 0W3NtlN5LXfpyPWcPhloaK2hzXo3rwRJZuO2ocacm4Lfw7hPbsVleCS6aQV07/wrSXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013093;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4O9H3HrRsFsbm+GWGewBaANCzC7cmfTIgsKp8aEhS6o=;
	b=iQP+cwnEQP/ZYJ0bnHkDjt95+irlgoDBcDc21lIjJb68sxhs8b5kn3GJisAZp+AUa87x
	 vDW7HRPx4x1xeIypBQ5uAqjvKUctiabScaQ9mGlA5ZxQBNKVdRvV9cMjHVtV+BudEJ3nu
	 dAnWA3lP5bI1sihjSLCXjEtizMlIvWuUIeZdzNBpjZY8vHSGGkHhiArnV/+hJz2Xcg7BS
	 78IEHcoX8upYzOjmFnFnW+esZVcHJQWJT34Vc6muhFEkDaqOY7kGydsO9hmoFPM5Npmfk
	 lIOppowzdqctbnEjFTqte6dHwhQRz8cj9VwpcY81RBcVg81T+8/nc26KTsJRvyBroag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N5M+Dq9Q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kWXti5+p;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECD460A6F47
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 11:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BECD460A6F47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N5M+Dq9Q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kWXti5+p
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtEIY3034730
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 11:11:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4O9H3HrRsFsbm+GWGewBaANCzC7cmfTIgsKp8aEhS6o=; b=N5M+Dq9QVP1joRjl
	WOUq4psI4+CY8GNnh5ovkeh0EjwtPJFHVRKK/tD7tqJ2vyokaIeaSa2GtYnfEhYE
	wtmD/fSJz9EG/DdBBzW5imhl5QJa3jQjaT0PAR019W4Z/LuC4Q0TUV+hdRayDe+a
	Y6v46RQN+6Xmx285U3kQqjYiYN4J7RfcCQqcLXBOdyYbdLeDZvzDZZXLYXfuOeFy
	HLGIdcEsylbH3Z0NZ/SwEPINqy+TSHFn92GL89WZ4GMEp1R66RRvPHJa/V0dv0mS
	JJza3RTtU/0W6vzvRM2jmm1Mqf8GyvduwIU9KMoS9XKkQGaE3lyRE5VQUfylk6/K
	ZXUf1w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj56y04bp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 11:11:31 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91b8c60c550so75759906d6.0
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 04:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013091; x=1793617891; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4O9H3HrRsFsbm+GWGewBaANCzC7cmfTIgsKp8aEhS6o=;
        b=kWXti5+pPGs/+pwgDRIngFn7aQgSC+sUuQyvurnKGH5vi24QJtFEkjwS9kk/Fde8XC
         NHWqipYFwxZhv+D/2TfWzOKnOEZKi3a45TSLs2FHConJl5NKx6sBbWU7F4lgV8jsGaJq
         8vRQ5qcUFOFm+nyCcn7wR2hui855asoVqfv82sItmXcPmlOo7GRerPq4C4Dcp/paZfiz
         nhr6LrPUEosZ5mw9tigKY4oWIHJAyrenNG3xpAJH0ivxw6S6IfElqABWluJ5D8Db0sWp
         3lvMRF7PcC0Bxt1884+Batyxd9qglaqKDD3zWC3rPwL8KaH253Vi5/+cCoSiACDRU3mK
         FFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013091; x=1793617891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4O9H3HrRsFsbm+GWGewBaANCzC7cmfTIgsKp8aEhS6o=;
        b=CYk0OUtKT4KdlSPJj4Sz/oRaj9RzSEXwz02OOJ/KZn6DgIjnSeeBNuvk5BJXgqjmKk
         xjI6DwHlWZljucLwstXAC2e1u8V2k9gqFrTN/kxPZDaw4dggLKIn0XDa/U5PrWy/usD2
         dYneh2oBILJR3P0U2/ESnRCf5SDIHPJqZNolK4UwjocnlkhuLhXbHsAI/d6Z1mZleTNK
         jaztA1M3cjcJz8+tmlJYAEl7/I138rbJg635mxIPzugUoK4BltIYsH5mlJJR0ds62tBZ
         B2jC3hoYlSXNqbpZ72IBhoh3g2E3rpwVZZdTo3M9Ux3nKcVLTPd2gNfU1L43roBHm6ge
         RhqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAMBSfwCFOCroQhKTXj47Hr/dmx9f7JlIpV1qtpASrIKLJOpRz/HE4wPOqPJDBcbulCwkQV1UK9fc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJj6eDLieLV8NrYBsPvnKftfuDgpu/iD2YdZRwYXR4JcqilH9Yb
	zmjyY4vMdA5d/Dn92Ev/Ks4tNsJ3idRE8mD7BhvMMfEvZk6Uzb8N3h3IOSqF8NH/6BW80/hjuRX
	8TuoMomyrZD27+SKfD+jquZBclTnKMJQbyup/NDuchUDxrQYZA0FQaJhJu5SUJXA=
X-Gm-Gg: AYBFou06PyJhNLbIp6A6b1kdUTcio1KcCo/jckaj8I40npS+FyXim8mMd2Lwi+YOYvG
	kmDZR1BwsdLT8YYDpbI/zNYtzVSEdZybf34d5PJsBXTQgij/6nNiJ9piqt2ip1WMfS62KIKvsBu
	nMkbccPng82dSOGuvBPFX9qwrZy3M1bhhNq3jYHpX6FXqy5OfGtJbGapYxXFK1sYFjxgIOnXCWd
	NnAn4e4jJKmEagn4e9OYBc2v0HDUeZOjhmMpGPxg3RLRoOUP1fCjiF8b37sO/k21+EPHSsfJxMx
	BMQYRdz21VOOe+cN+cgm4lsQ4TmxllMTktsp9VwC0UWr8uaLXmw6lz1+9OI3ELCAcuFixrFJ48i
	IVS73oZhs8idIm3V9Yetho+uw/93jhMrgdhxvlTCZ6FkH4k65OYTYl1uZf0+P5xAULhb9AIZ2u5
	XbdWR6bBaNCqkP
X-Received: by 2002:a05:620a:40c9:b0:93e:58a1:3da6 with SMTP id af79cd13be357-940ef988008mr907349585a.60.1793013090787;
        Mon, 26 Oct 2026 04:11:30 -0700 (PDT)
X-Received: by 2002:a05:620a:40c9:b0:93e:58a1:3da6 with SMTP id af79cd13be357-940ef988008mr907336285a.60.1793013090085;
        Mon, 26 Oct 2026 04:11:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:11:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:10:15 +0200
Subject: [PATCH 26/35] drm/bridge: add the connector_init callback
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
Message-Id: <20261026-drm-panel-funcs-v1-26-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4134;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+p5RUZhLB9ONjVanI2ibjcGEHsUQQIR/tz46EaICKxU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9Z9U+G8B/d3ZcYmPZx/LdvE79ePBTwP3d9ZBOfGxZiob
 L7Xtq64k9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQAT+SnP/j/poEUE35Pj9Vxs
 8m7ui3yZtjG8/NGacaK4509uhDp3jP3Jkya/lr/Xy97wVJjhpaTk+ltHUj5ce/RYOOGja2Le/0w
 huVK3mh/HnnXXPdPd+EKhL/NlOPdxQ+Wnxqkbfh48GFq9oly17vgj78WlB2dt9jghmuy33vKJRo
 9q3zaJkKNLPzDwi7+vuldfqBWeeTv1mgT7vDnGB++02zYkxLvn2bIbxiv/thC1dFNxmyRydQOj7
 8qjMxu/KfntywvzMbnqIRZQEfPuwaRjuU1vqtszs2vWKlbZcv61EZU+eE27pG6iqKdCrIjbye4U
 fv6u54bK5ysLQkM/fnEy+HdcJ3yZ1uZtVmclFr37dqMGAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX0W7K8RZ8vVTU
 +AmIRcZ0hz33oSIu8x+Vf3BTapdIGxddMY0Tu+bCp4D9wIs6V0WRC3mI8Q8VsrJ06rCWzgJwLgO
 r8gC0nmGIXkDYL57K1R++d7+IoV6b+M=
X-Authority-Analysis: v=2.4 cv=eMeGH3p1 c=1 sm=1 tr=0 ts=6adf3563 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=0bT5yVRSAMwfGHIoJaMA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX0OdsBlDm0HaW
 YjH6PCIajL2zqFkcwefvYQTdRzA+hJy+4avMSOyCzGCUAvo3BgRwUOA7FGRPQ/L0sIPt5V7LQAR
 yRa+LNUfPYkY3kM+bwOoCmX9LuTHOJgM6KfJctE7F0hXvl/BkpwuVD139t4/7LNpyjELCOuGM43
 X7H/b+azQl5MTDYUtfXOUxNa4BNfrSCvALY198eY3gUJcSLhODParGWm7oTTqpUSw5z1L23EtuL
 Thvfqk5Cx2O/1Oa9b1+qQnTjYw5vL3MON0UuocAlHRtMFCdji95jTeSS9d3PBSoBQZiwOQDxy9W
 PqIfd3lIn1pb+C2J9n6sEXZ3uRwzSsmsDnob1nWUnXAdZqPc3stT/cvjaAwVq2d0NcVW1c7HBNg
 ganxfEK5+KbK6uOw6FHBxtHmL3ZqyiC8cNKMrLyssYKdl9O0tmDM1L1RRTL/9gjQ4fKDdQvXt1m
 ARwKaknXCOqO8EUTCNA==
X-Proofpoint-GUID: 21ecVPmnqIGSe4cw0utJLPYRUHLbwZqu
X-Proofpoint-ORIG-GUID: 21ecVPmnqIGSe4cw0utJLPYRUHLbwZqu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

A bridge has no way to take part in setting up the connector created for
its chain. Whatever a bridge needs on the connector ends up special-cased
in the code creating it: drm_bridge_connector looks for a panel bridge in
order to set the panel orientation and checks the dedicated
drm_bridge.support_hdcp flag to attach the content protection property,
the msm DP driver attaches the DP subconnector property after creating
the bridge connector. A DP bridge which is not a part of the display
driver cannot get the DP properties attached at all.

Add an optional callback for that and a function calling it for the
whole chain. The function is separate from drm_bridge_connector, so that
the drivers creating the connector on their own can use it too.

Only the panel orientation is going to be converted for now,
support_hdcp and the DP properties are left for later.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_bridge.c | 31 +++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h     | 23 +++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index e7f9e6d58927..10c8388594a3 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -846,6 +846,37 @@ void drm_bridge_chain_mode_set(struct drm_bridge *first_bridge,
 }
 EXPORT_SYMBOL(drm_bridge_chain_mode_set);
 
+/**
+ * drm_bridge_chain_connector_init - let the bridges set up a connector
+ * @encoder: encoder the connector has been created for
+ * @connector: the connector
+ *
+ * Calls &drm_bridge_funcs.connector_init for all the bridges in the encoder
+ * chain, starting from the first bridge to the last. It should be called by
+ * the code creating a connector for the chain, after the connector has been
+ * initialized and before it is registered.
+ *
+ * RETURNS:
+ * 0 on success, a negative error code on failure
+ */
+int drm_bridge_chain_connector_init(struct drm_encoder *encoder,
+				    struct drm_connector *connector)
+{
+	drm_for_each_bridge_in_chain(encoder, bridge) {
+		int ret;
+
+		if (!bridge->funcs->connector_init)
+			continue;
+
+		ret = bridge->funcs->connector_init(bridge, connector);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_bridge_chain_connector_init);
+
 /**
  * drm_atomic_bridge_chain_disable - disables all bridges in the encoder chain
  * @bridge: bridge control structure
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 1981d24a700d..470b9c6cb12a 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -881,6 +881,27 @@ struct drm_bridge_funcs {
 				    struct drm_connector *connector,
 				    bool enable, int direction);
 
+	/**
+	 * @connector_init:
+	 *
+	 * Called when a connector is created for the encoder chain containing
+	 * this bridge, before the connector is registered. This lets the bridge
+	 * set up the parts of the connector it knows about, e.g. attach
+	 * properties.
+	 *
+	 * The callback is invoked through drm_bridge_chain_connector_init(),
+	 * it is not tied to the bridge being the last one in the chain or to
+	 * the &drm_bridge.ops of the bridge. The bridge chain is locked while
+	 * it runs, so it must not attach or detach bridges.
+	 *
+	 * This callback is optional.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	int (*connector_init)(struct drm_bridge *bridge,
+			      struct drm_connector *connector);
+
 	/**
 	 * @debugfs_init:
 	 *
@@ -1484,6 +1505,8 @@ enum drm_mode_status
 drm_bridge_chain_mode_valid(struct drm_bridge *bridge,
 			    const struct drm_display_info *info,
 			    const struct drm_display_mode *mode);
+int drm_bridge_chain_connector_init(struct drm_encoder *encoder,
+				    struct drm_connector *connector);
 void drm_bridge_chain_mode_set(struct drm_bridge *bridge,
 			       const struct drm_display_mode *mode,
 			       const struct drm_display_mode *adjusted_mode);

-- 
2.47.3

