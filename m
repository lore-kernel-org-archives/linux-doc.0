Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B68267B07
	for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 15:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773501944; cv=none; b=F3pPwDg8MxTVxsVWFkwRi7LeIr/p2JVLAwz//wSdNbuyom52zkol2UHOeIwjcAZf4vOKZwGBEcUXuBvgETuQPqGtqfMjVbjVk/EEnsjCzB9p18X+V+xDwqkBFZMg5QY2X3OlvWFLmipp9fQNATUgX0bF8zMMwyhJTXL75oZW+Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773501944; c=relaxed/simple;
	bh=qVVykF2qZOdy3jKWft05l6fKtGzUFkmgFClJWT6qCVI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DFw7hACwqvONXtgZxLKMeZmpCdhuHcNaPOwK3IThBVal04Vl4RadREqcbmBww45X4YIeHiILdjn3Bm4EnqdFthhmquxAafPZZyfA8moReVvVSWlL2Di5GUNJS0v1gjqNhIysjKQNtsk3+bIYdud87tyZbze92QolVsj1RI7QMbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/EEph8a; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/EEph8a"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so26481215e9.0
        for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 08:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773501941; x=1774106741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ggISVxzQUfv8963RRxSmcP19TZhuJ7JM1vyo2f42mPA=;
        b=k/EEph8aM+q/YRCG9z1omti4DhbdINhlFCFFvMoyrBC5k3mX3li/D4S5tTuA9r2rfp
         8t9sQLuPBNYjtLOJTWxH0Y7gxI8/K3IRRpxss3zkKFpZbUKHRwBpEWXKexarRtSNoRRM
         /IJLukUT+U8MM8E3VZ5UAs/dwOdRAadOUK1RIezuhL4AYw0NM+nqOJN4/TERwPUjWntz
         44Kcnu6VsKlCQbOLOMOthK8DRT9DF+cekMO0pPw2W5ItWzYmdSOvmNnTbPh+qqNesoI1
         btv+E4oEMVcExGUXf8GMcBICA3b+tQ9h8m9sgzY9KxtGtjN4KfqgGKHHS0mZDR39QTPP
         bXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773501941; x=1774106741;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ggISVxzQUfv8963RRxSmcP19TZhuJ7JM1vyo2f42mPA=;
        b=RGnfWDFIARaltIBLVBEvq4lkRhiAAnQiXiwgb2eWH1K2Wi6qld2SNibG/Jrj7frZ7/
         ovQQIKs+U2DQxY9B+oKZl3Cd10MmUYsdxJP/VsEkZDnjW+m4aC8twXeL0CdqK00Ets3o
         mphn6KKDKp8se6Lf/kMOT7zyCMZF0UrId/WS6CiL4XyjJWQzXPNQCGHjwcf1a5ZSUdTc
         150BzwSmfeaWHlN/RChIwWMxb8OGSkDKa6fbaHuKSJV+iiT+Tq1ueMlh4OsXo99n/0Mw
         8YawUNXMCABWnlS0b4u8NhpN+fiFUP8hdatS82ukNtEgV0YqrlM/xrpTiVH5lOlghpJS
         DNPw==
X-Forwarded-Encrypted: i=1; AJvYcCXJ6x08kNAzsOZAq7Zh9YaQL/SnT8c16T4UPfkwQamjHyAmbW5C4r90qn1xIbh3RE6fEtINPILhLxQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTl+TQJXju9h4kleqigyoZoDDhhFHO9VquWZvzVVpZRzMCRyT1
	ZrAlTMN+t9HMqED8R7jPThHRDaocJ8W93qugW5a32HI+6SRYycOJPv8W
X-Gm-Gg: ATEYQzxIvY2lplRVPeZmy9NBNLPWPAHROP8ockHAaAhZfKl/VCgBLiwkaRS6QpjkSeD
	JFLGfrlD9UrYN2IR7OxOMQZGEzkOC2AhQhnHSllCej3EaR82OWc4RnqvYdrbNQgSzOIg3GJmmgA
	Q4rqiEvt5id0UpcP3OJUsq4y38auxWH1Ne2Chwvbhs/A4i4HA7nH7HpD9ui6iKLtGp5GQSqidTO
	Cddy0X41Kq3gRF1551oi8vmniYFlXFEQEgUrS4dNt+KCyejk756QM0FGkNDtufBOSdW7kCasrHE
	1oUSrEoB7/YEBwgLxoXEYcWi5ADItanPF6BpTuCey/Pa0vXSRUA6PeQrxWVe18a9VwTBz2HDPC0
	CrZAvqcPyVSpagqoN1OjaO/bhbEOxCdgJO3yU8i/4bArewZEXtB/BHaY+gKLI+iz2FwqBG7phi+
	87df4Db98qAv8zUCWthYwuboIDUhmDnyZ/9kpR7hG6snoq30NBPFWPMVzibhfw6dwTh+GZr8NxT
	5Fd2znZv/Ad2x95lflm8Yd/PaM3IfGrvLuXEeFi
X-Received: by 2002:a05:600c:8b45:b0:485:35ba:1d81 with SMTP id 5b1f17b1804b1-48556703194mr110283255e9.21.1773501941355;
        Sat, 14 Mar 2026 08:25:41 -0700 (PDT)
Received: from DESKTOP-TILNSD1.localdomain ([139.47.104.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1a72cdsm27061783f8f.9.2026.03.14.08.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 08:25:40 -0700 (PDT)
From: Kit Dallege <xaum.io@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	corbet@lwn.net
Cc: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	Kit Dallege <xaum.io@gmail.com>
Subject: [PATCH] Docs/mm: document Shared Memory Filesystem
Date: Sat, 14 Mar 2026 16:25:38 +0100
Message-ID: <20260314152538.100593-1-xaum.io@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fill in the shmfs.rst stub created in commit 481cc97349d6
("mm,doc: Add new documentation structure") as part of
the structured memory management documentation following
Mel Gorman's book outline.

Signed-off-by: Kit Dallege <xaum.io@gmail.com>
---
 Documentation/mm/shmfs.rst | 114 +++++++++++++++++++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/Documentation/mm/shmfs.rst b/Documentation/mm/shmfs.rst
index 8b01ebb4c30e..1dadf9b481ce 100644
--- a/Documentation/mm/shmfs.rst
+++ b/Documentation/mm/shmfs.rst
@@ -3,3 +3,117 @@
 ========================
 Shared Memory Filesystem
 ========================
+
+The shared memory filesystem (tmpfs, also known as shmem) provides an
+in-memory filesystem used for ``/tmp`` mounts, POSIX shared memory
+(``shm_open()``), System V shared memory, and anonymous shared mappings
+created with ``mmap(MAP_SHARED | MAP_ANONYMOUS)``.  The implementation is
+in ``mm/shmem.c``.
+
+.. contents:: :local:
+
+How It Works
+============
+
+tmpfs stores file contents in the page cache using swap as its backing
+store rather than a disk filesystem.  Pages are allocated on demand when
+written to or faulted in.  When the system is under memory pressure, tmpfs
+pages can be swapped out just like anonymous pages.
+
+This design means tmpfs files consume no disk space — their size is bounded
+only by available memory and swap.  It also means tmpfs data does not
+survive a reboot, making it suitable for scratch data that benefits from
+memory-speed access without needing durability.
+
+Each tmpfs inode tracks two key counters: allocated pages (resident in
+memory) and swapped pages (evicted to swap).  These are maintained by
+the ``shmem_charge()`` and ``shmem_uncharge()`` accounting functions,
+which keep the inode's block usage consistent with the filesystem's mount
+limits.
+
+Page Cache Integration
+======================
+
+tmpfs uses the kernel's page cache (xarray) to index its pages by file
+offset.  When a page is read or faulted in, the page cache is checked
+first.  If the page has been swapped out, a swap entry is found in its
+place, and the page is swapped back in transparently.
+
+When a page is added to the cache for a tmpfs file, it replaces any
+existing swap entry at that offset.  When a page is evicted by reclaim,
+a swap entry takes its place.  Shadow entries (see
+Documentation/mm/page_reclaim.rst) may also be stored to support working
+set detection.
+
+Swap Integration
+================
+
+Under memory pressure, the reclaim path can evict tmpfs pages to swap just
+like anonymous pages.  This is transparent to the filesystem — the page
+cache slot simply transitions from holding a folio to holding a swap entry.
+
+When a process accesses a swapped-out tmpfs page, the page fault handler
+reads the swap entry from the page cache, allocates a new page, reads the
+data from swap, and inserts the page back into the cache.  This swap-in
+path is specific to shmem and handles locking between concurrent faults
+on the same page.
+
+Huge Page Support
+=================
+
+tmpfs can allocate transparent huge pages for its files.  The ``huge=``
+mount option controls the policy:
+
+- ``never``: only base pages (default).
+- ``always``: attempt huge page allocation for every new page.
+- ``within_size``: use huge pages only within the file's current size.
+- ``advise``: use huge pages only for mappings with ``MADV_HUGEPAGE``.
+
+When a huge page is allocated but only partially used (e.g., a file is
+smaller than a huge page), memory is wasted.  To mitigate this, tmpfs
+registers a shrinker that identifies huge pages where the file has been
+truncated or punched below the huge page boundary, and splits them back
+into base pages so the unused portion can be reclaimed.
+
+Accounting and Limits
+=====================
+
+Mount Options
+-------------
+
+tmpfs mounts accept ``size=`` and ``nr_inodes=`` options that cap the
+total blocks and inodes in the filesystem.  Every page allocation is
+checked against the block limit; if the limit would be exceeded, the
+allocation fails with ``ENOSPC``.
+
+These limits are enforced in-kernel and apply to all users of the
+filesystem.  They can be changed at remount time.
+
+Quota Support
+-------------
+
+With ``CONFIG_TMPFS_QUOTA``, tmpfs supports user and group quotas.  Each
+allocated block is charged to the owning user/group, and allocations fail
+if the quota is exceeded.  Quota state is stored in memory and does not
+persist across mounts.
+
+Memory Cgroups
+--------------
+
+tmpfs pages are charged to the memory cgroup of the process that
+instantiates them.  This means tmpfs memory counts toward cgroup limits
+and can trigger cgroup-level reclaim.  Swapping a tmpfs page out and back
+in preserves its cgroup association.
+
+fallocate
+=========
+
+tmpfs supports ``fallocate()`` to preallocate space for a file.
+Preallocated pages are allocated and inserted into the page cache
+immediately, guaranteeing that subsequent writes will not fail with
+``ENOSPC``.
+
+``FALLOC_FL_PUNCH_HOLE`` is also supported: it removes pages from a range
+of the file and returns them to the filesystem's free pool.  This is used
+by applications that want to release portions of a tmpfs file without
+truncating it.
-- 
2.53.0

