Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013070;
	b=nJEP0Cep2F7RCYN3xu/yXN+WWV1huGPkkOgvgcavUnugCwrdl91o/mIcLL/u5besOtaG
	 p23CNUB+RJmL9va2PHvx1KEfK5JGNlzwLMHu7DXSL6HSseBvd5c4p0XuK/s0EixhX8Jho
	 ciPfaVa/V4rAXsNmjIXlkM+UeXYB0+9PVs3OQzcCEWkWw2OYNv4FTPn50ngTwF8cYesVb
	 /BThXbHdymikDIfP0k07Uy1PvWf5Wxkwct/uFp1P+lhKS5z9ssjoQc/wnyfPB0OOLvkqu
	 n6NQB0YmSePJ/09754DCEGvvVp1hqn2M7XmfdFULaBerBe0J9rovkWssPB0GtMgR/Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013070;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Koy6XZWUO9sFV/HU2DhmXsiI2S7zyst4K9ZFcBiDlAM=;
	b=DibLtifNqOnWj3y1c8GOBQX0CXkUp1/qEuTmpVEv7PBg35yylyZ8KynE+UuU0xfo58nX
	 iebrssXize6C/x5MDCYN4ZtPNy94s/kSrDUKPeZH2IhNHIP0D7WAPIpBm7eHXpmtM1J7O
	 pb3l3Q1syq66JEU657B7Ukn+gvkdKPlwcsD7eKOF/gdJN+8rzhjMKfTkCLHnmJUgr7P/I
	 AGeufUe8aG7YdD2hfWUnBb/6HFWoJe8rv998w0hpIkkZg9wsgJQ6y9/EAai30c6bkLUve
	 97x08jiiHC12Gxbg0oBiRdS1Ka9u0BR3Nl6ZcxNbEZs0s4EhoEmLp8NSRX9vwy+FuAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l8pPE3ho;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HMTzJzsA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4362460A383A
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 11:11:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4362460A383A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l8pPE3ho;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HMTzJzsA
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt9VX3049882
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 11:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Koy6XZWUO9sFV/HU2DhmXsiI2S7zyst4K9ZFcBiDlAM=; b=l8pPE3hoE/kyXz3L
	j16UZazP/mmVe0gLaLrrseOQLCb3LVDtl/dvZzQO5Yr8M0BpSXk5lMGUU2FcZ9sj
	8D1UScd8wpdLe18x0VNkC7Jb8kYQyBFHLG4y1m6MW4njJXpcy+QEAWrml40jJpau
	Za6RMBq6Tlr1jhLgsaUqWOTwSgiIbZCwLL9WwzG3dkt2uWEVgj00f0+p16GxiyfL
	KA5UaZcuxvN+V8IeRsWRfrT50gRIAts0V5pGUxTMEFptscgaGM9GmQ7Pangaqzr3
	+CpJK0u9D34PWuuSAvk37/k1F1MOS+K4gxI/5jqm1aQAM+XBwW+C5WEEH++MYlXO
	bp9lAw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvdd9u8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 11:11:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f26dd2165so720110485a.3
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 04:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793013069; x=1793617869; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Koy6XZWUO9sFV/HU2DhmXsiI2S7zyst4K9ZFcBiDlAM=;
        b=HMTzJzsAdvbPlGw842DsCRCc8ms0aPMVXuHBpNFDBoSB3oBzDkyOApr9k2EGvIypMi
         KKyBsbB/RWkvXuF602tz9Qvz0spPAEPAFY4cPh/xIaCbvC/AbrJXhg8S2xbxmR/Yf9vv
         DpZoiJgSlVlPc3IB7O56ksGMyp4Po1UxfjmNZz2A3EPNcMbN+p4Qv3hQKDFTkgZIBvzp
         Pe6Yvi6/2iNVXzzKyEdO6jF3uafdrlpZq7asrhqeMxvxv8o+IMSS8Oj2M5fNpbBRAm3P
         kAxFpi9SEhNsHV8F3GF1IVi8byVHPADdS+KQC3mldkFbCpHmNbAeZVQDNDGV1Dbn88Ui
         017A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013069; x=1793617869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Koy6XZWUO9sFV/HU2DhmXsiI2S7zyst4K9ZFcBiDlAM=;
        b=cL3/e3SfoVLsYlswxdiCOs18VBdwj1EH+x1Xr+lOyvKPYKoDKAGSthcQkbvE01ySDS
         SS+KXGqoaOtk+wu3nEN+JfKQ+pQS3K5hExRjc7QbF8qHtpAXnTqZ/A4uH7jX+waK3sx6
         ij8+BsGtugS48w9wjy/xUw+tSN5VjRj0A3tYB57brPTIE0uUtSIx89gB788OlWcNfeWy
         L0vH2EqVSqxelk1Y1CnR6lml487y6z1ZBgPExEEEK7tJgZCDdyWtSdq5KJUNdHEya9vo
         bTkhOTwjCuRBE9ZC3EzMJcS9u0wppMfps6fdiHThTq0xivvhfB7VRulYG+CJu06iWH+0
         WoVw==
X-Forwarded-Encrypted: i=1; AKwUvBxdWZ/iKOR9BWwNebGuGGMQhSkVKM2E4jTlIxGhizcHcMBSg4HNLOkWj0R0BffCyRyZ3hmg1vvG1pk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/3dpTJ9YLo72Bu2E48hJifU9hXJmoyZkKHiBwY1/FNEbj0q0M
	a5sgiDfTYFlXV8++5nLul0vktSVmT+PVB3NfXA2w/0R9aQaU9f1xi3by888V68ua1VTjkBD/of1
	fMd7o885GqArvJz8PeRoY+PToHMVGhiNOd0uj+cdm3ZBsMS5e8l8tjxeYmdLBMIc=
X-Gm-Gg: AYBFou0fISoG3ioTqaGjeol/jYyg7qVvqIAceGByEUSCYviOF7cTBx/2wKemr2QVPEs
	jCZ0qvu5k0PL86LzpS/DQxn9ocxTNPB4IEbbjJuTDDF4bNVvlW9wFJ8JwxHXLEfordkoGcbRFPw
	fE/kX+jZJlhNMemRfoFpFDQ9ZKtd7CHxBdUl9eP6w8x45PbcXvbCU2r/vDDatNL/Cg3MDfAuzUI
	DIxS0C4cRvzyGy9nkjEC6stE5RZaf6pKt8xySn5r18bAtj2PAmT5WGEcKt231i/qv6StKlXKp94
	Adkw5yvx5O0185YBgfijVlXaiaPFgQjbksFEa+ZVZfLnh0OOoPHF4gRLRzem3pn1bo9mTAlv6yI
	937c8cX/vLyuyDulGllJ7kQloF7WvGUTFyPTHxrhTb86fo+JAvQVjcHIuAy0TdQNuVRGZUcmC55
	N2RfZf8bfM4Vwa
X-Received: by 2002:a05:620a:7008:b0:93b:ef24:bc8c with SMTP id af79cd13be357-940ef90e385mr838038785a.47.1793013068439;
        Mon, 26 Oct 2026 04:11:08 -0700 (PDT)
X-Received: by 2002:a05:620a:7008:b0:93b:ef24:bc8c with SMTP id af79cd13be357-940ef90e385mr838024485a.47.1793013067738;
        Mon, 26 Oct 2026 04:11:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a950a3sm1455459e87.68.2026.10.26.04.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:11:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:10:08 +0200
Subject: [PATCH 19/35] drm/stm: lvds: set the panel orientation on the
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
Message-Id: <20261026-drm-panel-funcs-v1-19-5e3070a3478f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=916;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8r2fYcoIsJs1j9rHuz5/0flsbVyRvFq/7E3ho1dMY8g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq3zUP6rKa9ZJALcKGd4Q94uEkWWivrXKdGILwM
 WTV3LksCzeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCat81DwAKCRCLPIo+Aiko
 1a7MCACdQuwUBC4LQjD8kSXjk9q+SL6jBfO9Vw0RSOYzTPZYfzN/mWDaLnY8OQVsSW6sYtHwZZu
 MGpaXwzyywrGYtx8O99zSZT8bSdtjpx+Jy0BgqASzEUjuMZwjTFk7J+tnbe36F6VEamVYfuFsfz
 IETX5ctEX2PD7t+g/ZHw7odQvPfMQgNJlC63Fc3aar0Q0zVCm3YpAusg9HhRbgR/GKAJ9/xpMmb
 gj6q84GCt4nruRc/ZwLd/QKdjhMPMGgGzZu36wGtHoM5UlDYHz79ZUjJ4AOGqbcGHo2P9uoQPPD
 EjnamVi7cEBFGHqiWYL9ljkqM8WW1Hny6uT15fp/4S2A5cBe
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: BvdZ9WWKVycPIV1Zvynt96dlikTgFRPn
X-Proofpoint-GUID: BvdZ9WWKVycPIV1Zvynt96dlikTgFRPn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX/FeWK/Cp7PM2
 +jfLAif85euq9oQW6HR5JYC5hozpMyt/JBjOvaCaJXKzOiSKYtDCz0smfi80OTyP3oKUhMr6tu3
 bIElYA/1Ir5g4vz1FP3ouGeGTDhFOATzyFQBtk2dNtQ2hJvN6RDR9A9FPCkwqHw8SwVxT6jE+RC
 4EPLV9fGPaHpuqb43FjMhIw/0mTP2NHQtrPq0bq+NNAaUUuVqHmN4WvRZahYcSZCc3xBoa3c8H9
 ZnccdkyzKosvE4U29jmgMLIvKd1Clq6k4hvag/mFsdle761bEqoYf7TJrz86cB1YDFEoqCVZRrM
 QdnUh7nhdZaNaQeQUmbFgq/fJGjdQgd97Nq9ZxbD0GOY0+xVHqUWqgqA9FGTJbzBzrvlw466g1W
 EttHl3HMwwHEKU+yJx/cnyNmj9HzZeTwuoP0qQ+0K9CVAL/CcTFH3ekAZ7EyFl48Y96iZ+JG2Vm
 XaHEz+e5A8eI7OeYpdQ==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf354d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=xd2H4mkyy6EiTJgHJZMA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfXwznV7QSa1Ib6
 i5TLYzPWg+ogjK81I6FMtv/lZ4G5C3c2op/wbco3Vu9OKdniE9NBw11xKi36jhe71WkwnQ3jTm1
 ap645fS0WazRlHRgXd00DKgQftMw7JM=
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
 drivers/gpu/drm/stm/lvds.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/stm/lvds.c b/drivers/gpu/drm/stm/lvds.c
index e72a64f14f47..11d32a8ddc58 100644
--- a/drivers/gpu/drm/stm/lvds.c
+++ b/drivers/gpu/drm/stm/lvds.c
@@ -975,6 +975,10 @@ static int lvds_attach(struct drm_bridge *bridge, struct drm_encoder *encoder,
 
 	drm_connector_helper_add(connector, &lvds_conn_helper_funcs);
 
+	ret = drm_connector_set_orientation_from_panel(connector, lvds->panel);
+	if (ret < 0)
+		return ret;
+
 	ret = drm_connector_attach_encoder(connector, encoder);
 
 	return ret;

-- 
2.47.3

