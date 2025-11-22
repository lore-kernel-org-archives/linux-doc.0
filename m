Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7539B2D879E
	for <linux-doc@vger.kernel.org>; Sat, 22 Nov 2025 22:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763850256; cv=none; b=PCtocCtNfikqiGyTpttaj3IjxEpVy3YKizrRIhiN64DRkV33krsv72Z+6Ql5tCFgMGiyIP/M0n9/tVERQ+ssLLik3OKy4bTA0c4Co0FKyfsC67LykTaxL52ncENOputnIPm10QgFWFrSjN8xS9rG3TVB9H4YHC+jaoqKgoLHTso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763850256; c=relaxed/simple;
	bh=1xESM3kSF6vnWYSb1QgtWGhaZBJp9gmYV9s8UUP630A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kzm0vuZase7gQ85vcExFQVHdHNwWfAhNCf47wdAEghVfQ94fa4NCliBnvz07yEcRB9lD2fhMfUr1eMnT9J19fMmw4Eawt3jgLo9483WLeq2BZ5UC77zcBcC4G/kkEOdYgDYxEv2IepA+QjHh82CGOhksNylKxUSNnZ4+Nn54/Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=EKZSh50U; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="EKZSh50U"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-786635a8ce4so25677437b3.2
        for <linux-doc@vger.kernel.org>; Sat, 22 Nov 2025 14:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763850253; x=1764455053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G9VyPKNhrn6KupO2JDxcjMrdrPrlD9k+PG4k0aWwewA=;
        b=EKZSh50UwQFxjlcTV07lk8FgnLcovZponwg3MsyQ0oXvmZnzthjz0qar0sFedeADGx
         WN9d+Ujs5MJwp0+78pdJiAubqSXrs2j7gvXOrXEqe4obDVXZHRFa24LPtT0yrcmq8+JR
         eRyeSkJSBb0ky5giXZdPKNgaltJn+UucOOn1o1h+Br5ypohMNzsjyTwUHCQGzXhXjrSg
         XnS1GiexdfM9Hs6HY6pSDI856IcXMueeyM5S+UIZkLb9Yb5qpwws9HdMoIkglCO0lmSr
         JQ9VFWY2VUpIgC018HBGYRHvQHPHuC94PkkPgQjhoadlyXPehjwECUEO7rdpIGy/u0mz
         wvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763850253; x=1764455053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G9VyPKNhrn6KupO2JDxcjMrdrPrlD9k+PG4k0aWwewA=;
        b=U7zHM6OBs8u8tj/MvMRi/YQY/Fo7Z7P0AfWoe5pQY2B2NFyFLOuKWzKWSfB5YqyT6W
         51T+LBYCfPecfHbL5lYH4BrOqI+Hp3hHRNnVW9X6G8+DF1jD9adYrkUkpOnBO4vfOgF6
         3mjs4UGTuUpC/EDQdx3Jg+kNHi0wsrbCmDwfcnJONhy5Vn5gDt9THj5xe4CZn8qHrPUU
         OYBP2raBKYQ2keJyDKY6HCBz5NGL8g2c5BsvUrboCoMO+rb0enANZVquNeN3uTxaWkK8
         rnI4V+71VRp+naVAwykomyKHFA5v+rggXlC/ok9V+/oIX921USxNrzPAupH7QujvRv9p
         whWA==
X-Forwarded-Encrypted: i=1; AJvYcCWRGY5vuM2n5HdfIvT9LN4//5ouGdoo8zG1WY3Z30eHx+sCnUE1txPP/BAa2hZ7cXp/+o7/pJdc+Zc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJOMoBea9+xFc7P59GBoi3ZjCROMHzyy/4tA4t39smdBG6TfGJ
	Jmk7JonOb7KJHOw07qQBJBLSfysoJG3wX87x9Uocf/dUTjiL9pGekJzcq3vw503rpo8=
X-Gm-Gg: ASbGncsg7eWqre7ru3D892JhmEOGPRFtx55Zv6+Cx/JV7LKJAiPd6lhdDYBBfBwnFje
	pdOPNQTdL/HBl6mXd2jbBl1zCLoUMDjxcxG++WM/ghezk1mqNkpaLBp1aGfVqAvCXyAjkitNGtJ
	0lqvU1A8/DcelZbOVG1tEu3IyHn+lmSZYcdH3l2XR+J9me0MANl5pT2w0A09DdfYYbEhw3hf6Z1
	LDe3aDxFJ9KvCdeBQMwzFI+7RmqFqcot7jBiBjP8i7DsTneexmUvgVbUBHYH9G42ZBW2o07lQGV
	75gZ3r2m7yoocdORS7kAHmHPkaClphUZmcvpD5F4gg78EZ93vi8Gdhn8AEE1pM2FePhNBGEBPdL
	euAptMEaqwdLeVsZjS8tmUMMrEQKuW5TKsC6JAbCo1RTbsL0x2+Fq7VKSzsBm0TZHIFpCl6rRRV
	Et0PmH9DUZmnCdIa9ilLW2jHVmbJf7Oz5sK8JToDDeQYwPZ3996flw+6wYzmn8i2b98D6YmE2EC
	TP6LDpyhvQS29Mkog==
X-Google-Smtp-Source: AGHT+IHmRWFE7rOb/6+yLAu3Pk2al1IPioQp+ETOH2bTApyjFAeLipumKzaBW+6hLLJxhT3rh6iVOw==
X-Received: by 2002:a05:690c:d88:b0:786:a39e:e836 with SMTP id 00721157ae682-78a8b5672d2mr62717227b3.60.1763850253309;
        Sat, 22 Nov 2025 14:24:13 -0800 (PST)
Received: from soleen.c.googlers.com.com (182.221.85.34.bc.googleusercontent.com. [34.85.221.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78a79779a4esm28858937b3.0.2025.11.22.14.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 14:24:12 -0800 (PST)
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
Subject: [PATCH v7 08/22] docs: add luo documentation
Date: Sat, 22 Nov 2025 17:23:35 -0500
Message-ID: <20251122222351.1059049-9-pasha.tatashin@soleen.com>
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

Add the documentation files for the Live Update Orchestrator

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 Documentation/core-api/index.rst           |  1 +
 Documentation/core-api/liveupdate.rst      | 53 ++++++++++++++++++++++
 Documentation/userspace-api/index.rst      |  1 +
 Documentation/userspace-api/liveupdate.rst | 20 ++++++++
 4 files changed, 75 insertions(+)
 create mode 100644 Documentation/core-api/liveupdate.rst
 create mode 100644 Documentation/userspace-api/liveupdate.rst

diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
index 6cbdcbfa79c3..5eb0fbbbc323 100644
--- a/Documentation/core-api/index.rst
+++ b/Documentation/core-api/index.rst
@@ -138,6 +138,7 @@ Documents that don't fit elsewhere or which have yet to be categorized.
    :maxdepth: 1
 
    librs
+   liveupdate
    netlink
 
 .. only:: subproject and html
diff --git a/Documentation/core-api/liveupdate.rst b/Documentation/core-api/liveupdate.rst
new file mode 100644
index 000000000000..e1f0c13d5b4a
--- /dev/null
+++ b/Documentation/core-api/liveupdate.rst
@@ -0,0 +1,53 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+========================
+Live Update Orchestrator
+========================
+:Author: Pasha Tatashin <pasha.tatashin@soleen.com>
+
+.. kernel-doc:: kernel/liveupdate/luo_core.c
+   :doc: Live Update Orchestrator (LUO)
+
+LUO Sessions
+============
+.. kernel-doc:: kernel/liveupdate/luo_session.c
+   :doc: LUO Sessions
+
+LUO Preserving File Descriptors
+===============================
+.. kernel-doc:: kernel/liveupdate/luo_file.c
+   :doc: LUO File Descriptors
+
+Live Update Orchestrator ABI
+============================
+.. kernel-doc:: include/linux/kho/abi/luo.h
+   :doc: Live Update Orchestrator ABI
+
+Public API
+==========
+.. kernel-doc:: include/linux/liveupdate.h
+
+.. kernel-doc:: include/linux/kho/abi/luo.h
+
+.. kernel-doc:: kernel/liveupdate/luo_core.c
+   :export:
+
+.. kernel-doc:: kernel/liveupdate/luo_file.c
+   :export:
+
+Internal API
+============
+.. kernel-doc:: kernel/liveupdate/luo_core.c
+   :internal:
+
+.. kernel-doc:: kernel/liveupdate/luo_session.c
+   :internal:
+
+.. kernel-doc:: kernel/liveupdate/luo_file.c
+   :internal:
+
+See Also
+========
+
+- :doc:`Live Update uAPI </userspace-api/liveupdate>`
+- :doc:`/core-api/kho/concepts`
diff --git a/Documentation/userspace-api/index.rst b/Documentation/userspace-api/index.rst
index b8c73be4fb11..8a61ac4c1bf1 100644
--- a/Documentation/userspace-api/index.rst
+++ b/Documentation/userspace-api/index.rst
@@ -61,6 +61,7 @@ Everything else
    :maxdepth: 1
 
    ELF
+   liveupdate
    netlink/index
    sysfs-platform_profile
    vduse
diff --git a/Documentation/userspace-api/liveupdate.rst b/Documentation/userspace-api/liveupdate.rst
new file mode 100644
index 000000000000..41c0473e4f16
--- /dev/null
+++ b/Documentation/userspace-api/liveupdate.rst
@@ -0,0 +1,20 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+================
+Live Update uAPI
+================
+:Author: Pasha Tatashin <pasha.tatashin@soleen.com>
+
+ioctl interface
+===============
+.. kernel-doc:: kernel/liveupdate/luo_core.c
+   :doc: LUO ioctl Interface
+
+ioctl uAPI
+===========
+.. kernel-doc:: include/uapi/linux/liveupdate.h
+
+See Also
+========
+
+- :doc:`Live Update Orchestrator </core-api/liveupdate>`
-- 
2.52.0.rc2.455.g230fcf2819-goog

