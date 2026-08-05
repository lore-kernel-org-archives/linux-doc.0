Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AC13CF69F
	for <linux-doc@vger.kernel.org>; Wed,  5 Aug 2026 17:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785950997; cv=none; b=NPSjVLXtBA7PkBDbtWz31bTUkqY9bMK9AipoR0mH++7Te9VYn0dB58IgeAyWNGxWWKz44pnCh769biYkH9Rhl+H+ro6MBWOa7017SO7qq+sc4x3fHSgh3qruqKdg8sS24gAlrFbIxkimDO01xmwmzrhCmwLNNG7LOjLma9XPcF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785950997; c=relaxed/simple;
	bh=5FMwOERpYxxMKr2Yzjx3moxBSEA3jcNJqG3HGHQMhS0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Zbtko/bGedLJ5v+ccs4zSl2V7knbwveKveGLXb6FGWNcjMUphNJ9FBwml4E5iKi9INeRSyknXIoVt/SUen8NCCAGQCzkM4jwJNB38VwunYoCldgfiCo6z0AHdk8eQ+12B6Sf3ErHp+aZKDu8i2wSuB12WfOBDXD6G7x9k1kZz2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mj3httLw; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mj3httLw"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb6ef846b33so71405a12.1
        for <linux-doc@vger.kernel.org>; Wed, 05 Aug 2026 10:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785950994; x=1786555794; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xDb6UVUUSmRTt/O3cIrZaFoVx9KXsBi3AsTvyG9chiE=;
        b=mj3httLwOVuC0Lt8xojbaq5fjj+G6JbKV5pgKgYWmErN8ZxSFLpuZBvEqo4lGMP1an
         6ciXQf8eQ2PW6VB3+Q494rKs5D3HC7ux2D06vGnethNjuyxrPY8EHRo2LEgnQSrkPz2P
         ebQ2eSXvYOD0ZAP9jwI6AWX7fdAFjtAkK0Omo9gslkC6qPLrg5HkHzC0Crrt05lqBLrm
         hvpe/vXXLIF5KzYYimQu4F5UmEPFvKUMQ9OjyxxQaBaQkou+BIzx46boLVQf2GrW+4JJ
         pEs8w5E3zhXothoYCXNpgljxITHjnyZhQ/JxPKsHvpRl9YnK70H1/UZUubTHBZCqFLPE
         wcnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785950994; x=1786555794;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xDb6UVUUSmRTt/O3cIrZaFoVx9KXsBi3AsTvyG9chiE=;
        b=k+DmNhy/8Hp9W753evQXgeVrYcQFJEuFvsANNya2hujA7+K2ke53N3arJReRAysqPt
         q255vYWrskYItuHEOJeJJtByR/XPClGwQtH75aypqEhDbphrFvFBJp6iLxwxf9dOM/Re
         z3NhPkGHQP/NWwUZUEjfBjttYATGamcM9okJHqqcR527ByGPFivfUqXT2ozDbU/yRDRB
         BlzC8qVvWpO8t1mO8x/6vlHkqhQStgE9dQT+j9k05knewuUu755iHgAfHJoGWEAwwI9M
         lWiErTK9Yr+Nx8hSmbsiulMPBUEz5fj5I+PmPRhGoN31Jv0VueLmRzMSzyH1xnL2RzP0
         CcTA==
X-Forwarded-Encrypted: i=1; AHgh+Rqzf2PdcyV0dYZz408bK8T+RgyVwKRlwgJPQ93J3FvOd4yULr5Sp9lIZtfA9p7RbJzl9HCVm94SjKc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/91ROPi8lFp6OwZZt78R7c/V8LhUYsztqravEemzGu2kZb6GX
	wBNEiD7BYddx092ErXktyTn4+8ReTEXqWYA4ciKS8I2MIR0713PspTRRXQ2Y4Xx9fuTUWATuzVq
	nBGCwtx6cYsmbSUD5+uxhQSuFxCTGY2agUw==
X-Received: from dlbsi11.prod.google.com ([2002:a05:7022:b88b:b0:13e:596e:f99b])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:a97:b0:3c4:3750:2c03 with SMTP id adf61e73a8af0-3cb9c1a2a27mr962641637.9.1785950994364;
 Wed, 05 Aug 2026 10:29:54 -0700 (PDT)
Date: Wed,  5 Aug 2026 17:29:52 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <c795f8089f82841e8a6e00d7ca286da2b23aeb7b.1785950530.git.abhishekbapat@google.com>
Subject: [PATCH v5] alloc_tag: expose boot-time compression configuration
From: Abhishek Bapat <abhishekbapat@google.com>
To: Suren Baghdasaryan <surenb@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Hao Ge <hao.ge@linux.dev>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Abhishek Bapat <abhishekbapat@google.com>
Content-Type: text/plain; charset="UTF-8"

Currently, userspace has limited visibility into the exact active
runtime state of memory allocation profiling and its page extension
compression ('sysctl.vm.mem_profiling={0|1|never}[,compressed]').

While reading the sysctl provides basic on/off status, it is currently
impossible for userspace to natively determine whether page-tag
compression was successfully enabled without scraping dmesg boot logs.

Add a new read-only sysctl representing how compression was configured
at boot time.

Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
---
v5 change:
- More documentation and commit message refactoring.

v4 change:
- Documentation and commit message refactor.

v3 change:
- Added documentation about the behaviour details of the new sysctl.

v2 change:
- Moved from displaying the state in /proc/allocinfo to a new read-only
sysctl.

 Documentation/mm/allocation-profiling.rst | 11 +++++++++++
 mm/alloc_tag.c                            |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/Documentation/mm/allocation-profiling.rst b/Documentation/mm/allocation-profiling.rst
index c3a28467955f..b2ebcef8af6f 100644
--- a/Documentation/mm/allocation-profiling.rst
+++ b/Documentation/mm/allocation-profiling.rst
@@ -43,6 +43,17 @@ sysctl:
   warnings produced by allocations made while profiling is disabled and freed
   when it's enabled.
 
+  /proc/sys/vm/mem_profiling_compressed
+
+  1: Page alloc tag compression is enabled.
+
+  0: Page alloc tag compression is disabled.
+
+  This reflects a static boot-time configuration of how page allocation tags are
+  stored (in page flags when compression is enabled and in page_ext when disabled).
+  Toggling ``mem_profiling`` at runtime does not change the state of
+  ``mem_profiling_compressed``.
+
 Runtime info:
   /proc/allocinfo
 
diff --git a/mm/alloc_tag.c b/mm/alloc_tag.c
index 84c5c3783ca4..b33410310477 100644
--- a/mm/alloc_tag.c
+++ b/mm/alloc_tag.c
@@ -1303,6 +1303,12 @@ static const struct ctl_table memory_allocation_profiling_sysctls[] = {
 		.mode		= 0644,
 		.proc_handler	= proc_mem_profiling_handler,
 	},
+	{
+		.procname	= "mem_profiling_compressed",
+		.data		= &mem_profiling_compressed,
+		.mode		= 0444,
+		.proc_handler	= proc_do_static_key,
+	},
 };
 
 static void __init sysctl_init(void)

base-commit: a946fa1d96648b92c9f37f0488e0e47a85f9e235
-- 
2.55.0.508.g3f0d502094-goog

