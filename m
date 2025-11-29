Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9CE1DA55
	for <linux-doc@vger.kernel.org>; Sat, 29 Nov 2025 00:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764376276; cv=none; b=T5JtW4CPhmv234SHahmd46UYM2n0L17y4o91gA3CO9EeDUsGb/cJPSw3zSX83puU/GNIXLkQF5m7Kf9GcjLzYbZW8y+GmHYNZgaIyOHC9pyY7tXOBGIKGFDRZX9pUKgA2wZnNgkOqJgZbMPf0y/o77dq1wP0GbCJmnst9B3lLJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764376276; c=relaxed/simple;
	bh=f5ajGLywqacetvO5aZlhvTWE1cr9omxu7IqEe8Fzakc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rH3QuAOLidY27zjnvVdrrEzILHfoRLRCwXUgxK2IAQZ/ZUk6W9tnLUgAckIPPvRIzd+lFciYphkVKYLOBvJ2hwBZkCXfwiPBFCbZt7TRthxj+wjSGxIZI4LGUMwEyzdCIpWn66hTUIowpdhfzLrURGFx984YuMzX62/G4YQ8E6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XqDA+WME; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XqDA+WME"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-298144fb9bcso23514655ad.0
        for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 16:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764376274; x=1764981074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S+fCjN5ZvI1tFg9f4Onw94iBdBKzIF5T11o6ts8QCmI=;
        b=XqDA+WMEmWIIoxG6GXI5u9ybfdaHaBeMPA8d/rUnHlR20+6eooigaa7NIo5J7SbuSA
         twvmMNWyIK56AiFQlxvnpqZwh4S+7p2RNaSwpPWQP69Y/X4SljZFknl7+uRL7aQeAGUN
         Ssc/bGjIFO1x2B46P0IyAUq1hirbpHnABE5TvBuhiwNLi1F32G4QYXfw1FNvdJSc0mOX
         cqMNyY0GUewVp+BghCyE6YygzJWLDPY1YLHBv3lfyi6UUD+KkpZhS+KHWELzaqlszbon
         ocUKv/clNTwUjByIO6owbOQjBDQ1nJ7wqawwOJZ6TPVaFPw5qHWerA7DISy61px0ikP7
         k3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764376274; x=1764981074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+fCjN5ZvI1tFg9f4Onw94iBdBKzIF5T11o6ts8QCmI=;
        b=Fwo8j8ARLLu/mcF9fd91uIzDg86XtQJfboXdfMQw7qa+MRfcBsNnIGct6qsc1jxDB0
         KerLeFjK8zteUTv4MgwlCzvVe5pRoX8ZbsJ1YXTaflMiScRTuh9QJlT1Nu6VaDCcIHag
         DV2YgULBXGAdFdC50acx6TEZMF82HNwaxTqvp1Nessh31jHXtrjs15RhdrYRoLPV4bmS
         FMUs7DUhLGtPPdRW7saCaVx7ytPL+DeIPQ3nVhgC32c0NldsZMU9Tn25bDJxZEgsYnIR
         him7k0tEbcL5ow5vAk6WRSWCjRHOZlKQ1GcWzBoFV5qZYwvQjD/6p+H72MLSofkzVM6P
         jf9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVa+FAskJjCpspCXqhyFUR/H6yF1BkKm6X/FG4ocTmgjsM6G9LAZUqxaL08zLbTsSV5ju8JoO1GzDc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjWSy5LVKihYLYo4itQY6802ZQYqp5nVK2SU1dAoZpA3Ns1jJM
	sqXqnWc8Va4VmMRCO5lu6BNVh4gqgXJdNo8Ri8WQgNyXKOu1ChETCYOK
X-Gm-Gg: ASbGncu5fmGBMnuEH0dQvxDk21Jhsz/19HR/qmXBw3KapSU2J4cML8BxOEYpYh6OM3W
	S4+yILNkwYJekNYp4PlPMigsIKhHWA05H0EhBM/mM//ZcrSeDLEA2nGwE1revtAq8TnmxMZiP5C
	75qERtCLiX7bl1no5zOp6/0FtlT71stRQzVoi3HNB0aNMjEzLiZx85db9VwWgxgATKuoPYIvEMP
	35zY+GuIOAGc2jEtHaZUq39So0lGIKnuM7I63O9155tcENqi1ykrIqybw36i0xjLalJeUa0eakn
	vfSQpbbMqw0vkHoDeo0saC0gjFDxWNvoZCbCSVFalvEpJ10XzrWu8Mv2wNTH5yWwhWBD0m3tgsf
	EoLi/aF3jrQ1L/EB2LNhF8XOBb8HFTrTlMknSFkgVBJIQfiJP97U+1EOv8UH+9WGHJm26KGzl1B
	LXas03XZ48jIH5/6xLlplhoQkpCgPlgjei3ufpazPqr3rw00HeDr2r5Tz2R6N9SyhO1g==
X-Google-Smtp-Source: AGHT+IH+svOzJyTxN6FrP355nvW2jyLTDFPrgoSEepjsq9Yu90iGPCoNap//9fhBPgDitqVWdz56mQ==
X-Received: by 2002:a17:903:1108:b0:297:f09a:51db with SMTP id d9443c01a7336-29baaf7be8fmr183413715ad.15.1764376274087;
        Fri, 28 Nov 2025 16:31:14 -0800 (PST)
Received: from c12-ThinkPad-X1-Carbon-Gen-12 (softbank221049092147.bbtec.net. [221.49.92.147])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb40276sm56054805ad.73.2025.11.28.16.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 16:31:13 -0800 (PST)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: corbet@lwn.net,
	dmitry.torokhov@gmail.com,
	hmh@hmh.eng.br,
	derekjohn.clark@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: mpearson-lenovo@squebb.ca,
	linux-doc@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH v4 0/3] TrackPoint doubletap enablement and user control
Date: Sat, 29 Nov 2025 09:25:30 +0900
Message-ID: <20251129002533.9070-1-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds doubletap support for TrackPoint devices with
a clean separation of concerns:

1. Firmware enablement (trackpoint.c): Automatically enables doubletap
   on capable hardware during device detection
2. User control (thinkpad_acpi.c): Provides sysfs interface for 
   controlling event filtering

The simplified approach follows KISS principle:
- Trackpoint driver enables hardware functionality by default
- Thinkpad_acpi driver provides user control via existing filtering
- No cross-driver dependencies or complex interactions

Changes in v4:
- Complete redesign based on reviewer feedback
- trackpoint.c: Simplified to only enable doubletap by default
- trackpoint.c: Removed all sysfs attributes and global variables
- trackpoint.c: Uses firmware ID detection with deny list
- thinkpad_acpi.c: Added simple sysfs interface for event filtering
- thinkpad_acpi.c: Uses clear naming (doubletap_filter)
- thinkpad_acpi.c: No cross-driver dependencies
- Documentation: Updated to reflect simplified sysfs approach

Changes in v3:
- No changes

Changes in v2:
- Improved commit messages
- Removed unnecessary comments and debug messages
- Using strstarts() instead of strcmp()
- Modified is_trackpoint_dt_capable()
- Removed _BIT suffix and used BIT() define

This version addresses the core reviewer feedback by:
- Removing dual filtering complexity
- Following KISS principle with clear separation
- Providing immediate functionality without configuration

Vishnu Sankar (3):
  input: trackpoint - Enable doubletap by default on capable devices
  platform/x86: thinkpad_acpi - Add doubletap_filter sysfs interface
  Documentation: thinkpad-acpi - Document doubletap_filter attribute

 .../admin-guide/laptops/thinkpad-acpi.rst     | 20 +++++++
 drivers/input/mouse/trackpoint.c              | 51 ++++++++++++++++++
 drivers/input/mouse/trackpoint.h              |  5 ++
 drivers/platform/x86/lenovo/thinkpad_acpi.c   | 54 +++++++++++++++++--
 4 files changed, 125 insertions(+), 5 deletions(-)

-- 
2.51.0

