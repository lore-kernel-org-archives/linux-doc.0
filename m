Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793123502;
	b=HGG7Lclvi8W+Dp/Aphzpy7GO8Q2Nf+aSbcxRQn7qMivKNZGksNoz5WalMpWTp1lUg6zm
	 wLbGGWgOap4YeKTH2gzXWRPLIDClnmniJqvRo99cEtn5dDoIVYiNNL93/McqQllOmfSCf
	 m8oDEdrqLGiy/OcGhGcXVxUkSAJJpFygcbcLLLEFYjH6SnlTb1TTMIXsmCBYs2KB07h4z
	 WFoFLzGjxHffYqrvr0vWIQzPrDeFabX/zkwQFlFW9/Q8M0hFLNpLrym3oODH3ii2sG0OY
	 RDs9I2RKuXSZbDBemmXYk1XVvKuOhNkG/q9o9Ed647cjuzmH17KMWoZDvCOlKRZBMaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793123502;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=QkAGfe/UDsHGvMGKL2L3uZbprb9NTy21LdH6RR7axyA=;
	b=N8NVdGDKPpCFTGRcJlIFMe1p6Sb/tfSuG5ng9jArTVMcTdnphTEELk7/XoF6J7cxcWu/
	 IN7jGK7Mmbk8EXfpackg8196xjMFEY5xCgEZP4/4AB4mJD4jsHLBuuDFQTGu7p4eztOT9
	 K62VAd1GSpCsjTrJ0ZP+Q7ENCEAdlb93+rIxWkUVnxHERW+xhgnPAadXevmjZlR42rdNp
	 BTqiTw+zSBQsrjg9PN6E1UZ4izSMukLzu1aPXtyezex5JtB0XfJ2ix3XQvZZbPfns/vNU
	 XrUNjctmMyjetinJ79mkPkaSpnWMfzqAxw2rbqEExqv6kJK18309R6h0sFMUXxvQSNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="Qczylg/H";
	arc=none smtp.remote-ip=209.85.222.228
Received: from mail-qk1-f228.google.com (mail-qk1-f228.google.com [209.85.222.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5165606A329
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 17:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5165606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Qczylg/H
Received: by mail-qk1-f228.google.com with SMTP id af79cd13be357-93cbc3ab2fdso1096185a.3
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 10:51:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793123501; x=1793728301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QkAGfe/UDsHGvMGKL2L3uZbprb9NTy21LdH6RR7axyA=;
        b=T2ZjzWFPY3qaCJuYyPV2mwrnTewHEfjHUja77F/vLR6WRm7e4Mac74aP8P11Jsvrjf
         rn8S1qVOGq7fXhhmS2xaKklPYB2N3YXNe8eZ31PdxqSRYBguSuRHRD2DYin9HJiy06fM
         48TLEz6P9O9i4z1L1J3g1DgETYcZuN+iXrH4v+rl4kdi2kIy/jzhW1s/SwMn4SjFN2HJ
         NZCYxIiJsjKoKR71tplmhIKFadfzJk1IhzjSXZjpxePgx7hH0YPiUhVnTaRQj7RXZzH3
         94NxXrKfN6vsq2eDYyyl5V3GaqNgY4j+l13w0OHwWRWfUSHPv8697e55/BMFB2mfRWcG
         bEeg==
X-Forwarded-Encrypted: i=1; AKwUvBzC36sTDNTFTN1sXPT8h43UklqkNu6VHPM4yKpEiNfyMbJQdJkq8m6lc1cDOf3vWag9omMKvGRNlJU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK34aYvRflr9UtJujg0jd4Onsioi6bQY/9Rj2v1hjK3rWPCp6Gn
	tKdDlmoCysT/1o/JrQ1aZ3HOxd0zWkgMevnX7PyJuf3W/rS/6Wv156IoSa9IBGSS0WiTJqZlLsN
	IEtr2I5bx7uNGUryvyp7apX/sd9Nv7jhy4yaSOjXwpbLtbdSJWnNOpaN+D6tC3JTS/4/+48PERQ
	BMlaELMg2ubbBW94m50KWkapXTDMXaDohStY9ijaSbDDWGqiK7kQ8Sgi7UiEkyXhQ/jaLWZRPw3
	c4CSXhIupBAxUk9O9ciick=
X-Gm-Gg: AYBFou06CDQol4tj2ehflKTxjYI4uDBQdwLq4t/emYDMLLRkUaWoRKFz54sj4j/lkl0
	/ma8Kot2X2REbCS+eYsBjdwXZiuCcN2mvaDIGArDS0SM3o1zjLVQ7kc8tjfJF4YZekTduqg3A5V
	dTvqppbj4bjGUfNAcYNJh2aQt+YxJEAgWb1tuOEquUjEsp9RYxjkzFRyEPTzBxIp7aGPx3OuPit
	TK5Ywnan5Wd35R8vaobakCqbq+iJU0m4ZduqRau1q6q4JFhxzOZ16JpDAo8uQIZWSjQJMzv8pic
	SgwlrRInqFJdb+2t0vw88w4MtcNsoc5KDLIqLv16tuUY/5O7eeftFhjXR920Hu1nRwVCOfWStEf
	SctyY4ISC3jYZcNuJUpR/pxv/BiY8hlcZb5xp1UU1FiR0tqwn6H4Zf8RlWGaE9el6/8H3q+jVaQ
	IvHHwbIXpdQNN2RLXpH6urP6tw5WFoyUfYyWW8ITS8
X-Received: by 2002:a05:620a:4515:b0:93f:11ee:ba1a with SMTP id af79cd13be357-940ef960b17mr1584207985a.48.1793123500555;
        Tue, 27 Oct 2026 10:51:40 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-23.dlp.protect.broadcom.com. [144.49.247.23])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-940f35f0251sm148747485a.5.2026.10.27.10.51.40
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 10:51:40 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-533928ef33aso3052301cf.1
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 10:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793123500; x=1793728300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QkAGfe/UDsHGvMGKL2L3uZbprb9NTy21LdH6RR7axyA=;
        b=Qczylg/H+JxabyUKQO6+Wf2DSWugEEbAKDOWvySYrn6hpb5ft8XX4RJjP5IP7UFiOB
         dTXQrSXG7Wk6MX2PRDH2ffPJOdtECGQQyL0KqWBiZJxBr8hftLXax6E4dODUW3ZpMtwl
         lbd90VI+GbwwIaaS3WR1UzOc04ZGFLcrwcG/o=
X-Forwarded-Encrypted: i=1; AKwUvBzY9zX7E/kmon7sk/ZNLD+koB0UbKN32vubqg9kcBZFpPNt3e4YfJ94GVUQajgLi4A/Xy0boAScvS8=@vger.kernel.org
X-Received: by 2002:a05:622a:54c:b0:536:3eef:56f3 with SMTP id d75a77b69052e-53fcc6c1af8mr63421cf.58.1793123499677;
        Tue, 27 Oct 2026 10:51:39 -0700 (PDT)
X-Received: by 2002:a05:622a:54c:b0:536:3eef:56f3 with SMTP id d75a77b69052e-53fcc6c1af8mr62871cf.58.1793123498959;
        Tue, 27 Oct 2026 10:51:38 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5383970ab61sm83164511cf.17.2026.10.27.10.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 10:51:37 -0700 (PDT)
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
Subject: [PATCH v2 3/3] ARM: dts: BCM5301X: Enable AXI PMUs
Date: Tue, 27 Oct 2026 10:51:24 -0700
Message-ID: <20261027175124.3518239-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027175124.3518239-1-florian.fainelli@broadcom.com>
References: <20261027175124.3518239-1-florian.fainelli@broadcom.com>
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

