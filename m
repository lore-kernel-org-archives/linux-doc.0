Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04662FDC31
	for <linux-doc@vger.kernel.org>; Tue, 12 Aug 2025 17:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755020409; cv=none; b=N9wncrtMsMrla+Lmb3f8ZTWDge516NRcxKi/kcfsakjZKjK74fCYgjviyaQ1wfarmly03nnCHq7ZdbHK/wBMbVl12n/C6tvc6HhPJ+bhbatOx9sdykpMzddgJVOQWcU0v4kFyQ6C4pnVZ6TbtOFwUt6L96RN7yvW0iqlYut5ZMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755020409; c=relaxed/simple;
	bh=TocwVLOEB5XV1gbfP3Auy1jcleuECYNnrJVj3OjWh6A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Xl3HcwOqiziQB2GR1ANK2s582jFLcJzWQtqpOzhuAEuPVXiSrHlUzlmrMiPfOjW5dOs7XJwpiC4H7IDj6u2739VXF5VYpSmxAILW4CNUBwekSrU3mFNL7hAH0frOQN6By9NVKnPFw0GFcA1a+naF83sYhdDX4BLGbDUti4g7mPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akOJKZD7; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akOJKZD7"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-76bd9d723bfso5045928b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 12 Aug 2025 10:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755020407; x=1755625207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yyx7QBE1HdTMr+wK3W6o508v+6XZUO5YXF3fJFpQ8Lg=;
        b=akOJKZD7c2jZtdKm7PIrjfRUwiqyzjK/N1LtmF3UW34zr39qC04IchKVzx8Xsiy9sc
         iFNFl6EFEsIgC2h9j7gY707vZKAEdLUpzGZaOUAxtgTY6I+d2/kgYKPhNj2QdrZu3dKe
         ieaa9XomTon2caJvv6IlcASb/NDzeS1XXAgK3KwsW3eg3pr2efmFwa2wXIWvyiiGbJNa
         YPE/UYukctWku8zfKVzYRRaQRjEHDHLdkve/7wL1dCtslfv9pcCRUTCgTc3vBPuDsK08
         zpv2zAgelDmZau+tEqy8XYMlHBXheGjGXwEfS/GpOgDmBoGh2Rr9WEAXsCOXEjbLTEef
         lxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755020407; x=1755625207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yyx7QBE1HdTMr+wK3W6o508v+6XZUO5YXF3fJFpQ8Lg=;
        b=LXlJlVDVl9+Art73bTR5G5FGTKSnYfZQ6eUwp3u1XOeqvYhKGfvhRCfH6O6k8UCrzo
         pkMUvBs6RHFMUKG3PDZZKepVdJkpQAUxCvTij4RuwDkxRO+kB6ZqahM9yYSQOKjrTzGE
         UDYfWQ5RRnb1nHuz2+SiOBF4IEO49GvrU9+8Ic6vioD6K7AaQ0vBf28/kws1ocbgPund
         lsLE59jjKSyGpSVRL1k4AEboh6sKZmmeHpMjW/tkstajiAh+wm56yuNZTVRUTvCSTUHq
         uTR6sjV6ebQXkpuxcSIHknczH+75BJtEt8wY4sHQS7HVnQVeIByVcIbW9BA9ifYj4pMU
         ywKg==
X-Gm-Message-State: AOJu0YzpyueIh0fcPehgA4t7EpihHTeaB1SCFkyVCiCFrgEqifDJFXJO
	j3Sjtyndv3AIADXCpXRB1vrLPDuLk3THSb6N+B71R9a9ra8Ify+zeP3UANsp7sT0zvA=
X-Gm-Gg: ASbGncsLwAbuZKIay3pcRmW24pPq7DTQXlSCzd5RqgvI2qD2G1kPGN92YoiDx6BISGA
	mb9uhw/xsAbQtjcNlftn5JUNRdZDjocRRT7j2DOdJ8MHMkRu8d8QQbYEkBFTLV2qzI7tXZmAuVv
	3GrcwISRI4dHqBrwFM8zd439lX0MUtmL20HoaHlSnhUGlcq0Z4k2ur11iAZMG2IJl5AxD2qDmSU
	WRD7g3tkK7cfIFaZpUHMtNtiNHm1cDOtotN/ryIxpS6OfV5cLWD7DqFKEs6RUPtmr2WcmTkQu6C
	ZATV/lar5Wmibss6VZUcJkygZoENex9eZ4gy7tvuzASjksn2BMOp2ERAbTNkfvhsiNmwlCmMdvx
	o9HmOWEKF2vjl9+8RU0eIEytDMsPm0XM3Ohdp7nwSPQ==
X-Google-Smtp-Source: AGHT+IGOeIXoT0DNozfxYJyFMhODlnRgCfgda7DRTMqeWV97DgXp1NykiFOe5OZ+vBQ47Y9zL5xJyw==
X-Received: by 2002:a17:903:fab:b0:235:c9a7:d5f5 with SMTP id d9443c01a7336-2430d0c9b8emr888825ad.13.1755020406364;
        Tue, 12 Aug 2025 10:40:06 -0700 (PDT)
Received: from soham-laptop.. ([103.182.158.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f0e9bdsm303688995ad.53.2025.08.12.10.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 10:40:05 -0700 (PDT)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	jaegeuk@kernel.org,
	chao@kernel.org,
	dlemoal@kernel.org,
	hch@lst.de,
	tj@kernel.org,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	agk@redhat.com,
	snitzer@kernel.org,
	mpatocka@redhat.com,
	kuurtb@gmail.com,
	sj@kernel.org,
	corbet@lwn.net,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	Soham Metha <sohammetha01@gmail.com>
Subject: [PATCH] docs: fix spelling mistakes across multiple directories
Date: Tue, 12 Aug 2025 23:09:03 +0530
Message-Id: <20250812173903.43333-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Used codespell to detect spelling mistakes across 5 directories

- Documentation/ABI
- Documentation/accel
- Documentation/accounting
- Documentation/admin-guide
- Documentation/arch

and fixed various simple typos found after filtering out the 
abbreviations, names, and non-english words.

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
Specific changes:
 - deivces → devices
 - intiating → initiating
 - conventioanl → conventional
 - directoy → directory
 - flushs → flushes
 - explicitely → explicitly
 - aproximate → approximate
 - entension → extension

 Documentation/ABI/testing/sysfs-fs-f2fs             | 4 ++--
 Documentation/admin-guide/blockdev/zoned_loop.rst   | 4 ++--
 Documentation/admin-guide/cgroup-v2.rst             | 2 +-
 Documentation/admin-guide/device-mapper/delay.rst   | 8 ++++----
 Documentation/admin-guide/laptops/alienware-wmi.rst | 2 +-
 Documentation/admin-guide/mm/damon/usage.rst        | 2 +-
 Documentation/admin-guide/tainted-kernels.rst       | 2 +-
 Documentation/arch/loongarch/irq-chip-model.rst     | 2 +-
 8 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index bc0e7fefc39d..1ccd8ef1dc65 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -822,8 +822,8 @@ What:		/sys/fs/f2fs/<disk>/gc_valid_thresh_ratio
 Date:		September 2024
 Contact:	"Daeho Jeong" <daehojeong@google.com>
 Description:	It controls the valid block ratio threshold not to trigger excessive GC
-		for zoned deivces. The initial value of it is 95(%). F2FS will stop the
-		background GC thread from intiating GC for sections having valid blocks
+		for zoned devices. The initial value of it is 95(%). F2FS will stop the
+		background GC thread from initiating GC for sections having valid blocks
 		exceeding the ratio.
 
 What:		/sys/fs/f2fs/<disk>/max_read_extent_count
diff --git a/Documentation/admin-guide/blockdev/zoned_loop.rst b/Documentation/admin-guide/blockdev/zoned_loop.rst
index 9c7aa3b482f3..2d50d081592b 100644
--- a/Documentation/admin-guide/blockdev/zoned_loop.rst
+++ b/Documentation/admin-guide/blockdev/zoned_loop.rst
@@ -77,9 +77,9 @@ capacity_mb        Device total capacity in MiB. This is always rounded up to
 zone_size_mb       Device zone size in MiB. Default: 256 MiB.
 zone_capacity_mb   Device zone capacity (must always be equal to or lower than
                    the zone size. Default: zone size.
-conv_zones         Total number of conventioanl zones starting from sector 0.
+conv_zones         Total number of conventional zones starting from sector 0.
                    Default: 8.
-base_dir           Path to the base directoy where to create the directory
+base_dir           Path to the base directory where to create the directory
                    containing the zone files of the device.
                    Default=/var/local/zloop.
                    The device directory containing the zone files is always
diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index d9d3cc7df348..29172f03b863 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -435,7 +435,7 @@ both cgroups.
 Controlling Controllers
 -----------------------
 
-Availablity
+Availability
 ~~~~~~~~~~~
 
 A controller is available in a cgroup when it is supported by the kernel (i.e.,
diff --git a/Documentation/admin-guide/device-mapper/delay.rst b/Documentation/admin-guide/device-mapper/delay.rst
index 4d667228e744..a1e673c0e782 100644
--- a/Documentation/admin-guide/device-mapper/delay.rst
+++ b/Documentation/admin-guide/device-mapper/delay.rst
@@ -3,7 +3,7 @@ dm-delay
 ========
 
 Device-Mapper's "delay" target delays reads and/or writes
-and/or flushs and optionally maps them to different devices.
+and/or flushes and optionally maps them to different devices.
 
 Arguments::
 
@@ -18,7 +18,7 @@ Table line has to either have 3, 6 or 9 arguments:
    to write and flush operations on optionally different write_device with
    optionally different sector offset
 
-9: same as 6 arguments plus define flush_offset and flush_delay explicitely
+9: same as 6 arguments plus define flush_offset and flush_delay explicitly
    on/with optionally different flush_device/flush_offset.
 
 Offsets are specified in sectors.
@@ -40,7 +40,7 @@ Example scripts
 	#!/bin/sh
 	#
 	# Create mapped device delaying write and flush operations for 400ms and
-	# splitting reads to device $1 but writes and flushs to different device $2
+	# splitting reads to device $1 but writes and flushes to different device $2
 	# to different offsets of 2048 and 4096 sectors respectively.
 	#
 	dmsetup create delayed --table "0 `blockdev --getsz $1` delay $1 2048 0 $2 4096 400"
@@ -48,7 +48,7 @@ Example scripts
 ::
 	#!/bin/sh
 	#
-	# Create mapped device delaying reads for 50ms, writes for 100ms and flushs for 333ms
+	# Create mapped device delaying reads for 50ms, writes for 100ms and flushes for 333ms
 	# onto the same backing device at offset 0 sectors.
 	#
 	dmsetup create delayed --table "0 `blockdev --getsz $1` delay $1 0 50 $2 0 100 $1 0 333"
diff --git a/Documentation/admin-guide/laptops/alienware-wmi.rst b/Documentation/admin-guide/laptops/alienware-wmi.rst
index 27a32a8057da..e532c60db8e2 100644
--- a/Documentation/admin-guide/laptops/alienware-wmi.rst
+++ b/Documentation/admin-guide/laptops/alienware-wmi.rst
@@ -105,7 +105,7 @@ information.
 
 Manual fan control on the other hand, is not exposed directly by the AWCC
 interface. Instead it let's us control a fan `boost` value. This `boost` value
-has the following aproximate behavior over the fan pwm:
+has the following approximate behavior over the fan pwm:
 
 ::
 
diff --git a/Documentation/admin-guide/mm/damon/usage.rst b/Documentation/admin-guide/mm/damon/usage.rst
index ff3a2dda1f02..5cd42d428c89 100644
--- a/Documentation/admin-guide/mm/damon/usage.rst
+++ b/Documentation/admin-guide/mm/damon/usage.rst
@@ -357,7 +357,7 @@ The directory for the :ref:`quotas <damon_design_damos_quotas>` of the given
 DAMON-based operation scheme.
 
 Under ``quotas`` directory, four files (``ms``, ``bytes``,
-``reset_interval_ms``, ``effective_bytes``) and two directores (``weights`` and
+``reset_interval_ms``, ``effective_bytes``) and two directories (``weights`` and
 ``goals``) exist.
 
 You can set the ``time quota`` in milliseconds, ``size quota`` in bytes, and
diff --git a/Documentation/admin-guide/tainted-kernels.rst b/Documentation/admin-guide/tainted-kernels.rst
index a0cc017e4424..ed1f8f1e86c5 100644
--- a/Documentation/admin-guide/tainted-kernels.rst
+++ b/Documentation/admin-guide/tainted-kernels.rst
@@ -186,6 +186,6 @@ More detailed explanation for tainting
 
  18) ``N`` if an in-kernel test, such as a KUnit test, has been run.
 
- 19) ``J`` if userpace opened /dev/fwctl/* and performed a FWTCL_RPC_DEBUG_WRITE
+ 19) ``J`` if userspace opened /dev/fwctl/* and performed a FWTCL_RPC_DEBUG_WRITE
      to use the devices debugging features. Device debugging features could
      cause the device to malfunction in undefined ways.
diff --git a/Documentation/arch/loongarch/irq-chip-model.rst b/Documentation/arch/loongarch/irq-chip-model.rst
index a7ecce11e445..94ed2858a570 100644
--- a/Documentation/arch/loongarch/irq-chip-model.rst
+++ b/Documentation/arch/loongarch/irq-chip-model.rst
@@ -139,7 +139,7 @@ Feature EXTIOI_HAS_INT_ENCODE is part of standard EIOINTC. If it is 1, it
 indicates that CPU Interrupt Pin selection can be normal method rather than
 bitmap method, so interrupt can be routed to IP0 - IP15.
 
-Feature EXTIOI_HAS_CPU_ENCODE is entension of V-EIOINTC. If it is 1, it
+Feature EXTIOI_HAS_CPU_ENCODE is extension of V-EIOINTC. If it is 1, it
 indicates that CPU selection can be normal method rather than bitmap method,
 so interrupt can be routed to CPU0 - CPU255.
 
-- 
2.34.1

