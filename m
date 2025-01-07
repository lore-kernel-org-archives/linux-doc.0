Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE1C4430
	for <linux-doc@vger.kernel.org>; Tue,  7 Jan 2025 00:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736208241; cv=none; b=E+ln57zz27q5uK46fag2XiPF13Un9MD9nxobGYg/JfqL3ESzw6QkswmOPQQSoMuB19GSEsqDFg2RiVSeHI1Pyfid8/vUEPGOBkLm22eUtPlFAELcpNG+2MIXYz1suDH1Tp1jUiSYkoco0tGo7VZQc4K0n3ZcCJRjFxCRnX7XrO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736208241; c=relaxed/simple;
	bh=oo64IWkjs7F27AhDChKPMK0tyVX4cHttD1+sGgXdYD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H2GnjsnIoQwlJ3ugpArus1qd3to/KzGeuO57ri5DEB1GH7TQUdfB16eRZ5fLQRbkSeGcGS5Uxi5nsP8U6err1VBBpkZzNFhX5/QhtmCvWjseyxVlS/Fzq9lsvJGBXKxD9WZoczKYTvqVu+mdWzO2PAQzTyPTCshdrC68Rln/r6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=b93hCZgG; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="b93hCZgG"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6dd0d09215aso119545836d6.2
        for <linux-doc@vger.kernel.org>; Mon, 06 Jan 2025 16:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1736208239; x=1736813039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EsdX3K0L6RUajk4aeowkzYla6EH2ycdI9VpsUm/ueEE=;
        b=b93hCZgGsIUXC/91X1k1atScIN50VQ4z1MYkNeZbdYx6w4Yx2f1IQEIUpKE70oU0Q/
         kJQ4BrP9+2cyqgOGc6U/WHKkdcoUAh3JXR4IIcNO8m2gNBoknIlTOK07cW5jlJjlDzlf
         JjzgNoHqWWJd2xi3TsQfDEMo2Qx1yraSmKL5GTJIdWtMdNfUF0vQoSRJDYdbCWgMeWV6
         migbnQzuXUoIt7DawwDvhVGORNS2Avg/gcAIgFxkTfQoX6jh6Wc/yU61OF3Rg24mQN1/
         BRXF77yuVZQsIFWzo+6icVydNicXDijXJzgTRwmaN07tVTB66+mIdE0GlJ59BDbeqJgL
         Jcag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736208239; x=1736813039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EsdX3K0L6RUajk4aeowkzYla6EH2ycdI9VpsUm/ueEE=;
        b=YHuzgz37D4K3yRlQ1cyH/Q7tns6KAoW39K8JNZLwajhCgC9L0533Y6D7Hq3aHKNaFz
         sP5FJsxXkgNxqWM446I3jgvKneFT+m7sX4TH39KLmIBZ/MnphrffB9IOg+eqU0RXLn6g
         YD0w/FLOb9ngu9nCHH412SuW8wd+RwZn3OHlWOJvfQ5fXGjXdT2dhySOZmJZieRsoo39
         l20vRzvZbryY39EOxlGK7/BAdbKwd6ILaFNTmT/cwn2mVcG3+5OzODnXevFrHFrEv7OH
         vyEGlbWxJrRFWo5jbQxQYL+cbaNSjui21Dz7dhAKe2p26o8wm+qBPnzXY1ThzTIMP2B7
         83dA==
X-Gm-Message-State: AOJu0YxTAqdbXy/pAQmjrKKl0AatED+IN41XQM6lHmV4v7XJ9WUNz7HQ
	8MPHFOqXaPeR8tmBzMZY642ctmmkqBWBma5OjVTAlDjx19cf8OAjTvD/DWGGffM=
X-Gm-Gg: ASbGncvJJiFgb3uilIVLKHNZ6aEwu4ouR1EfJ/03e0nTmXt0+fqoxRlN/tIneAkqghU
	DTtJAl+VZkEgvoXaaF9hxRb54iEvVtHrtEaqNmgy9FXac0JQ/3ay2S/euGVFsm87BE29ClHqtHO
	4AZtFcqfNmvB2VRm7FjNd3JlajqIYSDYpYlV/loqrPJuTmPOg+qeBS8m5Hs/PNTOFsFJNVBCYg3
	XqtBmr9PoYA6kZc7iR1hbj3972A7EcrmbMvJWv95gexs6ypma8Vx08N5h8yN+PZH3D++wZQw3tm
	s7IrhaOT3AjFYkMhkc/wJ9LqoohyGIaaoNdRALHjR4Id
X-Google-Smtp-Source: AGHT+IFjcy08ueMQthdN8WT7xWa+MvL9mh5Nnz9fWO29b2RIBwq+TvZ+nNviuLcDL7R+9H1KK37ATw==
X-Received: by 2002:a05:6214:495:b0:6d4:25c4:e77d with SMTP id 6a1803df08f44-6dd2339fe2amr1069592226d6.34.1736208238692;
        Mon, 06 Jan 2025 16:03:58 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd18137218sm174104476d6.57.2025.01.06.16.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 16:03:58 -0800 (PST)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	nehagholkar@meta.com,
	abhishekd@meta.com,
	david@redhat.com,
	nphamcs@gmail.com,
	gourry@gourry.net,
	akpm@linux-foundation.org,
	hannes@cmpxchg.org,
	kbusch@meta.com,
	ying.huang@linux.alibaba.com,
	feng.tang@intel.com,
	donettom@linux.ibm.com
Subject: [PATCH v3 4/6] vmstat: add page-cache numa hints
Date: Mon,  6 Jan 2025 19:03:44 -0500
Message-ID: <20250107000346.1338481-5-gourry@gourry.net>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250107000346.1338481-1-gourry@gourry.net>
References: <20250107000346.1338481-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Count non-page-fault events as page-cache numa hints instead of
fault hints in vmstat. Add a define to select the hint type to
keep the code clean.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 include/linux/vm_event_item.h | 8 ++++++++
 mm/memcontrol.c               | 1 +
 mm/memory.c                   | 6 +++---
 mm/vmstat.c                   | 2 ++
 4 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/include/linux/vm_event_item.h b/include/linux/vm_event_item.h
index f70d0958095c..c5abb0f7cca7 100644
--- a/include/linux/vm_event_item.h
+++ b/include/linux/vm_event_item.h
@@ -63,6 +63,8 @@ enum vm_event_item { PGPGIN, PGPGOUT, PSWPIN, PSWPOUT,
 		NUMA_HUGE_PTE_UPDATES,
 		NUMA_HINT_FAULTS,
 		NUMA_HINT_FAULTS_LOCAL,
+		NUMA_HINT_PAGE_CACHE,
+		NUMA_HINT_PAGE_CACHE_LOCAL,
 		NUMA_PAGE_MIGRATE,
 #endif
 #ifdef CONFIG_MIGRATION
@@ -185,6 +187,12 @@ enum vm_event_item { PGPGIN, PGPGOUT, PSWPIN, PSWPOUT,
 		NR_VM_EVENT_ITEMS
 };
 
+#ifdef CONFIG_NUMA_BALANCING
+#define NUMA_HINT_TYPE(vmf) (vmf ? NUMA_HINT_FAULTS : NUMA_HINT_PAGE_CACHE)
+#define NUMA_HINT_TYPE_LOCAL(vmf) (vmf ? NUMA_HINT_FAULTS_LOCAL : \
+					 NUMA_HINT_PAGE_CACHE_LOCAL)
+#endif
+
 #ifndef CONFIG_TRANSPARENT_HUGEPAGE
 #define THP_FILE_ALLOC ({ BUILD_BUG(); 0; })
 #define THP_FILE_FALLBACK ({ BUILD_BUG(); 0; })
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 46f8b372d212..865c9c64068e 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -460,6 +460,7 @@ static const unsigned int memcg_vm_event_stat[] = {
 	NUMA_PAGE_MIGRATE,
 	NUMA_PTE_UPDATES,
 	NUMA_HINT_FAULTS,
+	NUMA_HINT_PAGE_CACHE,
 #endif
 };
 
diff --git a/mm/memory.c b/mm/memory.c
index 24acac94399c..3f63cfd24296 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5576,10 +5576,10 @@ int numa_migrate_check(struct folio *folio, struct vm_fault *vmf,
 		*last_cpupid = folio_last_cpupid(folio);
 
 #ifdef CONFIG_NUMA_BALANCING
-	count_vm_numa_event(NUMA_HINT_FAULTS);
-	count_memcg_folio_events(folio, NUMA_HINT_FAULTS, 1);
+	count_vm_numa_event(NUMA_HINT_TYPE(vmf));
+	count_memcg_folio_events(folio, NUMA_HINT_TYPE(vmf), 1);
 	if (folio_nid(folio) == numa_node_id()) {
-		count_vm_numa_event(NUMA_HINT_FAULTS_LOCAL);
+		count_vm_numa_event(NUMA_HINT_TYPE_LOCAL(vmf));
 		*flags |= TNF_FAULT_LOCAL;
 	}
 #endif
diff --git a/mm/vmstat.c b/mm/vmstat.c
index 0889b75cef14..1b74d1faf089 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -1338,6 +1338,8 @@ const char * const vmstat_text[] = {
 	"numa_huge_pte_updates",
 	"numa_hint_faults",
 	"numa_hint_faults_local",
+	"numa_hint_page_cache",
+	"numa_hint_page_cache_local",
 	"numa_pages_migrated",
 #endif
 #ifdef CONFIG_MIGRATION
-- 
2.47.1

