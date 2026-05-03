Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79782749DF
	for <linux-doc@vger.kernel.org>; Sun,  3 May 2026 10:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777803325; cv=none; b=YHgW81LbvCvAbpFkZVGNf2X56Arudh0EaBZvv0CYNCy7zN2bRCiyKFbfoMT7yXVCIknaHeMQZP1U1Cr1er58a3/YVEGbzsz9e9RXAt67HcxAV5oc1mO6m8k4HmGMANS42MuFfesjE/0+D1HByg6Nxmxzxx0XhQmT6frdRuZQtcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777803325; c=relaxed/simple;
	bh=ntxk9XkXo2qFOsaC1Pln31AaPrQ55Fcl5c6Gpk8SfSM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pDqXcBc+SrKc8Wg+4e/TwiR5g6+mj/iEEgRU9ZR+RHZLAXYAYCgYW9B+j0MeDqZHrvtXv1jpBe5zKi3e44RxhnM0EcC+rW639Rs7sTcgnR9lfS25UgJPeHlKDaks55sRLt46Q4XbFIi1PuDWZ1NT4OTfeshiBkX0BkcuiQaOsZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=liJ0FbQ+; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="liJ0FbQ+"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2b458ca2296so18500795ad.0
        for <linux-doc@vger.kernel.org>; Sun, 03 May 2026 03:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777803324; x=1778408124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2/UYThvEY+1ayHncAH4N9/83tKpiIo8BAMYNggRMxm4=;
        b=liJ0FbQ+VkEYd6hd9zf+WBeSlqd8P4F6p+x/sm6P/onikCKXAnoDxnwmBLvJ3ustSS
         CZqNMFwXXyd5WCyJbeMHNe0mwllTbA7CDem9fYQqAK11zlolfOtrbKLeCIHo8pNv0oE1
         XT1kTdVltJMlYe08LK0f/hLPZNZ2BI6HUjsnPiDY/8b27Ah1PZaTE80TqNtdeIGGujOC
         8VivK65A30JvmBX4KzyoRZOYxjPe+Tbrji8K8AMtkj3b8RlkKQxmA8uPKDnGbuBpuKXn
         5JYQDGi9PJMnQB6CXjJVCfzH8ybjO1O+JvTk8DYXBJPhcyj4/lmYQGdTeKedLYgs5OLi
         uN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777803324; x=1778408124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/UYThvEY+1ayHncAH4N9/83tKpiIo8BAMYNggRMxm4=;
        b=BAw3hb//yARzbsfSMk2Zfmsr53NipLi7EJxJOfx+8DyWqWSLPfIU7Ue6OmMQ2r/0g9
         +XKG334PAigX21FMeUoVFog5/Z7fQAFOJKNubt47jlZe0S+M/SKQKnoumYk9Ce4OnihQ
         1aaUGQvOPSCn4IhWIqlGsK91JQJkoN+C7p27LprmLnrMKwuT6XiiKFZvOw57nn/vPBKN
         zSOr0tfHHl7KauxlVhAD/l96MVe6nDbwspWluY/6jrk2O/Cr9jXXK2mC2PNhD33Z5y/Z
         EbYQIh9/yt/7sjd1PyhS6igwyXBKlZilV478nlnqymvnpEQweEanIz1PIuJPqU7x4mAB
         71+g==
X-Forwarded-Encrypted: i=1; AFNElJ8w5nNpEKzDSyscXB0rxXKNJ3YYw9FhLI+AlrWSgPbF5+VUwDjdleUISZ8CcZr5XyCddfpBwPT8Tn4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEfPtipKI7zX7SXpxgkBKDxGtVckkTSHOCVlT9MePA4At7HMjI
	/zs9R71EfcdbaeEkWz1FGL4dY/LalUOqajnuQedzKutc9FDV1Mc+1W+JfOSiiW/g
X-Gm-Gg: AeBDietauru+BZifT1KEOFTZYxBdyqMrhE/MNy6Wx/xXgQ1xoK6uRFThZclv3+hr/dP
	U/+fQRo97rf7GwrjhTESI1SbHbABl4I6CKmFcZuFNmS3h23/TSt29MA5yR3g897Cv2sFwIyKxs1
	PIXWx9+2zoicqAGLasyKXuEJXHhRcLrGboCBrpV6QaX+Db5zwHUIjD7RbgklVHr4xz+msZvjIdl
	iiKW3dT99REdOz7SdAwjPjUqckoavStzMx2OwMlUX21P16+uGUxshpYWnPZPTre9rz/h+Kh/qDK
	gukr2Xtpr9SzsYxlQAuLxv4I7iqTDad7EOsZyBfrjLHbAh7WZglb7B3C1cYq0Q9YNgf93Vvgclq
	Z86MVPZ8TRSg/RAoTtGDFQxkkSB13s94DsO2k0Hq1DKrqob5t0Idjzl5IX63Fw+thcv0evxblQt
	2VKpO4oM53Qemq2JI/LyrQg03lIQ==
X-Received: by 2002:a17:903:a4f:b0:2b7:975c:dacc with SMTP id d9443c01a7336-2b9f2566b6emr35425985ad.1.1777803324001;
        Sun, 03 May 2026 03:15:24 -0700 (PDT)
Received: from apt ([140.123.97.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9caad2bd7sm81073455ad.36.2026.05.03.03.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 03:15:23 -0700 (PDT)
From: Cheng-Han Wu <hank20010209@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cheng-Han Wu <hank20010209@gmail.com>
Subject: [PATCH 0/4] docs: admin-guide: improve workload tracing guide
Date: Sun,  3 May 2026 18:14:25 +0800
Message-ID: <20260503101429.254394-1-hank20010209@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series updates Documentation/admin-guide/workload-tracing.rst

  - Patch 1 fixes several typos.
  - Patch 2 fixes stress-ng and perf record command examples.
  - Patch 3 replaces a stale fixed "perf bench all" benchmark list with a
description of the command behavior and how to query available benchmarks.
  - Patch 4 mentions the kernel build system's cscope target and shows how 
to exclude directories with IGNORE_DIRS.

Built test with:
  make SPHINXDIRS=admin-guide htmldocs

Cheng-Han Wu (4):
  docs: admin-guide: fix typos in workload tracing guide
  docs: admin-guide: fix stress-ng command examples
  docs: admin-guide: clarify perf bench all behavior
  docs: admin-guide: add IGNORE_DIRS example for cscope

 .../admin-guide/workload-tracing.rst          | 41 +++++++++++++------
 1 file changed, 29 insertions(+), 12 deletions(-)

-- 
2.52.0

