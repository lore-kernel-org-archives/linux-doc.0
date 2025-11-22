Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684DF2E284B
	for <linux-doc@vger.kernel.org>; Sat, 22 Nov 2025 22:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763850270; cv=none; b=XJpcV4CZjiUnUjECoJLPfzfb5+FoChXW2Pt9BdbrKpMgxvXwkCt1VVWHPRaQZasI+3FeZye0XBBNN4V5KnYft6Ist4Lur1lMZTzUsNq3RkEkn5PZM7nyplCRhzvtmvs/QkSpUfilf/2/E9+VVbEJZ4iGrGT8Hd+x2QmF2JyuI1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763850270; c=relaxed/simple;
	bh=HckDMYe0+V7dIt+99RvEfUMzQcIYTFKI66vYhRUdjQA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lje2L7RbG/y7nDRTNf9EtvL0snzdDPrvOZmxhzwWlS48ZuyneLLXBwIoqMh2D/KtIdPB+1vRjZQrGQBKr4DKvBxFvNqZYD0/hP3FrT4yJ+fsTInBVxEncRqYNDKMP1IaBZRr8ueNWO81DQb94m3iVMJZXezEcmrUlQyba8YxLto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=kUNpuhcm; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="kUNpuhcm"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6420dc2e5feso2470010d50.3
        for <linux-doc@vger.kernel.org>; Sat, 22 Nov 2025 14:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763850266; x=1764455066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8oZaYRe5g0R4lweOQLAK81RG676DLPyUWLh/z30V3oE=;
        b=kUNpuhcmhJRzDdbopx+yw1ynUATxeENtPf4tOwHPPENr78Xz1DbY8zuYNGC0GNDPTa
         ZSk0TiTXYZP4GoAEH9ga0HJqU7yWWdru/Vbpyg2wwwpx4nYuC2OigJLFMpv3MSCnRcss
         8VgrDTkHGCLQ2t+gaP6n4rUES77FYvAgAmH9IZYo/H9rQV17xQZyJy7R5ks7GABKkWi8
         Grd5BW4wn5TyZ4RKzBrN6WPo8lbCWq4ImT2WC5mW72L4pS8dme6t1iJHvyM6T+b99QKd
         M64TuQZrRsHu4DEhr8Ss9BfKanjC9absBmTvPnBPvDDnPORW8ckvh/ZjV71fAGyb5XFP
         Xi9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763850266; x=1764455066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8oZaYRe5g0R4lweOQLAK81RG676DLPyUWLh/z30V3oE=;
        b=rjyNajQE50SEgnfMlXeFcTJvjwuXSX+Divqhe0+aSXdQze/usbH9yDK/M025nKl9iG
         8h1G22Rvi3bOj2beRmLxGLsR88Ci0HWI1VVNd+xz/28cGK8idTQsXxbpiehcgIwO6ZP3
         FyyRse96TewtOLaxvLMLV16ltot0PaUyZhShtSNlh846ButQHUl7gIQC+tlLJNWda/r6
         /DBtJ99vrkQJ/VuI5ZulI+G+7z3UPFTL/akyOG/7LPGHV2GXKMRH1B+v2zFoF25wkR/E
         kz55ri7/xIzGYkSMkAqtThsBqylLcTZv/OjOuGqpHD4eQpngNMuf6S1jeI4ZVQiLGxLO
         upVg==
X-Forwarded-Encrypted: i=1; AJvYcCU+7Jy2ypvW0yoQ2qO4zBraV8mrBmvZc1sB/DWHl87mP7yprkLO/f+Ci+UoZQetHUNhBGjSuvn19DA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6YkSu8ijjn3VV4C1OXta9c44xrwCYG5zNFSEbQ+ew+z7C1S50
	hOJOlkxSyiezVqzo5RZcgmStA+psKxKdxT9+UDhDlBLYv8ULnJ68qWU/4Mx8Qx9jPJQ=
X-Gm-Gg: ASbGnctMEhn9kficNAoWPtw8M7OCxwyZwdYuSBHH0HvierGKp5B2KVsQIDo9aVIZfGK
	df8+AHNa/vRlvp9wYCRmzagqdefNUeFzIoFeNYcVzAXbys6u9aLetnb2N6aTOn7BiOhsSTARZtH
	8BB4G2MQMMLfnj6NPXtaK9v8XuK6RJmv2LXp7qyvz5f2yRoh43xbU7yv2HlE2wrqzkLNYkWoz9s
	YxaKHWWKaYqWgyf0QxeM/A+IRO+oGSJf9N1/+r8ODGXgCTLCg1D93cWP+8uIlGTGXUSYHvk2Zfj
	K7vZbgQ3sV1Ytek96iNmn6EyWVX8LdzWHhG9TIVdw1EwWSXcF6RCbuZvBvTX4NIGvMvvQDAadDp
	8M3L+Inu+47p3N2CdVBGq+9lPD7XjjWZG4eKQeSnZy02Ai2mIt9T651f8svO7Op5Z8jfCObNJ7B
	8mHIkCrRF1UKF2su000JRfxowRAz6jLfnqYL1E5k3OcO2rwBcJ2MBNQRUP0bkE1sRqMyp3cXohp
	YeEMSlez4dN3Awwlw==
X-Google-Smtp-Source: AGHT+IFA8xiqyidX6vSHxt0Fa6KY7zq1D81H8XmTPSjBAk/TG7qP+fvxB9otYVm16cp+k+p4xO9fVA==
X-Received: by 2002:a05:690e:118d:b0:63f:b634:4224 with SMTP id 956f58d0204a3-64302a427cemr5083872d50.21.1763850266314;
        Sat, 22 Nov 2025 14:24:26 -0800 (PST)
Received: from soleen.c.googlers.com.com (182.221.85.34.bc.googleusercontent.com. [34.85.221.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78a79779a4esm28858937b3.0.2025.11.22.14.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 14:24:25 -0800 (PST)
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
Subject: [PATCH v7 15/22] docs: add documentation for memfd preservation via LUO
Date: Sat, 22 Nov 2025 17:23:42 -0500
Message-ID: <20251122222351.1059049-16-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.52.0.rc2.455.g230fcf2819-goog
In-Reply-To: <20251122222351.1059049-1-pasha.tatashin@soleen.com>
References: <20251122222351.1059049-1-pasha.tatashin@soleen.com>
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
index e1f0c13d5b4a..b776b625c60f 100644
--- a/Documentation/core-api/liveupdate.rst
+++ b/Documentation/core-api/liveupdate.rst
@@ -23,6 +23,13 @@ Live Update Orchestrator ABI
 .. kernel-doc:: include/linux/kho/abi/luo.h
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
index 000000000000..66e0fb6d5ef0
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
+.. kernel-doc:: include/linux/kho/abi/memfd.h
+   :doc: DOC: memfd Live Update ABI
+
+.. kernel-doc:: include/linux/kho/abi/memfd.h
+   :internal:
+
+See Also
+========
+
+- :doc:`/core-api/liveupdate`
+- :doc:`/core-api/kho/concepts`
diff --git a/MAINTAINERS b/MAINTAINERS
index 425c46bba764..cabbf30d50e1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14473,6 +14473,7 @@ R:	Pratyush Yadav <pratyush@kernel.org>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	Documentation/core-api/liveupdate.rst
+F:	Documentation/mm/memfd_preservation.rst
 F:	Documentation/userspace-api/liveupdate.rst
 F:	include/linux/liveupdate.h
 F:	include/linux/liveupdate/
-- 
2.52.0.rc2.455.g230fcf2819-goog

