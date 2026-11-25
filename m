Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795581447;
	b=2g3Ovj92xge7WNn6ytUnuz0DGm6M5lrAn41cpqzm1s9FwOnVEty3+POvYay5dNpEytV7
	 zgDpW/w82sBjw37HCF4+vUbcEB9sR5IeFlJ0vSUa0j9xIAqnFDVLOtffwLo8fGyfZX7Co
	 qZtxcYdtADDPjVQlKOShmgGzhcNMpE0DYav/kmr74Gwad4C84ZjCLgas5+WVtm23qKtjG
	 gzpnW24K1ONRB1SCDxKVOjzeSLTRXXFWHAbsKxj6GcBeGpv9jfwd7C4pw4SQOCzsRiZuJ
	 V+k0W7gB6Nxpslo4HzEKHV0jAUWQ+L92HI4fKkBiYwEw/EzLuk93R7IjE4dAp7AAl2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795581447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=37Yw/Yh5Rz5Fzq741ubEI/Rr+lL1nn4+JbSz5DFAcwM=;
	b=kIZeYQ0Pk0zq6PRTO6QbT3aXngqw4w+ux+VjVwu9ritwvIpDav6SsqjM+ZwFPmkuZl4u
	 IcsakduihQvK9AaJef9arws9NQILpAhHAnJng4oYSgZcFHcnigFYKxg62rngwPWd4ra8A
	 9TQAoWNx6oAz92pIR0rr7REaupugk1vq5Pn8sOqLUu7UrJIZpFb9IwnOyz8uqFdcvmStB
	 7d3DlakDfhxhCeHrbSDybBvKdFOa9U0xEcH8VU4SvGmgFssnW3SRmywDiX/Ed3HwB+Am8
	 rDCR2JU0/KpNM0e+KCPgbEsQMqwFbgNZH8uWarwjEgNvY+3wqhV/SLCrlGqMFzLFnIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dr15ZfdJ;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C475D606A331
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 04:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C475D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dr15ZfdJ
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so2377747a12.2
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 20:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795581446; x=1796186246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=37Yw/Yh5Rz5Fzq741ubEI/Rr+lL1nn4+JbSz5DFAcwM=;
        b=dr15ZfdJEWlFKiosbX0D7l9+7/idGVhRa4u95t0s+U28EotPIPmyI2a+lnKcCTISn3
         S83ipJQLhVZoPma58S0CxFaXppQbCjP0Df0vV2D9+SStuKA+umIhNW7QQSUz9lHe2Ljb
         jC8mQgsMmwAU2d2AxJRP/InN8vIA/0f6/ymJPD+J2WOGQbtKCNFmm5AeybuSWmkAqwtJ
         jIdyrqVbnPcE7hN5G8f+I5n0ge8+/Vx/orLpolDiqFu8ZMF8EES03C5sS6pL+Mi4eIYv
         3LE3GQ2ZuqbVwZ1kE2IaFXX67bbSv/y592kweeth4OlvGf2uRDCZKlXbvbJ/nm771M+P
         1F2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795581446; x=1796186246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=37Yw/Yh5Rz5Fzq741ubEI/Rr+lL1nn4+JbSz5DFAcwM=;
        b=rjJyARdGC2ANEGMByiyOFJ5gyUipBB5wDMU36fDylNCv3yOPkpEZbJlc+fIzJjstrR
         QsVhLuxCUvFSgIaNf9KNKFcv+5W7PBOatL9qrYrjyC1ZjKpbAJbNAySlD1zxVsABiSNo
         y+oqJV1i+79YxxenSI2Ca1TMTMU1XKUqYhe5Emt2nDfn3R71rkUHfM8A5kZ+YoE4oUXZ
         bjANxpCYQWiwhfW/zUi/hpPSmMAtXeajon2854Q4wR4fGiBpdnv67z+lM6OPlgGzl9K0
         ZosBw13ig6mf0AcwQnSo9KnCUZSvFZK0QcrApv/Kwq44pTcAc19seYiDbvnSX2SiHCov
         EMcQ==
X-Gm-Message-State: APuU4Z8Tg4U4c3ghWrb2ccyT0rwNqFaoxoGqjIHLWPa+54JM9TRv856w
	flkwd2sYT487Ybd+YwmjDoxdPH3rTIORKwFMGfqc25nZdM7/JLs/zWPn
X-Gm-Gg: AZFdTZfMhP2giBvrSvFGRdhyohWoqxnDRGmf3Jqm6qVGENMBzu2JNutxIV8a/MmJnSs
	YPUpMyVANxeR+ptoxGhip2mifGOJpAr9hZHx1Rw6bMGvF9iKyOSpe4zHotku2mUMsyBHA8hRMPC
	1zt1uDpVFVb9j6I6GbtW0eBph5gdZN08MlWMNb8Pe/9jH147VWlqZiHLFE4P4JgAI8gsp5KZ4Oy
	JlECTK04V3nnEB61A2YxO9HkkOPeGaQ6S+ZluAxCa69BtUUTV/CAN46dagmcTnde3LBttm69n1i
	ef+M1QpBnHrqrBLQmzd1k6FPaUh4KA4WgFu01hVkM79b7rjOeciHg9lJz5aSs6lMGoP3Ln/f6cd
	z1nCMQ1z5QEl25wLRfvM3Lv82NEPiZher3QhIjDWRCSDZHtz2k160ffgxd2H8us+eG3X01FG4J7
	TQSo9yAjyN+VxMUvs+9mpdLY98L3rDYdjXmTEbFfVVEbR1qieLwOyfB4yzmfJpVwQdux5hoEfXQ
	FIRDXVzJQXfMMMFr37p/5z+IZBtBypJ1aqd0PAVGFDzpAOhDEoQI2EwrMvC2rwLqg3RmwhT6w+R
	NAK125r4mX8VvBjZwPTscLBskE8=
X-Received: by 2002:a17:90b:4a48:b0:3b1:4018:bfdd with SMTP id 98e67ed59e1d1-3b41c7d5cc7mr13865555a91.7.1795581446160;
        Tue, 24 Nov 2026 20:37:26 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm30506154a91.8.2026.11.24.20.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:37:25 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Aksh Garg <a-garg7@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Rhys Tumelty <rhys@tumelty.co.uk>,
	Manikandan K Pillai <mpillai@cadence.com>,
	"vladimir.oltean@nxp.com" <vladimir.oltean@nxp.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Hans Zhang <18255117159@163.com>,
	Yao Zi <me@ziyao.cc>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v5 3/8] phy: core: Make phy_put() ignore NULL and error pointers
Date: Wed, 25 Nov 2026 12:36:34 +0800
Message-ID: <20261125043639.249525-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125043639.249525-1-inochiama@gmail.com>
References: <20261125043639.249525-1-inochiama@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add NULL and error pointer check to the phy_put(), so it can ignore
any bad and empty pointer, this will simplify the release handler
of the bulk data API.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/phy/phy-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index efbd7e139dce..5004d28b167a 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -780,6 +780,9 @@ EXPORT_SYMBOL_GPL(of_phy_put);
  */
 void phy_put(struct device *dev, struct phy *phy)
 {
+	if (IS_ERR_OR_NULL(phy))
+		return;
+
 	device_link_remove(dev, &phy->dev);
 	of_phy_put(phy);
 }
-- 
2.56.1

