Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770CE42A79F
	for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 19:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784576101; cv=none; b=YDZDBoYcLR14uK9gicRzq6fhk2icEzTt6jCee/C57OMBGAUTYBR4B4q9N+XLMay95tHG8YBzUcGY+dzt6fsId9KzzMzjqcMoUjTkOpA1tvGjT18hXflSJoL/1uQ3B0qriF9uj8Zl04bYro/PQMQicRx4Mtgy8+09aXcygprEIzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784576101; c=relaxed/simple;
	bh=5WsZz3rVrHU17snClfl3M7UsKRdvN7wn8MZmoue9j4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=STJV1x2w2YYbfvkHICvgcUq+J166wCoA4cQn43DV3lRvXioU+4mwXF+NRhrcYN7p+7ueA2ukOq1PkBnjbk3wGiGauUaHy8b8dEyUeOok8vAwbXnZLUJgWVFXOUrmWzDWuXPIYhg4o22RrNYOKHeJXBMpqecNCm2RWGppajq14+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=AeO2JDVY; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="AeO2JDVY"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8ee88fce572so82095766d6.1
        for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 12:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1784576097; x=1785180897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xdEOlYqIeVdUG1DfkuvgY4asc0OjHWyQnI3tw1EXx60=;
        b=AeO2JDVYr4O4Zalcb0OS5SE9Jc10O2vFAgaj9xZdut8hoHmRchSeoKM0BvhpKROxAj
         TpuEQQHgBvlffX0b8VIu1nV8QGREocf9JjP9UxFZ9eQXVahhg1tRrUD9A4iLJnjqnU/D
         XIPoxcFJZpI2KVfzaHdaKMiYwn6HUcDzRSXafy0wt6fsDi7jgUlsm4Z+YkBdBlbXgULG
         RMbHG9yXaXWjXzjsV6CaTm5w4lwraNEUyE/0uyFHlQ3BQoNARJguOH8jZENaA3p2vTJw
         Yz9e0Q/xakbbN00AJ15b+UP3MeSow5DU3WquVLj2BDWd+eB4x1EcbXJLqt210bh7OWze
         Ik5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784576097; x=1785180897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xdEOlYqIeVdUG1DfkuvgY4asc0OjHWyQnI3tw1EXx60=;
        b=ZfEJcrfxbEpyTfTkKnLLj/taYfUzvrRrSsKBmHXu8efMMt1jg+OU3vR5jgWikwIpwv
         vrTj73z292FijvwDjMOP1XKk6u+1IN7LhzlBKHt67ucw5RoDPIynqIfAc+ByNN8wVfEn
         3e6XiOrODD/8yaiPwGvzN5eU9Hp3jUu0xQ3XRhMOV9yxTZrNcOvCPA8OoYVSZNyFJXP/
         oYNBRT6x25Yt/v/GQexwhcqonOS3maJ1rxlY5pd4Fs9h1IS4wEMofdmQGkkHHcYMRHif
         fKMbO/lUZJmPMQbjSRPCKXJwDRNKORfDP5QyS2LivXWZM68hQAHFwsB2oXgia0Y6/i9P
         iU7w==
X-Forwarded-Encrypted: i=1; AHgh+RqRQufoyhAc4GqRYWUkQcMqBedA8yecmGZ+Yz30zrooXJrwLJzRd2ksTIGVBo8YU0l+P0+W8iFm17o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8v0YOE81G2rzbW1czCBAm0Jk2DO1H1Mv8eBAQkym+RnNNYsOM
	hGW7KkDkBF9eD+YlAGHcLktxbkGy1LkxBHylzCZzsoIH3uA82/rtdRRHrhpk7uWbaUs=
X-Gm-Gg: AfdE7cmEKN6OaSSC+gSXGS/ZSSE/sIuPe9/XAto+++RX8d89DPZoV/N/V42XfizJ+IL
	dB4MdWsASUshCvVZZyhIvfSbTamb96QuyAqy2JRZRmPllc9n3ImFKmK9mcpq1EBn+YGnKMEPzrP
	aJtMPFxoiNCDNOYWCHLmqaWP474C/s5g4PEht9XNjAO5mQUKFjXzfD1aIKjG+8YowDwxkLydCCJ
	NmH4A2qHE1XpFUuORPMqe1tKa9nHEiEyQbrO9YEdpZAa5DC1UPUYxlZ6KI+wNf9bPxbioWy4wd5
	cCjgQR8PmRVaOyp6ukc/eu/rsUm0EfBDWp6CLIHRTlg1+6k2ESRtxmXTK4Heso51CvFdOAeFxLB
	BxoooehGB8/q7ty/AeklcKeZ/KpQnOFhQr+jU+kEOZziHt3QjZUbk6SRkmJ7XnAldGb+XLfqY6H
	8eg8Aa8oS/wMReqigSiSycCN+7CMXUbRub8tLeUx2lCQ8lHqCWik0UL4HIPwTwHvE=
X-Received: by 2002:a05:620a:a2c5:20b0:92f:196:209c with SMTP id af79cd13be357-930b41f9aa3mr1179416785a.71.1784576096734;
        Mon, 20 Jul 2026 12:34:56 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b545e47bsm957792285a.35.2026.07.20.12.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 12:34:56 -0700 (PDT)
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
Subject: [PATCH v5 07/36] mm/memory_hotplug: disallow migration-driven private node hotunplug
Date: Mon, 20 Jul 2026 15:34:01 -0400
Message-ID: <20260720193431.3841992-8-gourry@gourry.net>
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

By default, device-backed private node memory may not be safe to
migrate without coordination.

Do not attempt to hotunplug private node memory, instead fail the
hotunplug attempt, and require the owner to drain the folios
safely before allowing hotunplug to proceed.

Unlike transient / longterm pins causing failures, this is not a
transient condition - so we can break out of the hotunplug attempt
entirely instead of spinning forever on a failed migration attempt.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 mm/memory_hotplug.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 226ab9cb078ad..2b9c0830821e6 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -34,6 +34,7 @@
 #include <linux/memblock.h>
 #include <linux/compaction.h>
 #include <linux/rmap.h>
+#include <linux/node_private.h>
 #include <linux/module.h>
 #include <linux/node.h>
 
@@ -1843,11 +1844,12 @@ static int scan_movable_pages(unsigned long start, unsigned long end,
 	return 0;
 }
 
-static void do_migrate_range(unsigned long start_pfn, unsigned long end_pfn)
+static int do_migrate_range(unsigned long start_pfn, unsigned long end_pfn)
 {
 	struct folio *folio;
 	unsigned long pfn;
 	LIST_HEAD(source);
+	int err = 0;
 	static DEFINE_RATELIMIT_STATE(migrate_rs, DEFAULT_RATELIMIT_INTERVAL,
 				      DEFAULT_RATELIMIT_BURST);
 
@@ -1884,6 +1886,15 @@ static void do_migrate_range(unsigned long start_pfn, unsigned long end_pfn)
 			goto put_folio;
 		}
 
+		/* Private node folios cannot migrate, fail outright */
+		if (folio_is_private_node(folio)) {
+			pr_info_ratelimited("memory offline refused: node %d pfn %lx\n",
+					    folio_nid(folio), pfn);
+			folio_put(folio);
+			err = -EBUSY;
+			break;
+		}
+
 		if (!isolate_folio_to_list(folio, &source)) {
 			if (__ratelimit(&migrate_rs)) {
 				pr_warn("failed to isolate pfn %lx\n",
@@ -1931,6 +1942,7 @@ static void do_migrate_range(unsigned long start_pfn, unsigned long end_pfn)
 			putback_movable_pages(&source);
 		}
 	}
+	return err;
 }
 
 static int __init cmdline_parse_movable_node(char *p)
@@ -2067,10 +2079,11 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 			ret = scan_movable_pages(pfn, end_pfn, &pfn);
 			if (!ret) {
 				/*
-				 * TODO: fatal migration failures should bail
-				 * out
+				 * A fatal migration failure (e.g. a folio on a
+				 * non-migratable private node) bails out; transient
+				 * failures leave ret zero and are retried below.
 				 */
-				do_migrate_range(pfn, end_pfn);
+				ret = do_migrate_range(pfn, end_pfn);
 			}
 		} while (!ret);
 
-- 
2.53.0-Meta

