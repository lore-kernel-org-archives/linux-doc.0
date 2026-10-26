Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013046;
	b=j2PGjnESlH+Tw/fleYbWbSknZDWRcFhp0DlGWcpR73eLSGkoLyPaTci6v6f5XSx7Um8M
	 ox/9XwtBIXwfvtSg+3cI9PeHM7MwhgNLgikRhRcMKkvKCe6dOgNtFubEwXNMezele/mJx
	 zQUrhlHU5P6EtyPTCGkrJihOVCZB7XlMr0ExziAY1MUe9PEjgEXwQhaQGfuJ10wOAr8Gh
	 JxHnkveWxulqtPTbM/iGagk3G3BZIPLATZBrpQh1VRjvTcl/SSe3IP6Vwgd1RYbqojTXq
	 eXoxYHpXGaxNG90IXRrOC2hE5IFmHpqlFyKKNYB0PPCfCcqzxqa7KeEKN0SqlUx40Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013046;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JDdjP3ZvR3+u7GTATP7ekWKxiYBGcGUtqHhNUpZYJAU=;
	b=wB7eQuMQs2gPgdEaogo9L0z6vBwtOmdgZcy7hX5Z+pBLoDppN1Ujnttsa+j1Te2Ozjqh
	 WAjkpCcDHx86D4DgxvjOfkxdogT78eEV6pAHAMYZH/NLrVtYOT20CAPafS4IB79pCxbk8
	 SDq6fBRINKd0YCCTUUqDS0sZ/2xHOgZhXSuHfWGqeMX+2TC0mo8db/2wjgSN3LV8CbNvV
	 2q+Ys8aFXJiWKm3qAdrlg/fkAvtXYQykJOirK7UvMNLiSO0SagUu3mn1gKnamLq0S0uVn
	 HRH9bciIPweB6oOIFLtBpP2pyBf4JvcnXvw+GkiCI4PVx7nGE7mJ3FVQTEKlVFcXbEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F8wy4+CX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YVVtl2bz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6913606A97A
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6913606A97A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F8wy4+CX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YVVtl2bz
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAsrNO3033637
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JDdjP3ZvR3+u7GTATP7ekWKxiYBGcGUtqHhNUpZYJAU=; b=F8wy4+CX/rG+lfZZ
	Lyan3IdiIs/84Gys8owEbGXfJk34r3CcF+b+Q4mmInADgr3eWsRbVJRNoe3mwtZs
	VsYyArKxzDCzwHEmIoYcnByfO17CNPFncRW770DuzziCcwveti8XS2tC1/lSLo8L
	VcYAwYtiaXmUyJ18o38o6ju/1YtKbApXJwjhwyMJoWlo97KMrZIHjSOUWj3ce3HG
	HZDtvZAaUCdsdJBDdPPY/mjwYQldfdKv8hWGKkBABkHzpGCi2uBWHRuFB7DPdLhO
	lmcr/DgeJjlEfhQ+cH8SDfA7E3E5NMHxb7kyjKXT7eh06NVWeuu1TbmHvDH7JPnV
	0YuW9A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj56y0465-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1e62510cso728510585a.1
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 04:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013044; x=1793617844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JDdjP3ZvR3+u7GTATP7ekWKxiYBGcGUtqHhNUpZYJAU=;
        b=YVVtl2bznaS6SS/6vFgSQ4UcYPtj9oYp4dpt4ZjdigyQRHpLliIRvsXHskjfP63DCP
         xciX0bYC/xaMMWQXuCIX+dDlnG4bbC489vCTX3hRHxBeyXslpBVilJlHd83yoYZJa71Z
         3VGFcMeJRln+IAfQ0AVkrHe9PzNBVd92IfkiYoIXDGqNzo2DM8W5TYExi+Udk/CsFyPR
         HagYl4hlP5EqEBXfiK4aRvFSCLgxCL6Gk/6UsRQ2kceKnS3e11lCBM1bJNkyCw8bPNrd
         Z83HroJnDQimLPMvJNh2noFXLpU/mchaZ43VnM6JFc/O9uRBQBQxiYifq9o99mkysoef
         5+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013044; x=1793617844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JDdjP3ZvR3+u7GTATP7ekWKxiYBGcGUtqHhNUpZYJAU=;
        b=HPMB6HAGbkcP09XMMOEDvSv6AYy/6KvmxHwq1s3dZcpNI3SH//Pe/NQefvFf4EL9ZR
         iaxAvIz2dGhgVEdeg/cBCBnUXwX5sfDZzwbmXlz11hxpHXsfyyL4V6x7L6pp6G5+oUZ5
         TsveiJzzenbp6/tfzZqYD8WYsxhpuWLh9aWFr7gjzzLk3DYx4C07GOqMsWTN7k3V2P1M
         ayoyzEMLg3rt0eGuPyGFBUiNjw8kUzDItaFyz5pJ5vi6w+63/QA0YeOsTEcRHcOZ8gAa
         VAlv8icBDkiTvC2fBSTvWd7qsHeoDNSwQfDY5njOSO//h2g7wZfXNYLWoIsmALKMDA5S
         sJ7A==
X-Forwarded-Encrypted: i=1; AKwUvBwzFHfEqHrzupS/NmRGyd1wW7tl8VkkhJr7N4O/muukRwsz44b4Ev0qpq9msSnayvZsGp/m4WpPoO8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4MDoTdlhsF/emXlbYPnyTHD5zG+LudRHE88lR55tVCat7eyiQ
	gYvXPIx4K/X7gAtT1UWRoTj/5Lnk7eHeH8J1oVHsvxTgpabF5zvV0XCJ4uCa2WjwKyyVa8ph9jv
	D5b5XyVf9ZDsoC/vGf3KfTPw9y1O5ZFmGB9+TyFJRvyGvPxrhQxoxWjSosp6Xm3U=
X-Gm-Gg: AYBFou2DptlJKoWgCfuYcDYi9zWC9MBoW1v0BuJB6+jQRb5RwHyecCxFG2DEcgbna2g
	NfZHuTZf4Wavk8mWkGJNFe0Vz7En612hvFSCKxCpUeQo9RgdgUrams1zODn3gIzGvR4i/eCxgt7
	ggBaHQL+N/s94mvxJAzQT/g+Yg2Ia24GFRjUvx6K4Kk/Y31kYkO6yNNZNTfv5YIfUwNNEPBSzxi
	bceP3BkkpdD/pIUP4bRj+qDuckdG4cZ40Uot5deIFqmLXpBuEe0KbtxhMcKr6vW52SjW05RsNpU
	foi6nLPzrhdsdbTQMV2pxxBYf/gugTalZWkflAbaFz8FnHpeYoM92Z6I15ZN7qgt0H77MqXQfWI
	Pntso0AFmCFBHyWelPFKWU7NWhvmqyq4t741q25W8wKbrIjDAabh3xstEIZlJjzSuuZ3DXTjsNO
	SyHIyHBqpprzA8
X-Received: by 2002:a05:620a:17ab:b0:93c:bdb4:2be7 with SMTP id af79cd13be357-940ef999832mr820052485a.60.1793013044043;
        Mon, 26 Oct 2026 04:10:44 -0700 (PDT)
X-Received: by 2002:a05:620a:17ab:b0:93c:bdb4:2be7 with SMTP id af79cd13be357-940ef999832mr820039885a.60.1793013043412;
        Mon, 26 Oct 2026 04:10:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:10:00 +0200
Subject: [PATCH 11/35] drm/rockchip: lvds: use drm_panel_bridge_add()
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
Message-Id: <20261026-drm-panel-funcs-v1-11-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1061;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VuuvMuByE/5au8TNoJGc8h1xnsMCd+SMeZ7MKGuRyyg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUKIUVSRGzZfc6qYgyaD9nRGfx+H/7o4CWdk
 wQOpg5J6z2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81CgAKCRCLPIo+Aiko
 1QI8B/97uFs9wHHAcLSj02SUi5PXzEJMksmcQ7qKZIjNn7GfH8bLoBKSFnfP49YqCUduisOEhT6
 KTKuTU4S/KuVHEJBZ8F/LiOMPnVQBnq0NiQhbfywWC76Ly4pg+z9waoN70q5DcXEhbaE9tDRkX/
 MYkXObslKB4jt+l4aynd9Jnr6SEAxi0/kA+2541TxyDmriKD+P5IDDweHYYyiL0PKyYdNKx3OdL
 ZCouAJsrqTPTCfki5i1Jce4Kw4n+85mVUI4+LTmH77ya3K5dNFMJsfHdvnOYkmDaqyBghuWU49H
 T1iAXG1ZbmbO7m6dyfFHITSkUzX8Saqr43Axoe2knMHnYoPk
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX8RMOqzFlo00X
 2paN0+Sy0ig+IXDajg9G3DAgPXs+BEjTO3BB1NaDfJsGcZynF2fr6kzyeD6BCmTL7K5MQIRSUFu
 w3HEcdrIXhR3qkcbnk9mIAVg+1DBsiY=
X-Authority-Analysis: v=2.4 cv=eMeGH3p1 c=1 sm=1 tr=0 ts=6adf3534 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=BQQ5wuhf5moQr-eOkAQA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX6Em92pItIVBC
 iIi1WIE+ll2e5rKUMqSrh0nV+j9Hi9h7fjtssn+9rW6MCdEqQS3sCjJzg4BAHRuoQeSnbhic90E
 KX6ZsDsQitYPrGAHHYS4zUeDLYoBhBsfks2WSnIhDj5jwjKQcs1k/lHPfOqfHXpVnto4jruHEqi
 Gdd/qc79O4POoSvIcRv/tT5dLdcgqBhEfOROo4ZCK0fEJ4sy4vXI08TXny1pTvG/CEz7drZesPu
 ynRm7u/VbNH7alnP/qVMfllTs4B4OBFY/044IEDeOmczSSBY6GeI7tutJAbmVHv7vOQMFCk4vnK
 HHbKG72dL/qgxRtCJXlg0OK8VlBkbK6VDbJDzpvRs3jKago3xUkt1LJUaHQXyu8tkpnL+5CkQLa
 dEotC3fkPew/cv+NhWqarZBF3ApOSdgnhYBoib51X2ugSqHgw4Fkc4F1vE/pEMK0UUdk8xbP4sH
 2AQiXSRDYbWwL7BVoHA==
X-Proofpoint-GUID: 3vL_EC4FenxVik_V9JAcnAP3RUna4OY6
X-Proofpoint-ORIG-GUID: 3vL_EC4FenxVik_V9JAcnAP3RUna4OY6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

The connector type passed to drm_panel_bridge_add_typed() has been
ignored since commit b7797081ccfe ("drm/panel: embed a drm_bridge into
every drm_panel"), the bridge always has the type of the panel.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/rockchip/rockchip_lvds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index 505c6c56736d..d49870cdf906 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -609,7 +609,7 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 	drm_encoder_helper_add(encoder, lvds->soc_data->helper_funcs);
 
 	if (lvds->panel) {
-		lvds->bridge = drm_panel_bridge_add_typed(lvds->panel, DRM_MODE_CONNECTOR_LVDS);
+		lvds->bridge = drm_panel_bridge_add(lvds->panel);
 		drm_panel_put(lvds->panel);
 		lvds->panel = NULL;
 		if (IS_ERR(lvds->bridge)) {

-- 
2.47.3

