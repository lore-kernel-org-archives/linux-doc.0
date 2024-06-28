Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB887D088
	for <linux-doc@vger.kernel.org>; Fri, 28 Jun 2024 21:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719608410; cv=none; b=lCgUa0rfgPTqQqSFSWDDBDjEaG171wYn6xom0/CvaS6GarRmbp20uxoH9J2zlNEKNTyehBQer/vUCqWNFP3y5qEjMaOAxaJVE3ZSBqNhwdgj334cP/AzPQsgcaVpjiSdfQi9MetWaIQ+QjcqKisCZJq6LYIvMs5LRmUo25jVzKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719608410; c=relaxed/simple;
	bh=RvARpek5oB1OiKMp/udcOI/AnnOjzh0gz3imanKMPKg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=l90RFlrZNcg5ymjtfhCqvjPzYAtWfd3BCws/Yt9UHPcLzWyyecGQK0KGRRV8uSpElfD0VvEfpj6d1ADikTp6tvNc9Al9wLK1yyqHCWItnrhtHgODhOE2lUm9Z4MEP+li5pC9uRRI5Po6Yc7SUCEFDejt0IxnfGC9CRFQV1V8FBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I1qMXz7p; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I1qMXz7p"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-706645f6ef3so1003035b3a.0
        for <linux-doc@vger.kernel.org>; Fri, 28 Jun 2024 14:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719608408; x=1720213208; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K55H9E0t59nm9KeHZLiBbB7OkhvKOcAfSENsb6p/u6w=;
        b=I1qMXz7pXxE6seAHTUlK1V6nEGcHaM+2BB6KYT/YOmDzxcDQdPBWX1+fEh3YDE0Ixp
         IwqtfuvnRKfOrCyTwelO+9qpbRTB0DZT/r6HWvQ0HntUqJ1zRfdhMT69VhzWp446lroX
         0DFhZ2fAEWFbZDZRBH6CBGNtJTrhygM7uVJSp85lP9Uewld7xmqeyWLR/T8Znu9RnwBR
         30qd07UGpAJrxSuJmNXRLIGMIGgUB4YMU0QElyv/4rLowvMAj0yELvoTwI3FjffF9t/T
         JqLiv3ORPya+d1TsimEdGxZGBqHyXlTRRn3Xw2Bx4Q+YXhMWMB0qqgaHooNEKA1UHUqV
         QfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719608408; x=1720213208;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K55H9E0t59nm9KeHZLiBbB7OkhvKOcAfSENsb6p/u6w=;
        b=uaZBwv3xDI0Wc5qehKxmw4JTKkUyBhRKGqBNgi2Pb74eX39XE7IAczzoeBId2TmaAX
         duJa2tqomGnCQzsgxI2LnyKE/hPbkGXF5fijHhyIjeXg5xWlpRNEFgCSVCdEOej1jzaO
         OThk78nPLud3mpNCPPagt8NM4Zqob9pqBWl7qYqgsX0B2PNn8yMTt7G/QtFtbmMumuQX
         I0GiA0eq8UA1Wm62siftrHo+D9/LOSgbcEzhWG00Smy+ClbOEwM1/0d9HG0WHDY3is46
         uHrGXTzxULz8KSvk3W1HgQcqyBIxGQjwlBAvbWYfNltRjlCejga6QGraUdT5OVOQ9Cjk
         NQIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtwpjiN0VYFm/jBtrKz4D3Owzv6KblgB7xwFZKiDb6Hw9/9mgMm2eFwlQL0P5cPvDxfc1Gv+NW92T/QtRY3j701XcTD+auFBhq
X-Gm-Message-State: AOJu0YwKBmV+rovzzgNvjl4ZBSjGCxMBypZ+YRUBgSajIwq5UxtcKVHM
	SuAsQ+sE8c2ov8sDl3NS7O+VpozVIr/4oDzccl+oc9VE3no3JLvEF+QosQiKXtDpkTb4IZC27ly
	WWD3R0hWNTw==
X-Google-Smtp-Source: AGHT+IFbZGpVVtA+GUKb/6c6jsaI0OiKjqock+AA+pWiWe+A5unyUwPSLs/SOm+K4zdLrXzAV8wcIH5VRSCYXg==
X-Received: from yjq3.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:272f])
 (user=jiaqiyan job=sendgmr) by 2002:a05:6a00:3698:b0:706:6b52:43a7 with SMTP
 id d2e1a72fcca58-706746db53fmr184314b3a.3.1719608407790; Fri, 28 Jun 2024
 14:00:07 -0700 (PDT)
Date: Fri, 28 Jun 2024 20:59:58 +0000
In-Reply-To: <20240628205958.2845610-1-jiaqiyan@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240628205958.2845610-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240628205958.2845610-5-jiaqiyan@google.com>
Subject: [PATCH v7 4/4] docs: mm: add enable_soft_offline sysctl
From: Jiaqi Yan <jiaqiyan@google.com>
To: nao.horiguchi@gmail.com, linmiaohe@huawei.com
Cc: jane.chu@oracle.com, ioworker0@gmail.com, muchun.song@linux.dev, 
	akpm@linux-foundation.org, shuah@kernel.org, rdunlap@infradead.org, 
	corbet@lwn.net, osalvador@suse.de, rientjes@google.com, duenwen@google.com, 
	fvdl@google.com, ak@linux.intel.com, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"

Add the documentation for soft offline behaviors / costs, and what
the new enable_soft_offline sysctl is for.

Acked-by: Oscar Salvador <osalvador@suse.de>
Acked-by: Miaohe Lin <linmiaohe@huawei.com>
Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
---
 Documentation/admin-guide/sysctl/vm.rst | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
index e86c968a7a0e..75e22137d849 100644
--- a/Documentation/admin-guide/sysctl/vm.rst
+++ b/Documentation/admin-guide/sysctl/vm.rst
@@ -36,6 +36,7 @@ Currently, these files are in /proc/sys/vm:
 - dirtytime_expire_seconds
 - dirty_writeback_centisecs
 - drop_caches
+- enable_soft_offline
 - extfrag_threshold
 - highmem_is_dirtyable
 - hugetlb_shm_group
@@ -267,6 +268,37 @@ used::
 These are informational only.  They do not mean that anything is wrong
 with your system.  To disable them, echo 4 (bit 2) into drop_caches.
 
+enable_soft_offline
+===================
+Correctable memory errors are very common on servers. Soft-offline is kernel's
+solution for memory pages having (excessive) corrected memory errors.
+
+For different types of page, soft-offline has different behaviors / costs.
+- For a raw error page, soft-offline migrates the in-use page's content to
+  a new raw page.
+- For a page that is part of a transparent hugepage, soft-offline splits the
+  transparent hugepage into raw pages, then migrates only the raw error page.
+  As a result, user is transparently backed by 1 less hugepage, impacting
+  memory access performance.
+- For a page that is part of a HugeTLB hugepage, soft-offline first migrates
+  the entire HugeTLB hugepage, during which a free hugepage will be consumed
+  as migration target.  Then the original hugepage is dissolved into raw
+  pages without compensation, reducing the capacity of the HugeTLB pool by 1.
+
+It is user's call to choose between reliability (staying away from fragile
+physical memory) vs performance / capacity implications in transparent and
+HugeTLB cases.
+
+For all architectures, enable_soft_offline controls whether to soft offline
+memory pages.  When set to 1, kernel attempts to soft offline the pages
+whenever it thinks needed.  When set to 0, kernel returns EOPNOTSUPP to
+the request to soft offline the pages.  Its default value is 1.
+
+It is worth mentioning that after setting enable_soft_offline to 0, the
+following requests to soft offline pages will not be performed:
+- Request to soft offline pages from RAS Correctable Errors Collector.
+- On ARM, the request to soft offline pages from GHES driver.
+- On PARISC, the request to soft offline pages from Page Deallocation Table.
 
 extfrag_threshold
 =================
-- 
2.45.2.803.g4e1b14247a-goog

