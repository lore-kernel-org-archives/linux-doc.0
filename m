Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795250397;
	b=vZpghGe8fV4XwOVOv4dQMk5l+IHM3Xae9Y7gvFbpeGm2xgvaPiTF16SBJTVbOvsCT2mg
	 4FFJSEaGJQIuXzOlTe+BZ9VQywtYaOA5iqEPubepu+TeExG8cndtHkMjbzoo3ZeFVXHe+
	 3L6AF8D91MWH6+LalJruSH+kVy0kmh8ZHQJFesGnuzW5xGJE4ZiMjdPris5LCezD8rdj9
	 I7ZpRAYfty1bqAsx7Eb21FS8fJCz0OOZldwCrSx0xRxoOQrSbHEdxqtdv1X4cgRaCagm7
	 tw2uRfe6unazx/QMXUKc6VHNlFs1W0khKiEAZc7UgEEMHy9NAp0T/D09lunnFKpEGiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795250397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wAQ4qsK1Mx7pxpG0s5BlrPk5n0YkbGCnSR/VcQSO+vE=;
	b=ev64D4aBPvVDLEyzg6Z31s1IhGM2e00J5pvmKjCygHlBL77xGKjXiowRVJ9JSCMbxEZb
	 A1MVfMj3LXXO5xIpK7kPnkpBdL2DbMT20m0fpdCJSSk6nXcU2Pp/FWFLhzk12V8PVjAFm
	 mDiNhjJ0zp+kaVA6wet1fyze+2Gd5YiveNOfNznuHJlAN5ktMGS7BIutUKyMDLJIk644O
	 LpoUOwhmOq8KcvhBR9CkJuIUMXNvXmrlP4quWgkmInPvEEA5egAqxWwr7NybrBxDteQgF
	 WrM3Atu2wlG4t2913xId7BmeYr129zHvA7VU1iQli2fzckSrVzC7wL535P00XuEGr3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ucFgREx5;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1925D606A330
	for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 08:39:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1925D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ucFgREx5
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-38431138772so2155143eec.1
        for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 00:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795250396; x=1795855196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wAQ4qsK1Mx7pxpG0s5BlrPk5n0YkbGCnSR/VcQSO+vE=;
        b=ucFgREx5eG5Gp4dDGaFliObd3ODZT6HLUD985oyy+nHy1jRhSIa512OvGXlC8uSosx
         P3n8oqvVBjU0MsBZCDToYZ1zVyNed+c10yD+qzxP2aEj/UazFTy7rq59OEIhFitvqY4W
         XKfdrooOeY87qjKzFiRlF40ajX9YdmY8p7K2Xia0nqm+prTOEkne4EYxpFHsM5b8zQrA
         dGcmoo/63WXNzcCgURNkddcycnwcYKq8OrHVQYK/AWeyKrNk0DpzPP9Pl4QK3jqs66Fg
         1FeB8epKyHV1rGTZSIIhkLcTUk3gaaaKD3GMeCvmYQB5trrxaBA0WLWUydKFYFKJ9oKt
         Ziww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795250396; x=1795855196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wAQ4qsK1Mx7pxpG0s5BlrPk5n0YkbGCnSR/VcQSO+vE=;
        b=1uTvvelT5JUKeE2+apXJ2uvigpzQ30EYU41LEfKeOWlVBlPmKtjdribjo17d2TGW5n
         ruyBaFrDHaXsJPPSM0BlfXdR4jIGoo98FkPKbFhqYLleOezzd/wryHDHVEtcIXqs7pRL
         4rqmVchYAw5rm7pca3cD5GcLd0/A8eGSZGBa/twJAr1MwTTgrhGqsf07pQmPBNWwn/Cr
         kNBl2YBoJLpcHw6JTmXHRI+DBjx0SqWAsnnx/nO/tb62lthD/wMRD7oi27fqXBm2jGRU
         r6g0XuczkXjCfXeiZnrvkhPTyg/2CgYYh6Zw/t3eJsIZsf5cyFNHDWd3u5d/Su48GRRz
         XPqw==
X-Forwarded-Encrypted: i=1; AL+hErGceiAd5HVcjEvErN+GSpfCcyfOL4I5mjo2eQNH9adYNnTaU7v5OZS5gr/9IEF2i/25EH/m/k3HOlo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jHcyoHaZbNUx5kPZIt9dwn7BaZOkx14qxmCNN9YhCunMriGQB
	W6VBgzhch9c00R+ek04ydWmkQye1LdLiJNaw6VR2jwZiGe0Dmc4mpOt+9XY0fhUv
X-Gm-Gg: AZFdTZfxMRDIrekFSIiau5xyzo6ttH3S8Z3R+v910hYfziCz21nWeCA8YSFdnnQVyiK
	XRDUcaF9QQ361ZON25Y7mQNQhpDkb+1M0fRMLX06qT6f4V6C6S9MIO8HWvnwWsNbIVB8DFP1UcT
	GAvhri4hb3xJYxi8+9QecBWIOh774FcZkzTuaNXj/HlNDe5yfuP4g/y6u4cUp9TUFLydz96FnoJ
	Nw/L57+iKaUzG/OcL4Q58jPEI/eP157JAQ/WTS5/mlZPcMaoNk49Cn0Hvmbs8MpWIua2XifcmpF
	8kZwuXJvD8greIZ0n4Q+bFzC+53KoB1Ng5ZHiqVT/VXIFvrbXxBiV9VHdaG4a/Ne2NyI868M6KK
	sTbY17ZFjaiI34pfGGe/+TFCHyfC5nLjCUpCXPc8lMSXH7dF3aCscPT3+Dnz9VbI1NiXaH6aSBH
	B1GukEsRecjLHC0JizzTBmFfLNCWc2Yx3aP7ZCeHvIx9yTQwz9q5h8cAt4L/RfFKmLoPfDREInt
	3+Az1//tGX85Of9IzhURcdMA8fydgbgZ17QTCZggWu4ro+MgJGIL+DbK7C5j9H9cDz/gKlaxyef
	koXaAWtnzszJ3Y6Rm63J
X-Received: by 2002:a05:7300:6da7:b0:376:77e6:a66 with SMTP id 5a478bee46e88-385704509cdmr7474745eec.16.1795250396001;
        Sat, 21 Nov 2026 00:39:56 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3856456e6c6sm14113093eec.2.2026.11.21.00.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 00:39:55 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v2 1/2] arm64: errata: Set GIC-700 #2941627 Kconfig entry to N/A
Date: Sat, 21 Nov 2026 08:39:49 +0000
Message-ID: <20261121083950.1957044-2-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121083950.1957044-1-takano32@gmail.com>
References: <20261121083950.1957044-1-takano32@gmail.com>
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

The GIC-700 #2941627 entry in the arm64 silicon-errata table names
ARM64_ERRATUM_2941627 in its Kconfig column, but no Kconfig file defines
that symbol and no code refers to it.

The workaround has no Kconfig option: drivers/irqchip/irq-gic-v3.c
passes the GICD_IIDR value to gic_enable_quirks(), which compares it
against gic_quirks[]; the matching quirk,
gic_enable_quirk_arm64_2941627(), enables a static branch.  The table
already records GIC-driver workarounds that have no Kconfig symbol as
"N/A", for example the NVIDIA T241-FABRIC-4 row, whose workaround is
likewise in the GIC driver.

Set the Kconfig column to "N/A" for this row.  Leave the row in place:
only the Kconfig column is wrong, and the table should keep recording the
erratum.

No functional change; this only touches Documentation, so no build was
run.  The change and this changelog were written with the help of an LLM
assistant (Hermes Agent); I reviewed both and am responsible for them.

Fixes: 6fe5c68ee6a1 ("irqchip/gic-v3: Workaround for GIC-700 erratum 2941627")
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
v2: the change is the same as in v1; only the index and hunk line
numbers moved with the rebase.  One changelog sentence is replaced in
each patch: in 1/2 v1 called the table row the tree's only record of
the erratum, but irq-gic-v3.c records it in gic_quirks[]; in 2/2 the
sentence about the symbol is reworded to name arch/arm64/Kconfig.
Both changelogs now say that no build was run.
v1: https://lore.kernel.org/all/20261106234541.1474324-1-takano32@gmail.com/
A duplicate submission went out the same night with different subjects
on 1/2 and 2/2 (20261106235616.1533003); please ignore it.

 Documentation/arch/arm64/silicon-errata.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index bffaa46c664b..4bb5707a880a 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -297,7 +297,7 @@ stable kernels.
 | ARM            | MMU S3          | #3995052,       | N/A                         |
 |                |                 | #3673557        |                             |
 +----------------+-----------------+-----------------+-----------------------------+
-| ARM            | GIC-700         | #2941627        | ARM64_ERRATUM_2941627       |
+| ARM            | GIC-700         | #2941627        | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | SI L1           | #4311569        | ARM64_ERRATUM_4311569       |
 +----------------+-----------------+-----------------+-----------------------------+
-- 
2.53.0

