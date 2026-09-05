Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FAC17BEBF
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 14:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788617752; cv=none; b=I73JD4GUgZVndaNk48cxx8sc7atLmkOD5QjNdbvrYC8QuSAxOGZSnpUB7VXaUUXLNZ7dfEjfnQ+AmpnvNKFycRsq2SMeFNm991cTypez5/3QJL9x2Sx9gqnfajrMny9+O62hSiz2Llfr4ck/NUIYpc9PDvXOU24A5LfgO5yDTqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788617752; c=relaxed/simple;
	bh=5GA5jXos4+IjGs+5hJ4a6b8qsryHsEa0Fcok6jPFU9w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KFktPHARBSmPqnk8sjvUhz23Tpx94au/Q1gLfKkt24csXhQMVboJ92y6zqaVR2bm6U57kcg4cLYseEsTFg3Vz3x7nEmVA7aYVq2CH2lTmsOLLYiWn2dUmgfTCwST3ljcit3kiQuk6fmmkQEz1HBmcLgnPxRCen88LFtToPStkao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mL4/a8ys; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mL4/a8ys"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so2403824a91.0
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 07:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788617750; x=1789222550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oaI6KBzK7sPihmaSK/ByLcvQMgIofAT0nTkMKRAmXRI=;
        b=mL4/a8ys8Pu0183Kxj50pmcKjMmqsP/Y/upF23zrbxmg00LEDNDWGL3FzmX1K1YrmL
         hYdsPNJwfijBzUmJOaxEU95Wx+O52L2sf24r+nezxsUTWCVfevabM9phjArQVQEKqN7I
         yeewxbpUOJfaKU2IAzRTanvVao6GtLBEmIEHb060Cp6UcvmyWtAwkPvRhhFWQVd5j42h
         t0Kzs6z937/sbA3JQGGzIzIjQxfu6IXfC/AHYdHh7gVnp1rUSkPA0gu3lfvm9uXBWntw
         4YS3S3WYukxinP2grGnIsExs4aHKkCWaLtlcWJ8b/yRNkYZnWphWc2uTTNveXrow+UNm
         3aFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788617750; x=1789222550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oaI6KBzK7sPihmaSK/ByLcvQMgIofAT0nTkMKRAmXRI=;
        b=ZY+HLDlJoMmgBB/Ecg4kurYi7riiiIqKEt5WBOFQzGOEMdiPo4/JbLxkORaq/8YEY4
         6l7L6vuCqmKQdb6IFn+4D13n1NOj8PUrsHKcBE/gm0Q6sjIZqp+EKJKljwMF4mdrrGyi
         Ya8mW7GeYpsTKS+nmUrs32NSmhvKAdof5HeUl74L9RkQDhe4pbc5kpfu1PzxLlZSDcqG
         fJLbeYjnRIRwgGUVYCJFuJM3ZjwdvYcO0h6aToKPRnWa6ORQ4Z83c08H5OlNRGaiNKJK
         HxnbAfF3LaLpNOn83BxaGHWTgNJjyge9UyExDdD/n6Gb31elpx34M/1GZpjpPihFkY5d
         JD0w==
X-Forwarded-Encrypted: i=1; AKwUvBwQtPufwS0WWm0S0P9s2tr0WGDqmyLMgBOZBMzjpjC9PzqK5cIrleVD/i+DlMLdsnWVdBCsnJz0i/U=@vger.kernel.org
X-Gm-Message-State: AFuF++lIS/A1LQc5AQJOpJo6RPeWbAAa+YkPOHpZoT+ePNccSYwGCsFF
	zrYK/9ZY5/fecGbawoLqIZCBgB4zrkAYKBfrTtLP4jS2PgHV5hmDzIC8
X-Gm-Gg: AYBFou03iiY/iSN0ZTuF8sqEn5nnLZERqyBF/pwDlbfL+s5jCd0VbAFzTu5Z7W+a703
	3CJSeyPAv0j7VktSaW82jw7smRRvqUTELskSTPeC3SRlg4G2ultd06264v+mIwc6R3QSZYFrxI1
	wayIjVFDAWfsR4AonUHTncL7ZyxySnIEEx8WQRYTPG1jNVxmAx+cEx1KHvxeGGy+bkkQOJyzSFm
	rQEchr0lkXbnOIKswS3ptT3ITUKfBbLef+0Y2qpJYiygbEFpCVojPN6kJRbSMCSFuLAh0OyhjCq
	M0FeyRICTAX/WZcCWpicN5rS/uGrVRueuSqjlEe12qZ2NNqLVxe1Y/yotqF3XISvvZ9KKhrqH7o
	aPrHHTC5EvsNyiMDVVbVPzFMIiDpi4N2rVu2UXxD/8Rb8dwasgW73+u/0aQD4ZAgc/6enBYMxER
	ttBprIT9PIKUY30JoNcLhLURMgCn90ZoskyiEYRhDna+AKIwVJK2MZ2lc=
X-Received: by 2002:a17:90b:2ccb:b0:398:9be8:ea64 with SMTP id 98e67ed59e1d1-39b261d8533mr23136808a91.17.1788617749977;
        Sat, 05 Sep 2026 07:15:49 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d845sm16940726a91.17.2026.09.05.07.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 07:15:49 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Mike Rapoport <rppt@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	Pratyush Yadav <pratyush@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2] memblock: reject non-page-aligned reserve_mem regions
Date: Sat,  5 Sep 2026 23:15:24 +0900
Message-ID: <20260905141526.1546478-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When map->start or map->size is not page aligned,
reserved_mem_preserve() does not preserve the last one or two pages of
the region from map->start to map->start + map->size.

After kexec the new kernel reserves only the preserved pages, so those
pages are released to the buddy allocator. But
reserve_mem_find_by_name() still returns the whole region including
them, so they can be allocated while the subsystem is still using them.

So reject a reserve_mem= size or alignment that is not a multiple of
PAGE_SIZE to keep both map->start and map->size page aligned.

Fixes: 8375b76517cb ("kho: replace kho_preserve_phys() with kho_preserve_pages()")
Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
Changes from v1 [1]
- reject non-page-aligned size and align instead of fix page count when
  preserving reserve_mem regions

[1] https://lore.kernel.org/all/20260901165237.1025973-1-ekffu200098@gmail.com/
---
 Documentation/admin-guide/kernel-parameters.txt | 3 +++
 mm/memblock.c                                   | 9 +++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 68647ff4bdd2..f969085fffb7 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6648,6 +6648,9 @@ Kernel parameters
 
 			reserve_mem=12M:4096:oops ramoops.mem_name=oops
 
+			Both the size and the alignment must be multiples of
+			the page size.
+
 	reservetop=	[X86-32,EARLY]
 			Format: nn[KMG]
 			Reserves a hole at the top of the kernel virtual
diff --git a/mm/memblock.c b/mm/memblock.c
index 4302fb4ab85c..5e93b6da53e3 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -2816,12 +2816,17 @@ static int __init reserve_mem(char *p)
 	if (*p != ':')
 		goto err_param;
 
+	if (!IS_ALIGNED(size, PAGE_SIZE) || !IS_ALIGNED(align, PAGE_SIZE)) {
+		pr_err("reserve_mem: size and align must be multiples of the page size\n");
+		return -EINVAL;
+	}
+
 	/*
 	 * memblock_phys_alloc() doesn't like a zero size align,
 	 * but it is OK for this command to have it.
 	 */
-	if (align < SMP_CACHE_BYTES)
-		align = SMP_CACHE_BYTES;
+	if (!align)
+		align = PAGE_SIZE;
 
 	name = p + 1;
 	len = strlen(name);

base-commit: dbffc67777cd752ef3f77818109e1d2ef13e2949
-- 
2.43.0

