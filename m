Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C3B218AAA
	for <linux-doc@vger.kernel.org>; Thu, 17 Jul 2025 06:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752735491; cv=none; b=EsQYlMZP5YxJ49b5pwSqYgiw6Ww5Izqa6Q8JpFD7x7eVSRcd7dtXjdUYAqD9kgMCtFUZRr85OvZBDj216A7hfNOOG1lwH+8QSGfiQowKC5RTAIm9YC5Y7k/OkPLrbfrPB9XqZUjXqeQdXAKjSOekpyRRyeCHNmXtKepWNqfoPQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752735491; c=relaxed/simple;
	bh=GS8FKUFJnXN4vb3m8ja3wGK0qiCPE38bwfUfDE5aU6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X7eYSq8DO/q23aTKegMDnSkeKqaGpafuysKrw9JhjFYuF99H1l/mUrQTBhwu9irY/Ve/k2IkF5Al6wEeJyllh/c1O0oYlEv22QUiRI7kmVyfnNCtilbtQaJYyDjqJWpjajit5mvyFcVsB26zcICW4ocQWMkLZcuxxee2aYWxKls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=Ulg6Kocm; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="Ulg6Kocm"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7490702fc7cso449960b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 16 Jul 2025 23:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1752735489; x=1753340289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/QwaJ6+SV8dLr3sbsgOJRijgIEa6kBPmB3FaWrqGQmI=;
        b=Ulg6Kocmnw3etoxSdBHXpEbVJgV1zanWAK9DP1/a79e2hY28cNdJfdT6xsOVxHrLak
         c3ZyxiTtuprGmSUoBYjY9oCjjwjiaUVfaYwi379OgV6vy2ufG+AcUnI7u67BcHs7ymTl
         bfkTFKw6uxoRIfJ7UrAO6XChwuah4CoQoc1drVZ02csVCwfl6wrnax+2gEcOaHrSR7SP
         8e1FBLVO4RSUWm79KoSftIawgjbLVH93V0lUph4VGNGy+uDY2PSVsPNRry0dfvVcqopu
         mLmUgSKTNVHeF8DFxpfemkbMeg5LA4wT0F0hieWGRjOngfL01N2iaM5MF2Ez7PaxVQhG
         C1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752735489; x=1753340289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/QwaJ6+SV8dLr3sbsgOJRijgIEa6kBPmB3FaWrqGQmI=;
        b=ehBCiD/ikdnvLOlTAn4ug7voFauf+XsP2u7TrCr2N5dl6T5CUVBXtAHjBUOaSKPtwp
         AfwdYpwed6Lpm3f+tEKqQbvBCN/8aBd/HPAC8Fo4OqTL0o/A+a7itm5QB2AKfoQPcrjg
         E/gdd6+8v0mSQ+3OqT8mDRWiyRp+ZWSnTrl9k+841e1AmX+3BHJFOLo65BB+RbXpEaEl
         GMalzY3IuQiqsci1GXJKZs8k5MtB8GbHtzibnJJ6xJ4qguqYUV2foMdK8kCHmCr9CZpD
         l7HEgvIEuzn+NlcDtcPc027nUwaGyW6rNnY9B/4cVxUwXBiBwWuu906NFELltazbjaiC
         t67g==
X-Forwarded-Encrypted: i=1; AJvYcCVjt7r0um26iTdIJrnUqWPP9A6pFQC/rFqpmKJmpc4dXXsiROXC4Y5uElNFowq0x7cc3mZLJPypcyw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrhviQWB21b9G1poX9dAF8HR5HYtTZ3/xUJWvuJEAWAywczRN6
	u3i1vYGKzcYzKHyz4e+6IofdPNcrGH+V0+ac9TKbD0Y04jQ2OP7aLZfUmuJCDsYpet4=
X-Gm-Gg: ASbGncsyG0arScGARd4zuyPIZS5tIXoSjKrpb3ShV8FC72HlBGZfxb2ynZyJhBwIrvk
	eQywXtUe5mWw4ULlHFgI0Dj/SmUETc8yUvVETBcXJhEgN7gspFpEQdWIMoQQwiEwNYlgf/PL/dm
	Kh6m2vKiq219QLRswqO1cPjX8xeQmTa3Auh0ROKSXf6L0v1lbtV81ybDrOW0nlS/CxVZrZEwNMf
	2MN816sB1vqhjTYaIld8+PERTCg6Yc16RFeSBKRgo6+XcXnHXOSN2lG1Xr0SlKkJg+CXcJe8hwN
	x0HP6Z+PRDlminmKsSZQIFnerBG+C5VU/EtDl+qMp1p3d9Rc6K+EMTkIWhSHdL04l5L/rrQ1KhO
	Zp2Sjrl9YDF66MpZwGvPUBkmr/HRSbXLA+K2yeFYWh2ZX6KVHNOBEbw==
X-Google-Smtp-Source: AGHT+IEseKIfJqtbOw8gzUyfRbVBbKBWLtecuTXecrmR5KxL8XgEfMZkeKCbA0k+p/mbsZdrQYExAA==
X-Received: by 2002:a05:6a00:1707:b0:742:a82b:abeb with SMTP id d2e1a72fcca58-756e7acf5e2mr8654099b3a.2.1752735488782;
        Wed, 16 Jul 2025 23:58:08 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f4bc51sm15157293b3a.116.2025.07.16.23.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 23:58:08 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org,
	tejasvipin76@gmail.com,
	diogo.ivo@tecnico.ulisboa.pt,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v3 0/4] drm: Fix bug in panel driver, update MIPI support macros
Date: Thu, 17 Jul 2025 00:57:52 -0600
Message-ID: <20250717065757.246122-1-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes the unintuitive mipi_dsi_generic_write_seq() macro
and related mipi_dsi_generic_write_chatty() method from the drm
subsystem. This is in accordance with a TODO item from Douglas Anderson
in the drm subsystem documentation. Tejas Vipin (among others) has
largely spearheaded this effort up until now, converting MIPI panel
drivers one at a time.

The second patch of the series removes the last remaining references to
mipi_dsi_generic_write_seq() in the jdi-lpm102a188a driver and updates
the driver to use the undeprecated _multi variants of MIPI functions. It
fixes a bug in the driver's unprepare function and cleans up duplicated
code using the new mipi_dsi_dual macro introduced in the first patch.

changes to v3:
 - Define new mipi_dsi_dual macro in drm_mipi_dsi.h to reduce code
   duplication.
 - Fix bug in lpm102a188a panel driver's unprepare function which causes
   it to return a nonsensical value.
 - Make lpm102a188a panel driver's unprepare function send "display off"
   and "enter sleep mode" commands to both serial interfaces regardless
   of whether an error occurred when sending the last command.

changes to v2:
 - Remove all usages of deprecated MIPI functions from jdi-lpm102a188a
   driver instead of just mipi_dsi_generic_write_seq().
 - Update TODO item in drm documentation instead of removing it
   entirely.

Brigham Campbell (4):
  drm: Create mipi_dsi_dual macro
  drm/panel: jdi-lpm102a188a: Fix bug and clean up driver
  drm: Remove unused MIPI write seq and chatty functions
  drm: docs: Update task from drm TODO list

 Documentation/gpu/todo.rst                    |  22 +--
 drivers/gpu/drm/drm_mipi_dsi.c                |  34 +---
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 187 ++++++------------
 include/drm/drm_mipi_dsi.h                    |  46 ++---
 4 files changed, 92 insertions(+), 197 deletions(-)

v2: https://lore.kernel.org/all/20250708073901.90027-1-me@brighamcampbell.com/
v1: https://lore.kernel.org/all/20250707075659.75810-1-me@brighamcampbell.com/

base-commit: 667efb341917bde19f5d7517b65defcdaed67c9e
-- 
2.49.0

