Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C060B248F72
	for <linux-doc@vger.kernel.org>; Sat, 15 Nov 2025 23:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763249696; cv=none; b=WEe8VLe3EyQfid2HxYkKCxfM59gi/CXFVcGmaqI50034otlxZCYHDQMLAukdoTbniibk5oC4sLPKcKnIvKrWPLU8LjRDaDCCJtBffGaOiCxbRp9eHrD0q0jp4LuCrvxyxUDAaPZePQ3D7v5ZSu771iQSdYGXWLpSmBpspqbPD/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763249696; c=relaxed/simple;
	bh=ozB694jmbnonJd7q0YUnhbTNPWhn9EUs4khf2so6x4U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aihhp08t3fJbnfC87YOOu9MumzTT5sNIJi1XThoQU7uPqqf+9DIXreYg8rsZkDUWdaxof5pvzwvpmSh3MdhxcKRSaVg6p17mTtRVMtylGOYqpdN713Fr2oe2gx3tllcD1u92jpg3osn2uPBZG2AyyqRfgyr4nDIzM3HxheXBFBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Fe01lsQq; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Fe01lsQq"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-63fca769163so2887523d50.2
        for <linux-doc@vger.kernel.org>; Sat, 15 Nov 2025 15:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763249694; x=1763854494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fTOw5RLmNkeRdWzsM1mSOCwBuPeRYehGrzOUVePWwho=;
        b=Fe01lsQqg+ABF38Ii8gQw3+qtMhC+EuRx1QflpJXzZNME+8qvFr/P4UbqtHpD0evDu
         AQ7mde8yT7bKaiaWpo4MlpYZ8ziCH7yLn8Ax06mruSzgl1wnaFf6H+RJzQbhqUtx3Cd2
         e1S5SYsld6+CMOlCTP0SV6WA2ch/Xy8Q2smWrJ5nec6ZLE0VgAFechKO3KAPN5cE61O+
         3IbVe0I1b6NYK2TcrBzXfSOF0VNNgW0JzNDs5q4O8Q1cqO1ry1/3ZmWdpvx80XarZ2fn
         QvQ5Ft69wID/5KvK7WLQwd8hx+7g9XB9Cfi28uebAwQ9nefmtUOUJprapiWNVTd9ZVdP
         rGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763249694; x=1763854494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fTOw5RLmNkeRdWzsM1mSOCwBuPeRYehGrzOUVePWwho=;
        b=Ua4/fi+DqvpMcB0bZVTiin5kbh66QrCsG2NNSr9MIQ/yrRkOIETPBrh0ZvAmtMIwpE
         64w0uAzkfDAhZJhFkKBIl8Sd0mPPOAUho17Ix375ExGQ8wcp5OuEBq4HdpJZUogsLqpw
         45dw9c2hP0c+UPVtJAR+lGAFhlT+WjaFFP8J4YINJAlq5tmZ5F+mly0+UJuU3Rk6kF2I
         neFMt0bcM7TT3WqIXxAb35Om06qCCfaoh946IRgD/vxHQMHyeLGOVKxcWIhGttJpUN6X
         VtGAF1BR0zsIxzZ81poRWXUHSLwSxeWpBwy3Os9/+Z4nwIQbfKp2ut+PAqi/tGp4vsNu
         DsFw==
X-Forwarded-Encrypted: i=1; AJvYcCWcT8tG0cNHdvm9rhXCqmumhiV7TPyZD8X+SkKYs/MaXemUYe2QFWC+bMrA64n2LRVoeRZUja6RnuA=@vger.kernel.org
X-Gm-Message-State: AOJu0YygNqYz5MmQmgVTY6zrtqxp9BLX7oltz75Ln/i+VwOdHsFiLv3S
	35fIp7S7XNCCDijqzbKlzdhitRl8jR/i3hp7kJhWUGcH7QB41p+aL9WLTKOYnJSrBus=
X-Gm-Gg: ASbGncug8t+XoWNcLHSSUKYvKiS9USfa0foxX9r65ZZfcFlqEJKxKYurbs7oAkFpH0e
	m0IDU6RnWb4VDPPZu9IF01dHnsMvtKghRuaz46tKotZTwPujBzn/87YD5QWgLATGRGKsL1N+RZL
	Tf2saWnQcx/ZA73IzyGpWuIaYZKjiTQJaXAHK16G9XZj23OYQgNO3yGapcPINuk8iKJOQ0g15lE
	D39emLW3VBKVJNh4QrbMLuvBIAtEy6ZwtnnYfQ1UhCgh1Tt5eqBQIqT7QFdMQHvNYzJiKVsPaJB
	09B52cbw+nQOoT4pVhnO/OA6Z8hDi2R9KOkCK4JeeCr1a4hGX7hj7OsRx4omixM+r2RiGIkGUJk
	bUc154cG7LhuJmrqXIZvaQeE01V3zQm3qdW2qUyjEoK2uzKrpcDvFKvD5cBGFWpqLlD8RrF6BlF
	Xfga3T7qHsxb+/q/qy48J+ZDBSR5BEA6DncHWXs10JSKuJK2FlSwBKRJZo1ZHhJtJ0dCUvT100z
	P88rwk=
X-Google-Smtp-Source: AGHT+IE86X5p/xDAl3c7gipm+lk2CKoWWGbQ3TowepV0QBeNnwP3lOoccaKcpzs5yPfF3BpHdJYzlA==
X-Received: by 2002:a53:d006:0:b0:641:f5bc:6944 with SMTP id 956f58d0204a3-641f5bc71acmr2800491d50.72.1763249693809;
        Sat, 15 Nov 2025 15:34:53 -0800 (PST)
Received: from soleen.c.googlers.com.com (182.221.85.34.bc.googleusercontent.com. [34.85.221.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7882218774esm28462007b3.57.2025.11.15.15.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 15:34:52 -0800 (PST)
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
Subject: [PATCH v6 16/20] docs: add documentation for memfd preservation via LUO
Date: Sat, 15 Nov 2025 18:34:02 -0500
Message-ID: <20251115233409.768044-17-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
In-Reply-To: <20251115233409.768044-1-pasha.tatashin@soleen.com>
References: <20251115233409.768044-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pratyush Yadav <ptyadav@amazon.de>

Add the documentation under the "Preserving file descriptors" section of
LUO's documentation.

Signed-off-by: Pratyush Yadav <ptyadav@amazon.de>
Co-developed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 Documentation/core-api/liveupdate.rst   |  7 +++++++
 Documentation/mm/index.rst              |  1 +
 Documentation/mm/memfd_preservation.rst | 23 +++++++++++++++++++++++
 MAINTAINERS                             |  1 +
 4 files changed, 32 insertions(+)
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
index 000000000000..4f09c3921893
--- /dev/null
+++ b/Documentation/mm/memfd_preservation.rst
@@ -0,0 +1,23 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+==========================
+Memfd Preservation via LUO
+==========================
+
+.. kernel-doc:: mm/memfd_luo.c
+   :doc: Memfd Preservation via LUO
+
+Memfd Preservation ABI
+======================
+
+.. kernel-doc:: include/linux/liveupdate/abi/memfd.h
+   :doc: DOC: memfd Live Update ABI
+
+.. kernel-doc:: include/linux/liveupdate/abi/memfd.h
+   :internal:
+
+See Also
+========
+
+- :doc:`/core-api/liveupdate`
+- :doc:`/core-api/kho/concepts`
diff --git a/MAINTAINERS b/MAINTAINERS
index ad9fee6dc605..6ffe4425adbf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14470,6 +14470,7 @@ R:	Pratyush Yadav <pratyush@kernel.org>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	Documentation/core-api/liveupdate.rst
+F:	Documentation/mm/memfd_preservation.rst
 F:	Documentation/userspace-api/liveupdate.rst
 F:	include/linux/liveupdate.h
 F:	include/linux/liveupdate/
-- 
2.52.0.rc1.455.g30608eb744-goog

