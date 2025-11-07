Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540C032AAAC
	for <linux-doc@vger.kernel.org>; Fri,  7 Nov 2025 21:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762549571; cv=none; b=GBJNgeGs2+yN6FXQflnInhBIhAzrPGN4I70myIsM6Wt48iob35h0+wLupDbJZSTPjEmy12Dj/bzEqq8SvW4o4ab0EjQsvvbijNfoR9Qq+ZtM/jDxpAekTGDyvpkIS2vc7smvGWWGROq75FqSgtACUsP0N3nWsdvVeCWdGhvmDUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762549571; c=relaxed/simple;
	bh=LXpw63l9s85+A2ywC95X1cdCWNl0UMCa9L8ALqPe8sU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UmNGTsAtyR62OnqjZd3/luA9Ejv0x/GYwj9yh7F47CDp6MWOWc+4ini4ZVIURl4uiqFTss4YgfFYNiWvDXtlW4PyHFYkWu2eekHFtKQa5lSsp+Aj7zjgu8kJXy3clxdfgPCvO9oICq9kmQnUB4JnlW9eLaTIqEFgq2pf5VkkRII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=b60BptG+; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="b60BptG+"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-63f95dc176fso1195329d50.1
        for <linux-doc@vger.kernel.org>; Fri, 07 Nov 2025 13:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1762549567; x=1763154367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JsTES3jh+g2TZ5eZZXKIDmlAfD8Fsxtr8nl7dy6CsdM=;
        b=b60BptG+gjWR+9zKdkv6BZG/IMz7hbn1ri7IN1sa6ZcL141v4Dp217b9N1emp+0vMy
         kl7G+2qUHck08rVk94JhfctLp8ec5WmCLI7or4a53ZUEtavB7SL8JIaRH4gdIYCQN3BN
         5F+HU5ncrw2qUSxcgAqwuLB+SxTM368hS0jR917KbPhwZptzxoXGbPBBsTQeDdiUpPBY
         PVZKD2eyGCkkiAFct/JWu/6gEQfhHz6b3eE0eic8n+6Q9TXGx4VnewA2NpjoGDy2ezOq
         eDPhI0UrnpqBkGq6IZohIl7xOZQ6oYXDKSKOd3HYI68ZEQ9xY272OfG4srKj6dBt2rMn
         jxPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762549567; x=1763154367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JsTES3jh+g2TZ5eZZXKIDmlAfD8Fsxtr8nl7dy6CsdM=;
        b=xN3QdUnk7BnJhr6IimmOQ7PqhAf1q/EivSiU4jBNyoCWs4IAskLqGWjiB9pai7GExl
         oXMRYWSBylV9sjpOVPHIqeDesLHMJOZlLHWhVVmaolcFYg96sO0pdYYAl1bW6MbFYSt7
         UO8Pi+ZbimMVCbeOnnEWXVkYjzMgAfDc0RPi30njcN6E9TEoVWQBgCA21SgugyvC3AuE
         ldOx1b0rY1CPxh9WxnZady02vJQ1W56ZxMoPS1m6FkL11ZMTIb+WUQkP/r94lrQfOnSG
         Yw6SOnq8qN3a/aL7qfBDvvjFYReISbp8S3EWf2XbeBs2H5VGjVCu0FttqHoXf486SDJW
         Vk8A==
X-Forwarded-Encrypted: i=1; AJvYcCV6WeZkC2fOAdxge3cajYOjCnqjMLkCHAZosf10CUM+2fKZinmRykrwCQPkG5ivNV1q1qaowtVd8eo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB8NP9hh4VLWAevrfLJ92/qeIttGJS4q7fv3TXdKCAfyCr3ZHy
	cyTAi2G/NnEqQqBiUOamFgEd782q52MSYXptIKUrIqllA0OBw30Qk0ELRxJO/eIrPDg=
X-Gm-Gg: ASbGncuioj4Uf6ur+DOP1CknIOj+o5h6FxeimbHakX8+hWC6MjSXjP9TJuG0ywhJIbu
	Ej/jwWgtkMv+8NQ4m1TZy2jXk33UawJoxETCNjwgEal5tcX7aFwI5KHH/pKstTKLi8TWpGMGHyc
	rv3uOQ74ZYRlOubX79wa3NaXGAe7Byrudva1B3BkfjR75pNteA6c1kXmaqywNLzaBnNp501nJ+f
	qOHIiMNJU21jOow1wlzhI/QdChOhm6WN4Q+xeR+vkmdM5iUrUudYqtcYzkjtu7ANucJTNHk+3qW
	VtBAs1a4Zxz25+PyT+1Ud5Eo1fdMGwEpQqDvBK36Zb/yufbhIHNwjdD/mxWDGC+xqYKAk2yDxpn
	c0XumthJwoJAHq5E/7FiV+EtDAEvrw+1SxQWeW/rBHUCXVSN9xa1VDlQZYo2JfCfjsrpXZmKX1L
	7M1xvNB3A7oYy653DnZ0BbYHqE98a2iKM/p0yKDdEYyIcxqg9XMyof8iERfzvKgWVt148FJ+fu6
	Q==
X-Google-Smtp-Source: AGHT+IFYVLUYsoz4qqSx1jdSCSSHR6CFRDP48gNnoQOXCk0YbarCB32vquZ/fupTODYyB7YDg+0Eyw==
X-Received: by 2002:a05:690e:1604:b0:640:caa5:57bf with SMTP id 956f58d0204a3-640d454752emr376765d50.24.1762549567082;
        Fri, 07 Nov 2025 13:06:07 -0800 (PST)
Received: from soleen.c.googlers.com.com (53.47.86.34.bc.googleusercontent.com. [34.86.47.53])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-787d68754d3sm990817b3.26.2025.11.07.13.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 13:06:06 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	dmatlack@google.com,
	rientjes@google.com,
	corbet@lwn.net,
	rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com,
	ojeda@kernel.org,
	aliceryhl@google.com,
	masahiroy@kernel.org,
	akpm@linux-foundation.org,
	tj@kernel.org,
	yoann.congal@smile.fr,
	mmaurer@google.com,
	roman.gushchin@linux.dev,
	chenridong@huawei.com,
	axboe@kernel.dk,
	mark.rutland@arm.com,
	jannh@google.com,
	vincent.guittot@linaro.org,
	hannes@cmpxchg.org,
	dan.j.williams@intel.com,
	david@redhat.com,
	joel.granados@kernel.org,
	rostedt@goodmis.org,
	anna.schumaker@oracle.com,
	song@kernel.org,
	zhangguopeng@kylinos.cn,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	rafael@kernel.org,
	dakr@kernel.org,
	bartosz.golaszewski@linaro.org,
	cw00.choi@samsung.com,
	myungjoo.ham@samsung.com,
	yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com,
	quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com,
	ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com,
	leon@kernel.org,
	lukas@wunner.de,
	bhelgaas@google.com,
	wagi@kernel.org,
	djeffery@redhat.com,
	stuart.w.hayes@gmail.com,
	ptyadav@amazon.de,
	lennart@poettering.net,
	brauner@kernel.org,
	linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	saeedm@nvidia.com,
	ajayachandra@nvidia.com,
	jgg@nvidia.com,
	parav@nvidia.com,
	leonro@nvidia.com,
	witu@nvidia.com,
	hughd@google.com,
	skhawaja@google.com,
	chrisl@kernel.org
Subject: [PATCH v5 18/22] docs: add documentation for memfd preservation via LUO
Date: Fri,  7 Nov 2025 16:03:16 -0500
Message-ID: <20251107210526.257742-19-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
In-Reply-To: <20251107210526.257742-1-pasha.tatashin@soleen.com>
References: <20251107210526.257742-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pratyush Yadav <ptyadav@amazon.de>

Add the documentation under the "Preserving file descriptors" section of
LUO's documentation. The doc describes the properties preserved,
behaviour of the file under different LUO states, serialization format,
and current limitations.

Signed-off-by: Pratyush Yadav <ptyadav@amazon.de>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 Documentation/core-api/liveupdate.rst   |   7 ++
 Documentation/mm/index.rst              |   1 +
 Documentation/mm/memfd_preservation.rst | 138 ++++++++++++++++++++++++
 MAINTAINERS                             |   1 +
 4 files changed, 147 insertions(+)
 create mode 100644 Documentation/mm/memfd_preservation.rst

diff --git a/Documentation/core-api/liveupdate.rst b/Documentation/core-api/liveupdate.rst
index deacc098d024..384de79a2457 100644
--- a/Documentation/core-api/liveupdate.rst
+++ b/Documentation/core-api/liveupdate.rst
@@ -28,6 +28,13 @@ Live Update Orchestrator ABI
 .. kernel-doc:: include/linux/liveupdate/abi/luo.h
    :doc: Live Update Orchestrator ABI
 
+The following types of file descriptors can be preserved
+
+.. toctree::
+   :maxdepth: 1
+
+   ../mm/memfd_preservation
+
 Public API
 ==========
 .. kernel-doc:: include/linux/liveupdate.h
diff --git a/Documentation/mm/index.rst b/Documentation/mm/index.rst
index ba6a8872849b..7aa2a8886908 100644
--- a/Documentation/mm/index.rst
+++ b/Documentation/mm/index.rst
@@ -48,6 +48,7 @@ documentation, or deleted if it has served its purpose.
    hugetlbfs_reserv
    ksm
    memory-model
+   memfd_preservation
    mmu_notifier
    multigen_lru
    numa
diff --git a/Documentation/mm/memfd_preservation.rst b/Documentation/mm/memfd_preservation.rst
new file mode 100644
index 000000000000..3fc612e1288c
--- /dev/null
+++ b/Documentation/mm/memfd_preservation.rst
@@ -0,0 +1,138 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+==========================
+Memfd Preservation via LUO
+==========================
+
+Overview
+========
+
+Memory file descriptors (memfd) can be preserved over a kexec using the Live
+Update Orchestrator (LUO) file preservation. This allows userspace to transfer
+its memory contents to the next kernel after a kexec.
+
+The preservation is not intended to be transparent. Only select properties of
+the file are preserved. All others are reset to default. The preserved
+properties are described below.
+
+.. note::
+   The LUO API is not stabilized yet, so the preserved properties of a memfd are
+   also not stable and are subject to backwards incompatible changes.
+
+.. note::
+   Currently a memfd backed by Hugetlb is not supported. Memfds created
+   with ``MFD_HUGETLB`` will be rejected.
+
+Preserved Properties
+====================
+
+The following properties of the memfd are preserved across kexec:
+
+File Contents
+  All data stored in the file is preserved.
+
+File Size
+  The size of the file is preserved. Holes in the file are filled by allocating
+  pages for them during preservation.
+
+File Position
+  The current file position is preserved, allowing applications to continue
+  reading/writing from their last position.
+
+File Status Flags
+  memfds are always opened with ``O_RDWR`` and ``O_LARGEFILE``. This property is
+  maintained.
+
+Non-Preserved Properties
+========================
+
+All properties which are not preserved must be assumed to be reset to default.
+This section describes some of those properties which may be more of note.
+
+``FD_CLOEXEC`` flag
+  A memfd can be created with the ``MFD_CLOEXEC`` flag that sets the
+  ``FD_CLOEXEC`` on the file. This flag is not preserved and must be set again
+  after restore via ``fcntl()``.
+
+Seals
+  File seals are not preserved. The file is unsealed on restore and if needed,
+  must be sealed again via ``fcntl()``.
+
+Behavior with LUO states
+========================
+
+This section described the behavior of the memfd in the different LUO states.
+
+Normal Phase
+  During the normal phase, the memfd can be marked for preservation using the
+  ``LIVEUPDATE_SESSION_PRESERVE_FD`` ioctl. The memfd acts as a regular memfd
+  during this phase with no additional restrictions.
+
+Prepared Phase
+  After LUO enters ``LIVEUPDATE_STATE_PREPARED``, the memfd is serialized and
+  prepared for the next kernel. During this phase, the below things happen:
+
+  - All the folios are pinned. If some folios reside in ``ZONE_MIGRATE``, they
+    are migrated out. This ensures none of the preserved folios land in KHO
+    scratch area.
+  - Pages in swap are swapped in. Currently, there is no way to pass pages in
+    swap over KHO, so all swapped out pages are swapped back in and pinned.
+  - The memfd goes into "frozen mapping" mode. The file can no longer grow or
+    shrink, or punch holes. This ensures the serialized mappings stay in sync.
+    The file can still be read from or written to or mmap-ed.
+
+Freeze Phase
+  Updates the current file position in the serialized data to capture any
+  changes that occurred between prepare and freeze phases. After this, the FD is
+  not allowed to be accessed.
+
+Restoration Phase
+  After being restored, the memfd is functional as normal with the properties
+  listed above restored.
+
+Cancellation
+  If the liveupdate is cancelled after going into prepared phase, the memfd
+  functions like in normal phase.
+
+Serialization format
+====================
+
+The state is serialized in an FDT with the following structure::
+
+  /dts-v1/;
+
+  / {
+      compatible = "memfd-v1";
+      pos = <current_file_position>;
+      size = <file_size_in_bytes>;
+      folios = <array_of_preserved_folio_descriptors>;
+  };
+
+Each folio descriptor contains:
+
+- PFN + flags (8 bytes)
+
+  - Physical frame number (PFN) of the preserved folio (bits 63:12).
+  - Folio flags (bits 11:0):
+
+    - ``PRESERVED_FLAG_DIRTY`` (bit 0)
+    - ``PRESERVED_FLAG_UPTODATE`` (bit 1)
+
+- Folio index within the file (8 bytes).
+
+Limitations
+===========
+
+The current implementation has the following limitations:
+
+Size
+  Currently the size of the file is limited by the size of the FDT. The FDT can
+  be at of most ``MAX_PAGE_ORDER`` order. By default this is 4 MiB with 4K
+  pages. Each page in the file is tracked using 16 bytes. This limits the
+  maximum size of the file to 1 GiB.
+
+See Also
+========
+
+- :doc:`Live Update Orchestrator </core-api/liveupdate>`
+- :doc:`/core-api/kho/concepts`
diff --git a/MAINTAINERS b/MAINTAINERS
index 3497354b7fbb..3ece47c552a8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14518,6 +14518,7 @@ R:	Pratyush Yadav <pratyush@kernel.org>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	Documentation/core-api/liveupdate.rst
+F:	Documentation/mm/memfd_preservation.rst
 F:	Documentation/userspace-api/liveupdate.rst
 F:	include/linux/liveupdate.h
 F:	include/linux/liveupdate/
-- 
2.51.2.1041.gc1ab5b90ca-goog

