Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548293F9A0D
	for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 10:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785149331; cv=none; b=IJKrDkaUfoUp5E8GY2rAXdEOFaBvTtHL5GjslIwxLBfeL9Jk5xJoxCKyRwvJhaEDcFzMj0AHH8zWbS1LPo2uwNBWco/EzNqhrh20UM+hZTpOf728ZnFvN4LbRcRA4r1xc5bZ+MalnOZTZtijP6S1LbRHjQpH0CKkw+ZCZYpt4wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785149331; c=relaxed/simple;
	bh=ICH7e4hpKWGxpVtAyKFg0R9ccxTtE7zcbDRA57oYQHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sOytZWVC1ZXz2AgV8s5ZAEZ7mD+5VWLp7Ccabm6Dx0Jc9vU2NQoVrAaInPYzUu4N0mtKlyizJ9v1RK4NrkiiHC4SWOO0P+JmFNeP+thLULAA0kMpb1EFwbCogduVn/0HiBhGn1vclH4+9Umc36748WDX0qEu9Qr+n63tNHeztZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iHz7XJdP; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iHz7XJdP"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso12838045e9.3
        for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 03:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785149327; x=1785754127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wl6olrm9zBlfcqm4vDgZbW7ZBUMwFpjsg4jq9Xu7B8Q=;
        b=iHz7XJdPn+5JUzV3jwze0SeNr2RIVgW5ThdK/IDJSXBpLZ2kl3K3yrsdDap7qZlQIc
         93523F5nYVq0BEG3GpzHs86w6gN4mQSWAfecr3Iang7LCQiUO/F9yjMAneJFHz/DlToq
         UErXfMnja1xrYAG4w8RNJG+qqRBZ/HLCbChgbbL6EHwsyZGLOERTq1ELbzx1mkyK8nXQ
         BT6Y3nzE/Ac30w/pwIKIQ+JWnWqJHcFngT25PgpuXZewz9qbWdnbM4RbUSXS7d6XuUcT
         fnSnEylA7KsF6Rl3De0h6imk2KIs2/1/dc4QekyqHCd6Wia/qCAyVo4NzGCE72hDJes3
         Grdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785149327; x=1785754127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wl6olrm9zBlfcqm4vDgZbW7ZBUMwFpjsg4jq9Xu7B8Q=;
        b=lKutIH4lCimEIuuO1gZaRB7WgSPmAzvUiyQmaTKCMxSRekEcluUMWQltWoZzQ4xu4n
         q/zz46z0zp5qiXBS41Rv1hbLQn5jKcm1cCX5dbCe2zicCgyL02Dd0cbYBEL4c0aLMKzu
         HrvoKoh62BCTyFBcxlO5MYH2NmPDFDqlGDw7MLiBGzyxlwKvhtwKkEWItQSaOREp2ZKI
         spdI8ENRAmM502UpFhbyR5pI1E39+G4Z+jBZnkzFAPoKLmDEkqRePumZfgkNvrkCBvg0
         UdjadDxoR65paBAAE5ooZaCBtm4/+cNAjUIGL8IyADkYUKi+DsokSsViN6zujGP1aY7Y
         23Zg==
X-Forwarded-Encrypted: i=1; AHgh+RqJLzRwhuZX3Tneu6HuaxSfMt2WK4ys9b2viKckvU2ZhkAJSe79NXwBhZBaQI8RE658HSMRK3BRSHU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaGjn00JD2JsXkqu1qqvltdOGuJPfV07XpCVLLP6CaWLi7Fyqt
	+D8M6INJgjYRznHMD8Q/SYFC+QH+ZfNh/6W2eclMZZhiIE7yNkTdwnT4
X-Gm-Gg: AR+sD13ifVdz6YKjPYlEHeXagc+WTS/HS0QDgqWd+qL6jOKMMeQQKAOVdMKe6sxus6Y
	klki+SX6B6EpTx6c4gAEbf46jZvKukQlu4V5zx+FhqiyedJJ3hRqgkiYyE6VIjbFNkwQ2zQ+IFu
	/2GDvlmpWR24e4AdUnbvEXZhAHwLS2pU2VQarn36HhqFCZtjlcrzl5hHq9lW2cBHNEjSvJlpCHu
	KIWkZ0/WwuQ8CBTmJuwHA6/i1mXC8KdbkMD6uCFyRADbSVAvouKBCaDE7LLVmz3h7JCK5nRCxaZ
	U9yA2o0UaY6fDvF8sSE1WBExMkM7wcz/dj49yBXNxkbf/O869e+nccQqRQF0CjxzjenHLoBTxi+
	7zMCmKV+oXz67lfsZ+abVKznbIwRt13GNtJxsj3vAoYWYN6alZQpmrJikWsirKLFrLjdWIHszW2
	AWBicTkw==
X-Received: by 2002:a05:600c:19c8:b0:495:5205:86c with SMTP id 5b1f17b1804b1-496b5747d8dmr108835785e9.22.1785149327271;
        Mon, 27 Jul 2026 03:48:47 -0700 (PDT)
Received: from spark.Home ([2001:8a0:7280:4000:53fe:effd:424:fa7e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a659sm49056188f8f.6.2026.07.27.03.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 03:48:46 -0700 (PDT)
From: Eric Curtin <ericcurtin17@gmail.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Eric Biggers <ebiggers@kernel.org>,
	"Theodore Y . Ts'o" <tytso@mit.edu>,
	Gao Xiang <xiang@kernel.org>,
	Chao Yu <chao@kernel.org>,
	fsverity@lists.linux.dev,
	linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eric Curtin <ericcurtin17@gmail.com>
Subject: [RFC PATCH v2 0/4] init: boot image-based systems without an initramfs (rootimage=)
Date: Mon, 27 Jul 2026 11:48:41 +0100
Message-ID: <20260727104845.2607444-1-ericcurtin17@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727-gepaukt-eislauf-waran-7c03f0e47609@brauner>
References: <20260727-gepaukt-eislauf-waran-7c03f0e47609@brauner>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v1 (https://lore.kernel.org/all/20260718191551.1703670-1-ericcurtin17@gmail.com/),
following Christian Brauner's review
(https://lore.kernel.org/all/20260727-gepaukt-eislauf-waran-7c03f0e47609@brauner/):

The goal is unchanged: A/B image updates from a single partition,
without paying for a second userspace spin-up at boot. What changed is
how rootimage=/rootimageverity= get from "here is a path" to "here is
the verified, mounted root", which is what most of the v1 review was
about.

 - Patches 1-2 are new: they add generic, reusable VFS infrastructure
   (struct fs_context::source_file, path_mount_file()/
   init_mount_file(), vfs_parse_fs_param_file()) that lets an in-kernel
   caller hand a filesystem an already-open struct file as its mount
   source instead of a path, and convert erofs's existing file-backed
   mount support to use it when given. This is the "new infrastructure
   available to any fs" asked for, so that init/do_mounts.c never has
   to independently re-resolve a path that something else already
   opened and validated.

 - Patch 3 (rootimage=) now opens the image file exactly once and
   mounts that same struct file via the above, instead of opening it,
   doing nothing with the open, and separately handing erofs a path
   that it re-resolved on its own with no guaranteed relationship to
   what was checked - which is what v1 did, and which is where most of
   the "second lookup" / "weak assumptions" findings came from. There
   is no fd-vs-path race left because there is no second lookup left.

   rootimagesrcdir= is now mandatory (rootimagesrcdir=none opts out
   explicitly) instead of silently detaching the carrier by default,
   so there's no more zombie superblock/dangling mountpoint by
   default; you have to ask for that outcome by name.

 - Patch 4 (rootimageverity=) is mostly unchanged in what it checks,
   but now runs on the exact file patch 3 mounts, so the digest check
   and the mount are guaranteed to agree on what "the image" is. It
   also now refuses rootimageverity= together with rootimageflags=
   containing device= (multi-device erofs images), since the digest
   only ever covers the primary image file and silently ignoring the
   rest would be a false sense of integrity.

Not changed / not attempting to fix in this version, per the v1
discussion:

 - The carrier filesystem itself is still fully parsed (superblock,
   directory entries, extents) before rootimageverity= gets to check
   anything, since reaching the image file at all requires that. This
   is structural to a file-backed image sitting on a general-purpose
   writable filesystem, the same way a dm-verity root still needs a
   trusted block layer under it; rootimage=/rootimageverity= are meant
   to sit on top of an already-appropriately-trusted carrier (e.g.
   itself dm-verity/LUKS-backed, or a well-audited always-read-only
   fs), not conjure trust in an arbitrary writable one out of thin air.

 - A/B slot selection and fallback/rollback bookkeeping are still the
   bootloader's job, exactly as with dm-mod.create= today; this series
   only does the "resolve the one path the bootloader already chose,
   verify it, make it root" mechanical step for the file-backed case,
   not image-based deployment policy in general.

 - There is still no sysfs equivalent of
   /sys/block/loopX/loop/backing_file to discover which file backs the
   root after boot (the mandatory rootimagesrcdir= at least means the
   carrier itself stays reachable). This would need its own generic
   piece of infrastructure and is left for a follow-up.

Eric Curtin (4):
  fs: allow in-kernel mounters to hand filesystems an already-open
    source file
  erofs: use fs_context source_file for file-backed mounts when given
  init: support mounting the root filesystem from an image file
  init: support pinning the root image's fsverity digest

 .../admin-guide/kernel-parameters.txt         |  56 ++++
 Documentation/filesystems/mount_api.rst       |  18 ++
 fs/erofs/super.c                              |  19 ++
 fs/fs_context.c                               |  39 ++-
 fs/init.c                                     |  18 ++
 fs/internal.h                                 |   2 +
 fs/namespace.c                                |  96 ++++++-
 include/linux/fs_context.h                    |   4 +
 include/linux/init_syscalls.h                 |   2 +
 init/do_mounts.c                              | 269 +++++++++++++++++-
 10 files changed, 514 insertions(+), 9 deletions(-)

-- 
2.43.0

