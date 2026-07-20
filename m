Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0D53D955A
	for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 19:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784576120; cv=none; b=kXkH76ehRKrF0vkSiyQ7roVY2S5ziaGcd1wn639boY2BuUH2s2r/onb3HQRBjLSUoWt3eK0zZ9Nl1MtBYlzjPo6rL7RQC3RKXTobpdEpcfgRys5a2xVCOriR8fPnbD9LUtGgDi+tnagHKB6uFN/7UIyFMEdgDsS7Lw2TVKo8JDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784576120; c=relaxed/simple;
	bh=YDZvVuwxxNQNjdV0uMiVC+0kbWzivRWlBZFWKXKo0fQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eVn0aNNoVB5LSRaJ9/949kR96UwFEptTf/gvDWef2PAFr8VMQQw/oJjo+zooDgqKwnBIupYJ1glF18DdwhAOLZ6HIZr1orYJH3TCxQ6RqnTq5XdpeQNONwH1fR3XazYU2RWNG9Sk8sc+oY7OJvyuD1HiCem2qua69VV8kTgLDtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=UkNy6Lyf; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="UkNy6Lyf"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-92ea24a2dbfso893495685a.0
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 12:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1784576115; x=1785180915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bn1va8d6JpVtah/28aJ2nDxAxk/IiYTaqElYsPWqJNc=;
        b=UkNy6LyfbqXF9yIeCYdJyilNhqzXgUux1X1hd6mYEUcb/KF6frIUHMm4glreGepqiR
         dkGrwvm03lgliafPrVgh/K2lSTt+JMh4f3Q26AkwdQDhYLEgxNFln4OOIIL0HAhwUN1j
         ASTYMqe5SWSQau6D4RKTKMbwTTHFCWlugLVvqbfsV4qG2Ti5LUTHoJz2ofGrjb5cnMh+
         5AWDqCtxMuLDf2B8BHg2xqq3tevfeQe1n5KCFBZa+fc+glDYONDJRhIkqRpnDAIUWMBm
         NBFn0KyHXZmhjlKQ70uZoESWndE4PpY1AyRlM5fd0+IgLPKdYugn8VdkXuu9FGgvth8G
         Ybaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784576115; x=1785180915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bn1va8d6JpVtah/28aJ2nDxAxk/IiYTaqElYsPWqJNc=;
        b=RmjfKT3/6jqHs48vEFo29ldJr9oECKxPmFprExPhl0KY+OItarZTfdt+jNtY9re/Vv
         OBSlI7OurmTRrB5QtPWP8zMoZ+WbArFMWnJEof2UWzXDBWb0gsb/jOgTbigw/MPnHtd+
         LHiRySfe+MWtnl+vcBnyXPt0j3iXSMrqHo5nUtppNsPT4mK8kgxpmhmQ0iTfkkO1gTjK
         dOkuHtr3sIWydahVR4yWQbPmy2mM92A+HJQ7n8hCd8WfFwRTTTZvY1TqxJMlFTZ+AXYP
         iAzmrwm6dNWh8YdAOBrSRPLxDMhwGlNLxg4TzbPgJJHKihzr1mYav9Pov2voKZoKPUqc
         mdOA==
X-Forwarded-Encrypted: i=1; AHgh+Rra9aeGMaBgPvRnj4zxQr/JFmouSr/5PrPajZ+fHo2hr2WglKs3nMBVdO/r+OcljaYa/LSPScJNeJg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+GkP5iQNSi4d5OUstq2hqppM3oEV7QWEdoZzq761FQSS64YMf
	n6N2ifzae2KLGRgnjACmjn9k5q4mt4v8eayeS4q+9U1qted6V/WHYo2n4QDCZttSlrE=
X-Gm-Gg: AfdE7clqgB+9OP0fPUOFMLKmDUMuz4hXKhz8RhDde4+vqt66cU81iFUsNX3nDhVmh2E
	fQE5dNj9rIdpXyJPyIhvyYSLlHlqxdYw4jt/JOsVe8iRt+due3IoQVdIjclFSCj9LnBi/SHZkH0
	vZDhONjTEJMuYnMpXGxkvpL6xDpcM7QmrvunvzAOFT1Veg93l3bAx1MdTZWMl8OX/zzq0e8yUwl
	kpJ0hasqb9fIQgI37BSqwSSknz6Pd+1U8JUZDPrHMFhHzoO4R88BU5t9kaIcIZOa7rx3mdjT6k0
	yhpNNm++MbbdR/WjwCq7Ycu/P5JtVAt3mQhpPTiq95Oia/ljQpoMNVgpEbzx0QFihH9hOHzztAs
	HhHIIShrxllCJCBfolOjo32EUwD9kyNxoaCLmir6hDxBwYwFNCzE+2uwF4sZSDG/cRdoP3Ky9sC
	wXMgRuVV3TyUXELwptpCYtvN3HKkS3mxrXtfUuJOFwoGX+FgXoGwxK8vlseojKF1Y=
X-Received: by 2002:a05:620a:f0b:b0:92e:5ffe:7833 with SMTP id af79cd13be357-930b41d083dmr1531787885a.61.1784576115361;
        Mon, 20 Jul 2026 12:35:15 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b545e47bsm957792285a.35.2026.07.20.12.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 12:35:15 -0700 (PDT)
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
Subject: [PATCH v5 14/36] mm/damon: skip private node memory in DAMON migration and pageout
Date: Mon, 20 Jul 2026 15:34:08 -0400
Message-ID: <20260720193431.3841992-15-gourry@gourry.net>
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

DAMON operates on physical address ranges, which can cover private
node memory. Skip private-node folios in both DAMON's migration
and reclaim paths.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 mm/damon/paddr.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/mm/damon/paddr.c b/mm/damon/paddr.c
index e4f98d67461f5..c741a94319750 100644
--- a/mm/damon/paddr.c
+++ b/mm/damon/paddr.c
@@ -12,6 +12,7 @@
 #include <linux/swap.h>
 #include <linux/memory-tiers.h>
 #include <linux/mm_inline.h>
+#include <linux/node_private.h>
 
 #include "../internal.h"
 #include "ops-common.h"
@@ -250,6 +251,10 @@ static unsigned long damon_pa_pageout(struct damon_region *r,
 			continue;
 		}
 
+		/* private node memory is not reclaimable by default */
+		if (folio_is_private_node(folio))
+			goto put_folio;
+
 		if (damos_pa_filter_out(s, folio))
 			goto put_folio;
 		else
@@ -344,6 +349,10 @@ static unsigned long damon_pa_migrate(struct damon_region *r,
 		else
 			*sz_filter_passed += folio_size(folio) / addr_unit;
 
+		/* private nodes do not support migration by default */
+		if (folio_is_private_node(folio))
+			goto put_folio;
+
 		if (!folio_isolate_lru(folio))
 			goto put_folio;
 		list_add(&folio->lru, &folio_list);
-- 
2.53.0-Meta

