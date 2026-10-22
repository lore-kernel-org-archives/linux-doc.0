Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792709440;
	b=lH/xXZLf5sFySeSmv5bZgC4xc6q2lSuaNx2V/yZ4jwOilYg95ES395yOXTXNyA8n5Hv6
	 QD4BnhnbS4SCvLKQ4LV/H4Q3c+jSuLRna3HBRIGx3IoPUS0bb6g8/oWYfamv/H8BWy6py
	 mP+oN3a/VOZzTWAhmxLRfNxpoMxw6T6VXseEPDVRW281ew0pd16E315kQDEUWWJqa7nyL
	 J3aS6lAucV1gq1npLL+TqV9kcRAdMc8xX325t/IwP0sIweIIsJTaHQ3VXLn7L2Gb0DG68
	 dbdKKmZeAdnQuYCpbnHuX+/Ke9XseQb0zjtXaR6I170Y8ioBz123IJPlIGOX1fDDK3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792709440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=QcZ8/zo+4ubbzN6kQcHbARyXxVN7Up83gggbGBEi730=;
	b=rQ8xPbHQaAV4izGXjMOCiRCWdejthS+l6hPfcuYXV/HiZSGBNmk8iIvcr6k16BFMkUFP
	 JZlJ1eNYKKh9W70SEQ2Rj2jme5t/T7bRzQ24SegEe33qrv9FyyM6OwQR5opYQaDlOed/x
	 Qi544OJhdsQvY2PyzFRd1oU9yNDhXLLxzYFNmnuY3liV9fJiiWc7MuKZzxnanN5Dac8mW
	 OHHPgW70jPJax69r6fv6ij2HSufIUfb+/P0BT7h6FM3B0V0++nik5/lwBxv70NM6snQyd
	 UuuofjuLiNre3v+3dKIMLs/OWkVXM7lmaypfkxjF6x/rE0eX/SbjNh97F5X3W1fHjPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=u0+KIhiu;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBCA606A319
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 22:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CBCA606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=u0+KIhiu
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e9821ca96fso2454615ad.0
        for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 15:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792709439; x=1793314239; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QcZ8/zo+4ubbzN6kQcHbARyXxVN7Up83gggbGBEi730=;
        b=u0+KIhiubnYthx/xW0tDnkh08B40JT4FU7KGj6YNT/mWvDqkQHguNtcFOrbVeThUBV
         nQrtVMcuw77zq3bnSdhZqMjvpKhi7kG+9dk5SOTgimRfbsSFz0QRxkYCqzQlsShmMi64
         +FbsN2ooc4HBUUFIMMOgNgninJXXFtt9c1XaKTVwMq7vjq3g2pFBRDgmUmziuTVGUH5R
         jHrvWttgtBkp9pUkWwqnux2JIwiIJ/HYfRFvKtvO4f5/pYbOYeiErRdTfG5tVh6DsCZa
         1cX/ymp2xK0ah0EzTD4j6JGUnw5ueNzBK+c8TXDUzlpKdJB3gLmwvcR1qoLzPqiwsiSX
         pIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792709439; x=1793314239;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QcZ8/zo+4ubbzN6kQcHbARyXxVN7Up83gggbGBEi730=;
        b=b0co7jwRzlJP7vQ6tu/zfzDSO00J8hH+7TSP+/35+QVXj4MwAQTsLcSQ3gzHZ8RWeY
         +95AVpESpix67cxNUzSOhrRYgXp/jCilD/qj0cwaGsDvETPksi9UDkUZObMeee0YeTch
         0Tvo/IQAqo1KLb6RmRmqEM9iqKsmLReCsVMbtovF69BHZ/4BodFE/CiZ7QUjjdlMqKK5
         cBslAn0tJuj7mgEaQt4MTcz4S4f6OwLl04KwXkZhWVcGnkhZU7e8rCjnpQ+IA7+08imA
         pjN9Oeg7LAet5jK9V9Ta4bkVzk7ADdYl3zMptYbmNTAJz4Q4xJi7z+3ViMar2Ka0LU+V
         MIOw==
X-Forwarded-Encrypted: i=1; AKwUvBw2mXnvx7/IOK2gCzi4xNsvXFRXSbPbji4Zoz7m70htw84bVkOtNL8CQiBYzOUfAVv5cZl0LahxvzU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4Yld9KhW82oflYP2TMMOcWotK+R79DQ80OJkyeUHyB8MyRACj
	b28XadwcrkQNSCs+nW0MuCKawavqGffFJLh1ifoG45HrE6/0LLKBFi+nkVUFLL3hYZNQE/FRKjp
	K0lbUObI62KFJSQ==
X-Received: from plpn5.prod.google.com ([2002:a17:902:9685:b0:2e8:18c6:a093])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f689:b0:2e9:87e8:71c8 with SMTP id d9443c01a7336-2ea7c9ffc99mr6376265ad.4.1792709438571;
 Thu, 22 Oct 2026 15:50:38 -0700 (PDT)
Date: Thu, 22 Oct 2026 22:50:25 +0000
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022225035.377445-1-dmatlack@google.com>
Subject: [PATCH v2 00/10] liveupdate: Preserve tmpfs files across Live Update
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org
Cc: Alexander Graf <graf@amazon.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

This series can be found on GitHub:

  https://github.com/dmatlack/linux/tree/liveupdate/tmpfs/v2

This series allows userspace to preserve files on tmpfs mounts across a
Live Update, in addition to memfds. Today the memfd file handler only
accepts unlinked shmem files, and LIVEUPDATE_SESSION_RETRIEVE_FD always
restores them as anonymous memfds. Userspace therefore has to put every
in-memory file it wants to preserve in a memfd, which works for VM guest
memory but not for other files that live on tmpfs mounts, such as
in-memory logs, binaries, and configuration files.

The kernel preserves the contents, size, file position and seals of each
file. After the Live Update, userspace retrieves each file onto a tmpfs
mount of its choice and links it at the path of its choice, so userspace
decides the directory structure, names, owners and permissions of the
restored files.

This series builds on the per-file-handler argument for
LIVEUPDATE_SESSION_PRESERVE_FD and LIVEUPDATE_SESSION_RETRIEVE_FD from
Pasha's v1 [1], following Pratyush's suggestion on the RFC [2], and on
the design discussion on Pasha's v1 [3].

[1] https://lore.kernel.org/kexec/20261015093816.2438942-1-pasha.tatashin@soleen.com/
[2] https://lore.kernel.org/kexec/2vxz7bjmkjeu.fsf@kernel.org/
[3] https://lore.kernel.org/kexec/atE53vmlDeA4cWD2@google.com/

Series Overview
---------------

This series implements the following:

  1. Let userspace pass a file-handler-specific argument to
     LIVEUPDATE_SESSION_PRESERVE_FD and LIVEUPDATE_SESSION_RETRIEVE_FD,
     and let file handlers mark retrieve failures as retryable, so that
     userspace can fix a bad argument and try again without losing the
     preserved file (patches 1-3).

  2. Rename the memfd file handler (memfd_luo) to shmem_luo, since it
     preserves shmem files, which will include files on tmpfs mounts.
     Preserving memfds created with MFD_HUGETLB will need a separate
     handler, so naming the handler after the filesystem avoids another
     rename later. The compatible string stays "memfd-v2" (patch 4).

  3. Fix two existing problems in the retrieve path: a WARN_ON() that
     userspace can trigger when tracking a retrieved file fails, and a
     leak of the preserved folios when a retrieve fails before it
     restores them (patches 5-6).

  4. Retrieve files that were preserved from a tmpfs mount onto a tmpfs
     mount chosen by userspace, via the new struct
     liveupdate_shmem_retrieve_arg. The kernel creates the file as if by
     openat(dirfd, ".", O_TMPFILE | flags, mode), so the file gets the
     same flags, owner, permission checks and security labels as any
     other new file in that directory, and is charged to that mount.
     The kernel fills the file before returning it, so nothing else can
     access the file before it is complete, and userspace links it at
     the path it wants with linkat() (patch 7).

  5. Allow preserving tmpfs files that are still linked, and require
     permission to change the size of a file to preserve it, since
     preserving a file freezes its size for all users of the file
     (patch 8).

  6. Allow retrieving tmpfs files with O_RDONLY so that restored
     binaries can be executed before the session is finished (patch 9).

  7. Add a kexec selftest for preserving and retrieving tmpfs files
     (patch 10).

uAPI Changes
------------

  - struct liveupdate_session_preserve_fd and struct
    liveupdate_session_retrieve_fd gain a 64-bit @arg field, a pointer
    to a handler-specific argument that starts with a 32-bit size
    field. Callers that pass the old struct size are not affected.

  - Passing a non-zero @arg when retrieving a token that was already
    retrieved fails with -EBUSY instead of silently ignoring @arg.

  - New struct liveupdate_shmem_retrieve_arg, with @dirfd, @flags and
    @mode, for retrieving tmpfs files. Files that were preserved from a
    tmpfs mount can only be retrieved with it, and memfds can only be
    retrieved without it. Unlinked tmpfs files (e.g. created with
    O_TMPFILE) were retrieved as memfds before this series, and now
    require the argument too.

  - Preserving a file now requires permission to change its size (see
    Open Questions).

ABI Changes
-----------

  - struct shmem_luo_ser (formerly struct memfd_luo_ser) gains a
    SHMEM_LUO_FLAG_TMPFS flag in its existing @flags field, which
    records that a file was on a tmpfs mount rather than the internal
    shmem mount that memfds use.

Open Questions
--------------

  - Preserving a file freezes its size until it is unpreserved: For all
    users of the file, truncating it, fallocate() and writes past its
    end fail with -EPERM, and the owner of the file can't undo that.
    Linked files can be reached by anyone who can read them, so without
    a permission check, anyone with a session fd could preserve e.g. a
    world-readable file in /dev/shm through a read-only fd and break its
    owner. Patch 8 therefore requires permission to write to the file
    (inode_permission(MAY_WRITE), but neither a file opened for writing
    nor a writable mount), or ownership if the file is immutable or on a
    read-only superblock, since its size can't change anyway. The check
    applies to all files, including memfds, where it passes in practice
    since memfds are created with mode 0777 (or 0666). Is this the right
    permission model for preserving files? Should this apply all files
    or just shmem files?

  - Is patch 9 (retrieving tmpfs files with O_RDONLY) worth merging?
    Without it, userspace can only retrieve files O_RDWR or O_WRONLY
    which then LUO keeps open until the session is finished, so
    executing a restored binary fails with -ETXTBSY until then.
    Supporting O_RDONLY retrieve is fairly simple so I think it is worth
    supporting.

Merge Plan
----------

This series applies on top of the next branch of liveupdate.git
(commit 80cf37169dae ("Merge branch 'kho-bootmem' into next")) and is
targeting Linux 7.5.

The series will be merged through liveupdate.git.

[4] https://lore.kernel.org/kexec/20261020144710.4154339-1-pasha.tatashin@soleen.com/

Testing
-------

All patches were build-tested individually. The series was tested on
x86_64 and arm64 in QEMU using the Live Update selftests:

  - luo_tmpfs (new): 31 test cases covering the contents, size,
    position, seals and holes of restored files; creating the file like
    open(O_TMPFILE), with the requested flags and mode, the caller as
    owner, and O_EXCL; executing restored binaries before and after the
    session is finished; preserving files through read-only fds, on
    read-only mounts and superblocks, and immutable files; rejecting
    files that the caller can't write to; block accounting on the target
    mount, including large folios that extend past the end of the file;
    mount and memcg limits; memfds; invalid arguments; retrieving a
    token twice; and that no kernel warnings are triggered.

    The main downside of this new test is that it is large (2k lines).
    It was trivial to generate with AI, but can understand if it is too
    large to review. I can look for ways to simplify it. On the other
    hand, having comprehensive test cases is quite nice.

  - luo_kexec_simple, luo_multi_session, luo_stress_files and
    luo_stress_sessions.

  - liveupdate (including the new preserve_memfd_with_arg test).

The selftests were run with vmtest.sh:

  $ tools/testing/selftests/liveupdate/vmtest.sh -T luo_tmpfs

Changelog
---------

v2:
 - Rebase onto liveupdate/next.
 - Drop the LIVEUPDATE_SESSION_FREEZE patches, which Pasha posted
   separately [4], and the session freeze tests from patch 2.
 - Patch 1: Fail with -EBUSY if an argument is passed for a token that
   was already retrieved. Drop liveupdate_claim_file() and
   liveupdate_unclaim_file(), which nothing uses anymore.
 - Rename memfd_luo to shmem_luo, and clarify in the documentation that
   memfd means a memfd created without MFD_HUGETLB (Pratyush).
 - Don't WARN if tracking a retrieved file fails (Sashiko).
 - Don't make early retrieve failures permanent, which also fixes
   leaking the preserved folios when they happen (Sashiko).
 - Create the restored tmpfs file in a directory chosen by userspace,
   like open(O_TMPFILE), instead of restoring it into an existing file
   provided by userspace (Pasha). This removes the need to check the
   provided file, and ensures that nothing else can access the file
   before it is complete. Don't preserve the name of the file, which
   userspace already knows, so that it stays out of the ABI.
 - Pass the flags from userspace through to file_open_root(), and only
   reject unknown flags, unknown mode bits and O_PATH, like openat2().
 - Decide whether a file is a tmpfs file by its superblock instead of
   its link count, so that unlinked tmpfs files stay on a tmpfs mount
   (Pasha).
 - Require permission to change the size of a file to preserve it
   (Sashiko).
 - Split O_RDONLY support for retrieved tmpfs files into its own patch
   so we can decide if it's worth merging (Pratyush).
 - Replace the selftest changes with a dedicated kexec selftest.

v1: https://lore.kernel.org/kexec/20261015093816.2438942-1-pasha.tatashin@soleen.com/
rfc: https://lore.kernel.org/kexec/20260901180713.4185641-1-dmatlack@google.com/


David Matlack (7):
  mm: Rename memfd_luo to shmem_luo
  liveupdate: Don't WARN if tracking a retrieved file fails
  mm/shmem_luo: Don't make early retrieve failures permanent
  mm/shmem_luo: Retrieve tmpfs files onto a tmpfs mount chosen by
    userspace
  mm/shmem_luo: Allow preserving tmpfs files that are still linked
  mm/shmem_luo: Allow retrieving tmpfs files with O_RDONLY
  selftests/liveupdate: Add a test for preserving tmpfs files

Pasha Tatashin (3):
  liveupdate: Pass user argument to file preserve and retrieve
  selftests: liveupdate: Add tests for preserve and retrieve user
    argument
  liveupdate: Allow file handlers to mark retrieve failures as retryable

 Documentation/core-api/liveupdate.rst         |    2 +-
 Documentation/mm/index.rst                    |    2 +-
 Documentation/mm/memfd_preservation.rst       |   23 -
 Documentation/mm/shmem_preservation.rst       |   23 +
 MAINTAINERS                                   |    4 +-
 include/linux/kho/abi/{memfd.h => shmem.h}    |   56 +-
 include/linux/liveupdate.h                    |   55 +-
 include/uapi/linux/liveupdate.h               |   52 +-
 kernel/liveupdate/Kconfig                     |    8 +-
 kernel/liveupdate/luo_file.c                  |  110 +-
 kernel/liveupdate/luo_internal.h              |    5 +-
 kernel/liveupdate/luo_session.c               |    6 +-
 mm/Makefile                                   |    2 +-
 mm/internal.h                                 |    1 +
 mm/shmem.c                                    |    9 +
 mm/{memfd_luo.c => shmem_luo.c}               |  369 ++-
 tools/testing/selftests/liveupdate/Makefile   |    1 +
 tools/testing/selftests/liveupdate/config     |    4 +
 .../liveupdate/lib/include/libliveupdate.h    |    3 +
 .../selftests/liveupdate/lib/lu_utils.c       |   17 +-
 .../testing/selftests/liveupdate/liveupdate.c |   44 +
 .../testing/selftests/liveupdate/luo_tmpfs.c  | 2000 +++++++++++++++++
 .../selftests/liveupdate/run-vmtests.sh       |    1 +
 23 files changed, 2630 insertions(+), 167 deletions(-)
 delete mode 100644 Documentation/mm/memfd_preservation.rst
 create mode 100644 Documentation/mm/shmem_preservation.rst
 rename include/linux/kho/abi/{memfd.h => shmem.h} (54%)
 rename mm/{memfd_luo.c => shmem_luo.c} (50%)
 create mode 100644 tools/testing/selftests/liveupdate/luo_tmpfs.c


base-commit: 80cf37169daef112b6bea9ae7d9808355a045475
-- 
2.56.0.257.gf7497c7d27-goog

