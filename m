Received: from mail-yw1-f196.google.com (mail-yw1-f196.google.com [209.85.128.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0E038E8C2
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 22:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778970889; cv=none; b=lhH7ZI3gVxzy/kutcIszvGOn+mo3k3o8wtkfe+dP9gKCya8O3cKa3QMUITotW1KvWGbUUtefBhXK0PKCsR4s5J4X0gYUUVLQGtn5GOz+8d7Vo+uD4JTGXXb8bA5Zkqrtb3YAGeoG/0zlomoP5JujiP1LOL0f7BTrYh9NSijx4pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778970889; c=relaxed/simple;
	bh=81t2u2yCaMRD7GUpqkuicA4uYgq8AJpp2/8XxLBG7H8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LF/PpeGDYgicxJ6z+whHc7rjP/BbnZx3vbIKpPoYULtd4ZiwKlf6WfDAL23Z+XBK9/Zaj7tof82K/9YbqJnzfd4fhcrCsDbA/ymb7GJEtMlGOb0FI+Gr6KNEsNlJrrtf/9PXghhpKQeT26bxW2iR3dlrj/klsu6Mscd//QDOxYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JZg7dqQW; arc=none smtp.client-ip=209.85.128.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JZg7dqQW"
Received: by mail-yw1-f196.google.com with SMTP id 00721157ae682-7bde9d73678so5541957b3.0
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 15:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778970887; x=1779575687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R2FYJPYLSru7tpq4iL0KXNgZ0ilFNQRh0d+zdghJXVs=;
        b=JZg7dqQWAkJnvD4PkduhIElA1kVt1D2WbJz7GmAMfhK8uC+X0ZMMJPAI663aXh1Peh
         ooGjQzMY9wfjkLJVFDR3WFSNnUr0LIqZ0UaFKXp7hN9CeYc1mDsFJiKXWntWLul82t/K
         5yqtkt9qadQkAsNB/PsXln4bN10t7qOaKMe6NLCCs65FSabq+7QHhLpWG4ADHWTz3EpY
         +KnBekYMRJ7El2DXvQreGJXzSCre2qQhX3/ma7S17CL/OXbXe2LP2OrGUrxW85NCDBAa
         ciwoFc3ya66COMACr07jl3Yst80Bkrw241jhac6BF850yyIPrerA0wkUFZOCUVOFy6W4
         rYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778970887; x=1779575687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R2FYJPYLSru7tpq4iL0KXNgZ0ilFNQRh0d+zdghJXVs=;
        b=FZ5C5wc/5QUhsWWIWa1+L81Kwu/5PZ39VZ5HwdO3v9IvrYxpUA6zb0TfEBqvyIdgEX
         gn5ui6+/O+VKScis4j27U1gcoupmOzueLtrILU5GZ2nK2Ewx+rBmMpvoEuXY4kCyBJj1
         MaBsMq/WiXrNhq5YNRotSldwd7p3T15KYdCcOG4CyDa6DvhsMRG1J1FdypYkPcd+NQBv
         8gcF7legDS0riUwGSjogz0yXzcV4OrwC499tS3YBxn+lU25Y7SyIQGzbWb64Bjj0VCRA
         vh9LnTWHcokGezZ62Wz1/44NuSQJ2D5iM4cVMoVMWGfA4P0RDAmgzTYfdMnzG01hitSG
         8Uig==
X-Forwarded-Encrypted: i=1; AFNElJ+0BlhkW6nTYMfY11AFToi8gdOd69VZZyJlDSp3iuufZUP65DFhxQjX2UG5yYoxYEcAv+R23+f/j7A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWWNkfnimk/mve7x+DSSnIQ0HQprgw+pPYJWTQUpVLFJhgvpyA
	FOy0mUxNQG4fsYlL2yY1LyqCVP/ha7oV1u0o0ZH53G6pJ46Igufta0w=
X-Gm-Gg: Acq92OHSZZzhaoyP5Wgi1VTx2I4o+2jOTv5h5xdspt8f7sfWl7ZQVULwx9O6DvY94Jq
	Efh8P6PW4Qv4J6T10iMcAxE61CYpwbKQB4EEVukpvItNmCpGtBcKYCfq3Eswvb3w84VC6/Jtapf
	Kcps9gv1JmcIuFp6nliZhcinRUMKtKtPIQ3e/YAE0kNdaImmvrEEwpymE5Q1eySlruioSjbBx4Q
	LgzctYT3fDpCd7UaNuFBy/phVh3iAKpO+tvo3v8TdP2a8IoUFWANzATezOJsP7UPg8uc0NhV9oD
	Xt10E2hO3ywnqogtqGdLzlkMMqy0lpHSla3zqEuIwV7gFBbjwcp77iJPAKqamQVqWBm8HuhrUP8
	9IXM0rBPwUDfy1o2NGZzI1P+tgaOmwI6AL/NyjK5dL18Iwm/1uz6HTH2xxpw7/lnVZQWpuhMYQu
	ehW/LPl90+KA60VIgvww5L1YWqyAnq8BHO9EP2SpdCwB3UhJACMP2Ru7S1OLbG4fDUSt3Ij655G
	Q==
X-Received: by 2002:a05:690c:f02:b0:7b6:dada:4017 with SMTP id 00721157ae682-7c949ac202bmr92155237b3.24.1778970886989;
        Sat, 16 May 2026 15:34:46 -0700 (PDT)
Received: from localhost (23-116-43-216.lightspeed.sntcca.sbcglobal.net. [23.116.43.216])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc9d18dcddsm633357b3.49.2026.05.16.15.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 15:34:46 -0700 (PDT)
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
To: sj@kernel.org,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: akpm@linux-foundation.org,
	corbet@lwn.net,
	bijan311@gmail.com,
	ajayjoshi@micron.com,
	honggyu.kim@sk.com,
	yunjeong.mun@sk.com,
	ravis.opensrc@gmail.com,
	bharata@amd.com
Subject: [RFC PATCH 2/7] mm/damon/paddr: export damon_pa_* ops for IBS module
Date: Sat, 16 May 2026 15:34:27 -0700
Message-ID: <20260516223439.4033-3-ravis.opensrc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260516223439.4033-1-ravis.opensrc@gmail.com>
References: <20260516223439.4033-1-ravis.opensrc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove static qualifier from damon_pa_prepare_access_checks,
damon_pa_check_accesses, damon_pa_apply_probes, damon_pa_apply_scheme,
and damon_pa_scheme_score. Add EXPORT_SYMBOL_GPL for each.

These functions are used as ops callbacks by the IBS backend module (damon_ibs.ko)
which registers paddr_ibs operations.

Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
---
 mm/damon/ops-common.h | 13 +++++++++++++
 mm/damon/paddr.c      | 15 ++++++++++-----
 2 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/mm/damon/ops-common.h b/mm/damon/ops-common.h
index 5efa5b5970def..0ec75276d985a 100644
--- a/mm/damon/ops-common.h
+++ b/mm/damon/ops-common.h
@@ -23,3 +23,16 @@ bool damos_folio_filter_match(struct damos_filter *filter, struct folio *folio);
 unsigned long damon_migrate_pages(struct list_head *folio_list, int target_nid);
 
 bool damos_ops_has_filter(struct damos *s);
+
+/*
+ * paddr ops callbacks, declared here so paddr-family backends
+ * (e.g. paddr_ibs) can reuse the paddr operation implementations.
+ */
+void damon_pa_prepare_access_checks(struct damon_ctx *ctx);
+unsigned int damon_pa_check_accesses(struct damon_ctx *ctx);
+void damon_pa_apply_probes(struct damon_ctx *ctx);
+unsigned long damon_pa_apply_scheme(struct damon_ctx *ctx,
+		struct damon_target *t, struct damon_region *r,
+		struct damos *scheme, unsigned long *sz_filter_passed);
+int damon_pa_scheme_score(struct damon_ctx *context,
+		struct damon_region *r, struct damos *scheme);
diff --git a/mm/damon/paddr.c b/mm/damon/paddr.c
index fc2154b6221fb..5af4ac2a7ed4d 100644
--- a/mm/damon/paddr.c
+++ b/mm/damon/paddr.c
@@ -124,13 +124,14 @@ static void damon_pa_prepare_access_checks_faults(struct damon_ctx *ctx)
 	}
 }
 
-static void damon_pa_prepare_access_checks(struct damon_ctx *ctx)
+void damon_pa_prepare_access_checks(struct damon_ctx *ctx)
 {
 	if (ctx->sample_control.primitives_enabled.page_table)
 		damon_pa_prepare_access_checks_abit(ctx);
 	if (ctx->sample_control.primitives_enabled.page_fault)
 		damon_pa_prepare_access_checks_faults(ctx);
 }
+EXPORT_SYMBOL_GPL(damon_pa_prepare_access_checks);
 
 static bool damon_pa_young(phys_addr_t paddr, unsigned long *folio_sz)
 {
@@ -168,7 +169,7 @@ static void __damon_pa_check_access(struct damon_region *r,
 	last_addr = sampling_addr;
 }
 
-static unsigned int damon_pa_check_accesses(struct damon_ctx *ctx)
+unsigned int damon_pa_check_accesses(struct damon_ctx *ctx)
 {
 	struct damon_target *t;
 	struct damon_region *r;
@@ -184,6 +185,7 @@ static unsigned int damon_pa_check_accesses(struct damon_ctx *ctx)
 
 	return max_nr_accesses;
 }
+EXPORT_SYMBOL_GPL(damon_pa_check_accesses);
 
 static bool damon_pa_filter_match(struct damon_filter *filter,
 		struct folio *folio)
@@ -234,7 +236,7 @@ static bool damon_pa_filter_pass(phys_addr_t pa, struct folio *folio,
 	return pass;
 }
 
-static void damon_pa_apply_probes(struct damon_ctx *ctx)
+void damon_pa_apply_probes(struct damon_ctx *ctx)
 {
 	struct damon_target *t;
 	struct damon_region *r;
@@ -259,6 +261,7 @@ static void damon_pa_apply_probes(struct damon_ctx *ctx)
 		}
 	}
 }
+EXPORT_SYMBOL_GPL(damon_pa_apply_probes);
 
 /*
  * damos_pa_filter_out - Return true if the page should be filtered out.
@@ -542,7 +545,7 @@ static unsigned long damon_pa_alloc_or_free(
 
 #endif
 
-static unsigned long damon_pa_apply_scheme(struct damon_ctx *ctx,
+unsigned long damon_pa_apply_scheme(struct damon_ctx *ctx,
 		struct damon_target *t, struct damon_region *r,
 		struct damos *scheme, unsigned long *sz_filter_passed)
 {
@@ -574,8 +577,9 @@ static unsigned long damon_pa_apply_scheme(struct damon_ctx *ctx,
 	}
 	return 0;
 }
+EXPORT_SYMBOL_GPL(damon_pa_apply_scheme);
 
-static int damon_pa_scheme_score(struct damon_ctx *context,
+int damon_pa_scheme_score(struct damon_ctx *context,
 		struct damon_region *r, struct damos *scheme)
 {
 	switch (scheme->action) {
@@ -595,6 +599,7 @@ static int damon_pa_scheme_score(struct damon_ctx *context,
 
 	return DAMOS_MAX_SCORE;
 }
+EXPORT_SYMBOL_GPL(damon_pa_scheme_score);
 
 static int __init damon_pa_initcall(void)
 {
-- 
2.43.0

