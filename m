Received: from mail-oa1-f73.google.com (mail-oa1-f73.google.com [209.85.160.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEE0204C2B
	for <linux-doc@vger.kernel.org>; Mon, 24 Mar 2025 06:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742799213; cv=none; b=rvFVpxGcipDOiw2GEJzxVd9vgfD4h1sliOOYzkrZDC3UIz63ojEWx643dF9uBMTDMg+g0KE2YQQdCi8naxoPGjNK8qxE4U7iAsrS+mbo2JspmGekBc3o/2bfljCTwKy3gLFN6gdJZH75d9XV2pXaAAEOYMXIDGN1XCwIP9v6mNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742799213; c=relaxed/simple;
	bh=BBod9XlyyDQ8D6adGtugfu8HDKv7/m/WFoETZ5Ucj84=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=m6lU/kB/MqgdiqKyMfJf16FOcdT7wlXDJJK4vXC2yuBV7wENPuSF2uyB9YNrqgsiHJ51zIBbshnyedjkvgDYbcNz/XsITEKGcsOVlfvUveSiyL9+Y5Lc2Xv8uLOaF4BweUI7lopZyUUfRQro+VwjX83Qac/+nEXqPvRdtTraE/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bferOem4; arc=none smtp.client-ip=209.85.160.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bferOem4"
Received: by mail-oa1-f73.google.com with SMTP id 586e51a60fabf-2c76ed410d3so3013884fac.2
        for <linux-doc@vger.kernel.org>; Sun, 23 Mar 2025 23:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742799211; x=1743404011; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ij8NrI5xZ43JBAGEthvNKWDZxxjZlhI2ViPlC5qM+Ac=;
        b=bferOem4Kmpd73E/n6xq19KUOfp97nSAZkcPz7DO4yw3lssi+zAGYriQuKYIQES1/a
         RO/v5grBrWbnyOpuY6NDWG9WXM2bUqhOt0MnEL181/o1X85rVcIElbeoXUQ6m8eg3nlC
         pDa80t0NC5atHl8/YQICgZ+UP8LVhtRtLfaZtJ3O14j1+mlaYzojfLcK7Fp7sJpXo8eK
         kCKoiKXHnQMctne3QVxZjxUYBMXs4UASBABuLMiF7s5kKzKG6UE3uHpFKmxdx00NMCFh
         9xRVKbwFmOnwyLVIDw/JBU9TH9QZ8uH/HvB4LkNh1l/QgwiAt+SwqzeVXk34I5tpgRMe
         47Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742799211; x=1743404011;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ij8NrI5xZ43JBAGEthvNKWDZxxjZlhI2ViPlC5qM+Ac=;
        b=AUMYPS8ceCiW63OnL35iRocpH01WgtnImrAzWKTA2TA62s0Uho7BN20XyzWe8PwncW
         1pSKeMwlDjHHii4wt+I3sZpIWFKT/5YKVBgJqPZuCnHts/Tmu2d0eIxO/gKptUUGzkdY
         Rlw7RdGw/nkVA4MOSuFufO5sbAcQi29kALP4Pu8/l/qLIMNFUivyfa8ZKRr6/6fEkvcN
         1IS6TZWv27BJnvbcyoY5GxkHpiPxhNIVyDeHamEXEh10qYpLzgYtkgSf0+tPrdtOjF40
         6qJGvOmbXCkLUiwTpf98fSeiJEKEKFQ6oFfinLvVG8Fx/3yNrgQY2E0TtM6/ycGoWjwb
         WTFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDpxJeeEgy8gNo/LEMescoR8SaQoYLgO7X6/CwJKz/w4b7Wf+a9Vv21OpUNF78CDpSe+TW0MRGyIs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzGCTKBLCy41EwtLgY7nN3bsix+m2YEj+qKCmHMX/XVFLG9iUW
	CvyNUcZqjj8r5bNBmMUQJcAU9MfSLnSZ+ycihw/sGZwHwN3CTPO9EXNtxwxkX1PJBXrWCLXLLzD
	jiw==
X-Google-Smtp-Source: AGHT+IHpdLVbnzsd3cNvYjM2o8eY6lwTbr3KBAgc79gozX2wYwWUwNW68nIoXf4IdVkTdg+SlaMY46oDTYQ=
X-Received: from oacpc8.prod.google.com ([2002:a05:6871:7a08:b0:2b8:faad:4f1d])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6870:8901:b0:2c2:57a9:79c4
 with SMTP id 586e51a60fabf-2c7805045acmr8278062fac.32.1742799211140; Sun, 23
 Mar 2025 23:53:31 -0700 (PDT)
Date: Mon, 24 Mar 2025 06:53:25 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250324065328.107678-1-avagin@google.com>
Subject: [PATCH 0/3 v2] fs/proc: extend the PAGEMAP_SCAN ioctl to report guard regions
From: Andrei Vagin <avagin@google.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	David Hildenbrand <david@redhat.com>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	criu@lists.linux.dev, Andrei Vagin <avagin@google.com>
Content-Type: text/plain; charset="UTF-8"

Introduce the PAGE_IS_GUARD flag in the PAGEMAP_SCAN ioctl to expose
information about guard regions. This allows userspace tools, such as
CRIU, to detect and handle guard regions.

Currently, CRIU utilizes PAGEMAP_SCAN as a more efficient alternative to
parsing /proc/pid/pagemap. Without this change, guard regions are
incorrectly reported as swap-anon regions, leading CRIU to attempt
dumping them and subsequently failing.

This series should be applied on top of "[PATCH 0/2] fs/proc/task_mmu:
add guard region bit to pagemap":
https://lore.kernel.org/all/2025031926-engraved-footer-3e9b@gregkh/T/

The series includes updates to the documentation and selftests to
reflect the new functionality.

v2:
- sync linux/fs.h with the kernel sources
- address comments from Lorenzo and David.

Andrei Vagin (3):
  fs/proc: extend the PAGEMAP_SCAN ioctl to report guard regions
  tools headers UAPI: Sync linux/fs.h with the kernel sources
  selftests/mm: add PAGEMAP_SCAN guard region test

 Documentation/admin-guide/mm/pagemap.rst   |  1 +
 fs/proc/task_mmu.c                         | 17 ++++---
 include/uapi/linux/fs.h                    |  1 +
 tools/include/uapi/linux/fs.h              | 19 +++++++-
 tools/testing/selftests/mm/guard-regions.c | 57 ++++++++++++++++++++++
 5 files changed, 87 insertions(+), 8 deletions(-)

-- 
2.49.0.rc1.451.g8f38331e32-goog

