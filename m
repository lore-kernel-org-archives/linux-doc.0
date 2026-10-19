Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51894503EE
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 04:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792383506; cv=none; b=d7G82nED1HQGfQNxSmbmHJQoNqSMhBzkFjOovumW1NkDIcUAG2eQhIy3UTrZOm9uquymwI/54dLg3AKftYVGsDofPeMkHJQoDuJpYheqCS8sGlz9S9VlKxeXBHnPaae9D6vFint0tYHEDnOHQJtpcg7piK0wtxWHu51721aczus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792383506; c=relaxed/simple;
	bh=OLk3lkOlJR+7876NVDGnA4nVmv5Z9vXbwQfvWpoBh/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RoWO5r3zEZde9+yDM3JVeyr0SwxX26si8HyNDuOCWi2RiSqRX8EwCEt8SCulCnBLb5tqgug/wA7kHsXIwYjiOQ1Pa3Ee9e6e7c+uzvkpd90IOD9NdyK/sfNR2DJMmJ4bw4bnJtqGXU/tm03gYKf2ky5gB3gzQJ5b9XLybZArmZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hackers.camp; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hackers.camp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48dc1508191so137515f8f.3
        for <linux-doc@vger.kernel.org>; Sun, 18 Oct 2026 21:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792383500; x=1792988300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4v+FKFBObejh19KRtYEM9IysqPpG8sncgKBeni7jk/E=;
        b=Nwqx9DuFcmm0ijgMow+rPLpGcMW96oYcagx0BUlTRmWrJcrxWgcBRtTZ+ctLDl8tpB
         rXmU7rSwOpCSV9nlso+N7MeOcEyz6MtXV3j3WsXx0J3iHU2QtJmOjLEpsxxcnpmPfHP1
         3XxE88Hl4kPcVG7PrX5V3pMGjgh0rtcLW6DNWmq6vJkdUhurfVtaV+G5qh8P1Qjp7bV9
         lRiroAR3jhyoT19j470oNayr5VROe6OMS9N8ByoRjGkZbgClQJGrAnr9IBWVabrLnlXW
         6Yn/MCVtNNTzjc9xjayJSgXy9IzaGXOLVMxBjwgdL+bStL7excHEuiCBtQkR8tF/XvJr
         7C4g==
X-Forwarded-Encrypted: i=1; AKwUvBxdmCojA2QO6uaQkHBk6CSnE/mKwN/B2i3MasdtEa7WVYUExlGql+y67QxEBKyNyb+9zo9ENANgjsA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBcXKycmzo4iFbvje3xFJ+8kbCBx/5E+pnUoJjmuSyj6mJgGV9
	fixHucZGZMiNjGx0TL789Mnw02SvsWIovFLpiEFfkpOdsFACIBKeN4u9
X-Gm-Gg: AYBFou2e/74JbWnJinNIbABrpdK1XAE94Ib6dI1SRblQpw6cr+vUlk0pxGZ39LZ82YX
	u05C7KFBj//n+Fo6+Osbrr9GdDt25D2gpfqKfOklYE0SBkOAkgyYoE2JB8v1zXI07r4X3FIMzdW
	nU2dz3I19Ta0llmST77C0grsLDbr3s0zprSBNzY5PtdAc/KRfYalsNlkMIM3ZA/qn7Ep7JobUEU
	vSzFEsHV019yoi6zs5W3po79uKgixkrPJ+ApdLmQ8ZcIHHHGCADzr6shrcoLKoXtzjFKky4YBss
	z2pEEK0GRnml3QB5fMIOvX7UStTCVU1ceuTmKZ/TPVyzt+adHwymLP+ZUrsOjIvIKRPfNUcyKeO
	w3Tv7BuGLsuhZLbuSPepr7LyHiZ+MHC3k9bp7+hNKamh2jzb/AFbYj0qpHJG78xfjJQD65nDJFC
	SI6qQEsXdpMTzFWynLK04xN/Gz1A7rl701ssK40NSeHHJIZ7DnykkCy8fpZzoEzwRNm7P6l3n2i
	l2iAPLN8cT7H3vM0rThjz0VkcrDDxQGWEedfGNgHBzGqaY=
X-Received: by 2002:a05:6000:46dc:b0:48d:fd16:1063 with SMTP id ffacd0b85a97d-48e0792c479mr8477241f8f.0.1792383499565;
        Sun, 18 Oct 2026 21:18:19 -0700 (PDT)
Received: from spartian.home ([2a01:cb1c:76:ed00:602f:c5f4:d108:b925])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd500e75sm20090449f8f.42.2026.10.18.21.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 21:18:18 -0700 (PDT)
From: Aurelien DESBRIERES <aurelien@hackers.camp>
To: Aurelien DESBRIERES <aurelien@hackers.camp>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	aurelien.desbrieres@gmail.com,
	linux-api@vger.kernel.org
Subject: [RFC PATCH 16/18] Documentation: filesystems: add beamfs
Date: Mon, 19 Oct 2026 06:17:26 +0200
Message-ID: <20261019041728.327785-17-aurelien@hackers.camp>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019041728.327785-1-aurelien@hackers.camp>
References: <20261019041728.327785-1-aurelien@hackers.camp>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

What beamfs protects and how, its runtime interfaces (module
parameters, sysfs, uevents, debugfs, tracepoints), its userspace tools
and its known limitations.

Documentation/ABI/testing/sysfs-fs-beamfs describes the attributes
under /sys/fs/beamfs/<dev>/ and the uevent raised there.

Assisted-by: LLM
Signed-off-by: Aurelien DESBRIERES <aurelien@hackers.camp>
---
 Documentation/ABI/testing/sysfs-fs-beamfs |  88 ++++++++++
 Documentation/filesystems/beamfs.rst      | 197 ++++++++++++++++++++++
 Documentation/filesystems/index.rst       |   1 +
 3 files changed, 286 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-fs-beamfs
 create mode 100644 Documentation/filesystems/beamfs.rst

diff --git a/Documentation/ABI/testing/sysfs-fs-beamfs b/Documentation/ABI/testing/sysfs-fs-beamfs
new file mode 100644
index 000000000000..d59b96239a9a
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-fs-beamfs
@@ -0,0 +1,88 @@
+What:		/sys/fs/beamfs/<dev>/
+Date:		October 2026
+Contact:	Aurelien DESBRIERES <aurelien@hackers.camp>
+Description:	One directory per mounted beamfs volume, named after the
+		block device, holding the scrubber's controls and counters
+		and the volume's clock anchor. The counters are kept since
+		the mount.
+
+		A KOBJ_CHANGE uevent is raised on this directory, at most
+		once a minute per reason, with the variables BEAMFS_ALERT=1,
+		BEAMFS_REASON=<reason> and BEAMFS_DETAIL=<text>; the reasons
+		are "uncorrectable" (a block could not be recovered),
+		"no-margin" (a block whose worst codeword has no correction
+		left) and "correction-rate" (more blocks corrected in one
+		sweep than alert_rate_limit allows).
+
+What:		/sys/fs/beamfs/<dev>/interval
+Date:		October 2026
+Contact:	Aurelien DESBRIERES <aurelien@hackers.camp>
+Description:	(RW) Milliseconds the scrubber waits between two blocks of
+		this volume. Writing it sets the pace the scrubber returns
+		to when nothing is wrong, and the pacing only tightens from
+		there. 0 parks the scrubber; correction on read is not
+		affected. The value a volume starts with is the module
+		parameter scrub_interval_ms.
+
+What:		/sys/fs/beamfs/<dev>/cursor
+Date:		October 2026
+Contact:	Aurelien DESBRIERES <aurelien@hackers.camp>
+Description:	(RO) Where the sweep is, as a physical block number.
+
+What:		/sys/fs/beamfs/<dev>/passes
+Date:		October 2026
+Contact:	Aurelien DESBRIERES <aurelien@hackers.camp>
+Description:	(RO) Complete sweeps of the volume since the mount.
+
+What:		/sys/fs/beamfs/<dev>/blocks
+Date:		October 2026
+Contact:	Aurelien DESBRIERES <aurelien@hackers.camp>
+Description:	(RO) Blocks the scrubber has read since the mount.
+
+What:		/sys/fs/beamfs/<dev>/corrected
+Date:		October 2026
+Contact:	Aurelien DESBRIERES <aurelien@hackers.camp>
+Description:	(RO) Blocks the scrubber corrected and wrote back since
+		the mount.
+
+What:		/sys/fs/beamfs/<dev>/uncorrectable
+Date:		October 2026
+Contact:	Aurelien DESBRIERES <aurelien@hackers.camp>
+Description:	(RO) Blocks with a codeword the scrubber could not correct
+		since the mount.
+
+What:		/sys/fs/beamfs/<dev>/error_budget
+Date:		October 2026
+Contact:	Aurelien DESBRIERES <aurelien@hackers.camp>
+Description:	(RO) How much correction capacity the volume has left: one
+		line per wear level, "<level> <blocks>", the number of
+		blocks whose worst codeword has needed that many
+		corrections, from 0 (untouched) to 8 (no correction left).
+		Reading walks the volume's budget region, which is a cost
+		paid on request rather than a counter kept in memory.
+		"disabled" on a volume formatted without a budget region.
+
+What:		/sys/fs/beamfs/<dev>/clock_anchor
+Date:		October 2026
+Contact:	Aurelien DESBRIERES <aurelien@hackers.camp>
+Description:	(RO) What the two clocks read at the same instant, taken
+		once per sweep: "mono <monotonic>", "real <wall clock>" and
+		"quality <unknown|rtc|ntp|hardware>", the worth of that wall
+		clock reading. A reader dating a journal entry needs all
+		three.
+
+What:		/sys/fs/beamfs/<dev>/scrub_pace
+Date:		October 2026
+Contact:	Aurelien DESBRIERES <aurelien@hackers.camp>
+Description:	(RO) The pacing of the scrubber: "interval_ms <current>",
+		"base_ms <the interval written>", "factor <base / current>",
+		"corrected <blocks corrected>" and "wear_visits <blocks
+		visited through the wear map>".
+
+What:		/sys/fs/beamfs/<dev>/alert_rate_limit
+Date:		October 2026
+Contact:	Aurelien DESBRIERES <aurelien@hackers.camp>
+Description:	(RW) Blocks that may be corrected in one sweep before the
+		"correction-rate" uevent is raised. 0, the default, disables
+		the check: the right number depends on where the machine
+		sits.
diff --git a/Documentation/filesystems/beamfs.rst b/Documentation/filesystems/beamfs.rst
new file mode 100644
index 000000000000..7e5d6ca2d079
--- /dev/null
+++ b/Documentation/filesystems/beamfs.rst
@@ -0,0 +1,197 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+======
+beamfs
+======
+
+beamfs is a block-device filesystem that corrects corrupted bytes in
+place, on a single device, with no second copy to repair from. File
+data, directory blocks, inodes, the allocation bitmap and the
+superblock carry Reed-Solomon parity, built on lib/reed_solomon, and
+every read decodes. A read the decoder cannot vouch for fails with
+``-EIO`` instead of returning wrong data.
+
+It is meant for systems that keep their data on one storage device in
+a radiation environment: on-board computers in space, and equipment in
+radiotherapy rooms, where high-energy photon beams and proton or ion
+beams produce secondary neutrons that cause single-event upsets in
+electronics [#tg203]_.
+
+beamfs protects the path between the medium and the page cache. It
+does not protect memory after a read, and it does not replace ECC
+memory or redundancy across devices; a beamfs volume can sit on a
+mirror.
+
+
+Data blocks
+===========
+
+The block size is 4096 bytes. A data block holds sixteen RS(255,239)
+codewords over GF(2^8), primitive polynomial 0x187: 3824 coded bytes
+and 256 bytes of parity, then a 16-byte tail. Each codeword corrects
+up to eight corrupted bytes. In the default layout 288 bytes of every
+4096 are overhead, 256 of parity, 16 of descriptor and 16 of
+generation, which leaves 3808 bytes of file data per block.
+
+By default the symbols of the sixteen codewords are interleaved across
+the block, so a burst in the coded bytes is spread over all of them.
+The parity of each codeword stays together, so nine corrupted bytes in
+the parity of one codeword are enough to defeat it.
+
+A read decodes every codeword of the block into a private copy. The
+corrected bytes reach the page cache; the read does not write them
+back to the medium. A codeword the decoder reports as uncorrectable
+fails the read with ``-EIO``.
+
+Beyond eight corrupted bytes in a codeword, a Reed-Solomon decoder can
+also land on a different valid codeword and report success. With the
+``DATA_CSUM`` feature a CRC32 of the payload, stored in the block, is
+checked after decoding, and such a read fails closed. ``DATA_CSUM``
+and ``DATA_SELFID`` are enabled together by ``mkfs.beamfs
+--data-csum``; neither is on by default.
+
+
+Metadata
+========
+
+The superblock carries a CRC32 and Reed-Solomon parity over the region
+the CRC covers. It also holds the correction journal: a ring of 64
+events, each naming the block, the codeword and the number of symbols
+corrected, with a monotonic timestamp. The ``raf-decode`` tool in the
+beamfs repository decodes it.
+
+Each inode is one Reed-Solomon codeword, with a CRC32 that covers its
+block pointers. Directory blocks carry sixteen codewords of inline
+parity, as data blocks do, and hold variable-length entries. The block
+allocation bitmap is Reed-Solomon protected.
+
+An indirect block is 512 little-endian 64-bit pointers and has no room
+for parity. Its parity lives in a separate region, at a slot computed
+from the block number; ``mkfs.beamfs -I`` chooses ``rs`` (the
+default), ``crc`` or ``none``. In ``rs`` mode the parity detects and
+journals a damaged indirect block but does not repair the buffer,
+pointers 478 to 511 have no parity, and a pointer flipped onto another
+allocated block is detected only with ``DATA_SELFID``.
+
+
+Background scrubbing
+====================
+
+Correction happens on read, so a block nobody reads accumulates upsets
+until it is past the correction radius. Each mounted volume runs a
+kernel thread, ``beamfs-scrub/<dev>``, that walks the allocated blocks
+at a bounded pace and decodes each one, so that drift is found while
+it is still correctable.
+
+When the volume has an error budget, each data block also records the
+largest number of symbols corrected in any of its codewords: how much
+of its correction capacity it has used.
+
+
+Using beamfs
+============
+
+The userspace tools are in https://github.com/roastercode/beamfs,
+under ``tools/``::
+
+    mkfs.beamfs /dev/sdX
+    mount -t beamfs /dev/sdX /mnt
+    fsck.beamfs /dev/sdX
+
+beamfs takes no mount options.
+
+Module parameters
+-----------------
+
+``scrub_interval_ms``
+  Milliseconds between two blocks for volumes mounted from then on
+  (default 100). 0 parks the scrubber; correction on read is
+  unaffected.
+
+``clock_source``
+  Declared quality of the wall clock that anchors journal timestamps:
+  0 unknown (the default), 1 RTC, 2 NTP, 3 hardware (PTP or GPS).
+
+sysfs
+-----
+
+Each mounted volume has a directory ``/sys/fs/beamfs/<dev>/``:
+
+``interval`` (rw)
+  Milliseconds between two blocks for this volume's scrubber.
+
+``cursor``, ``passes``, ``blocks`` (ro)
+  Position of the scrubber, completed sweeps, blocks decoded.
+
+``corrected``, ``uncorrectable`` (ro)
+  Blocks the scrubber corrected, and blocks it could not correct.
+
+``error_budget`` (ro)
+  For each number of corrected symbols, how many blocks reached it;
+  ``disabled`` if the volume has no error budget.
+
+``clock_anchor`` (ro)
+  Monotonic and wall-clock time at the same instant, and the declared
+  quality of the wall clock.
+
+``scrub_pace`` (ro)
+  The scrubber's current pace.
+
+``alert_rate_limit`` (rw)
+  Blocks corrected in one sweep at or above which an alert is sent; 0,
+  the default, disables the check.
+
+Alerts
+------
+
+When a threshold is crossed, beamfs sends a ``KOBJ_CHANGE`` uevent on
+``/sys/fs/beamfs/<dev>`` with ``BEAMFS_ALERT=1``, ``BEAMFS_REASON``
+and ``BEAMFS_DETAIL``, and logs the same line. ``BEAMFS_REASON`` is
+one of:
+
+``uncorrectable``
+  A block could not be recovered.
+
+``no-margin``
+  A block has used all its correctable symbols. It still reads
+  correctly.
+
+``correction-rate``
+  A sweep corrected at least ``alert_rate_limit`` blocks.
+
+Each reason is sent at most once a minute. What to do about an alert
+is left to userspace.
+
+debugfs and tracepoints
+-----------------------
+
+Reading ``/sys/kernel/debug/beamfs/rs_bench`` encodes and decodes in
+memory and reports the cost per block; ``rs_bench_iters`` sets the
+number of iterations. The tracepoints are in the ``beamfs`` trace
+system.
+
+
+Limitations
+===========
+
+- There is no journal and no copy-on-write. Metadata reaches the
+  medium through writeback, in no guaranteed order; after an unclean
+  shutdown the volume is checked with ``fsck.beamfs``.
+- Metadata goes through buffer heads.
+- Without ``DATA_SELFID``, an indirect pointer flipped onto another
+  allocated block in range is not detected.
+- The measurements published so far emulate single-bit upsets on the
+  read path, with at most two erroneous symbols per codeword and per
+  decode [#beamfsv3]_. The eight-symbol limit, bursts, miscorrection
+  and performance are not measured.
+
+
+References
+==========
+
+.. [#tg203] M. Miften et al., Management of radiotherapy patients with
+   implanted cardiac pacemakers and defibrillators: a report of the
+   AAPM TG-203, Medical Physics, 2019. doi:10.1002/mp.13838
+
+.. [#beamfsv3] A. Desbrieres, beamfs v3 technical report, Zenodo,
+   2026. doi:10.5281/zenodo.23253350
diff --git a/Documentation/filesystems/index.rst b/Documentation/filesystems/index.rst
index 7cce7cc28d12..bff91a3c82ff 100644
--- a/Documentation/filesystems/index.rst
+++ b/Documentation/filesystems/index.rst
@@ -74,6 +74,7 @@ Documentation for filesystem implementations.
    afs
    autofs
    autofs-mount-control
+   beamfs
    befs
    btrfs
    ceph
-- 
2.55.0

