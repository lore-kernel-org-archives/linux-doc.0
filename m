Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013035;
	b=n/Q798Q1/JSvIBbpovGbEB2VDaepU96zJ7DNcl75ULB/E4oTWfC2SEkXjdEkidPD8ibB
	 S7gx6Rk35k0nHELlSUBBn5Egkna+E2AV2Da/ZEelM/oFeCOL1mUlgEl8dKZxLCvBm5vwx
	 dRhZ0t5nxyQKTNoBU4APVhqd6egNv69iweAy8YiBeqWkFQSwYd0A4ldqJPAoyXVPvPONN
	 H4JZs+rn/1jhIEEj+jJyReV/04HLjvSVtvNTdnZ7hOIml4WV18xxANUP4Cwyva5KhMiFa
	 kWIxDInmA3IV6xOfFJPnHhI9BU+nsFXoK7fMErrNfJoLUXPUTchMN8y4xnbg9MjrddQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013035;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zJGI2tz0W57vr06M7+SplOiRV5n8FbpcsoZ1wpiNj8c=;
	b=v54eUXBrkB7BUXfI4TudPwnrDbtzsa4yCjSE6+K55qSo++CAMrtJbHiaKhKkNc0ZqTbM
	 IJKrF05yO3GAcQUxSdcfzvJPJm7UGAbIgneWm1xcE/PpPYrinCeKd6OSv8TnqzADXppxs
	 UrzfeEmcAyBczsYZ0bVTkaINFxMr8UsVffJZlYOgxBL1hc3AatV1AJ4xw3f8MrvkKZaJN
	 sB0Rxil08yqFLGsWWRD12yoe177zYuOgHJM/nXi40N4N3+qBt2rELOFxX0Ew3jZnEBTJv
	 qEsI3iqNmPdT+Gjcu0/pCqo+U8gQ+N3T9GN0wBP8y5R/Bpf5GDnY2oXskqr9nSpsgLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="PcfRn/MG";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ilmu2HwX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4864C606A324
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4864C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PcfRn/MG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ilmu2HwX
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt91k3049902
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zJGI2tz0W57vr06M7+SplOiRV5n8FbpcsoZ1wpiNj8c=; b=PcfRn/MGbVAXfuQ7
	zuREWbOF7ZIB8QlcwD/KDbCIEUoeG7p+WT9dU6U0lHPpBw7CHD9KJhgMPjXBnp6h
	RfZTfxM4vQGZM7+3gXb07mWk7JJJMFBiwdTqqjNS5cnBmRMhC18ELfJ3wiMBTGoY
	3yozE2Zy+QVDywzmszrEeOS9MZFS5j6P4ReC2pCgM28DF0eSBqSASDR4S4XRpO+e
	MQPqZsen2+iLuIAkN89uSuL/TIZ+320zVGTahJ3xA05P3hpjzwtk8i4Wh0HTXzzI
	em1LhwF7ZOqA2Ys1U29fiUiBSzr8wO4sCZKvvcLxiftqP7qiVcSk/ldu3jBwb7ca
	JfVhAQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvdd9u3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 11:10:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93dd3c3badbso722690285a.2
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 04:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013034; x=1793617834; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zJGI2tz0W57vr06M7+SplOiRV5n8FbpcsoZ1wpiNj8c=;
        b=ilmu2HwXYv5fKAVeX4VmvvEHQAaxPNEWJEp5wjjWBS6/8CWffqJgeNDhxLPxYQZK0X
         8gZ5wxU84IGDzsOtcOcrwVebIuHLxcVdCruemzr9+SedbRqJV9Winc8w9CeuHvZf4UtM
         NbobrDM35EY7IeORyCxLZLCDpaNGWZdFXineBmZDCaODOC1uCHxsnCj8OybjoFqX9mPH
         UlNgau7TONbYr775HTwjw5cMYAmdG20E3G4pUuu9MpFOlvuKMJeu7+7ghTLHW2508FHm
         kaPQeLAha5nZCm+3jWL3RrlcLWKJgJ9zDGzFZecsGH/l5sXonGlllan12APNoR/5oNhm
         jazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013034; x=1793617834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zJGI2tz0W57vr06M7+SplOiRV5n8FbpcsoZ1wpiNj8c=;
        b=j6sVrRiedvh/gxP8HaXO2dNDgFfuCLFLcGgUhQqX+MPJgcfbEZ4ZyV4GhYIqyszXDk
         /E060fMHD8TJA6OYWhx0D5vvHVeacxw9r1BY7q9TCh2USw0OSZQuI3oOma5TXsJqw3Sw
         nAYa7pguusBsnH8ICNt+mzPjnfuO/OEsk7cWoQ0k2u0Uf/JjbD5ufWweCtN9b4WMsYmU
         r4U43/hjP6GWEtUWyQkqIEByzBiaxDs4OSk9MVax5jnQjCHE2hnErkErgJIrA9YxBWz0
         mSUEw21wSIDm1m4QgTnL1H1V5MfhZR9iDMb2UiC5IlC/6cvE6jHGZg0twNN1c2L/Uz80
         EqQQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/+qKLk25mTYVhe0ofIzkCRVeTkhNvqk5wwz/N23emgeehjywXQo8lKbKq9JwhhY0nMaQLZTitkHo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOO+sZ0Ec6lccPHIx+Tk3/IsypNavPjR01T7vD30jYDISyge4I
	y8MdS5P63v7nEEcuSaeq0k7U6bMuAl4jbMRBgKjG4/Fhaqg9LiEDukyY6eYgWIBmjF15KJIgCbM
	XQkdXH9gW3IoFAHdEA7N01WEfs1i43ETRexvKLYwynGCW9YF7nodNUAEYjOWKvaQ=
X-Gm-Gg: AYBFou2jxX4ouuO9jjXu8PIJMeqLTTAkCcmS20nZ5KwLZRY6MsLVCYE7sY75UxMuOOp
	i0COLjk4Wkto824rVo+Dz4NZtVx2IEia+grPVsuHJSHgw+0R2lFonlk3plzc4NP6ReRSk325+Lw
	jJmAkAT3li3hYT6HqsrY3Lhu7W2+sHwOZa7aUAf+mY24oYxaqdzVunbf/JYZn8ED07rcY4uwaC9
	SZoXyxIR1eu3EeAfCLYQgh3EXO6EzJ5yt3iVn6mjFODV8S+cIR9wRWYYxAm8BacWiVIBkuEN3m2
	fIJH3P4b8Ln2LHSqH5d5nR47HtdDizDqHEuxk5hMqHZzF9XCOh0BdxZkYR878YUt+nfcN/8nkEh
	e+ejcSnwQ047MGlzmfDsp8W2rNCiI0l1nuppjRJUjG3aU6uvtjAqxMtoZhE2D3arhwjYj/HuVDT
	ynk0kniG7iwuHG
X-Received: by 2002:a05:620a:6887:b0:93f:567b:6157 with SMTP id af79cd13be357-940ef964f93mr965076685a.46.1793013033481;
        Mon, 26 Oct 2026 04:10:33 -0700 (PDT)
X-Received: by 2002:a05:620a:6887:b0:93f:567b:6157 with SMTP id af79cd13be357-940ef964f93mr965073285a.46.1793013032997;
        Mon, 26 Oct 2026 04:10:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:09:56 +0200
Subject: [PATCH 07/35] drm: rcar-du: use devm_drm_panel_bridge_add()
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
Message-Id: <20261026-drm-panel-funcs-v1-7-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1332;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ULsX1dvjGix9WxOeq5OBXyIUsRBnuO1n1CN6kLh7e1o=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGrfNQijBa4aGH9jIv71o3IUXgiKh0bJWRV+IrnWQn/EhK976
 okBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJq3zUIAAoJEIs8ij4CKSjVvlcH/iO8
 jYjv/HmDRrgNDbCzIBY4wlAdtIgGZlU+t9FDDKZ8SP6nhoK2hkukiFUBbwqQnTCMGhwHGeC81oR
 JVXvJKEJI/fcLj0DPMr3YIpCmst/stq61gz+KuqPdk7SI9OuOF0a2H88vkGOOoj35VT0rc6NCdW
 9QKlWwfZvnOEY9n2MuG076KGS2o5KXObwy2hr7i5FtiMbDhT+y9jXBXOVw+qvMBJyB0Utk3l+MX
 pgFkTm36QGi1diysTHh2q2sTPKR2zcgP0IIlrA5zOSzxXb6wCEfiKFWWPkLHZa+EAGdzpIvJYg2
 b9aYDplpVEOCLyE33DWH7DqvtUtQp6mqaFqOu44=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: pgAwQ5V12u4nuBFDGtamlDDPYS-XNvBC
X-Proofpoint-GUID: pgAwQ5V12u4nuBFDGtamlDDPYS-XNvBC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfXw21DrfGruaEa
 1IxstIljzwdkb8KsBSKmEPVl2QfQWmr4T/6WoHAdbuglhAKGuF5Sb1dKMLSUx4l+HbcB0E1aI+V
 OQ4ABuPm1wBGyKrksR0MO7qWyPjFhMdEwJj+i0hEGXBW//swDhR9MaaU/SxsjtWMLJlVsiFAcyo
 OEtexnMJD2pxNYsFnEGMkU803E5zdTfHc0RdXTWcWyfwbAyk4XrlxHScmcGbv5iT6hnr7PjDVZV
 vsh99QVk/DrcTv/HTUlchOV3v1A14/KDlI3GGd7QKdFQdXuxxJQg9t39yUAp2RyiLDLC0yGTnbk
 GPXgl7F2G43+lrJxGnSGUtv59RCr55ndIYnC0PsEtbacSpG0Qgc2N7eKRmHk5GfcXW3NU7Mg9uM
 c3y+yWYZh1q1pNxlFawSaoro+hGI1e7eDjN8IXVg+C/EvZHuh/wcYNM8YZD10ZFNadv/lecq/L8
 04FLbgEcGAofSPUWBIQ==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf352a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=BQQ5wuhf5moQr-eOkAQA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfXzaJx2qt9nEPa
 jdxei1fwGvpznCdomCryg+1tc9hUxCVqa0vJiL9/x+duRmxCg3nCRnN0yS2h8K0NxR5DxgYmSUV
 8pPTaOB0uOBvoYJRU5Ytit18GBJiGoI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044

The connector type passed to devm_drm_panel_bridge_add_typed() has been
ignored since commit b7797081ccfe ("drm/panel: embed a drm_bridge into
every drm_panel"), the bridge always has the type of the panel.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
index 3f98eae9b6ac..f28840e3a1ed 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
@@ -67,14 +67,13 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 		if (IS_ERR(panel))
 			return PTR_ERR(panel);
 
-		bridge = devm_drm_panel_bridge_add_typed(rcdu->dev, panel,
-							 DRM_MODE_CONNECTOR_DPI);
+		bridge = devm_drm_panel_bridge_add(rcdu->dev, panel);
 		drm_panel_put(panel);
 		if (IS_ERR(bridge))
 			return PTR_ERR(no_free_ptr(bridge));
 
 		/*
-		 * The reference taken by devm_drm_panel_bridge_add_typed() is
+		 * The reference taken by devm_drm_panel_bridge_add() is
 		 * released automatically. Take a second one for the __free()
 		 * when this function will return.
 		 */

-- 
2.47.3

