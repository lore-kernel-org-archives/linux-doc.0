Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5511DED42
	for <linux-doc@vger.kernel.org>; Tue,  4 Nov 2025 02:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762222989; cv=none; b=M7VeNusIlIvpp152fCq0Kx49hvugyFuZ/AdQJ8ckMFWsQqzwzvyar700hHf0BS4O8Wk+hgaAa81U+Kh+VA2m2IxDjhO2g2OJQRlxXRIwRNeapmNeYLOxX+Qe798YJfr94aoowJIioRN++b2AVJ2OuU+4iPVcp8z4ag7cdAQmpbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762222989; c=relaxed/simple;
	bh=eCLzlFPaLSvLqLxXZ5mRBpzn22+x40x3Y0NMv6gFw1E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lWNhxjcggq3XIRhMboI3aziM4wWKcx4Q/5/XfeDM2q/FTTcJkU5y6mWlz3myeFbo8JSv2n0LwBwl+dFGB4Yy3UMgty7oUbWS7quZxzKmHgphIoh9z3Sq67fuqYOIg45ii7IcJjayRObQFTSRXl2QK+1HVeoLeN1aVQ0IekB1CIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C+gXlu4a; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C+gXlu4a"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7a435a3fc57so4877323b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 03 Nov 2025 18:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762222987; x=1762827787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CUNivpaoNg5y7SD12fYPhASBZjYUtqUtVFH5sTI+ugM=;
        b=C+gXlu4apB4wOePxwvLbvRI6K58ItydQe9f6OvIb3gVe4pypdJJdRNBsIz5H5ocds3
         QCZKwKcene5W09X+JUZ5fDUiGA2avPYVwTdDYvu4N/x5dZa0vu+/s9tVwDLazxVVOutF
         3VlOdy616wZ8piGIPy3Yxw+rjxkaVBkKLXUA3DfHIqXa0qCbBmqP+j/HO0C+JG5uKUCe
         5dQfcHbYRHX24LdhQ/1K6KmNfNTaEz/d0kuVkkAShNY+PJCHekqyQDPh71L+N95N7DGq
         OR6T9sn7+NRnnuf7d8Ezh7LMYAuYBqon+kM1xQDQAdO3WH5roAn8P1fGjcE/vuTPjdTC
         UHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762222987; x=1762827787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CUNivpaoNg5y7SD12fYPhASBZjYUtqUtVFH5sTI+ugM=;
        b=st5Dydi+138lTXv7aiuoxGOmKLCRFoZeYzVnQzu69Sd/4iQBs0M9pnJ934ZTrleSv8
         A4Reh2fNgrL/SI3FA2t902a9vS94UOZvlm6Zw9myJmektysnjrpReacb24FOhku36Lu9
         ToS2USGoIu4KOBhW++iAWHZPXWu7n8r0sjOp2n9A6J18lGxpUmhXg4xFisrAX0p4Vvat
         ZzyVoEE21HBYOLnvw1IXeGYGR0doZ8BhCp1Zy8xuteiuiMC7u9tNTwIBvUb/pJizTPvl
         kK6ACYyn6rPuUa2Amf7ekSjb1a1DQo5O2kjb6j4oX1xk1bwkDUiRgKGZRb2mIKNmc32Z
         8D7Q==
X-Forwarded-Encrypted: i=1; AJvYcCW4HgNFHJxUS1dV9emPDkSrg5lqdfR7Q9XVudZDSEBCnmI6mcQKMucjMXrH6hv6/2E1/cWARrFUa2o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCRS7rm7wZIeLOvKVGyeC/fT070ixFFA3EN7rz/u4DJsOBWu3P
	hITIPd6dkY79PFXAONqsJa2xPzsZZiV8TbSxkOrV16HQ+gfJaf6wOY9R
X-Gm-Gg: ASbGnct4lgfeAPxyCAHAlMqOVt0/VNTr4stszxsQ9djW0WsDMFdGjfnU3Q1zvID1F0f
	Q4cB+9Vtr+VwoFcDlgJIZf5p6x90xVMotyJUu/dwt2EQV+sPZ2DKxGYTfqW3qlxuWI1184P5YXp
	7Ms1XVypp2Maq4ulHJ4e9peqHYn4EhwaOyr83xutUEcr9OfsnIkpnktFy15j58oTGKPc/nhSKnA
	qaPzVhOW2kPSR+bDOG36nK9JEvS3bNKEPKbMjiMVObnOSAXWktXiZuJM5ezBWCT1u6C4blbkLYI
	BM9eu3SOtVtps41n458QDfcoa0yXA/lUsYooIWwns3hzLeuuPCrgeIuV78Mjig4N8VUi9sMZjcY
	eeuoN5iAHmU907ayVB7s7o4QYUgNZgib3teGHvRzuO6vsMgJUfTYSNrsQ9GquBU494GDs0bFZhp
	AEgd2D0S37+F0=
X-Google-Smtp-Source: AGHT+IGtaT4nbrH/vsm+W0H/MgZf84Wbl/w652bwjzVWrm82zm/wubl6T4br7d+kv1IczEaMxgwPyw==
X-Received: by 2002:a05:6300:218c:b0:342:bd5d:2c62 with SMTP id adf61e73a8af0-348cbda98acmr21110239637.29.1762222987383;
        Mon, 03 Nov 2025 18:23:07 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba1f87a614asm541798a12.32.2025.11.03.18.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 18:23:06 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 2C2E9420A6B9; Tue, 04 Nov 2025 09:23:01 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vamsi Attunuru <vattunuru@marvell.com>,
	Srujana Challa <schalla@marvell.com>,
	Julien Panis <jpanis@baylibre.com>
Subject: [PATCH] Documentation: misc-devices: Fix C macro cross-reference syntax
Date: Tue,  4 Nov 2025 09:22:42 +0700
Message-ID: <20251104022242.19224-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2887; i=bagasdotme@gmail.com; h=from:subject; bh=eCLzlFPaLSvLqLxXZ5mRBpzn22+x40x3Y0NMv6gFw1E=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJmcSX+2ifB2xboIXtPKO9HHzmAvZmPbWXJT2VIsxUJJx pUz16ujhIVBjItBVkyRZVIiX9PpXUYiF9rXOsLMYWUCGcLAxSkAE6lWYGTYs2YF179OZ7mpm/T/ fFCoebsw9oX8idUrz2/R9fp47qmzM8OP1w8/sFzd2iS7SObBj9hFW1OuPHa6bzRVgPtL1euD/w7 yAQA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Macro references in Octeon CN10K and TI TPS6954 docs are erroneously
written using :c:macro:: (double colon) rather than :c:macro: (single
colon), making these rendered in htmldocs output as italics with
verbatim roles. Correct them.

Fixes: 5f67eef6dff394 ("misc: mrvl-cn10k-dpi: add Octeon CN10K DPI administrative driver")
Fixes: dce548889650c1 ("Documentation: Add TI TPS6594 PFSM")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/misc-devices/mrvl_cn10k_dpi.rst |  4 ++--
 Documentation/misc-devices/tps6594-pfsm.rst   | 12 ++++++------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/misc-devices/mrvl_cn10k_dpi.rst b/Documentation/misc-devices/mrvl_cn10k_dpi.rst
index a75e372723d860..fa9b8cd6806f14 100644
--- a/Documentation/misc-devices/mrvl_cn10k_dpi.rst
+++ b/Documentation/misc-devices/mrvl_cn10k_dpi.rst
@@ -33,12 +33,12 @@ drivers/misc/mrvl_cn10k_dpi.c
 Driver IOCTLs
 =============
 
-:c:macro::`DPI_MPS_MRRS_CFG`
+:c:macro:`DPI_MPS_MRRS_CFG`
 ioctl that sets max payload size & max read request size parameters of
 a pem port to which DMA engines are wired.
 
 
-:c:macro::`DPI_ENGINE_CFG`
+:c:macro:`DPI_ENGINE_CFG`
 ioctl that sets DMA engine's fifo sizes & max outstanding load request
 thresholds.
 
diff --git a/Documentation/misc-devices/tps6594-pfsm.rst b/Documentation/misc-devices/tps6594-pfsm.rst
index 4ada37ccdcbae8..5f17a4fd9579ea 100644
--- a/Documentation/misc-devices/tps6594-pfsm.rst
+++ b/Documentation/misc-devices/tps6594-pfsm.rst
@@ -39,28 +39,28 @@ include/uapi/linux/tps6594_pfsm.h
 Driver IOCTLs
 =============
 
-:c:macro::`PMIC_GOTO_STANDBY`
+:c:macro:`PMIC_GOTO_STANDBY`
 All device resources are powered down. The processor is off, and
 no voltage domains are energized.
 
-:c:macro::`PMIC_GOTO_LP_STANDBY`
+:c:macro:`PMIC_GOTO_LP_STANDBY`
 The digital and analog functions of the PMIC, which are not
 required to be always-on, are turned off (low-power).
 
-:c:macro::`PMIC_UPDATE_PGM`
+:c:macro:`PMIC_UPDATE_PGM`
 Triggers a firmware update.
 
-:c:macro::`PMIC_SET_ACTIVE_STATE`
+:c:macro:`PMIC_SET_ACTIVE_STATE`
 One of the operational modes.
 The PMICs are fully functional and supply power to all PDN loads.
 All voltage domains are energized in both MCU and Main processor
 sections.
 
-:c:macro::`PMIC_SET_MCU_ONLY_STATE`
+:c:macro:`PMIC_SET_MCU_ONLY_STATE`
 One of the operational modes.
 Only the power resources assigned to the MCU Safety Island are on.
 
-:c:macro::`PMIC_SET_RETENTION_STATE`
+:c:macro:`PMIC_SET_RETENTION_STATE`
 One of the operational modes.
 Depending on the triggers set, some DDR/GPIO voltage domains can
 remain energized, while all other domains are off to minimize

base-commit: 27600b51fbc8b9a4eba18c8d88d7edb146605f3f
-- 
An old man doll... just what I always wanted! - Clara

