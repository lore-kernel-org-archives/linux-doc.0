Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7430337F105
	for <linux-doc@vger.kernel.org>; Wed,  7 Jan 2026 16:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767803404; cv=none; b=SjJ178zD9HKmj0OksvVS2sG2w6tcCVx3+M/jilWee36Ua524oOHg2nE8FY+FULM7WUUsRgFsRVd3uOQqsm00Jf6F9dTVOu8Oqs8wmIBjNedtXPp9b0e6smIgdZdgQ2oy22rA1KOgeajP9dw3EzNvUdpLni0FpGZ2Bvgf2mcZdbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767803404; c=relaxed/simple;
	bh=9BATtieLEYCpEcZj+GM/kP3Ja9/0f7Z989r6IWgQnPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gcyH7gfJ3HTD/cBCqzEe+mf9Jq5LfVbAlsLGGzFZ8xzZS7UdeiC0LSv0iYlv52YaSqzuE7HQ8y0XSFKTUlFG0Q/ctiuJnIfYljDLGJubsguHyknfxvZocoIadXQ5P8Qgpxu3khKhQqWpoheHGzWaCW7g1KAxJ+DGG0WetQWAtd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech; spf=fail smtp.mailfrom=osyx.tech; dkim=pass (2048-bit key) header.d=osyx-tech.20230601.gappssmtp.com header.i=@osyx-tech.20230601.gappssmtp.com header.b=G0AV5DUC; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20230601.gappssmtp.com header.i=@osyx-tech.20230601.gappssmtp.com header.b="G0AV5DUC"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-430f9ffd4e8so475300f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 08:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20230601.gappssmtp.com; s=20230601; t=1767803386; x=1768408186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WihJclLNTP76N6hz6eqMpZoD5cMEZ14VPXp1pd6gG3I=;
        b=G0AV5DUCkIVoAqpgQWEX/9lUB5kktqCgXbewIHqswqeS6vW1szpPhKDO3upN7mluJJ
         YXpPKekVDudKt9P8u1LKtkd5th+etFVxOu1jKq12ZzSdCOZ33eCnErhUnHdfUs5A1CM1
         fvmu3UjQz06XXV6T5cWVO1TuJZunEg4p0Mv3KeMnNerMb2JyW95c17WLAD7ag9Fkflnu
         vS4zM6fVM2D78ht+VFybuqzm6p19BuplW9EiQuu/TYK5rbOa8se1vV3KMSZrtBQFHVbk
         q+AVdORefAHg6G1d2lFuWoy1X2BzsSE/SKyQxY3kv5aXtxqCPfrXhLJCaoD7WG5pfpuL
         57UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767803386; x=1768408186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WihJclLNTP76N6hz6eqMpZoD5cMEZ14VPXp1pd6gG3I=;
        b=gV4rXSLvJJIPGjcCAi4mvRh9+h3Tq1XfZk3lTASklv9lNnMoNwu6OrPt1wLrKlUPac
         1dolHm0isaEg2L7oHBIrf8GuS2SUq+lDzD70l0mL8NEGm3yHi4MXdwUamCICqE7tqol+
         LF1h4hZlIM/Ei6SmBu2t2bDOZCzy85A0LnBIT1DQQ6Tb7AgLUo0RvyfqzAEydJr2cFkj
         gbM5792Ymy5GI56KfkUnYkSnl2kMXlE1h5Eo8k7jfSxmGhSmz4C0GLtmSkGPHkkaffqc
         XwmF+79HMWxGRucPB2bR7+xZULr51yRo1zJB6SoDvgxAO80zV2KiICLcENseRx1cZrym
         ISYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXqEqomwukVozUBTD6HuQnKDjS3E995BfjxyNzUu8tBLfM3VMzsTMFALYY8tnFjd5qdDO5Z+Ur16s=@vger.kernel.org
X-Gm-Message-State: AOJu0YybPX7yr1woAV2ANr7sTncVz4VOp/i14BFRUmR2RhitQ2NdEW5C
	rN08jhLl51nfi3U5MQhc/X/vZ42EcRQmO2GLhOT0fUCRoTl3zS4/pm9gW6MoQuKp28dp
X-Gm-Gg: AY/fxX55hkGMfZ0ylT6OWhWgjm7NlZXnnMGVxFMvdd6lcYQAWjqK2ENfFzRv4J9MHyB
	3k12/FKIkEbDN29HGkgj26uH/2d51ZFoKDi/Dqb5e40vs1NIWf06stijLtOT7vtoD1AaAAsQaMJ
	nz22UGd/dVXhHcvj0baZCCGHmtvD0K+bho1Fxa2AfFxJv8PmHBWkDt+AfwMTsISNYB/rPKptiK7
	M03OlmR1Rm64eFGCtERmEPaYZvAZLoRpJnDvpBQ2bEJzO/3tFKnZjjUbT6dty0p2PNt5J2Gag4n
	7IlTUaxMZnJ53pjacGrrFJrJ86nv9LRnFFGx2KCeDGFjrcn5cnzxMCubGM4HbrE2bCkP8KJ1u1m
	Zusr9aeKCM9iVTjusanmDiuny60CiBVOFXD27gzRuR1WZ0F3pFDVsQpKdnv2Pc5nqekAIrz8Tix
	RI/egjAdq9RJ34nGVjNQ==
X-Google-Smtp-Source: AGHT+IFKD1+c7SUjD7a/gByTTs7FpF1prAJlqO9osr5dmkMQRiIqO+8yFt3RtGpmL0uKFm0/tPDRBQ==
X-Received: by 2002:a05:6000:a88:b0:432:c0b8:ee42 with SMTP id ffacd0b85a97d-432c0b8ef25mr5297882f8f.11.1767803385887;
        Wed, 07 Jan 2026 08:29:45 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:4a3c:13be:a1c0:7b9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff0b2sm11117030f8f.42.2026.01.07.08.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 08:29:45 -0800 (PST)
From: joaopeixoto@osyx.tech
To: linux-kernel@vger.kernel.org
Cc: ajd@linux.ibm.com,
	alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	bagasdotme@gmail.com,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	corbet@lwn.net,
	dan.j.williams@intel.com,
	davidmcerdeira@osyx.tech,
	devicetree@vger.kernel.org,
	dev@kael-k.io,
	gregkh@linuxfoundation.org,
	haren@linux.ibm.com,
	heiko@sntech.de,
	joaopeixoto@osyx.tech,
	jose@osyx.tech,
	kever.yang@rock-chips.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	maddy@linux.ibm.com,
	mani@kernel.org,
	nathan@kernel.org,
	neil.armstrong@linaro.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	robh@kernel.org,
	will@kernel.org
Subject: [PATCH 6/6] MAINTAINERS: Add entries for Bao hypervisor drivers, headers, and DT bindings
Date: Wed,  7 Jan 2026 16:28:29 +0000
Message-ID: <20260107162829.416885-7-joaopeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107162829.416885-1-joaopeixoto@osyx.tech>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: João Peixoto <joaopeixoto@osyx.tech>

Add MAINTAINERS entries for all the Bao hypervisor components.

Signed-off-by: João Peixoto <joaopeixoto@osyx.tech>
---
 MAINTAINERS | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index dc731d37c8fe..4286efb307b8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4321,6 +4321,19 @@ F:	drivers/video/backlight/
 F:	include/linux/backlight.h
 F:	include/linux/pwm_backlight.h
 
+BAO HYPERVISOR
+M:	José Martins <jose@osyx.tech>
+M:	David Cerdeira <davidmcerdeira@osyx.tech>
+M:	João Peixoto <joaopeixoto@osyx.tech>
+S:	Maintained
+F:	Documentation/devicetree/bindings/bao/
+F:	arch/arm/include/asm/bao.h
+F:	arch/arm64/include/asm/bao.h
+F:	arch/riscv/include/asm/bao.h
+F:	drivers/virt/bao
+F:	include/linux/bao.h
+F:	include/uapi/linux/bao.h
+
 BARCO P50 GPIO DRIVER
 M:	Santosh Kumar Yadav <santoshkumar.yadav@barco.com>
 M:	Peter Korsgaard <peter.korsgaard@barco.com>
-- 
2.43.0

