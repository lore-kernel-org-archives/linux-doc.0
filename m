Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241C43DB636
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 18:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787338681; cv=none; b=Im7W6+h+8eKU96IMfYqKlmvL6WTW7Z2HmNxNMQyvheBOEa7LZKAOR9ErAltAXLHfWVOFujzS8SQhdwUbYyr95vlnuJosDzCLALvJsEKmYZ0yZ64L7HTUCmUM4htNgV6guFPuKL4F8gQbUX4SvPG233tZyuDLZ66TrO9IkLl5vGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787338681; c=relaxed/simple;
	bh=p4E4Ct3IlFbTeWS21yt/A9ZhhZobTV3W1Jsfzz388+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sb2MygUxQqt4dU3Jl6CyJp/S+7s1RzzP7y3amW9zKRBYEVeb0lLZp0P7U0SuLlKZLe9fQZIJGaHOx9HBr74gzBa/Dd2fc2h/m7loMhkqXLoQC+vKaRyzuBIE5dISNM5Mkb1tXFYgJHI2xtNtGIxfeGBHw4MatHS4x91eaP2cC3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OeoTMPEa; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Trc6mrBD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OeoTMPEa";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Trc6mrBD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787338677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e2V2mpWvyYuIz7GKVVHxUcELAybMhQQsAX/9av2OZxM=;
	b=OeoTMPEaRaxz1wIpZAFP/kZRL4p2RUWzLz52yLNe2pYK5zLJJ77vdvBUoC5bsvFaZjTj7+
	o4J9bwfwbl6OMAlCB5/O3nfUB+MSYj19hFZiJHdwZ/QPKcDMJ85B1Mr0oNWJxcMvQyy8mN
	eF6MUeBvoCZ6aVBz2ZIsAHT1hudwHRs=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-q_M2Yt97O4-GrB4sOv9kTQ-1; Fri, 21 Aug 2026 14:57:56 -0400
X-MC-Unique: q_M2Yt97O4-GrB4sOv9kTQ-1
X-Mimecast-MFC-AGG-ID: q_M2Yt97O4-GrB4sOv9kTQ_1787338676
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9368f2b7b2bso135893085a.0
        for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 11:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787338676; x=1787943476; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e2V2mpWvyYuIz7GKVVHxUcELAybMhQQsAX/9av2OZxM=;
        b=Trc6mrBDX+zo4KJit944vd4EryF8ogDzd0zttSoaT5gO3/kZsiVh55oFO+OCMFOXdZ
         sbn61iyY+B1KSMphNhazGcTIp/5DaN3LGV0wey10B13v0tbWDJXG0pPmjmNKH4bGkQh4
         qaMivl+tt/YgzdNCjFtePnO/n5uZenMAU8jvBqXAeAY1UqvxDsWiNEwc71LyWt531AxH
         +LRSTiMR0PQIIEAG654GF52CIOnj64u/FilaR1QMMaBRNxQZDcIuwyTZqJBKMyL5t4rM
         w7schtzJ/CaA5StrI4I9zTMJL9LPfZ06J2XdPrwpEf5+PZE5FE3TAEJJ8X6NN/AQFUyS
         uOnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787338676; x=1787943476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e2V2mpWvyYuIz7GKVVHxUcELAybMhQQsAX/9av2OZxM=;
        b=UBielwkb9SLmTuhmeOTIY5FQ6zVAb5T2YD0ycHxpbcQ8UcEqvmWwk3G858/s847hrK
         PU0zboOiSqpAV6hlFKNh2AUSm69NjEp8S2ITWcx/6//Hc+3dzxciLuqStssF+kIleGXk
         MaSyuILBXALemP5MJCF6+9f+exG79GqH+8XFBRNM+wp1ZocQV6ooCPZC3ubA9PqHIyQk
         M8NOnmUlFcPQQaJInUaKqTBkKR0StfsJgqVIUyWMtYr15zo30yNnbi/DcAKgab+JElVa
         Z4vaLf+1pXDztLI6nwwBURkhKYQaFw0IDHRQ4IfSy5JVNr1F6ISEScmN889gUQA7j79H
         +jBQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr+DwcNF4QUgpXGH9MastbhYk3G5R2wNYEYW3Vzs6tVm2BY13NnBhc7YKuLy9krylr1xiUphrfE0Uc=@vger.kernel.org
X-Gm-Message-State: AFuF++m/ulljjx9tgNoqSyL455OgTYi9bdypW9LUg7ZeHoCDQqlbMwOo
	87V77SNZFsvVJSO0bDZ5oGeGRPh2qBPnHSFPNAUFu9JCuNTP+6ANSu6onV3RCYkr/GPEr9O40Oj
	EoWyKfoEo6t0CY3Dgl8Aio/jeVGcZnRA5q8vo1P/z1svWGSwvg2GxRhNf3rub8Q==
X-Gm-Gg: AR+sD10FbvyWGlcEPm3LBjjcq86RvA+jJOdu7kpI5ipT4MYFFU+77jl0aBFdQ1l6v3S
	71aXFJDbGxa8JU3BAypCoCHP1pg1VEJDMKk+J/sCy4Qku8bA9PJAXhQAa8R+PeY1cunaFMAzPKL
	8qTZBjZ/xq+Y05e4Eiuqpz/0ibU6M3xSfGfUZjXMCntrz2uBOSlcCXQsxgLFDuByWwELvBOXXDE
	u6CmbsBZjvo+V7piRVajrZ8+lgwcPhpYjGFj1E4aB+lKlbcaD+temn2iOIMgEXWKiBlW6cV25uw
	UoJ0BiSKdqCl9xGHJv+TYbJR6EEd8ktg1v9IPNNXIHXbF6I/8+fQxKBohBzR0N3xUCUFZ2a+FQ2
	tch5INJyEXXcqDstaLtt6GXTEEmkChDq/CSIhfIIAGmAw
X-Received: by 2002:a05:620a:29d6:b0:914:bd3f:b6db with SMTP id af79cd13be357-937394278e8mr807010785a.10.1787338675676;
        Fri, 21 Aug 2026 11:57:55 -0700 (PDT)
X-Received: by 2002:a05:620a:29d6:b0:914:bd3f:b6db with SMTP id af79cd13be357-937394278e8mr807005485a.10.1787338675183;
        Fri, 21 Aug 2026 11:57:55 -0700 (PDT)
Received: from localhost (pool-100-17-17-231.bstnma.fios.verizon.net. [100.17.17.231])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93720586ea5sm655734185a.38.2026.08.21.11.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 11:57:52 -0700 (PDT)
From: Eric Chanudet <echanude@redhat.com>
Date: Fri, 21 Aug 2026 14:56:54 -0400
Subject: [PATCH 02/11] mm/cma: include linux/cma.h in cma.h
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-cma-memcg-regions-v1-2-d21b165b8440@redhat.com>
References: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
In-Reply-To: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Tejun Heo <tj@kernel.org>, 
 Johannes Weiner <hannes@cmpxchg.org>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Maxime Ripard <mripard@redhat.com>, 
 Albert Esteve <aesteve@redhat.com>, Eric Chanudet <echanude@redhat.com>
X-Mailer: b4 0.14.3

cma.h needs definitions from linux/cma.h (e.g, MAX_CMA_AREAS,
CMA_MAX_NAME), so including mm/cma.h requires including linux/cma.h.
Make the dependency explicit by including the header directly.

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
 mm/cma.c       | 1 -
 mm/cma.h       | 1 +
 mm/cma_debug.c | 1 -
 mm/cma_sysfs.c | 1 -
 4 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/mm/cma.c b/mm/cma.c
index e1820fb451e4..03f98f6d45a5 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -25,7 +25,6 @@
 #include <linux/string.h>
 #include <linux/string_choices.h>
 #include <linux/log2.h>
-#include <linux/cma.h>
 #include <linux/highmem.h>
 #include <linux/io.h>
 #include <linux/kmemleak.h>
diff --git a/mm/cma.h b/mm/cma.h
index c70180c36559..0c9de38d6bff 100644
--- a/mm/cma.h
+++ b/mm/cma.h
@@ -4,6 +4,7 @@
 
 #include <linux/debugfs.h>
 #include <linux/kobject.h>
+#include <linux/cma.h>
 
 struct cma_kobject {
 	struct kobject kobj;
diff --git a/mm/cma_debug.c b/mm/cma_debug.c
index 523ba4a0f9f7..70bfc6fbeeca 100644
--- a/mm/cma_debug.c
+++ b/mm/cma_debug.c
@@ -7,7 +7,6 @@
 
 
 #include <linux/debugfs.h>
-#include <linux/cma.h>
 #include <linux/list.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
diff --git a/mm/cma_sysfs.c b/mm/cma_sysfs.c
index d5bf792c6245..e4ee35bc682b 100644
--- a/mm/cma_sysfs.c
+++ b/mm/cma_sysfs.c
@@ -5,7 +5,6 @@
  * Copyright (c) 2021 Minchan Kim <minchan@kernel.org>
  */
 
-#include <linux/cma.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
 

-- 
2.53.0

