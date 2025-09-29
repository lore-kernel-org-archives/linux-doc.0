Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E9526B0AE
	for <linux-doc@vger.kernel.org>; Mon, 29 Sep 2025 01:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759107885; cv=none; b=fNKyrtIeNKuF+gBAWRUss0uv3brLEp9O06CJzjGFcjN8nc97ZulYgnu2P/6ufjAK0MzEogjL5gyxhyA58WuJgZdruCAUTZMku9R9IYQYASsIanTgm+PmSVCl8GiHCUdUbenG0VJuzcKaiEC0XdLv0vGUPZXiX/K4egVxoHzBNto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759107885; c=relaxed/simple;
	bh=TZZO/P46r8g00GY+tV6D7n7mil1OMeqdQT3ahHm3ces=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uiKG0pD9bEmZgKpcMG1t6Ydfn1JGLLsVCo99I9efxxP4A5ZNJIbFeV6WzvBVdTh8pwujcVW26mf3SmFH8ltubXeYS2go2mMu+/tWj5ivhvTvcp00sCYqvNrdDa6evlEBDdU3L14fdrdSvF1GRrFWtFX3oHOWQlcXeWQnZ3wJ/hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=FbSIkthQ; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="FbSIkthQ"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4dffec0f15aso13100221cf.0
        for <linux-doc@vger.kernel.org>; Sun, 28 Sep 2025 18:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1759107880; x=1759712680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qo+j6vvSs0kYXvlpvUfoWrks4CXynF5fRGFMBKVd5/I=;
        b=FbSIkthQlOj+3XizBHveKhbLcXK6qQHekhjG4OJUBWy8szfN5fMow2YkXERBY/9FMP
         afyQaE6aVRSL8gO75nRyuBmIjfqjBtgDo/iDwDJnClbZTwyRp+VWarJd4YSGy7Y1MT9r
         WU16WI2csyTtKJKQwwBFDWfeT6SZ8Q87QKY+xeQAObRcYN4TuczQlOavjH+wG3enEep3
         /f5/cROo3XbQUgcn/8xKTQA0euedIRtLL4NnqAFSJIHhnCUCUMr+FxcML9h3/Ktb6++H
         Hxds0xFcPsIxymlHe4nKxaYN2jCnXHKAcY5e1brRpSowjFf2fcfIhMVO9OfLkZUB1cpO
         r1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759107880; x=1759712680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qo+j6vvSs0kYXvlpvUfoWrks4CXynF5fRGFMBKVd5/I=;
        b=cr674oPGQV8cHLsw5TSGKYL8b/tUIuKjX0vvsjwm0JCdebexffCW++aLyALX+j2VO8
         VJnWs1CGn31yq1MXlU/7bQQWQ9Lh+KeSCqunBE6t6cIdzTYtj9n9kRZ5WbdHjaki2PJ+
         fhNfiKHeMK+b+34ScEdtNR66SVhytrW45MinC0JJdgeHjD2qTkONO3LqcMiglSRG5HZi
         gkhmql7QekkYmxq3Gp7Nc5WT0IqAgteOfqzLakR0XziWU9sGnxcR+4XnQMfzKc7G7qFb
         bkh1LmyLLeVtPA5ThvhkYEIBk6ANPp+4sNokmuWkYo+DL354pZyqTf352z97jjA4gDem
         EKew==
X-Forwarded-Encrypted: i=1; AJvYcCXFvu62PGyc8MDmedW+s/n5LRJRDLFBix0tWDzCkNo/e5WQDaiMkdxLhQCUEpK5clsQbx8BgQ5MomE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH+sz49tpNa9zBmoRV20dS62eqxvejJ+aUzcjnxySAdEiaHL7D
	0OMCIUxuTzYRJZkG8tgEE4Ja/EUkWQgZXfNO929u9ibTBLvSFVpTJChWZTvpSYyxPvA=
X-Gm-Gg: ASbGncsOr6TY8yhbDVuz8RVxGL/0AT1XrvhxgU3v3XNBrizsy5Y/IHfIdqK9N1SkE8G
	ltTWCNzGsy2VOyM+XUzS6+llE7bvx4lcLezo+rG8IgMqQBjcPzjbfKvajMiqBmFs6+Z0hh7OJU4
	GBWC146yWeiABq8jtjJP6T5bys0gOBz53E1ArrB6yClWS1T3hCKqO50ScifbMfvwCS8ABq+Pu9s
	Jh920+UNDgV6K4hFVu0hbrq/s++IkwLLMTOJTb9I7nHQIMWizBJ86302IFYyVjtx84/1a++ZrRR
	J5eqFptf9SbxJtnE/BlLgDwIZ8nn+YZ7sImlIhQlbzLCuKw3irD00vo17OFJ4kub3t0Ci1+mw9q
	SMtXWgjPmD3KwAIv8jf2I0nvveB8xE2YOVlfYS+38hTfnj6wMtSZhbjyVzByQEJDHkl83XnL275
	836mdfH4A=
X-Google-Smtp-Source: AGHT+IFnn/Ai8Ev964hSNdZizcDfUH5OIiSZcW9Lxxs1D7Eu4fY6PuQ8Bl+TY2i03llueVLxiUozLg==
X-Received: by 2002:a05:622a:904:b0:4c3:a0ef:9060 with SMTP id d75a77b69052e-4da49253c74mr204367941cf.26.1759107880566;
        Sun, 28 Sep 2025 18:04:40 -0700 (PDT)
Received: from soleen.c.googlers.com.com (53.47.86.34.bc.googleusercontent.com. [34.86.47.53])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4db0c0fbe63sm64561521cf.23.2025.09.28.18.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 18:04:40 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
	changyuanl@google.com,
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
	chrisl@kernel.org,
	steven.sistare@oracle.com
Subject: [PATCH v4 19/30] docs: add luo documentation
Date: Mon, 29 Sep 2025 01:03:10 +0000
Message-ID: <20250929010321.3462457-20-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.51.0.536.g15c5d4f767-goog
In-Reply-To: <20250929010321.3462457-1-pasha.tatashin@soleen.com>
References: <20250929010321.3462457-1-pasha.tatashin@soleen.com>
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
 Documentation/core-api/liveupdate.rst      | 57 ++++++++++++++++++++++
 Documentation/userspace-api/index.rst      |  1 +
 Documentation/userspace-api/liveupdate.rst | 25 ++++++++++
 4 files changed, 84 insertions(+)
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
index 000000000000..7c1c3af6f960
--- /dev/null
+++ b/Documentation/core-api/liveupdate.rst
@@ -0,0 +1,57 @@
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
+LUO Subsystems Participation
+============================
+.. kernel-doc:: kernel/liveupdate/luo_subsystems.c
+   :doc: LUO Subsystems support
+
+LUO Sessions
+============
+.. kernel-doc:: kernel/liveupdate/luo_session.c
+   :doc: LUO Sessions
+
+LUO Preserving File Descriptors
+===============================
+.. kernel-doc:: kernel/liveupdate/luo_file.c
+   :doc: LUO file descriptors
+
+Public API
+==========
+.. kernel-doc:: include/linux/liveupdate.h
+
+.. kernel-doc:: kernel/liveupdate/luo_core.c
+   :export:
+
+.. kernel-doc:: kernel/liveupdate/luo_subsystems.c
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
+.. kernel-doc:: kernel/liveupdate/luo_subsystems.c
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
index 0167e59b541e..64b0099ee161 100644
--- a/Documentation/userspace-api/index.rst
+++ b/Documentation/userspace-api/index.rst
@@ -61,6 +61,7 @@ Everything else
    :maxdepth: 1
 
    ELF
+   liveupdate
    netlink/index
    shadow_stack
    sysfs-platform_profile
diff --git a/Documentation/userspace-api/liveupdate.rst b/Documentation/userspace-api/liveupdate.rst
new file mode 100644
index 000000000000..70b5017c0e3c
--- /dev/null
+++ b/Documentation/userspace-api/liveupdate.rst
@@ -0,0 +1,25 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+================
+Live Update uAPI
+================
+:Author: Pasha Tatashin <pasha.tatashin@soleen.com>
+
+ioctl interface
+===============
+.. kernel-doc:: kernel/liveupdate/luo_ioctl.c
+   :doc: LUO ioctl Interface
+
+ioctl uAPI
+===========
+.. kernel-doc:: include/uapi/linux/liveupdate.h
+
+LUO selftests ioctl
+===================
+.. kernel-doc:: kernel/liveupdate/luo_selftests.c
+   :doc: LUO Selftests
+
+See Also
+========
+
+- :doc:`Live Update Orchestrator </core-api/liveupdate>`
-- 
2.51.0.536.g15c5d4f767-goog

