Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640227;
	b=uKamlZe1Cm4pSsKMGszLLc0XN5ZtH/0LmktJ79KwIUn3TXU6dl8OGG0KXZ7EJ+s3iueN
	 uVpdFRzywUlAgKtsZpaPDVoPT/ZboDeQTM37zqWpoWKpgqMiHXHUxJaAQwyegY8TvJnMi
	 /euVtl9r45+CZTSFOZp6NPwV0FxEjZ/3OaanC/VVAFt7DMgrM0l8psF1WOsXYvNlFQdMm
	 27RZmbcQZdOJgQGC+xGehEJKAXv+vIVSA+gQJTrLZHMqeKVLkRbIsjcYmbi/T2miiWE/L
	 65x1SGzkWSJoQ/VDHQQSe//mBPL4k3qt/Hg3nlKGqtYArk3faFXr0LjhA3UqjNeuoMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Tt496ll4IbdlqeCDi3ioSW9/vXDsw+lkgrGBEmtKDJU=;
	b=NUNSZi2x0V9Lc27XRXD7uXDVAip3+faF6771qjEQ6shOC6Rlqs5nfawlAX4wFYBheNF4
	 QOPAPoKi0y5jBlowq1G64pkzVCG1k4hvcKGwUhrpR02K91wRVgGyCz0yWXl8EODScchgM
	 SESY8U8JDXOM1ZXVK967EFkTGm45SKjG19r1Zp3kUAxe/khd5eX3I8BKkFhKbOKCRBBa4
	 qQtlAbq2Vxjf7zBnlOCyqCt352m/ZlHcoxj54FIELOkcvR9cs7H9VRHX6eecM9kBfOagp
	 aZ5aRqVHzd9RvLIyVi6Zpfac5x9dBkG7agiIOh+hjxanecrYpFtRT8fv2xExoRYIEBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Wak6pwPF;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDB5606A8B1
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 07:10:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADDB5606A8B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Wak6pwPF
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91f1e3dd08cso7449326d6.3
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 23:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640226; x=1795245026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tt496ll4IbdlqeCDi3ioSW9/vXDsw+lkgrGBEmtKDJU=;
        b=Wak6pwPFiUkKyhQgMf4rS7ScgYnhLHPu/BQFbJsFq7WKKXSUOmiu+EsQFsjVZ8zFDO
         FDrlS7y+5O55UEGv/kTSaX8dffsOnEXEa6/2U/GCtWcFwv0S/O1x4yRSmj13AtftFa/d
         2LHhZ1Xzh9y1vx57sBVWmEQqxXZeF/gRFDaivKFbqeTHuyd1MOWBIFDDx6qnA+nzwI3j
         f0FWi5bqe5XptEAAFE0ZLXHTalZ4ObmYUba1bTQ7a5ucsWoZ5b9b8qD9ay1zcLACOuUw
         HN4jHEZ3DD/E9fTfoTkj/qDM3H/u15Vo16V1SDswP6q5IvcI5vpIGBny10cK9BBE6q/X
         KPYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640226; x=1795245026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tt496ll4IbdlqeCDi3ioSW9/vXDsw+lkgrGBEmtKDJU=;
        b=sUGrv45Z7Z0f5lNN7b9X6qgNsYOI7z/LGWBD0ILflVb1BkGcxTxZ4y9HVslaK0r76L
         B0kwDpxtRgndjJvlt0l/3Yu23lyXzKzoNr5u24uLc3A+jvfOlD9XuJPvtC+xKditFtMS
         UvRnpyHGd5Y7Vuzr7zc5MHcvQKH4N/4LeHDCj1fPE5qQehYSnlXp+vRBaRqKYQptdBPn
         vGd/KmqZtDX/pjolqqMIBUvqud/tyUcCWVq76mO16pVA5bGrDrjXWZo92s2BXnW5Owj/
         lhPhV0pGuLRSsX93VwCFdSwcpoaT1seKOYuVMj9n/AHSw9Gp8YftTWKhvaWfvohjDDlV
         JwAg==
X-Forwarded-Encrypted: i=1; AL+hErE27o252eVM8yC1ruMNwS5+6LQnrIdc94ZQtvLbac8LuWGNf+1+x9tXz/M/yC3uimOMvC3qryMwLSE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UbiiA+5lwUPDz4or4LR0tFg7z8wYZy4hnhf3/sgCHhIECsfHC
	5IM46lWC/5Y4vKpX7yGST+bdJQQIl612HbLA0/f5R48LIPhAuP6bV/j7N+L+j0m8N9Q=
X-Gm-Gg: AYBFou3lvM7DlIwDUUNR8DAjXgSjrxjlNwujxrR5J1+lj9G16i9QG+ni+jU7jQFhbYL
	3nEIt1bLcBi2w14wue8WgTOqpSMHpxtYmrRNWdewfuBsRBVwDw9jInUT9NJsMpWG0afc5EY1JaL
	VJM/0A87oJJL/Ve3Awb7t6jWG1x3HIQYyCdXv5tZSbX9ss4mLlFzhdWbiU5P5NJH0hdhg0YxuXi
	KVToPbzPhOBvVRm8ZBvIbOrChRfLjbjhNuTW//tKaUDjx0tWWa208Y/arozpkSFf6+C7fi9+ytn
	fOw8fqTLXKYWVgSRUbEDh3EhX/vKLpseRheUTc0nXwzHODv1hf2SmYV+U3N8SG9Slg2IawWehcb
	hn2Unwe9/GLuMq1NeEkY7Rn879FEq+6lOg/upc/sDpysgBOOIKS4tko+vqiDayOVYsBReYaJlZl
	2xYde/QvRxqDZq3uhS499uBrB2mZRVye799b5yWmBgPvaOcOHmd8eOwnJX3hrAd/vmqzVegMpjo
	Z9Lo4FaXb9Yz3GpFOfXJLdPKxyNaOcimo8KButi6Kf4xAlern6HrfYOWK+YVu0arpOlZRSASgYr
	R9MKkkEeOoUrVhGCPxXige7qM+lpDvv5o/Eh+qn18GS8IE4rOL+p8Nt7CH/BOFg6K11YzAq/K7z
	NGyVQ4hVssDhAJss=
X-Received: by 2002:a05:6214:e8a:b0:91e:7bb7:fd65 with SMTP id 6a1803df08f44-91f24292699mr81332616d6.56.1794640225203;
        Fri, 13 Nov 2026 23:10:25 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:24 -0800 (PST)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-serial@vger.kernel.org,
	linux-pm@vger.kernel.org,
	damon@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	johan@kernel.org,
	jirislaby@kernel.org,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	yury.norov@gmail.com,
	linux@rasmusvillemoes.dk,
	pavel@kernel.org,
	lenb@kernel.org,
	hannes@cmpxchg.org,
	brendan.jackman@linux.dev,
	ziy@nvidia.com,
	sj@kernel.org,
	muchun.song@linux.dev,
	osalvador@suse.de,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	xu.xin@linux.dev,
	chengming.zhou@linux.dev,
	gourry@gourry.net,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	matthew.brost@intel.com,
	byungchul@sk.com,
	apopple@nvidia.com,
	rientjes@google.com
Subject: [PATCH 10/22] mm/khugepaged: restrict collapse to common memory
Date: Sat, 14 Nov 2026 02:09:47 -0500
Message-ID: <20261114070959.3490008-11-gourry@gourry.net>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114070959.3490008-1-gourry@gourry.net>
References: <20261114070959.3490008-1-gourry@gourry.net>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Collapse is an opportunistic MM service and should operate only on
common memory. The anonymous scan and isolation paths already filter
zone device for the same reason.

Replace the zone_device check with page_is_common_memory().

collapse_scan_file() gains a folio_is_common_memory() check. Page-cache
folios are never ZONE_DEVICE, so there it only filters memory outside
N_MEMORY_COMMON.

All memory is common at this point, so behavior is unchanged.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/khugepaged.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 4bbe319ef86fa..b4bd29f25c145 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -628,7 +628,7 @@ static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
 			goto out;
 		}
 		page = vm_normal_page(vma, addr, pteval);
-		if (unlikely(!page) || unlikely(is_zone_device_page(page))) {
+		if (unlikely(!page) || unlikely(!page_is_common_memory(page))) {
 			result = SCAN_PAGE_NULL;
 			goto out;
 		}
@@ -1673,7 +1673,7 @@ static enum scan_result collapse_scan_anon(struct vm_area_struct *vma,
 		}
 
 		page = vm_normal_page(vma, addr, pteval);
-		if (unlikely(!page) || unlikely(is_zone_device_page(page))) {
+		if (unlikely(!page) || unlikely(!page_is_common_memory(page))) {
 			result = SCAN_PAGE_NULL;
 			goto out_unmap;
 		}
@@ -2741,6 +2741,12 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
 			break;
 		}
 
+		if (unlikely(!folio_is_common_memory(folio))) {
+			result = SCAN_PAGE_NULL;
+			failed_pfn = folio_pfn(folio);
+			folio_put(folio);
+			break;
+		}
 		node = folio_nid(folio);
 		if (collapse_scan_abort(node, cc)) {
 			result = SCAN_SCAN_ABORT;
-- 
2.53.1-Meta

