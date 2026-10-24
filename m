Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792874378;
	b=t5yBdvUcc+Q0Vv7l/Wu3D4JW4IHnJjZbvUL6Kk1+dzMpusDMfkFdi5VzmEiU5W005vwf
	 6nzJJn4sONfi7559qyw3EqqBvqk5yh2xdk8FyYh3JVQtSsdqZkYJCSC3b6h+Vgk22lnAn
	 KlU5Tgk4L4K+b6yEwMepVcYSU3P+9DK+F6pgJdRB7OmGY/8funb2dhCLKnHRpj7sMO6Da
	 TgiAlGGnsOA4v1hTsW2zPBi4iqha/M1k8FTRdI1oU8bTtIduKWYE8WyGC/70+sStXMFDV
	 kpI5tTPyZ4OnWHvKcnCEFk8I/h1CR7/vS7SKhcbkiIRirzHU1EmIl5EA7P1rA5dhTlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792874378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=IjSiHGQjMHBvlnVEepWUCcgABELupa+mQr5lHVGi+/M=;
	b=OWVffbPdzHTb/b0wiBwENQqhBEj7MiisMjvv4fOSSUcqxoOwYetkgSiK0xM0AbftVL0w
	 LZY5xjxBzK5LGcb6XbYop3BrArBvmVFSGHcWGk6oABuvK9mVZk3A/9qMoNVxjTP2uVqCS
	 QZmoNyMAB9ElJyq0uvtX/N8DqlBQVC5+4WyDhQtBINf6dSwxD/4zxq21hBdkPXkzjZzKf
	 n1ZPIZ14iWndVHtgyGN7szC/waQV5hGUtxbU6hmEB8CH7FYfLEi2K5kmqLDKomrfh4YQg
	 HxcUYTlKM3NuJGXbghv09Ts/laahv/ASZBnL36rpBiFZcSQvCdD1OkhuHUOrNYb5Pfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="ghOihAI/";
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F6D606A31F
	for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 20:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28F6D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ghOihAI/
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-188406bb948so1517173c88.1
        for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 13:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792874377; x=1793479177; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IjSiHGQjMHBvlnVEepWUCcgABELupa+mQr5lHVGi+/M=;
        b=ghOihAI/niEfFdudfKnMpvmID9ulFb6KCy4bYzxqTPKhOY6+TDy1gKg4KftkTONQMx
         Y1254Et39lk13UtL+3kitY1qFdspTFyxgLZVtK2d3uRChUEw5ulzFu0ZFuDHpxH/mPe+
         BWHKiPH/WFDBYCjzlfjcnocAOPagWdFGx9g8BXcbuP61yXMKRND2Is1JJ2vfEdREuUQ6
         Ocbtrf6+W/Ia+RiFMoti45zjKWuEMXMyQXiAHgUodpZ8Waa2KDdULug6HP3ZHOqvXMg+
         iyYqcBAvlZfIWE7u/4oZeSnmG3Ebgrb1zJVB7zhnebeVx9+97RoV/0t2uICfuI1ilUu3
         2+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792874377; x=1793479177;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IjSiHGQjMHBvlnVEepWUCcgABELupa+mQr5lHVGi+/M=;
        b=bqLY4wHVVk49Bcs5UuDlb3mdQ5a4l0r3Noesr/PaS8ioFlBjd2jcmgD/w6Xf8nbpnm
         2nu7HpbeI/mIX7YH4DDoPsUdNSEf2rqfHwYoVrF40pyFqoViIKW8IGw1fw97Iw+eJair
         27uXOzjV4rlkilMc9+6gIb/9F5SPuIcj1oDCGgUXrh1sMUeWPoAqJ92ERulBShTq5eL+
         a+p8r8HXSBrpWCTNV7EFAsBi2fPebY+nP+rfSXLZjumMaXX1ID313rrKBIvyP0uCIktx
         /r//OK5SKm4RDvavE2eZFAYjCuMZKdotNRGiEyicsYuLSpL0zDjdtN5mk0JFMukV0V1i
         I99Q==
X-Forwarded-Encrypted: i=1; AKwUvBzN40bG/ZnVV8O7PCNk1j1ptYJkQZ4p7AytMhPDWdWkd66SJSi3dzgYWXT3fEV+B9q9ipLNmaDFbuk=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+UksE478SE+M+5/xhdEjU5f+iaSItzQB9RUpmT1rHUOHoHmJo
	nhFeU7FcLXtaFLRy6hWdGWVNUlsMP6ZSynn7MeEpdOSbp2t0hQTlYdenR+uHyq5C01c=
X-Gm-Gg: AYBFou1bUBz8TXmVzbJE3Q0M1BLuv70aeg5cqsDsZPAbilWaz+UffbPa5tNT2bdgyvZ
	RfYY3LmgDGQSR6/alVFY6ercQZxGyYf1wF2Su4dL/QZj7Hq9te3XMjW0UejPtRRPR4rLESqodc4
	/l4yZ5m8/HDFCpz4crLxY1+xEFPel7gX9QPqHj8Xwu5vKIvrSNdygJIoDRInWb7iam4L2EVhpz8
	lixrJ+hgzgcuGLiee2xVF/WL4nqkQJcHgKPTyhJC//qGukEmfbIhIoxoLhtb6d9Woopt+HsKCM9
	mEYQ35H2aPOdWdAdOV1g7VsBq40RkA7RwMdZn7X8mUXMWIbsSGY9Q4+62c+S0UJDaSRWvNpZ8te
	cotA/tsppSLj+fIXb5cgmTu+mBOfwbLGddUtSrjnrYMISqHknXXgye8BgOkxlpRVS6yLLB53+6x
	URFW3Dk2doLRHSgBOlX3YyAHJmytoropvxoiI54B5v2HeNkaMDkEy8vum6pBGyrxRipI74XX/yd
	39s/dm15caHIyih1Glau7yNbkAYM8qrbP6UNE+Aml5I0GpgYXDzxWkJcGQDsA==
X-Received: by 2002:a05:7023:881:b0:168:fe32:35a with SMTP id a92af1059eb24-19935be806fmr4264812c88.20.1792874377042;
        Sat, 24 Oct 2026 13:39:37 -0700 (PDT)
Received: from [127.0.0.2] ([73.222.46.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a1bfaf25sm9764737c88.14.2026.10.24.13.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:39:36 -0700 (PDT)
From: Farid Zakaria <farid.m.zakaria@gmail.com>
Subject: [PATCH RFC 0/3] landlock: Add access rights on created files
Date: Sat, 24 Oct 2026 13:39:16 -0700
Message-Id: <20261024-landlock-created-rights-v1-0-77c8db3f6bd2@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQrCMBAAv1L27MI2BlGvgg/wKh7SZG1XSyq7U
 YTSvxv1OAMzMxirsMG+mUH5JSZTrtCuGohDyD2jpMrgyG1ach7HkNM4xTtG5VA4oUo/FMPd2lN
 HFLbRJ6j1Q/kq79/5DKfjAS5/ac/uxrF8n7AsH5qqeoaAAAAA
X-Change-ID: 20261024-landlock-created-rights-9340b00a8c4d
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, Shuah Khan <shuah@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, John Ericson <mail@johnericson.me>, 
 linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Farid Zakaria <farid.m.zakaria@gmail.com>
X-Mailer: b4 0.15.2

This is a proposal for an idea to add support for landlock to work
better with build systems such as Nix where they want to apply
restrictions but the paths may not yet exist.

TL;DR;
========

Landlock rules attach to inodes that exist when a ruleset is built.
That makes a directory shared between trusted and sandboxed tasks hard
to confine: the sandbox may create entries there with
LANDLOCK_ACCESS_FS_MAKE_*, but no rule can name those entries ahead of
time, and granting read access on the directory to cover them exposes
every other entry as well. This series adds a rule flag that grants
access rights on the entries a domain creates in a directory, instead
of on the directory.

Motivation
==========

The motivating user is the Nix build sandbox. Every Nix build runs in
its own sandbox, and a build may only read its declared inputs in
/nix/store and must be able to write and read back the outputs it
creates there. Nix enforces this with a private mount namespace: it
creates an empty store directory and bind-mounts each input path into
it, one mount per input. Nix has paid this per-input cost since the
sandbox was introduced [1].

The cost is paid per build and grows with the size of the input
closure. Nix is moving towards much finer-grained builds (many small
derivations instead of a few large ones), so the number of sandboxes
grows while each build's own work shrinks, and the sandbox setup is
becoming the bottleneck. A typical build has hundreds of inputs; large
ones have thousands.

A microbenchmark sets up and tears down a Nix-like sandbox (user,
mount, PID, IPC, UTS and network namespaces, pivot_root into a chroot,
removing the chroot afterwards). It compares one bind mount per input
with a single bind mount of the whole store plus one Landlock rule per
input. Median latency per sandbox, one sandbox at a time, Linux 7.1,
ext4, 16 cores:

  inputs   bind mount per input   one bind mount + Landlock   speedup
      10         3.2 ms                    2.3 ms               1.4x
     100        11.6 ms                    2.8 ms               4.1x
    1000        79.3 ms                    6.4 ms              12.4x
    5000       400.1 ms                   24.4 ms              16.4x

With Landlock, an input costs an O_PATH open and a landlock_add_rule()
call: there is a single mount, and no mountpoint directory to create
before the build and remove after it (removing the 1000 empty
mountpoints alone took 17 ms).

The single bind mount is only sound if the store listing and the
undeclared store paths stay unreadable while the build can still use
its outputs. Without this series, covering the outputs requires a rule
on /nix/store itself, which makes every store path readable again.

[1] https://github.com/NixOS/nix/issues/179

Series
======

Patch 1 lets an LSM observe inode creation through the
inode_init_security hook when no LSM provides an xattr. Patch 2 adds
the LANDLOCK_ADD_RULE_CREATED flag for path-beneath rules and bumps the
ABI to 13. Patch 3 adds selftests.

Testing
=======

The series applies to the Landlock next branch (3e271a27c46f) and was
tested on Linux 7.3 with that branch applied.

Without patch 2, the five new tests and the ABI version check fail.

Open questions
==============

- A created inode stays pinned until the layer's hierarchy is freed, so a
  sandbox that creates many entries in such a directory keeps them all in
  memory. Should this be bounded?

- Creation is detected in inode_init_security, so on filesystems that do
  not call security_inode_init_security() created entries get no rights.
  Is there a better hook?

- Through overlayfs, created entries get no rights either, because the
  upper inode is created with the mounter's credentials. Should overlayfs
  be handled, e.g. via security_dentry_create_files_as()?

- A file renamed or linked in keeps only the rights it had at its source.
  Should it get none instead?

---
Farid Zakaria (3):
      lsm: Call inode_init_security hooks without xattrs
      landlock: Add access rights on created files
      selftests/landlock: Test LANDLOCK_ADD_RULE_CREATED

 Documentation/userspace-api/landlock.rst     |  42 +++++
 include/uapi/linux/landlock.h                |  18 +++
 security/landlock/domain.c                   | 182 ++++++++++++++++++++-
 security/landlock/domain.h                   |  28 ++++
 security/landlock/fs.c                       | 176 +++++++++++++++++++--
 security/landlock/object.h                   |   6 +
 security/landlock/ruleset.c                  |   6 +
 security/landlock/ruleset.h                  |  14 ++
 security/landlock/syscalls.c                 |  20 ++-
 security/security.c                          |   9 +-
 tools/testing/selftests/landlock/base_test.c |   2 +-
 tools/testing/selftests/landlock/fs_test.c   | 227 +++++++++++++++++++++++++++
 12 files changed, 703 insertions(+), 27 deletions(-)
---
base-commit: 3e271a27c46fd591d1011c7de5a644a41e2010f1
change-id: 20261024-landlock-created-rights-9340b00a8c4d

Best regards,
--  
Farid Zakaria <farid.m.zakaria@gmail.com>

