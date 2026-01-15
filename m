Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7BF32573A
	for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 23:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768518075; cv=none; b=MIaEc2iu8tgIJO8lRaezbva3tMUyOQQjjZKdbd0nyKCSKWjEhjgpsglUgu34t9c+fgUlL/LL2VupiLaeAddlBqHjx61r6ojv2HM09rYpLElIZr8txa0rAzwCzyaE1zLy8/1sxK3s9cj1IZYiX09o99C1kH9e1Y4lugNxMXx5G3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768518075; c=relaxed/simple;
	bh=O1SOduE0DYFh6BNYxm/AuK/BA9hlofbKv0VAN9Oty/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iGKj+6DojYEoWuuvkJwhRbVVkRI6Oxy1hzrLnhnFh1C6zKliSSmDLcl/AF/k6B4GMfnnwL6m6MHv1yUefeAU6GUbncNiwqvQe57Po9P1WfZJU0YBDrCvHBuDPH4vsWyOoSkwMJHUQFqJccKiek/36JmN7JwQxTOg4t4oR7Mk7sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cpkqvTSF; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cpkqvTSF"
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-b870732cce2so225099866b.3
        for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 15:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768518072; x=1769122872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=krP/FuWU72zzkZjjFgAKrPUHg8xQJchUgVLFOs4NnHI=;
        b=cpkqvTSFn6H9N4usZhlK83kQ35mFYS1iS8vrMApR9vmyMpf8QkkCKkKsbnQBB6lwgC
         FoHaMRd66gys0yWyd3cqDCi0OgejgcQupj5meFQuwQzb/3MYCTRTjOsNTzPQh5AdS3Ct
         aiANl6ptAnR94b7u+A3jA0N3I2xlbTzZqDNIu2b3ZA2c2luFsWzW7K+4jXJDPNOVsy9G
         sC5LoyNqqjs4a7r7EMGcRgCvW667XuWFsiC3erWg5upVeu2ddLkAxOmp5q6HD/Kr1WnD
         fdL+U89WHM8b2EAN6xgr7BBpgonmAUdZC+QkW3IkVg2BvSt9DPzJPuBwaKb/JRm7R7EN
         WmiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768518072; x=1769122872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=krP/FuWU72zzkZjjFgAKrPUHg8xQJchUgVLFOs4NnHI=;
        b=wh9FI5TRGwhBeJrpnqG+nOOVDSFhLPvWooSrZpIqZ1HIHjQ3PWeDwCtjQOP98biA+l
         FggtmJgRmcaGxQ3tJzMB8809m3P1n8kumPyLdo3kZENZlj3wzgKpUmTYTW3VpAmDWtxU
         mbm4jMOkJwFOmtX9KW7qd02GmJEubYP/KyiaGuaNJpzCPiL3GCrp3X8PZX5Ov/gMxJex
         uZqEpI6LiGcpw/cUTwoAgQzFav3mZUIJtcz2JhNmpPP85MECmSWFaXmdfxxnVPlgbENs
         2gC/0kjjhrtIikhFpIOHKWNb6cgvAAqLqB4HdFgABxRt/xDXea+27lTl95gp2vudF1Tu
         vgYQ==
X-Gm-Message-State: AOJu0YyimDaE8ySiEintxZwNoUCgusWsfNgF32cmE1PGb6uDY6jerWBZ
	8pkSFauQwOKlnKvioSTg+QMv98aS92Hm8pYab/b7k48BGBqXYBX9D6fyBRShz3WA
X-Gm-Gg: AY/fxX6WtWJQ2syrRL2YUQN/N/9nrvqTH+hsXb7V/9mp7177pZOk7Mo6dRWYdbjKYCN
	uv6Fy5aVjpKlcMMg8zIJdZ8rBBOY0/OnGU1/FGIKOqDYt/SSz++hn5g5iBbneRTWZQuoffVpKB5
	i4S6hnF9Xm6Hzn9OEbvqAXURvs/pY9JPjcUpi77syX12WqgPZJ2vTfQngeVzdzfOGBWTXb7ZCSt
	k+Z2lGeGfKyR/wQr2iooWN9jWnnzwtWyFgBy6FilPT1bu7T2uh+MIW9SICvJrERKhZgiFRUM2pE
	kfTU51BhWaZOnZHiEMAcj/vbUIXc1V6FyUt8s3n07AeWbrFB1FpqR0Lwmbs5ZUjR7fePZn4Uz0J
	7C1iQkPf1gGroVgLbmN4InK40BKJHJ21JaAl4R+ulD3Onf/6Qw0kSPtgcShtxVPiCBR16RlOvR3
	zPgbkiu4SsmG9y2/Gvo9H/pMHnqt3667ueD36CjKbNVdwIW+xJ+TNb2zgiaY+xYwRwEi9XSthOh
	hQIfna2Uz4L4wxs7e996nI1jwLcxddXUSL6cIc45tOQiH8he321D4wRbCCjXOmEmCPX6M5kT6h6
	N0HZN7h+lgCYVy15rUHmFLAFWlb3x7Qv3Ho=
X-Received: by 2002:a17:906:2099:b0:b87:7042:9aea with SMTP id a640c23a62f3a-b87968f610fmr40722666b.18.1768518071328;
        Thu, 15 Jan 2026 15:01:11 -0800 (PST)
Received: from MacBookPro.speedport.ip (p200300e927012f53d1aa14657f634ea0.dip0.t-ipconnect.de. [2003:e9:2701:2f53:d1aa:1465:7f63:4ea0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795168b2esm63853066b.17.2026.01.15.15.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 15:01:11 -0800 (PST)
From: Nauman Sabir <officialnaumansabir@gmail.com>
To: linux-doc@vger.kernel.org
Cc: corbet@lwn.net,
	tj@kernel.org,
	Nauman Sabir <officialnaumansabir@gmail.com>
Subject: [PATCH v4] Documentation: Fix typos and grammatical errors
Date: Fri, 16 Jan 2026 00:01:10 +0100
Message-ID: <20260115230110.7734-1-officialnaumansabir@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix various typos and grammatical errors across documentation files:

- Fix missing preposition 'in' in process/changes.rst
- Correct 'result by' to 'result from' in admin-guide/README.rst
- Fix 'before hand' to 'beforehand' in cgroup-v1/hugetlb.rst
- Correct 'allows to limit' to 'allows limiting' in hugetlb.rst,
  cgroup-v2.rst, and kconfig-language.rst
- Fix 'needs precisely know' to 'needs to precisely know'
- Correct 'overcommited' to 'overcommitted' in hugetlb.rst
- Fix subject-verb agreement: 'never causes' to 'never cause'
- Fix 'there is enough' to 'there are enough' in hugetlb.rst
- Fix 'metadatas' to 'metadata' in filesystems/erofs.rst
- Fix 'hardwares' to 'hardware' in scsi/ChangeLog.sym53c8xx

Signed-off-by: Nauman Sabir <officialnaumansabir@gmail.com>
---
Resending as a standalone patch. Apologies for the confusion caused by
the previous submission, which was incorrectly sent as part of a 3-patch
series. Each patch targets a different subsystem and should be reviewed
and applied independently. Please ignore the previous submission:
<20260112160820.19075-1-officialnaumansabir@gmail.com>

 Documentation/admin-guide/README.rst           |  2 +-
 .../admin-guide/cgroup-v1/hugetlb.rst          | 18 +++++++++---------
 Documentation/admin-guide/cgroup-v2.rst        |  2 +-
 Documentation/filesystems/erofs.rst            |  2 +-
 Documentation/kbuild/kconfig-language.rst      |  2 +-
 Documentation/process/changes.rst              |  2 +-
 Documentation/scsi/ChangeLog.sym53c8xx         |  2 +-
 7 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
index 05301f03b717..77fec1de6dc8 100644
--- a/Documentation/admin-guide/README.rst
+++ b/Documentation/admin-guide/README.rst
@@ -53,7 +53,7 @@ Documentation
    these typically contain kernel-specific installation notes for some
    drivers for example. Please read the
    :ref:`Documentation/process/changes.rst <changes>` file, as it
-   contains information about the problems, which may result by upgrading
+   contains information about the problems which may result from upgrading
    your kernel.

 Installing the kernel source
diff --git a/Documentation/admin-guide/cgroup-v1/hugetlb.rst b/Documentation/admin-guide/cgroup-v1/hugetlb.rst
index 493a8e386700..b5f3873b7d3a 100644
--- a/Documentation/admin-guide/cgroup-v1/hugetlb.rst
+++ b/Documentation/admin-guide/cgroup-v1/hugetlb.rst
@@ -77,7 +77,7 @@ control group and enforces the limit during page fault. Since HugeTLB
 doesn't support page reclaim, enforcing the limit at page fault time implies
 that, the application will get SIGBUS signal if it tries to fault in HugeTLB
 pages beyond its limit. Therefore the application needs to know exactly how many
-HugeTLB pages it uses before hand, and the sysadmin needs to make sure that
+HugeTLB pages it uses beforehand, and the sysadmin needs to make sure that
 there are enough available on the machine for all the users to avoid processes
 getting SIGBUS.

@@ -91,23 +91,23 @@ getting SIGBUS.
   hugetlb.<hugepagesize>.rsvd.usage_in_bytes
   hugetlb.<hugepagesize>.rsvd.failcnt

-The HugeTLB controller allows to limit the HugeTLB reservations per control
+The HugeTLB controller allows limiting the HugeTLB reservations per control
 group and enforces the controller limit at reservation time and at the fault of
 HugeTLB memory for which no reservation exists. Since reservation limits are
-enforced at reservation time (on mmap or shget), reservation limits never causes
-the application to get SIGBUS signal if the memory was reserved before hand. For
+enforced at reservation time (on mmap or shget), reservation limits never cause
+the application to get SIGBUS signal if the memory was reserved beforehand. For
 MAP_NORESERVE allocations, the reservation limit behaves the same as the fault
 limit, enforcing memory usage at fault time and causing the application to
 receive a SIGBUS if it's crossing its limit.

 Reservation limits are superior to page fault limits described above, since
 reservation limits are enforced at reservation time (on mmap or shget), and
-never causes the application to get SIGBUS signal if the memory was reserved
-before hand. This allows for easier fallback to alternatives such as
+never cause the application to get SIGBUS signal if the memory was reserved
+beforehand. This allows for easier fallback to alternatives such as
 non-HugeTLB memory for example. In the case of page fault accounting, it's very
-hard to avoid processes getting SIGBUS since the sysadmin needs precisely know
-the HugeTLB usage of all the tasks in the system and make sure there is enough
-pages to satisfy all requests. Avoiding tasks getting SIGBUS on overcommited
+hard to avoid processes getting SIGBUS since the sysadmin needs to precisely know
+the HugeTLB usage of all the tasks in the system and make sure there are enough
+pages to satisfy all requests. Avoiding tasks getting SIGBUS on overcommitted
 systems is practically impossible with page fault accounting.


diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 7f5b59d95fce..098d6831b3c0 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2816,7 +2816,7 @@ DMEM Interface Files
 HugeTLB
 -------

-The HugeTLB controller allows to limit the HugeTLB usage per control group and
+The HugeTLB controller allows limiting the HugeTLB usage per control group and
 enforces the controller limit during page fault.

 HugeTLB Interface Files
diff --git a/Documentation/filesystems/erofs.rst b/Documentation/filesystems/erofs.rst
index 08194f194b94..e61db115e762 100644
--- a/Documentation/filesystems/erofs.rst
+++ b/Documentation/filesystems/erofs.rst
@@ -154,7 +154,7 @@ to be as simple as possible::
   0 +1K

 All data areas should be aligned with the block size, but metadata areas
-may not. All metadatas can be now observed in two different spaces (views):
+may not. All metadata can be now observed in two different spaces (views):

  1. Inode metadata space

diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index abce88f15d7c..7067ec3f0011 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -216,7 +216,7 @@ applicable everywhere (see syntax).

 - numerical ranges: "range" <symbol> <symbol> ["if" <expr>]

-  This allows to limit the range of possible input values for int
+  This allows limiting the range of possible input values for int
   and hex symbols. The user can only input a value which is larger than
   or equal to the first symbol and smaller than or equal to the second
   symbol.
diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 62951cdb13ad..0cf97dbab29d 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -218,7 +218,7 @@ DevFS has been obsoleted in favour of udev
 Linux documentation for functions is transitioning to inline
 documentation via specially-formatted comments near their
 definitions in the source.  These comments can be combined with ReST
-files the Documentation/ directory to make enriched documentation, which can
+files in the Documentation/ directory to make enriched documentation, which can
 then be converted to PostScript, HTML, LaTex, ePUB and PDF files.
 In order to convert from ReST format to a format of your choice, you'll need
 Sphinx.
diff --git a/Documentation/scsi/ChangeLog.sym53c8xx b/Documentation/scsi/ChangeLog.sym53c8xx
index 3435227a2bed..6bca91e03945 100644
--- a/Documentation/scsi/ChangeLog.sym53c8xx
+++ b/Documentation/scsi/ChangeLog.sym53c8xx
@@ -3,7 +3,7 @@ Sat May 12 12:00 2001 Gerard Roudier (groudier@club-internet.fr)
 	- Ensure LEDC bit in GPCNTL is cleared when reading the NVRAM.
 	  Fix sent by Stig Telfer <stig@api-networks.com>.
 	- Backport from SYM-2 the work-around that allows to support
-	  hardwares that fail PCI parity checking.
+	  hardware that fails PCI parity checking.
 	- Check that we received at least 8 bytes of INQUIRY response
 	  for byte 7, that contains device capabilities, to be valid.
 	- Define scsi_set_pci_device() as nil for kernel < 2.4.4.
--
2.52.0

