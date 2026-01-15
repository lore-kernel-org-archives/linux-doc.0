Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB371309EF7
	for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 06:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768460052; cv=none; b=jV0Y5ghV6h1J6F6I8aALvS2okizeU2s8TWbhqjF6kbw2T45WsPdLRcnLiU8vaB6shK8sx+ibm39yDY5qCzzZ4PXpxGq9hnTDkL9poyZ7FFMbWTLvJ/eBryFsZGvIaTmlOI/mHWW1sEFAdmJ+FSKinpyanSJRHketBN6w3i0ZATo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768460052; c=relaxed/simple;
	bh=B3BbHcJxCbl5kZ6l1jOVKdEUzVWNYI0omxaP2/+qVLA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YHRXig/32TzcfmvKUs4GoreILuTtUNopGtErJptNEEvxz6WXCpn2vyj8GKhWsTHiJ9Cd6U2XS3F+IcaNPrJV2lGAWG3t3vuAnynAgxuC2ohPy5YTHUyXW8NndoQLa43eTi87Ihh7i+DZp6XGRTOTypUGNtByTO2URclVZcFEJHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c9lcc5mg; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c9lcc5mg"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-81f42a49437so293333b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 22:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768460049; x=1769064849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kKhd618xjsvDuEuPwrm+JCeU68pfSg69amjpKuyrL+8=;
        b=c9lcc5mgnASJU8Zg3JkmuqoLW4u2glHym857t9BWo5d9kXylX+LpQ+0ZojYbp2Hfaw
         F6+W+Rbz5LhzfxyQmxwP0yNwpEBD6irqQeGoGvIKNfodQ69ZZ1Eh0rmHljjNZDbke6bg
         YAU52OnufryCbSk4quHfhtIdsyZwMnYW8/n8WNMKStPWj7mtqEgpplBHqXONgT9rsY9p
         3G3fWkbvQLPpVLm3sDQPjdILlMxknr3liDW4CkiLzVdPnQmMFc86FXWvqoSJvILsniPr
         amy6CMSvphrRa8ifXrbRKJ+4eh2WZ3eS49RyDnr+6mRFAoq09H49LwnL9BQzB0uH0vHu
         IDqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768460049; x=1769064849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kKhd618xjsvDuEuPwrm+JCeU68pfSg69amjpKuyrL+8=;
        b=sDcEKL5WOTlG9BOJKrx8n1Q5nRGnm8nDO92vcX8pjlbKWZcsuQj/5t6ws8k6QMCjYO
         WGA+gu8VuqH7+H/LKUYsGlFpJke5HTbvYtyEzSKPrU/G/OjilDkA+usckExrH+LWz/rS
         3hTG4+Caja0+rLJSr2l9QZN1qDRof23VCvWaCeb0ERhmpLY7mCnPSzcbIkE+58cSB1UV
         0ekK6S3hvVB0fOqpgyglBpTHWG+/6aA6d/p9mGGi+Hb8Wf4O/sUv0h9nm27yc+dlBFq+
         yzbtlHND8ndGomQlW1y2Lga7auWdXKcW01DDYAEGNOBCD03FlaKT57vDyhueU0E9EqHL
         xZ9A==
X-Forwarded-Encrypted: i=1; AJvYcCUd9jCtPXLRemrSCFioFLu39aMvGXPm3O2pc6XhBpT+NDFNXmrEYFVD0YKCTQ8opojefx35upz8Yh0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYyNerPudeu8zmkaljKXE4R7lbIEZqC6A8zMaOVw1VdHgrUCXK
	tzRbwT+LgLqosqaVRIT7WmG+7CWjx3tQ9V3duQVPyfV0kLa5X8dIjy6r
X-Gm-Gg: AY/fxX6Roi62nLS1GFCX1Z4jagqt6bqUYzzZTsLZqXmK3G/25wbl22dL0Nl9Pztjhng
	tFlez1Luz7cAhWiDN/7J+HrCnoNA73Ho5Lit+ub2+zhuiU5xjD+LkYfR/AhPsyMrO98iXS8s+ki
	Vra1U7brbKwgMisrnmNGJzVgkoLQAjrbHcgj+TwRh8c7bdKljW5Yh68asPXbghmzQiP+Sno5VW/
	qgxoQY1lj7mo8nTcWU1nurVWsuFNLbyGqQXAF0Imx5IHe4CejC8sxg/695qDelJKjoa4TL17XmZ
	uIPEYR3q9BALkujLoC8xb8qXvjSHlZ5RwH/tEH+hfgl0V9izSjFzRRxclf9LAN2FKJj9Zn7rJer
	cnd025WQsBm6ltoPkgDaLEBWhg3rDHjbYy/PJPIye9alnXZY8gO/wYt0Vp+3M0LF+NYwTuGMYOp
	yHRj8YRwOlnM9qSNMqajSr9A==
X-Received: by 2002:a05:6a00:4196:b0:81f:4abd:f15b with SMTP id d2e1a72fcca58-81f8200640amr4799382b3a.58.1768460048941;
        Wed, 14 Jan 2026 22:54:08 -0800 (PST)
Received: from localhost.localdomain ([72.25.121.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f8e4b8246sm1499683b3a.3.2026.01.14.22.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 22:54:08 -0800 (PST)
From: Yiwei Lin <s921975628@gmail.com>
To: corbet@lwn.net,
	linux-doc@vger.kernel.org,
	rdunlap@infradead.org
Cc: hdegoede@redhat.com,
	srinivas.pandruvada@linux.intel.com,
	linux-kernel@vger.kernel.org,
	Yiwei Lin <s921975628@gmail.com>
Subject: [PATCH v2] scsi: docs: Add description for missing options of link_power_management_policy
Date: Thu, 15 Jan 2026 14:53:41 +0800
Message-Id: <20260115065341.10230-1-s921975628@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the kernel update we have more different policy for SCSI
link power management. Add the corresponding description to
the file.

Signed-off-by: Yiwei Lin <s921975628@gmail.com>
---
 .../scsi/link_power_management_policy.rst     | 23 ++++++++++++++-----
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/Documentation/scsi/link_power_management_policy.rst b/Documentation/scsi/link_power_management_policy.rst
index 64288dcf1..e350892cc 100644
--- a/Documentation/scsi/link_power_management_policy.rst
+++ b/Documentation/scsi/link_power_management_policy.rst
@@ -5,13 +5,13 @@ Link Power Managent Policy
 ==========================
 
 This parameter allows the user to set the link (interface) power management.
-There are 3 possible options:
+There are 6 possible options:
 
-=====================   =====================================================
+======================  =====================================================
 Value			Effect
-=====================   =====================================================
-min_power		Tell the controller to try to make the link use the
-			least possible power when possible.  This may
+======================  =====================================================
+min_power		Enable slumber mode(no partial mode) for the link to
+			use the least possible power when possible.  This may
 			sacrifice some performance due to increased latency
 			when coming out of lower power states.
 
@@ -22,4 +22,15 @@ max_performance		Generally, this means no power management.  Tell
 medium_power		Tell the controller to enter a lower power state
 			when possible, but do not enter the lowest power
 			state, thus improving latency over min_power setting.
-=====================   =====================================================
+
+keep_firmware_settings	Do not change the current firmware settings for
+			Power management. This is the default setting.
+
+med_power_with_dipm	Same as medium_power, but additionally with
+			Device-initiated power management(DIPM) enabled,
+			as Intel Rapid Storage Technology(IRST) does.
+
+min_power_with_partial	Same as min_power, but additionally with partial
+			power state enabled, which may improve performance
+			over min_power setting.
+======================  =====================================================
-- 
2.34.1

