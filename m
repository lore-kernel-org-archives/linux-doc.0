Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793049129;
	b=zyImhG+a2ndnvD8bZdkVNexP2Bx2dAVmXIFQv1AXLqvrxSACWNpvX4KDHlsgKw9T9W3b
	 sce2kIzSQw4xUpISo829A4pttdC6aOAIUA7FUXnqt3RccI7f6/ErjGhyz0gvcqS3ASmLg
	 70PlUtm9HENVBFRhmJDjD1oUprgmPtAbDY1CRr8aJJHAzOhMBY8Yji/aPaIWMigU4eB4d
	 8Hx6+f/5onZVSW/EjK+8iTRNjfiBrZ2gYNwon80vV1+ef+iWHWvCuwmNgM4LEXUxOQ6Qe
	 rUp12qCHRINFWg5KxNs1KBDGeC9DkCZ30Z88VCWZWELz9rNXsy5+RUSLfYSM2XUlihA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793049129;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=QkAGfe/UDsHGvMGKL2L3uZbprb9NTy21LdH6RR7axyA=;
	b=2F6O/mHZW7Y1zoN3refmgBMqWlSeyZfWU7j1IplqGaGQO/jD+vUPUOE7wf/vAgs1a54D
	 PC3jD6rtZyw7tH9ckFfGqKwJzdPbM1n1dMe5j4Sw3afausF/wdSdqw4NHBRiOaVToUBro
	 9nD27fC13je5p4VVxV09rnTiVwRFgDpjxICqcMNgQBCayVAuwSgwRistSzP5CF/qBzTS5
	 H43fpBYbjErxfRlTbHe3+RXg7T+K2ovK+Fz/cSWJ8Ydc9WKf7NoXs2zFxzypwD2SB+W5T
	 rNMWmtI0i1gmp+8V2hwWaXR6NIMNsw9pgkJD3rOypv+Mdl8rfeebVoOpwkt0UOYTsyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=PfhwGTgB;
	arc=none smtp.remote-ip=74.125.224.98
Received: from mail-yx1-f98.google.com (mail-yx1-f98.google.com [74.125.224.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC94F60A260A
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 21:12:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC94F60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=PfhwGTgB
Received: by mail-yx1-f98.google.com with SMTP id 956f58d0204a3-67990a45e02so3399274d50.3
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 14:12:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793049128; x=1793653928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QkAGfe/UDsHGvMGKL2L3uZbprb9NTy21LdH6RR7axyA=;
        b=16wuKwGvTaa8KaWNLON7ohzugohMz0TMvKqORMiFgx0Ei4CzLG/eshTvyGItxkAmje
         Co8NuEoS0UXXFoMCqEaYkiqJgr/WOmxDqVZXHKiNI2K3TRT7HuzqNq7PpEAm12qsCCGk
         bMWNDzFV5HZIqDg/zOpz1im5w2tO93NJKhAR+wehcIwhtOFJHGCLj3dguTKwJ13q+ZtG
         yyKP8M+24TQl9Em9yT7gs/FlcXCL6aJ/UMIZ51uHaCKrqLamGuxMoG1rPIbSRQOuSXec
         scyq3WSKWvoG96k88ZEh2FDe1C3Np24O+7HQ4+kKBnMthpA20rGtrrG67MZb2vrjOaTk
         hEgw==
X-Forwarded-Encrypted: i=1; AKwUvBw2yoCJnyRjmBPmjMH5PFiUe83Ft9jgUjbjZGGZ0mr/l5LnSS/UvAFBYD4i72ooRsvs3q+jhRWteEw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKQoB1+pHMoOVpI0Zs4x/p4x8DcrIm0l9rGzOee0cuetUmW0oB
	n62abtPm6l/hFWSLCNGHpkSncda2Bj/Zg2BWIKI3KGzqKCW7GlliqHN47v46dSgjEUYp05G5Fbo
	z1DG3MwTgNSmdsXMSeETqvhDhxAKBQIhOwA8ktPcHVkRbdrOi+X2gD4C3nIzC5RA8TP6KaKvdOY
	OCQlyhtg48s3vvGpnZiYqi8xs7LmiJBuL0MryFaT6XKDl2GHLzfH2BnyeiTeVmcwulzSeBqixBe
	8RYyTkEOxXNA6LcrtAd6jA=
X-Gm-Gg: AYBFou3opdoAfpBDW9E+jZRCsJKYuBN4ugeqpxsB4OUvTBg8G0fyblU3eBqjMY70oK5
	soH0mMhjcS8iqFY00L6YCTvWkyfEyw+AdNg/yFXU4z5MDg32FBNoAbYlUgEQQb5XZVBfWceto2T
	IFiwLfDtLroQnCjcPFWNcUjsbq5+Ne8m/2jqpl/Oh3ocAFkpVlLOmpTJbkrKeJMg1ASkx+5rJqo
	fp4g6QJshh5qd4zaeFGnkvgofeW0sd8+Q9DKuAAX5oVrmTGkvC6Un4i2UTGqQIWyP2cIDFpeQoe
	l2e5t9LY8GtSrkunUB7SVMA2okrfhSdVIq2j65umufGpm6XA57fffGZe8/5lZFG+D3Ap6Zah5Fr
	XCiKu+wOTw4+MQd0GrRpwIcNkQfHzqA/i84IJEttc5E/7gdgcLkgXpLQv6hPuxcanUzEGiNdMnb
	+/KrZNJ7NVRJfZcNCVFe/+/i7zPNv4QxH3HHNjcy5X
X-Received: by 2002:a05:690e:1c07:b0:679:abf5:148b with SMTP id 956f58d0204a3-67a453d5defmr7399570d50.52.1793049127773;
        Mon, 26 Oct 2026 14:12:07 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-67a4606a28asm116289d50.11.2026.10.26.14.12.06
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 14:12:07 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so9403072eec.1
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 14:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793049126; x=1793653926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QkAGfe/UDsHGvMGKL2L3uZbprb9NTy21LdH6RR7axyA=;
        b=PfhwGTgBUJ5zVQWhxz7I/MWHGTjwtEFi9lj8OhLboPwwYtWFCEHd6vrlAKSuoPTfNQ
         PVmETTYCdSTnH2Kn5A2I15wJ80v5D5POqMQVujnoUbNWV+cplC0XsBh9VxycTzpjOeTd
         7YXlmUeWiyFXpMMax+eVFNra0ZwM13Sq8eX9w=
X-Forwarded-Encrypted: i=1; AKwUvByckvbm4LNGe2E/HLjJCPfJo30p/gJuNMohh5t2bFSNsT+EJRvu9yMODSRZXZk2kv2ZJ41zqzXzgxs=@vger.kernel.org
X-Received: by 2002:a05:7022:eb50:10b0:191:a5b2:ef4a with SMTP id a92af1059eb24-1993677ac8fmr11277898c88.28.1793049125714;
        Mon, 26 Oct 2026 14:12:05 -0700 (PDT)
X-Received: by 2002:a05:7022:eb50:10b0:191:a5b2:ef4a with SMTP id a92af1059eb24-1993677ac8fmr11277868c88.28.1793049125085;
        Mon, 26 Oct 2026 14:12:05 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0f81ea9sm31915678c88.11.2026.10.26.14.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:12:04 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-perf-users@vger.kernel.org (open list:ARM PMU PROFILING AND DEBUGGING),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Subject: [PATCH 3/3] ARM: dts: BCM5301X: Enable AXI PMUs
Date: Mon, 26 Oct 2026 14:11:51 -0700
Message-ID: <20261026211151.3212237-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026211151.3212237-1-florian.fainelli@broadcom.com>
References: <20261026211151.3212237-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Describe the three BCM5301X AXI Trace Modules and enable them on the
BCM5301X base DTS file.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm/boot/dts/broadcom/bcm5301x.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm5301x.dtsi b/arch/arm/boot/dts/broadcom/bcm5301x.dtsi
index f06a178a9240..dcae7cba37c4 100644
--- a/arch/arm/boot/dts/broadcom/bcm5301x.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm5301x.dtsi
@@ -10,6 +10,21 @@
 
 / {
 	mpcore-bus@19000000 {
+		axi_pmu_m0: pmu@3000 {
+			compatible = "brcm,bcm5301x-axi-pmu";
+			reg = <0x3000 0x1000>;
+		};
+
+		axi_pmu_m1: pmu@4000 {
+			compatible = "brcm,bcm5301x-axi-pmu";
+			reg = <0x4000 0x1000>;
+		};
+
+		axi_pmu_acp: pmu@7000 {
+			compatible = "brcm,bcm5301x-axi-pmu";
+			reg = <0x7000 0x1000>;
+		};
+
 		a9pll: arm_clk@0 {
 			#clock-cells = <0>;
 			compatible = "brcm,nsp-armpll";
-- 
2.53.0

