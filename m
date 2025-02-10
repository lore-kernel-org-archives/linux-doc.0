Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD582253A1
	for <linux-doc@vger.kernel.org>; Sun,  9 Feb 2025 23:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739142586; cv=none; b=NsCF23bUI3bnVmRp2NvxD8b5f4qrhj6Hy7vp1tqdR1u0x/copXuSzHTDqWg3vWOttx/hc2AtBf2HojLmCl8wUPE14FyVxF/rcvAoBkw04jpZ/usqsGG3uoJs3CORg5Tv/RLgJZMKRssHN6/ChOY1EreZ7NQJLPGXEnwQQhDHnCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739142586; c=relaxed/simple;
	bh=OwyNbHzr6nbf0VNQwpYxaf2tsXgpqdF70EqeajHRFx4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QZX9l3wGWDz2QiWLgGM0lyH69ha6sKwZOne3JbTloFSAd2ymwo8l5kdgEzAUbM6UdcjSA3prGWkMUyPrz+8cL1L6SUzVbuCu0739VfA8jdXl+d0LKHIY86g+wfqnkOhOkxBqPB8LNYNYtc68V2+aWlV8g+F/FElOZoO9uCftlsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHk1oa4X; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHk1oa4X"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21f49837d36so38625995ad.3
        for <linux-doc@vger.kernel.org>; Sun, 09 Feb 2025 15:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739142584; x=1739747384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IRtpFSrOe0YUFBCGtZKy2pmvQABInQf8jn/zl5yH35c=;
        b=FHk1oa4XRKIEHrBu6GRENhh9k1eAs8LR9IzHAeuG1fLh0QI98Mw/hdilVJa1HCfUWH
         b+SOnHG1om9Sep6A0EMBrjlW7Fy49hII32pBX039C9SFerKBSwp9yde6cNdds7NvmpTX
         OsQHTF5MGY1wH3I/eZYhzXFhZAjgvOC4uUNEpC2RpVbhOPrYHgJdA6OLnf2wXBmIIbNv
         PhtOhflaM6YOt5HgYMNqTQhbOaYugrZFMGhNjIf19XYRnF+DArBibqrhY7Qvaaj4MTz+
         zPmyKJ+31d+qHSOlNytqRRtDy7X9NpNYMsIQTML1HkrxRlGyDcIEnerxmfEhI9t8llk2
         LWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739142584; x=1739747384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IRtpFSrOe0YUFBCGtZKy2pmvQABInQf8jn/zl5yH35c=;
        b=aBpVx3WHaKSgM1yApCn3GbS4u4Nvn3DcxjenQd/dcGa0ukbC9Jwu0IIDP8thRpv6Vi
         UdeJzDxOm1z3YPfs+CBfdtlgAuSVoPfgHZAb/PWNL5YRurJd9wB8z+leqfmjvWZDQvNO
         2rXILQThF4AzCgYhWWqhzUr9lWeNnbddR0Lvfh5bI9v2dAdo+cLBx5Gd/n0wqqzNRQ2r
         KmKZcG/P4QgwCuRqavdGY4vXAsjjMOqRPqmojTTmEFUcdhBVeB7yfNJlXvJAT3qoMYs+
         mGbwiTf3dqisgJr4BvwtKKm9fgGcn/Zk+szKVuz0dwUVKfOqLmInU52R4lWK7qlh17VP
         k+Yw==
X-Gm-Message-State: AOJu0Yy5Zvr+cIzNkqLUrD9aR7pKdfz451UtEcLJ1sySE9ilZgEJt0D/
	rl/L82VJRDPxpi0oKKAKlSnHbk18wwna2yL/OIrZMZRHpxL/OQCfkU2K8L4K
X-Gm-Gg: ASbGncvutGfJJPN4qp71TcsnN2FGKlgtTHyGQuizm9xLdGe0CpxEeNjJPy32i3ymGrC
	Hj5RgJeu4e5Njv4tG+/8Pvv6VGElJsUJBOlOJRRH18Z+Ii3yupXlwEmr7cpFsa30J54+Ah+EH6X
	Kx8xPyTYxdcdIly6yfwFGh70e7OhbzZcRqluLwN2hML5JI8Qd+NG3a7t1X6O68CmmxAerJTyflE
	Nbue309CfhoKDxTYRg3PQK40m5zDIp/b9csZhEyy2vXKND/y/zlixHU3uXE1fwZhycwCRR9djq6
	QvsRGAEYAQ9VC1AwnysrNpTDqimexk1wUEdAB7zEYB8wXy08
X-Google-Smtp-Source: AGHT+IEsXaLhAw+BdeFLmr3E9pcj0NZRRv1NE6e2LnmnpRHBIst/JH+s4wYziF17uy1EPreJMNESyw==
X-Received: by 2002:a17:902:da8e:b0:21f:98fc:8421 with SMTP id d9443c01a7336-21f98fc85e7mr21974615ad.50.1739142583722;
        Sun, 09 Feb 2025 15:09:43 -0800 (PST)
Received: from ritvikos.localdomain ([2405:201:5501:4115:fd74:2c07:b6e:c967])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f368d8ccbsm65615965ad.255.2025.02.09.15.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 15:09:43 -0800 (PST)
Received: by ritvikos.localdomain (Postfix, from userid 1000)
	id 43898140645; Mon, 10 Feb 2025 04:39:37 +0000 (UTC)
From: ritvikfoss@gmail.com
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] documentation/filesystems: fix spelling mistakes
Date: Mon, 10 Feb 2025 04:39:37 +0000
Message-ID: <20250210043937.30952-1-ritvikfoss@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ritvik Gupta <ritvikfoss@gmail.com>

Corrected the following spelling mistakes,
based on the suggestions by codespell:

1. Optionaly   -> Optionally
2. prefereable -> preferable
3. peformance  -> performance
4. ontext      -> context
5. failuer     -> failure
6. poiners     -> pointers
7. realtively  -> relatively
8. uptream     -> upstream

Thanks for your time!
Regards Ritvik

Signed-off-by: Ritvik Gupta <ritvikfoss@gmail.com>
---
 Documentation/filesystems/9p.rst                              | 2 +-
 Documentation/filesystems/bcachefs/SubmittingPatches.rst      | 4 ++--
 Documentation/filesystems/coda.rst                            | 2 +-
 Documentation/filesystems/debugfs.rst                         | 2 +-
 Documentation/filesystems/netfs_library.rst                   | 2 +-
 Documentation/filesystems/xfs/xfs-delayed-logging-design.rst  | 2 +-
 .../filesystems/xfs/xfs-maintainer-entry-profile.rst          | 2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/filesystems/9p.rst b/Documentation/filesystems/9p.rst
index 2bbf68b56b0d..3078f3c9256a 100644
--- a/Documentation/filesystems/9p.rst
+++ b/Documentation/filesystems/9p.rst
@@ -90,7 +90,7 @@ Just start the 9pfs capable network server like diod/nfs-ganesha e.g.::

         $ diod -f -n -d 0 -S -l 0.0.0.0:9999 -e $PWD

-Optionaly scan your bus if there are more then one usbg gadgets to find their path::
+Optionally scan your bus if there are more then one usbg gadgets to find their path::

         $ python $kernel_dir/tools/usb/p9_fwd.py list

diff --git a/Documentation/filesystems/bcachefs/SubmittingPatches.rst b/Documentation/filesystems/bcachefs/SubmittingPatches.rst
index 026b12ae0d6a..4b79ca58faf2 100644
--- a/Documentation/filesystems/bcachefs/SubmittingPatches.rst
+++ b/Documentation/filesystems/bcachefs/SubmittingPatches.rst
@@ -30,7 +30,7 @@ CI:
 ===

 Instead of running your tests locally, when running the full test suite it's
-prefereable to let a server farm do it in parallel, and then have the results
+preferable to let a server farm do it in parallel, and then have the results
 in a nice test dashboard (which can tell you which failures are new, and
 presents results in a git log view, avoiding the need for most bisecting).

@@ -68,7 +68,7 @@ Other things to think about:
   land - use them. Use them judiciously, and not as a replacement for proper
   error handling, but use them.

-- Does it need to be performance tested? Should we add new peformance counters?
+- Does it need to be performance tested? Should we add new performance counters?

   bcachefs has a set of persistent runtime counters which can be viewed with
   the 'bcachefs fs top' command; this should give users a basic idea of what
diff --git a/Documentation/filesystems/coda.rst b/Documentation/filesystems/coda.rst
index bdde7e4e010b..0db3c83a50e5 100644
--- a/Documentation/filesystems/coda.rst
+++ b/Documentation/filesystems/coda.rst
@@ -141,7 +141,7 @@ kernel support.
   a process P which accessing a Coda file. It makes a system call which
   traps to the OS kernel. Examples of such calls trapping to the kernel
   are ``read``, ``write``, ``open``, ``close``, ``create``, ``mkdir``,
-  ``rmdir``, ``chmod`` in a Unix ontext.  Similar calls exist in the Win32
+  ``rmdir``, ``chmod`` in a Unix context.  Similar calls exist in the Win32
   environment, and are named ``CreateFile``.

   Generally the operating system handles the request in a virtual
diff --git a/Documentation/filesystems/debugfs.rst b/Documentation/filesystems/debugfs.rst
index f7f977ffbf8d..610f718ef8b5 100644
--- a/Documentation/filesystems/debugfs.rst
+++ b/Documentation/filesystems/debugfs.rst
@@ -220,7 +220,7 @@ There are a couple of other directory-oriented helper functions::

 A call to debugfs_change_name() will give a new name to an existing debugfs
 file, always in the same directory.  The new_name must not exist prior
-to the call; the return value is 0 on success and -E... on failuer.
+to the call; the return value is 0 on success and -E... on failure.
 Symbolic links can be created with debugfs_create_symlink().

 There is one important thing that all debugfs users must take into account:
diff --git a/Documentation/filesystems/netfs_library.rst b/Documentation/filesystems/netfs_library.rst
index 73f0bfd7e903..3886c14f89f4 100644
--- a/Documentation/filesystems/netfs_library.rst
+++ b/Documentation/filesystems/netfs_library.rst
@@ -515,7 +515,7 @@ The methods defined in the table are:
    the cache to expand a request in either direction.  This allows the cache to
    size the request appropriately for the cache granularity.

-   The function is passed poiners to the start and length in its parameters,
+   The function is passed pointers to the start and length in its parameters,
    plus the size of the file for reference, and adjusts the start and length
    appropriately.  It should return one of:

diff --git a/Documentation/filesystems/xfs/xfs-delayed-logging-design.rst b/Documentation/filesystems/xfs/xfs-delayed-logging-design.rst
index 6402ab8e370c..2a2705e975e8 100644
--- a/Documentation/filesystems/xfs/xfs-delayed-logging-design.rst
+++ b/Documentation/filesystems/xfs/xfs-delayed-logging-design.rst
@@ -219,7 +219,7 @@ The log is circular, so the positions in the log are defined by the combination
 of a cycle number - the number of times the log has been overwritten - and the
 offset into the log.  A LSN carries the cycle in the upper 32 bits and the
 offset in the lower 32 bits. The offset is in units of "basic blocks" (512
-bytes). Hence we can do realtively simple LSN based math to keep track of
+bytes). Hence we can do relatively simple LSN based math to keep track of
 available space in the log.

 Log space accounting is done via a pair of constructs called "grant heads".  The
diff --git a/Documentation/filesystems/xfs/xfs-maintainer-entry-profile.rst b/Documentation/filesystems/xfs/xfs-maintainer-entry-profile.rst
index 32b6ac4ca9d6..ce4584fb3103 100644
--- a/Documentation/filesystems/xfs/xfs-maintainer-entry-profile.rst
+++ b/Documentation/filesystems/xfs/xfs-maintainer-entry-profile.rst
@@ -93,7 +93,7 @@ others on a regular basis about burnout.
   sponsoring work on any part of XFS.

 - **LTS Maintainer**: Someone who backports and tests bug fixes from
-  uptream to the LTS kernels.
+  upstream to the LTS kernels.
   There tend to be six separate LTS trees at any given time.

   The maintainer for a given LTS release should identify themselves with an
--
2.43.0

