Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5082235345
	for <linux-doc@vger.kernel.org>; Sat, 19 Jul 2025 08:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752913624; cv=none; b=g/z39aJbInaXQCXCMw9KeAKZpygatqpMS9Q9SqXIMlq/JnzlOLqRJV2bjJEKP34WyqOCSziU6qC9lvjZE4ddlVbEV5IuSzLx4jLoz/hREv6Y98c98l7bxvX4ES1578jJc4VaUBUrqKVqij16YbQUbs+4khGw7B/axdb378cB7XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752913624; c=relaxed/simple;
	bh=P22GETLL8XCTAG82w5KLzdw5PA4pQl85CxmaEqGA3PE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fWjF/Yj7Pw6syG9F4NqE6ESC0P6FFyA+WfyDjYMAIZ3tJsjVGINusnQeWfUiyFh3aUFPpBF3wjO7vxn2qM/TAsLpPcV4i5SBNBc+N+IZMuhYQDtVWKnx7eiz5OZUmx1Ie7RbjhEJ+rlfIq9YQLbsAs8zjKHs0YC59lKAbr1A7og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=DKhGQBj7; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="DKhGQBj7"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-74b54cead6cso1911240b3a.1
        for <linux-doc@vger.kernel.org>; Sat, 19 Jul 2025 01:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1752913622; x=1753518422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EPId7hlRtak29cJpHNdXMRMJJGzWtgzI1RuZFg9RVGU=;
        b=DKhGQBj75kL0R1fRR/ZxZOoXIWHAutNRIfNM0BwMDkuJMHJ+V5u7f6xOUnGD1ltdMr
         OSYvUOM14UptrgS3hzeqviZbCwlt/lLH2n8MRcwbFAiVJ5OtTOefhp6I0nJWdF1vGkAk
         V+opPAEZItYdf20IRt1f51h0RQVR5QQwyND3urfYeiimutHcE18NEVUhrx2DDiL9Af7Z
         K6rv0hDBXR4JvQudGv/54mnuiGbppuCXDyyb5aaSVpr3jVNviLBL+mCYnuosMUIIPbQl
         Prl6WjFEpwni1kWEGKxfwkb47rIGQZxACu6+jy6FaZ9eGkgcPGCMBibbnMsgTV1Pqh+7
         dppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752913622; x=1753518422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EPId7hlRtak29cJpHNdXMRMJJGzWtgzI1RuZFg9RVGU=;
        b=TtsvI9DTv4/BrebjOfQ7ow9GPKTqrA6t7OkYX0pXxOsPHfGHQXY7DBG9vFUXqBJJEl
         nzPgrDD3X3ARVWGtsaf5a88q/+54dtXPqXYOVWrjaG+8rRwTu0ZFa/LIKbEk2xxHDOi5
         ua6c7nN8xNR1OtB8CYBRt+AQg4kkm8aLkLGFfb6+IvQEE3AmXk2n7Dtx4sD/NZY4bStm
         o6z3jn+qYQHI8t1bzO9ThVpdVDAQS88c2nvLFDs5bxo/gYM5ea6ZitwErSEo8oRxV1L2
         DgxYRwE07PiLCUztNhaeCyAu9PvUATAnwHB1k7WIw/3oSPQcIwMgAgyiyBFMZDOS9dpq
         lZEA==
X-Forwarded-Encrypted: i=1; AJvYcCWMJez6ZeqwkV2SLbwBzHgyHp3/z/FSwl64eGQC0nfl8BbcqNNZfJ9VVLIKrxdgXvWzVvFX9fZRHuI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjkcKgh4vCk7vlpsUg+9Px6kEmuwY845IrC5O5YwWugN/WPZg1
	QFiZtJdjJBV7FtXY+wW35cbCVa4NnHiHX/1IM+pnM+DAQ5BcED2+XrQbJQ8U1Co8tt0jZjEMBO2
	OyQui9rigOw==
X-Gm-Gg: ASbGncuTIB0PKVBPRZZ60hKr7B95S+zfcelUxUDQqUU039acGDzRQKn9JQRr/XNA2kJ
	1jWMkI2Zx2TFpah3PSdYQtXTKokJBvhBdryXEoT0KX6VBMHvI660F430eeIw1Z7hW4iXZ327hPm
	5BPWjBQYFyb282KjgHn176tZKCjEKP3tpwTn1GlTpvQwcGTttQgVZyKuQn5XLzOZNBK62Rgo2yK
	tG+amEeGmWo87wjdthhAnuvTTulB07MiIxl4mLFCEegZiI7khwR5UUGIPIp4SCGUlJjXfKwFIno
	3/es9Tf4SoYTDKu7ufWkxropFN6J1xMUvHzDSHwhrcAm6aOAvwSIkgRffwM2vnGz0sfWyych316
	zzPrw/iygQG4RChddUvijAcpCBJcqyJI3f5pi8QkMu4mQHiOFiQ==
X-Google-Smtp-Source: AGHT+IEzBjqgE2BlaLz1oOWFjBrHioQyEDfCtdHE+F0FDfd8OvpCDexvgvzMEwrHYyRAhMYVJmlFCA==
X-Received: by 2002:a05:6a00:3a11:b0:736:51ab:7aed with SMTP id d2e1a72fcca58-75724180944mr17224932b3a.16.1752913621977;
        Sat, 19 Jul 2025 01:27:01 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb157635sm2475260b3a.83.2025.07.19.01.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 01:27:01 -0700 (PDT)
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
Subject: [PATCH v5 0/4] drm: Fix bug in panel driver, update MIPI support macros
Date: Sat, 19 Jul 2025 02:26:34 -0600
Message-ID: <20250719082639.307545-1-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
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

changes to v5:
 - Rework mipi_dsi_dual to explicitly not support passing macros into
   _func and add "dual" variants of the generic and dcs write macros.
 - Make jdi-lpm102a188a use the new
   mipi_dsi_dual_generic_write_seq_multi macro.
 - Make local struct variable in jdi-lpm102a188a conform to reverse
   christmas tree order.

changes to v4:
 - Fix whitespace (I forgot to run checkpatch. Thanks for your patience
   as I familiarize myself with the kernel development process)
 - Initialize mipi_dsi_multi_context struct

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
  drm: Create mipi_dsi_dual* macros
  drm/panel: jdi-lpm102a188a: Fix bug and clean up driver
  drm: Remove unused MIPI write seq and chatty functions
  drm: docs: Update task from drm TODO list

 Documentation/gpu/todo.rst                    |  22 +-
 drivers/gpu/drm/drm_mipi_dsi.c                |  82 +++++---
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 196 ++++++------------
 include/drm/drm_mipi_dsi.h                    | 112 ++++++++--
 4 files changed, 210 insertions(+), 202 deletions(-)

v4: https://lore.kernel.org/all/20250717164053.284969-1-me@brighamcampbell.com/
v3: https://lore.kernel.org/all/20250717065757.246122-1-me@brighamcampbell.com/
v2: https://lore.kernel.org/all/20250708073901.90027-1-me@brighamcampbell.com/
v1: https://lore.kernel.org/all/20250707075659.75810-1-me@brighamcampbell.com/

base-commit: ca2a6abdaee43808034cdb218428d2ed85fd3db8

May you all have a wonderful weekend. I'll be riding my motorcycle up
Logan Canyon.
-- 
2.50.1

