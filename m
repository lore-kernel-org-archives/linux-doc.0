Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793123492;
	b=pfwtkamc6pVvFfP7h2lYdI58ubF3rc7SJSjzyOYVf7dhV+AvB1nMD56iwI672Twd+QLi
	 WoPVnAHQzArXKwCcs5VOVzG2TnnOfHnk635Yvgh8ONYJFFi5FQ7iNxZ2pxSVpzcf81onT
	 GY2Ies/oe9REqcnRL4VdtNQRQzW3D+JIVVQTl/xGKuVqaH63yfYBFj+5qhJWbxLyvfvZZ
	 Xl1hRzoP+VFy/W1Wex0LwTdra7WbfIW+Cz4+Xk8tlVcxYgQeb3NqdRbhfFFyGsUYeIeC5
	 zvpzTMu+W6sv/RyPAWES1Vl80gdbHltgFQz4MzLRYoDpu7b8wsUvJeAZLGdzce5bDSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793123492;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=ynPryf8FPydp/yEEGiFFJxiHciJ+nwSgBGs4pEky5R0=;
	b=KZ1xQW5Vfs4OW4DWmRtOSHZtgdaQRyLjQbsc0dx0D7cr0Jd7SvbV+GHxq1zxbaETJxpH
	 s6/SxBZcegC2xvrC9nU7G9Fg6iqB8Fy70aiL9SRrxvhwJxpDxXCx2sDB3MiLJPWlm0EtL
	 ciX6w7xwqE8wLhFF7rraObL/a7YvCTgQBSVUdcHfLV568XNASaCZXcodasZlnSUfs5xqZ
	 Y4fXoKKeaVfJtT44VmgEYm2p+ZGXtytC7QFVP75ADv4MoFAFADXI73VDvLtdz7+7m7LQG
	 B9HK+8crwAU9gCwyU62pCWo6gy/2ZyAEvg6KpnH31D6q2s3DMMhWthjqvXB0DwgVaRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KnNsRIn5;
	arc=none smtp.remote-ip=209.85.214.228
Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A73E606A31D
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 17:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A73E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KnNsRIn5
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-2ea138a3497so261035ad.2
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 10:51:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793123491; x=1793728291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ynPryf8FPydp/yEEGiFFJxiHciJ+nwSgBGs4pEky5R0=;
        b=RmMr3sBR63j54QR0N2fWvDWnvIXo32vPAY/92BLyJThEvnXE77HsdWa80apDoWXVUQ
         LeBfHleAvDryltP2lFu4VTELjxhdMzpDzbuA9m1pcv34LF2Fk4dHUBPZ84gzALceP2eF
         f0SofUdR5SXa87WIxVJD6dkacwCNFt4f0ZQ1nRiWeqRsIlJ2plfOUTy/4dxfgIGi+ERt
         i/3Q/7v6O624JUzc8Pi/kUWry56rvFGhLaUyKCkjMR5VYZEADm7Ii/WUh8pFPw6qCHEB
         SNVHiWOqE7YwOpItXhVnoDfkddJfjh1CcyYQmcUxTXclPUr8p5uP3kiRYdUbYbjOPzat
         zxgQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHw2lgPil0x8mETunWPuwrggkGCaax+x8svX2a1SVtwBhKjiSIp+0WR43fHeZNX9nV2y20erWnoDw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+f1YkP9bbkD8NsvWPDH21+IszEn/1hvnoUw2wzCoqiYIfg1Mo
	H0xjAHUIGhwwiI1KmLGrfStDIcGqX7v6ioOT70vnwoHWUZpQ7gKE/d36Smk5dnPLeNnYClF0lWb
	N8ONIJuD+1QunNEq8XAuYH+MttAJLclz40iX69jxvLmqdWvxwUu99TjtAnvv6wNLyj+smNNa8Rj
	8c2amWbXUc5cyfSBoeraJnRXyzbKQMpBB1gdbRc+mkA0EzKSELJRFBf+CScMJUvv0Dwo9IXpd/F
	JaufhvTd3uWiO1sLxIWLE8=
X-Gm-Gg: AYBFou0If1mG2d5sE+BiWFXyZydrer4fyeFo1pA1vn7lzdbrH0WOEoR7MQ3m1kQzbeC
	TeHIgUNrSnVh6HRhgqyjuFlEc6V9IAZoEVX954u/9KaUriU/IkKC1vGEdvE8BZjrdD5Qfq7VO1g
	20JC+1q3PmOKpehZdpKuxK2cze1UBczpw4QifQjGZkRgF0GZdhQiHW1UMRVbILuzGTk23p4dsRK
	cssRvsdNOCWEaNrhwTDu9qFBaczTZOVfxIRPaaA9ROYnt/bkisyb8uOKu9eVXG5VgcO01xXm3ub
	kJ1TbRPRNBDdqdbPmOEKsJ82LpbRUYfTxTJunVfbokGjF6oVKuj0tlWRonfUss/7UvZ7+cbEb19
	x8Sxks4nUsi9W1nKDa2Xyh/XeWcD/kZOoET0KCvLtWuDmHwHREEzOc7GyKJ2x3SVYnSSpzapysC
	T5FOjPvxNG3O3TO1YUI2JTaVmNll1dj6R1fCR55WVu/Qk=
X-Received: by 2002:a17:90b:2cce:b0:3aa:548f:eb77 with SMTP id 98e67ed59e1d1-3adeaf95bd5mr9044107a91.56.1793123491384;
        Tue, 27 Oct 2026 10:51:31 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae405f198bsm2728769a91.3.2026.10.27.10.51.30
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 10:51:31 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5338ff2cf14so4120841cf.1
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 10:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793123490; x=1793728290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ynPryf8FPydp/yEEGiFFJxiHciJ+nwSgBGs4pEky5R0=;
        b=KnNsRIn5rPXbYlRZ3D8CkIIIZ3cjZ2XNagJss9nCusmcYzYdSEeFZr4iGUEKO1j6Qa
         VYT0q6RqN4/Qi9WDHp8awscMrllkxaVsdLomH+XO7J7FpvuOB+m+Bit093azr9MDVum0
         q0643wT0D3JWUDFN60poZNns3i8L0mQmhUMiQ=
X-Forwarded-Encrypted: i=1; AKwUvByo9BjdMaRWpcXhwMh7rQ/lRRITi7iZLtnfhH/wCZeI2mdL7oNOubHicu+peuJkK/sjDdk1RiP/irY=@vger.kernel.org
X-Received: by 2002:a05:622a:5b09:b0:536:539a:af8d with SMTP id d75a77b69052e-53fc5cbfb48mr1179831cf.0.1793123490163;
        Tue, 27 Oct 2026 10:51:30 -0700 (PDT)
X-Received: by 2002:a05:622a:5b09:b0:536:539a:af8d with SMTP id d75a77b69052e-53fc5cbfb48mr1179381cf.0.1793123489573;
        Tue, 27 Oct 2026 10:51:29 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5383970ab61sm83164511cf.17.2026.10.27.10.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 10:51:28 -0700 (PDT)
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
Subject: [PATCH v2 0/3] Support for BCM5301X AXI trace PMUs
Date: Tue, 27 Oct 2026 10:51:21 -0700
Message-ID: <20261027175124.3518239-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
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

This patch series adds support for the BCM5301x PMUs which are AXI trace
engines present in the chip.

Changes in v2:

- addressed Sashiko's review by adding the appropriate title length and
  group validation

Florian Fainelli (3):
  dt-bindings: perf: Describe the Broadcom BCM5301X AXI PMU
  perf: Add Broadcom BCM5301X AXI Trace Module counters
  ARM: dts: BCM5301X: Enable AXI PMUs

 .../admin-guide/perf/bcm5301x-axi-pmu.rst     |  92 ++++
 Documentation/admin-guide/perf/index.rst      |   1 +
 .../bindings/perf/brcm,bcm5301x-axi-pmu.yaml  |  43 ++
 MAINTAINERS                                   |   3 +
 arch/arm/boot/dts/broadcom/bcm5301x.dtsi      |  15 +
 drivers/perf/Kconfig                          |  12 +
 drivers/perf/Makefile                         |   1 +
 drivers/perf/bcm5301x_axi_pmu.c               | 452 ++++++++++++++++++
 8 files changed, 619 insertions(+)
 create mode 100644 Documentation/admin-guide/perf/bcm5301x-axi-pmu.rst
 create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm5301x-axi-pmu.yaml
 create mode 100644 drivers/perf/bcm5301x_axi_pmu.c

-- 
2.53.0

