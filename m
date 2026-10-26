Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013061;
	b=aMXyOYoNWPHa82r4o6I1/yCcOyZWupwJah1psMUUYHSGDX1n1cPB65lW+PzYPmKy2JNE
	 wkWHb5kEgIcQqll/IJkj7BgvdLSC5SlaQUlPhQpMcKyOP/8v3M4f//sCSnw9nTyR6bx2N
	 IdXF7HfPyAKQnlC4Ko8LwQwd3Ni5lYa30WMMX/s/5p3zfDPjNK3g+6UaFlWD3KfRzfdyv
	 eKwHC9rBMEh6gUAswgJRYvCJ56oJjm7ReQVWm8SccgrY1MkvxoVruC+5sYUQuAOzvotQz
	 oMJF1Rk7IiqAjuUUtca0PxCAjjEC7E9zVNxV9I4JLKY44UDi3LX7Nrd3AytqeNgimNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013061;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rebvWxCr9+Ge0kDc28vUG6xfscS8hdlfWlfBhz5l458=;
	b=JHgo3CBlqEK3TD8v9GwNb/9DSomBSKR/6mGvji7UmkKpvV7RCWB44vkhcZcwSGS38lGs
	 S8SchI296e3Xw/pj2QX8ZWwAR37N8qaCRN/rc8Ufog0eBkCSriwaPDk5Oq/d5zhDzNnVi
	 4HTpX42ee+RA1cyvZy8GIWa4nCW86zbZYybWAT+Fs9sCsp68yj/PWltORW+ImT9jsDVq+
	 VVZb80rnu7hIAMWQCTwrqepYhHSRRE/HmIMtdZKBra6utJIAx/q+wuLBeugJSrT5HtbKd
	 LpYgK5lUWk8KBRf8AinHkQs4CJIbYrAGHqRmCfAkf1UubiCOLVVGrWJdxlEtNZ0/ipw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CoB+I2+S;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WbMEyYY8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67C1606E724
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 11:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A67C1606E724
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CoB+I2+S;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WbMEyYY8
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtN903050893
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rebvWxCr9+Ge0kDc28vUG6xfscS8hdlfWlfBhz5l458=; b=CoB+I2+SWv35Qtor
	L8GMhL+b7WlxecdNbWGNx+yPxRVOLK747fIkTb4GgJSaAtEkXbxeXhiDg1sCKBD9
	4ovFGGB5v7fFJ7Q/SWsjoy7VwfWCJQJDO8jP3dOuUhGRuAk+Hv8gQGqenkbDF6/X
	u209LROl5Vi9P3ypaj5N97DDDNR6gqlGWsxlK2Yzi9v64uvLwZ9Lw5SULLUWxqRP
	9uuo8DNb0WntR3VxigvtFclO+9Mp9sOhuBXQ5iS4Xy4diS7cD2p7uiZQZ6rcZ29D
	XZAQ/dcvi5uXNTIQcvr2BXZRVZZE7h+SkoM1YIbFfl3dhV+aJKIm7l33YVTtUjDu
	+X4QjQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvdd9u7f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so640570085a.2
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 04:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013059; x=1793617859; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rebvWxCr9+Ge0kDc28vUG6xfscS8hdlfWlfBhz5l458=;
        b=WbMEyYY8vodE6QcurWUwRHFSsQmYwVs2IJ0lg9LGnaFeMi4xFrWQl9FOKq56JKcIEA
         8hlSyy87FVqUdqv3EshI2qFB1dnIZhhGaf+pHT1/ksz7f4hBZToB0aP/1znapUkRqK7v
         Q+7g6pikUDJ5yWeBm2vOm4ycZJ2ZIW9dr5RoQ/OENk/AjTU3Uejkl3FM3amFg90n/Lra
         uW522xDLOWqHy7rTtMnSTK6Dxmu8yOVuuPmqFFxsIkx0v+y31ADmnNVod0PtIhaakF7T
         2PmupOl0K9Tq9EdIJYfaDsHoXuqLr7qbaB4qZn5KlFl6NnhJ7XHQaAVA7p2TESXhFnzq
         rsog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013059; x=1793617859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rebvWxCr9+Ge0kDc28vUG6xfscS8hdlfWlfBhz5l458=;
        b=jezJb7Mg9aMReY9mFM+lkgdBQQdMBG70Om3KAq+414qG5ao6BiLyfZeuEZbLde2AQt
         xr09U79Vngi5Zhw1jK9TGOz3ZMW1j5yGJno+6SLYgJz5bAoQXGRkH1bPAKklNb8PwWO/
         prsqE+fQ4o7b6ARFS8kMy6LpWaU2FxLakT1DS02q2QyTzEsvNiQhjhgE4Ymzj+flTErd
         tZ9/k0UZ1ToXOX7iwVdDqEkpTbv3ZBYBW+INuPe6QZG5ofqydAIJ8ROzPHykzUuC8pJX
         kayn47fN+Av1A9ezXLvMKqfpMf+r3FMKosjNt9idtkj2v4/OhjMXlAEc1ueqZW9MWLDE
         E7Uw==
X-Forwarded-Encrypted: i=1; AKwUvByZtqEVVUGmbdAWBQLug7SGEI0Zf24yEJ6hw3FCNlRJDyY885NAbQWdqFyMj2RS/AnmOkR98yyn/50=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEF/kbo1gZ/7UY33iJ8xsYLuJTl630bDCvD3UnBZWJB+iF0fBb
	S3Zd9EDybbzDzxZ0WYWXszqTwfkOlzaCBsg52iWzfZTiAF8crDLpCjkdUmeL2SugWYckTKxoItd
	DhEVHrV9fvRjBtgWlBAktRGDUZT0gsMtNfoGf253BsgRP6j1M7h9LMgR1jVsR6SQ=
X-Gm-Gg: AYBFou2hfVrLkgDoPm4Q1vfzhxrEXGWLins898Usln+1KUnNQjMJgsibzjOVwfDyiVi
	hR81HtYqV67y+KjSdsTND5rlgaNrMvwjaJqz2Z55jKXbiK8Xr77PTxB6ZVo284EQ3/SIJMQjNp5
	mPZ1RJOJtVn3zeyoNeFfVTFo5yW1qOlLExyYy22qFMbmwqobP/apirYIAwDl/1wOMiTdMXDXV0g
	QjQ/XP5XA+iuwplr+wY6Y1joA7stLwq4F3Soj8aHrJdXBUU/PI/6/ZX8OPdTQByBdCrrrBQ1XXC
	ns8j480PdCKH7j96x4xwCwd9Chemr149wzDEYdDBnnuZMyhQjm/pcbvveiJ4aa6fQlDGK4KWlhZ
	k5KqRARTPkKcSUeb67Tnht/uVMjT6+4vuVvaT7HsYdm32XUqH2JneSByh/osHfN81ZA+xpDrmK+
	G0HXYRqfaLlIuk
X-Received: by 2002:a05:620a:4720:b0:93f:5519:5e87 with SMTP id af79cd13be357-940ef7ac1b0mr958734485a.4.1793013058985;
        Mon, 26 Oct 2026 04:10:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4720:b0:93f:5519:5e87 with SMTP id af79cd13be357-940ef7ac1b0mr958725885a.4.1793013058439;
        Mon, 26 Oct 2026 04:10:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:10:05 +0200
Subject: [PATCH 16/35] drm/exynos: dpi: set the panel orientation on the
 connector
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
Message-Id: <20261026-drm-panel-funcs-v1-16-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=928;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CZFt1bBeZJSZQXRLfeILapG6+I5U/Cgs+hD3WY/o4/o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUN6YdtgUzCeo5T63KQnD/ShNUM3twfrzjxa
 JKBXHlhMg+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81DQAKCRCLPIo+Aiko
 1RaJB/9FjTGyNUxqB20GbVEDkLZ3czC9tui0A5a81YkHH5yOQeYmEHwdjPjus3nLIDjcc38vLCJ
 1HNPw79T//9xux606CATnWJ3HkM/CcQQG4ErEaZ5jcYplsMFqFCRWPJQF+wkiVXllMb4VnaRZmc
 LMeYEvSlnozCScMtCAgma9qOqczJpeMKvBe7CJ/jfyecwQjCui3sVY7Co3VjjyAYdqgltGgnclm
 6XlCriXjWT2SPOezJDZ/vrH3cMoicwlexf5eF1V6V/UZueqvLExaKnhhJ7KziQqNDUDWoO2rV8u
 euxMxnZ6TNLYBs2ynsod8Yf1sYhlhfEoUc4CeK3326Xx80Wy
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: S96qsqE_ZrTIGRmYp7ozBAMbCUDyxJrO
X-Proofpoint-GUID: S96qsqE_ZrTIGRmYp7ozBAMbCUDyxJrO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfXw255dNa4ZSmh
 8Ue9g1Vwe+oAGbu0LJ55A9/iK2K4MYyqOVYNPhkI0eG2aEb8XU9yH2p3ryWVZ7vgXC0hmsHdvTp
 16SJZeL9sbi+4/0eALd6/+Nx77XBuwQ7kCGp07p6yZ9ZUGEqSBUgdL6t98eGaRx84VYM5K4xInP
 crUo2rc7Fy8kzlnp8Mb0/90qgXy+56f2q0ZjZL2O9hJhG7CJhHbJ616DrC7OYD9TeZflQXmNZEK
 AdVR0HeK/WLVChEgEgWSCttASr7iztBxjlzll8/USamzi5EplgcuFYXOCu57IPNc2mmJQuNje/U
 ZViSXMghttJOyF69oVzcwHl5Uh6Y7cjbcGW1wEUghbeRbcdtKkfNgeSeBgRdhq/4Fc3CtgRehTv
 p7eKBAkF2HQcIAMOLki9VpqHN9CEPrhnlOSbEhWN+Ev+CDZ2K2yWSujkqkswrOASPVmShgsS07X
 wRVIVQvx2oEeF8T4zcw==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf3543 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=-iJ8zVrSboFU4qp5kIsA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX5J4AD2mZGB/u
 7iKdkktWI9ss+ru3D1mgp5asak8JnWMlaCZBkxEXxLiDBAC3AdYqvWtpzxPtq29b6S+dGTS+Y07
 Lt7M6Zt2Za+MTqdxcxhLwssbyFeBx/8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

The panel is used directly, without the panel bridge, so nothing sets
its orientation on the connector apart from the workaround in the
get_modes() of some panel drivers, which runs too late.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 74d3a2bebb74..05014c2e7d92 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -109,6 +109,7 @@ static int exynos_dpi_create_connector(struct drm_encoder *encoder)
 	}
 
 	drm_connector_helper_add(connector, &exynos_dpi_connector_helper_funcs);
+	drm_connector_set_orientation_from_panel(connector, ctx->panel);
 	drm_connector_attach_encoder(connector, encoder);
 
 	return 0;

-- 
2.47.3

