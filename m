Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793049121;
	b=OaMml7isjzXSi/bq98G57mRvjJ5cRrCzT+MyKCK3zPg+GE9PG4krP/4heS3uAAkahilO
	 d+MRIhhGk60FrLUUb+kzUBLlA2UKnC9Rk0S6SJxOQjNpcgFKHjV3rb4CcIIQqHXG72nLm
	 fOLTsIgHwhxG8kRXk/Myy2urdU5Do2wxLKucHHrCByyENlPVHfyhbMJiDGkzcpZ9WKanc
	 gt65iTJdSk6wCGg/A5ECqETSOkMMuLuf7N6M+eQYh4xLDSJ2/HZxDH9fTtWdZU8R7jw0R
	 NJCH7vtD9k2n6MOAboC6DH7uLkWtx75MChwkuFSuY0wx124lN6qodxGtiTE5GQLN68Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793049121;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=/ESG1GK92x5B58pgVYf4SxkXNGgkEl2iePaEHR3ImRM=;
	b=bsQuzoiVk3YndeInelx1/6mHCZl7H6MMBhuB2RvzBPjTxM44/LLvJOQQjvHpby2/fh/6
	 NYALA+1y2WGe3WlC3rcCrT/CFyiIieUYfkmwAoBpXGu8kHzoww/AM+rMX1eusTqv3dkJ7
	 +5a3CiHX4Ubs0cFRaXtQ9lZ/YPLyqxqhRm870yv5Pban4L/GQj5soq2wJjjBohrLgbGIx
	 9dVvJYiQJFkpKkt3MpTCHwFYlB7NoKpEqoQ/cy/ayoJc6HRuwjJcz74d8vlT5qH5pY8nL
	 fWg81m58aI2d5CSmtpWxZDs1V+S14BpTordFx1ARdKS5nqlag5KZ1xl7InKpEfQ9KeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="N7msw/Lj";
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7233E606A31A
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 21:12:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7233E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=N7msw/Lj
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3ada8bc2380so1401370a91.3
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 14:12:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793049121; x=1793653921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/ESG1GK92x5B58pgVYf4SxkXNGgkEl2iePaEHR3ImRM=;
        b=rHp5NHmR+F7jMEvdzPw2cpDx3ZCMOD/oh0SYur88wpHX0klzYG06wzEvQS/TtSeVoG
         dYRUDz6uZq5MxACtjqZyoYf7ce8oDOwMQzEVcvBOiSJY2dzSYjKX5Z/l3rCZGqHltpWx
         IAWRAVPu41MsQKY4XtcldX8CS71QRgnVIB/rlmX8GfxP4cuKrrPx96M7epX1T/f8hVXA
         30FChkyKRLU9mpWObVZvVDWyTWcptRH40LB1mx252bpVVoegnBA348ipcUX223jVKkxQ
         H177JHUuf+qPkEG6jGHCgRB7hbU/HI7NquC6N5zCPn2Txktsfxs8VM753CMBE61y+WBf
         mHkA==
X-Forwarded-Encrypted: i=1; AKwUvBynKKWaAc2F9WwvvrShWM1aN+1hciiFWotBnL7hv5h66bvoztnioM2rktjLS7aVA4IActJDQj1WBWU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKt9cOaLtKNPoYdIZv5cG65DpW621idmjrlNWNiqUNRsdp4i+yW
	mTsIw7kaGnhIDCGZnwcEnOk/pjiYSUgT09qtW+7r15gEVPVJdFsH16JkKB97rN+YNolNqvuvjog
	40gSIYiR6/EraYQDCBMSEU/P9ysEprrExrUbgD6+43CAItvREO/ZarOWV4cgQbPHofVGSDZnCv7
	RQt5FOR5wbYjfItUiWpDiyzCtynDEUgZ8ZloFcfXDbs6kQI89GdrBTi6y9CECpfXzBbHybwVr0H
	0WN0SNdJxt2ZufPReJrpP4=
X-Gm-Gg: AYBFou2kw5M7uN7XqmiRedPNfZxCVHtZuqR9VacpJ4NdlA5HCERAH+G8pXWBPtlvE1D
	I5kBK48H9wLEu85FFl0TelIxU+K/WCCkCU1pbiJBk2oUKeW4y1R7y5KnbCROG695ajttJSTsgvr
	e4XMXQHgZt+CF003Gf/1l4Irx5c7ru9eqTkBREdah7jfixENjFNSEPwyd2YogCCcIvEQ4CAVwBU
	2Xc8kxaZiHmuLNjZlc6T1jMoU8X2skjTZoEpAICC2dB2LdI2qOh26B83MFVe2B57Wk7jF17pzy6
	jNKTPtjMm43I0pOP+C0Fdw/R9O/588TgVaqaCBoI63/y/i8bmnhKSawX7QS2l4bel6IE4TX4qLk
	N6g790anRRVEbL50ppeFa0RmdwTyMyrQVxZaJMSzXL/G0A8uR7dGyRAwMFeBz12fNkzNeBGt4TW
	y/aTyKTcVHJdq7qIGAN6Z1AyCnFM6cGiOGD4vIk+LO
X-Received: by 2002:a17:90a:9a88:b0:3ae:3c0b:159b with SMTP id 98e67ed59e1d1-3ae3c0b1f18mr979149a91.24.1793049120685;
        Mon, 26 Oct 2026 14:12:00 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae40619b11sm594308a91.5.2026.10.26.14.12.00
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 14:12:00 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-18b5ee75447so3762665c88.1
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 14:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793049119; x=1793653919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/ESG1GK92x5B58pgVYf4SxkXNGgkEl2iePaEHR3ImRM=;
        b=N7msw/LjUAO06jTT33HAeE2jfXss/tWdcRa9CMPvn2AKZ84mrvNCO+U7NZQpgULCVG
         ktJvfFKjLUPxWZyP7zlpGrpw15mIHiNENiWyKewSda7W+LPLvHHM0zs50wssyTonX1Jn
         HhxxF+MXnk2PkUrCusJPEKXuOzENWxd0e7gWw=
X-Forwarded-Encrypted: i=1; AKwUvBzq3HDSOMq8QU0WLf+DRP7GLjjld6I7ycW+ZucpDM6zGsLLOc2orSwRN78Gkl5oOnRDDpXIOUYa3S8=@vger.kernel.org
X-Received: by 2002:a05:701b:42cd:10b0:165:4b88:abc2 with SMTP id a92af1059eb24-19936e394f2mr11809674c88.26.1793049118828;
        Mon, 26 Oct 2026 14:11:58 -0700 (PDT)
X-Received: by 2002:a05:701b:42cd:10b0:165:4b88:abc2 with SMTP id a92af1059eb24-19936e394f2mr11809638c88.26.1793049118184;
        Mon, 26 Oct 2026 14:11:58 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0f81ea9sm31915678c88.11.2026.10.26.14.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:11:57 -0700 (PDT)
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
Subject: [PATCH 0/3] Support for BCM5301X AXI trace PMUs
Date: Mon, 26 Oct 2026 14:11:48 -0700
Message-ID: <20261026211151.3212237-1-florian.fainelli@broadcom.com>
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
 drivers/perf/bcm5301x_axi_pmu.c               | 450 ++++++++++++++++++
 8 files changed, 617 insertions(+)
 create mode 100644 Documentation/admin-guide/perf/bcm5301x-axi-pmu.rst
 create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm5301x-axi-pmu.yaml
 create mode 100644 drivers/perf/bcm5301x_axi_pmu.c

-- 
2.53.0

