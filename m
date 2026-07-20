Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E4B480974
	for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 19:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784576124; cv=none; b=IzlxkHfWZOrcaJyd2niHlLwBZzEqr3lR4H7zhEAMkXIp4qAx9PlTn3wbu4iHlR3d4Y0BHbTT/c7ZoYjlhbt06HYqQctqjqymL7wIQ54EsLcrihD1CXGEjZ5vFA3PjtitNnxStS4dhc9K5DEzJgJJgrmg9hVt6yYOz6RitjDSb20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784576124; c=relaxed/simple;
	bh=rTGbsGvKQACnJtisxUC5ZLec44efZiXOSNd4OQNTaLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dxWj/RBRwGrUWs6OLxzf7XxMy8v5wN4DwvFUj7HbaJis4KkKBDC5dZHTL20xg9SfgUoF2jLlWVposhYaiuEe46zxPmZt1WUqzyjSh7Bt+QIlbkbMexH7XZD2lsUqyy8lWr8JV9+Ta26tZN8X7kZfXOqZ8fOGTNhuL+k9XPYh8/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=KNaHn0u5; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="KNaHn0u5"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8f032b47e3cso89921676d6.0
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 12:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1784576120; x=1785180920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t6FOiK4vob/RxKMxAQwNd3dgf0KAGjN7gNG/YIVjxjc=;
        b=KNaHn0u5ops1R/lZeXIDAUO/x4K11AG1ePxAFRbUhd7TfbL1t9LgN4aTaaNKEmTtjs
         nzppEVg1Q9PX8Y/szIAZHRhmAsCyhFpgETvciNAsYAr7YVRUqsFYcRkrJ1cA0BJYzfV0
         5h3TZYJehbb6t4kBKpCI8ZB2jJZyseGHBoqYgwIuBjPkOZcyiIRzf/kcFdewtJpLa1/O
         2fFQ4cCSeO51sw1iCLcCFiOoCVvSqtOi4L7NkYOIn9TUVDV6s0gfypiwDr5EKWb01FiR
         oFb3+M5V2dmD9yoV/rPUoLqy4kniWwtmd/ATQkFdRXosc90P3z/b9WVijvCzfsZAgfXg
         89tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784576120; x=1785180920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t6FOiK4vob/RxKMxAQwNd3dgf0KAGjN7gNG/YIVjxjc=;
        b=SCNg2k0eKmO13tZgO14/f+UWu7SCQQsSNTq9rvSEoGhN1jnGEkQ6XtkgayPkzLQLn5
         K25+B6xDvoo2YB+F63+V6INMvsNIjBCbspZS0icaqpyp96AaqvGOyBmzmC+yeNQMNvip
         d00W0MiY+pFmmPRkCVndwaFKIb+MZ24LJK8cZcTbFFvCLXmmH/jBkeAKAGxg+v/DyGvC
         wIP5uLRgdMvb/ThQgMgO4SL4Oq4ABXFX+VZEv0PTXnLrHMjrsb9k+Wa8SJJpvFfv1Vab
         dgU0Ew2aaRBDRLacWKZtVQ1wfSMzAEomPiam6wvgRaTOw3vVMxQyJbnslGhkoTonqk3C
         w8lA==
X-Forwarded-Encrypted: i=1; AHgh+RrPotzYb+UGeJS97CMIFtACwpbbGm6CSvpMs4ecAMWVgHWA8PEcckRftL/tpWlRBZopT9nzq/4tUC8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7w6BxBKrwzGrk0VsbJvHGO1ME0aM+9KIy3Gnx5XcID71JfX/I
	5g5QDL2n8XNVvqd15yS8OkABRQAljNeqisQF2eDEdEk52b4+0/u9ncGa0SvyDqnsbq4=
X-Gm-Gg: AfdE7cm8ZCEKCGGZSzQ1nQUN6yepBhZ1wkJuPFFm8kiWp+GSkVStIOFY59IkoXu918D
	xaS1ipcq9R9noH+k4b57VrK7QDq2UNep+uxiCO0BpQMua/mHr46wWGyOa3x3R0RjJ4kfKcrumXp
	wRBK5rtfkA6LlRMMMWPJ0lIpgM6m2hYnLRy+vui6C4zHGCDiGAIpauMrLHH/cipziImMoVJ6BeH
	4pz8zD6FMZXfZ9lu1UD7O67FEL19Yj+KFufblwLxYu714Rv3I5q8gdqcYSJtzYJC64q19yy6zSe
	XAd8r7w0llWW7k6avhCQaqWbMeXAvDt2gcBC14FI54cBxq+WbD0qZYomYW2CfzYyDeRYR+muf8G
	cXIWUhY5qhlUSEP7GVLEPM31vDEjJAEJXrhcbS9BIGYmvD+Ql1wseRJ/M74NXSvC+I6geDKxExL
	j+r3GXqSiEDeUJGNIZiPp19lrP6ef7RASiQefR5hKrREhz4Ea3ejzT6c31kaK8xv0=
X-Received: by 2002:a05:620a:290a:b0:92e:7745:9a3a with SMTP id af79cd13be357-930b3e4e1f3mr1582641285a.18.1784576120209;
        Mon, 20 Jul 2026 12:35:20 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b545e47bsm957792285a.35.2026.07.20.12.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 12:35:19 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: Zhigang.Luo@amd.com,
	arun.george@samsung.com,
	balbirs@nvidia.com,
	brendan.jackman@linux.dev,
	yuzenghui@huawei.com,
	apopple@nvidia.com,
	alucerop@amd.com,
	matthew.brost@intel.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	djbw@kernel.org,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	osandov@osandov.com,
	jannh@google.com,
	pfalcato@suse.de,
	jackmanb@google.com,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	pbonzini@redhat.com,
	osalvador@suse.de,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	yury.norov@gmail.com,
	linux@rasmusvillemoes.dk,
	longman@redhat.com,
	ridong.chen@linux.dev,
	tj@kernel.org,
	mkoutny@suse.com,
	sj@kernel.org,
	jgg@ziepe.ca,
	jhubbard@nvidia.com,
	peterx@redhat.com,
	baolin.wang@linux.alibaba.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	xu.xin16@zte.com.cn,
	chengming.zhou@linux.dev,
	roman.gushchin@linux.dev,
	muchun.song@linux.dev,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	linux-debuggers@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	kvm@vger.kernel.org,
	cgroups@vger.kernel.org,
	damon@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v5 16/36] mm/khugepaged: skip private node folios when trying to collapse.
Date: Mon, 20 Jul 2026 15:34:10 -0400
Message-ID: <20260720193431.3841992-17-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260720193431.3841992-1-gourry@gourry.net>
References: <20260720193431.3841992-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A collapse operation causes new THP allocation to occur, and may
migrate memory from one node to another.

Handle this the same as zone_device for now (disallow collapse).

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 mm/khugepaged.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 89ce6bcbc376b..fb4378cc17b10 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -700,7 +700,7 @@ static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
 			goto out;
 		}
 		page = vm_normal_page(vma, addr, pteval);
-		if (unlikely(!page) || unlikely(is_zone_device_page(page))) {
+		if (unlikely(!page) || unlikely(page_is_private_managed(page))) {
 			result = SCAN_PAGE_NULL;
 			goto out;
 		}
@@ -1687,7 +1687,7 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 		}
 
 		page = vm_normal_page(vma, addr, pteval);
-		if (unlikely(!page) || unlikely(is_zone_device_page(page))) {
+		if (unlikely(!page) || unlikely(page_is_private_managed(page))) {
 			result = SCAN_PAGE_NULL;
 			goto out_unmap;
 		}
@@ -1944,7 +1944,7 @@ static enum scan_result try_collapse_pte_mapped_thp(struct mm_struct *mm, unsign
 		}
 
 		page = vm_normal_page(vma, addr, ptent);
-		if (WARN_ON_ONCE(page && is_zone_device_page(page)))
+		if (WARN_ON_ONCE(page && page_is_private_managed(page)))
 			page = NULL;
 		/*
 		 * Note that uprobe, debugger, or MAP_PRIVATE may change the
-- 
2.53.0-Meta

