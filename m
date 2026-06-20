Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915E82C21C5
	for <linux-doc@vger.kernel.org>; Sat, 20 Jun 2026 12:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781958495; cv=none; b=NUst4SrKzCvVwjAb78CQv74FbQyst4leB0btzkMJaK0AxKl3gmJymCYJ1/KnT4mfkCazLgb7MC+eMstaNv6yd1sj7t83NdRtdGCAjYV5vDhlIxPDsX/PqHtj8VLRiqaL6WnVBnD432LIqN+Lhq+NeAoLgEeYAJ9tUNIOkEZXpRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781958495; c=relaxed/simple;
	bh=J+q2tm0dpONzieAzxCQJ2z9vwqaC+mViTCZ8c5SfpM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ublpJNxvW/yy5X8cogSs+3E++E+eeFDY1bMVf9n2MmOfpyf6/QthtgwjOk9bk3w9W4H6Zm5Ag6KDEAMkDUwyLKJdeKBU0/wr7PIzHTcB1S8TsohFcy61uCK9l54YK0tyH6sCRhX3jZ8Is0uQzwktii+owJRio5r0y908b33Pf8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YeIX3trQ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YeIX3trQ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490b8adf7efso5252705e9.1
        for <linux-doc@vger.kernel.org>; Sat, 20 Jun 2026 05:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781958493; x=1782563293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Im+iZLIRK/53fqygAoYA6+h4HUl3WPCXC1dHO2ua9IA=;
        b=YeIX3trQt8JrXRqVbjPreShbEPIHIvv1dZ+WWLh/gfSaVp0Jen2WsFUD6/BbxWJ2Kq
         ytU+eGD3EDS7kMvdTTR2Y9VBYLY7KguuKxrrS9VO+n4vUQC82LLImTHaEL5gM0orbhxu
         8WBEiXfwdoHv8EKl/FvJc9lwjph4vU4G8HZ+7ytrSij36VFmRodydc7N2lxNwxrgr4sc
         ERPsrGD1jslOQKyX9Snz6cb1M4HvtsZCYD8+PWGg5HaEf63idi36QKPjE4AnFk1RwRBn
         LmvtHDyIA6ohKgL6KnLlbN4AIg7ElRFTJ6/x9wkuieGeGzfvW68fhgtiAS4tprM5wh+6
         vpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781958493; x=1782563293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Im+iZLIRK/53fqygAoYA6+h4HUl3WPCXC1dHO2ua9IA=;
        b=CdQKJaNqgPdwI+J5w6fYAM2LEf1pqtIfC+Uh5LUKnYwYAujdHk8G1eFJ3TWCEvl3lb
         iSUg9WA9cc46dl/KUWxfgf6V8D1DaGy/cKYr/iAqmQwzvv+lmj/tmKq0xWM4VO11Z6kM
         OLTWHe2tiIzGOrGwRZNTNwuLJ+Vd40wZyAQG5hoFGxGCjjfEFnURzmzD+wQk6fh7KhLa
         WT6DkGWZTkaN5dh/ITMNEtq0XIvbFJgpKMntm0ZKRcx/GxEL07pJ+JEwddmqBNDixn2h
         Uq7M9VkQefwWUp9d4bMvtqU+jJhnXXrwSNyHBV85qKHqjPV09Y276IuM8s4CcZc98ooz
         IZSg==
X-Forwarded-Encrypted: i=1; AFNElJ8pp/whrIdWqVmQVGy7VuQueK05Tk9RIzXPW03Mru/iRznBKqbk7SqMQb/E0//gdbmyc6R/cJ4S6sk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc6E0xRDsA5tQiU6YOde1dRjgWXu3fvq8giISrG9O919RZBSru
	R3uy15yR5yV87SsiYULY6Hi4/ICCpqC5fu+n+oTbESa3WfVSC1QVSBMc
X-Gm-Gg: AfdE7ck+QQbupqMx28f2MiZxxjHniwIfPXWKbjOOHBQKcK5nixEqL55Lz6ARI4cWMT9
	1DU9Es34H9wc7cbfBGs3R1ucH8w9+H8pxcHEbbf+K+1HSbdXj/AmWZl2Po2WcXa9Iw/FcFkr9uV
	LZSpByo3+CqkF5ZNuSU8Otpyt+m4Z8xR1Yb6mM/WBo9VB3wlzUn5VPz0vVgdnRaNOj5Lsd4ztmc
	aetzFuEvsy80AFmT5RzcpN4RmSQqgHEmThJeLmDffPYel6Z5sGfVaBRBptavN+CShnoSyQgV6UP
	jDLWWPKiq3HYePPmKry2UTfsTVznzQlwu0n40trgPjplfDeMassXAYYi+aMquUw0dRWfk7ecqj2
	5hbKu8zokeAeAP0DBw7cETTjYdnSQNLpDVhkgQcUNMdDyrexChsdsAOsABxZYmQ9Q2qY+KHLRlC
	a4G9zgXyUNjEpeUG25PkXtm1nR5oLvcSDAtNpBW+4uLedZaFhQ+SLOKNYwFHwkSDrVYWnGwzwVw
	EX1b/TYuKSCoxDs
X-Received: by 2002:a05:600c:630e:b0:492:38cb:a7ff with SMTP id 5b1f17b1804b1-49246e60fc7mr31082325e9.7.1781958492836;
        Sat, 20 Jun 2026 05:28:12 -0700 (PDT)
Received: from doehyun-dev.pradel.rg.cispa.de (x06.xlate.fw.cispa.de. [195.37.157.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49249207dabsm101338325e9.0.2026.06.20.05.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 05:28:12 -0700 (PDT)
From: Doehyun Baek <doehyunbaek@gmail.com>
To: Tejun Heo <tj@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Yosry Ahmed <yosry@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Doehyun Baek <doehyunbaek@gmail.com>
Subject: [PATCH] Docs/admin-guide/cgroup-v2: fix memory.stat doc details
Date: Sat, 20 Jun 2026 12:27:51 +0000
Message-ID: <20260620122751.388770-1-doehyunbaek@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix minor cgroup v2 memory.stat documentation issues.  Correct the
vmalloc per-node marker now that vmalloc uses the native NR_VMALLOC node
stat, and document zswap_incomp as a byte-valued memory amount instead
of as a page counter.

Fixes: c466412c73c3 ("mm: memcontrol: switch to native NR_VMALLOC vmstat counter")
Fixes: 5ad41a38c364 ("mm: zswap: add per-memcg stat for incompressible pages")
Signed-off-by: Doehyun Baek <doehyunbaek@gmail.com>
---
 Documentation/admin-guide/cgroup-v2.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 993446ab66d0..ce6741f78f4f 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1570,7 +1570,7 @@ The following nested keys are defined.
 	  sock (npn)
 		Amount of memory used in network transmission buffers
 
-	  vmalloc (npn)
+	  vmalloc
 		Amount of memory used for vmap backed memory.
 
 	  shmem
@@ -1735,7 +1735,7 @@ The following nested keys are defined.
 		Number of pages written from zswap to swap.
 
 	  zswap_incomp
-		Number of incompressible pages currently stored in zswap
+		Amount of memory used by incompressible pages currently stored in zswap
 		without compression. These pages could not be compressed to
 		a size smaller than PAGE_SIZE, so they are stored as-is.
 

base-commit: 1a3746ccbb0a97bed3c06ccde6b880013b1dddc1
-- 
2.43.0

