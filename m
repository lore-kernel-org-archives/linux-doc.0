Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60848191F62
	for <linux-doc@vger.kernel.org>; Sat, 11 Jan 2025 04:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736569595; cv=none; b=uDLu2SAleFFADi9ktLnbEoQEYiTDFMJma0CY9AA8wNECr24xkAEJ1LQOIBSTKTk7qJLWXWDKapjudFkAawnDj8wRMO15cB7Y8rgRqzgBekvbpZNrEKrgRwGENkXhooTr9l3xUAXzEJpT0mwytQeZdmFSPVlcrcyNpkxXVFWnuqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736569595; c=relaxed/simple;
	bh=Y9D0p+k57aMethzqPjdkAQ2WOKHP/DFBI9vGZ9OYQL0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=u2YfGbcJGzvAhwhh63GbA+2djJ54NvsPjvl6d/gY5qMwyQZaZwRUg9mmCJEU+bHUjwTcpRMEcbe9EtIZquZ7dtLvuoPYKNa62ww0JzCFhgQDpZ5ZUbjYA9l2bnmcpYP6n2XJ57FEkExEjpDcxL1WkuKRDxdj3GefeB7D2Mdbwoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iT0zylMc; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iT0zylMc"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ef9e38b0cfso4790790a91.0
        for <linux-doc@vger.kernel.org>; Fri, 10 Jan 2025 20:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736569594; x=1737174394; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2TrBali5XeUoD22YNdBhZEhX/KaryyxFeSYnw61ebAw=;
        b=iT0zylMcnJ+rtthquVcq3gO4BSIctVmLVcjdXHcivXDGVD3X4GR7Cq3orKDPZctHvV
         BktUivCsnWeCd4K5eK0qyyI5vu2TtlIyLZ9NdmLxjyuJFI99jiaFaK12Oa8wlywRtHWI
         Vh8RNW3Q+gf32cA0ndmYbu3QOviOtZ3IBQ1esJDihPYntKAWOKQbIf0slpodZ7TUoTXd
         XSXRa+H1b8T9+dMtRc2FKSe1ydpdHJhKAeoFS5UnJ2nek2Kn9mpbnFXIwwcZd6RuVFnd
         GT9hgdztEpOe2UI07nGNAHs3QjTh9ZWwFIj/YGgIaxXcpz92PORuOmYwi2A+87LVJZZ2
         iB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736569594; x=1737174394;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2TrBali5XeUoD22YNdBhZEhX/KaryyxFeSYnw61ebAw=;
        b=d30qOPJdGtB04AXyEaJbMVr3ILBvIp+9eM5wipkwXIHB//zebNd9UoxOjjPh8Apsin
         IA48robTGF6L5bz1yIyI56f+DvwCgarLfPoLmCMCVr01Nxa0zEvP/LUmfsMNsqKXzEsO
         LVxGdTuJ2NaYNvTVAAtwx5QOzthCl30x6+krizVBxasGgDEVtDdccWfUiMyNPpnKO9vz
         ngFocvakEAbggYV6g3nMV7yvcc+LGVP3PXi60cd5zAJCo0Hqb1T2FIkt4xw0CDOkD8UG
         GU9HYNNAHBmXoH4kpWQfnVkv8ZxlWMVMldirFMX/GoA3jUl0ZE1wG242xr2HxcEtrblN
         +HtA==
X-Forwarded-Encrypted: i=1; AJvYcCUj54TeVVw7hDncKxyj4vtZefMeRCU4yc67HtuSLG4ggNlmk4w5VCOMgbWyo+FJHwKbfq0jefxxiz8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvYQvXYAkXLBt5nKQTWCOwWyDagzSsMTglktAHUOG6Jn8EtJgK
	2Yvzw10L3gfIPoFaYvjQiIz1w49fIlNGtTC2PF/qxjTX9qEb8SWdEfcdteVl3zd2BCgykNV1c+W
	nbA==
X-Google-Smtp-Source: AGHT+IGO/d7KP6nJwj/5X1Bl/23roKwNny3F3/SdCo6a/vda+g/68kT+5jbEnMfYJNiY3Hot1V2n9uarLr4=
X-Received: from pjbdj16.prod.google.com ([2002:a17:90a:d2d0:b0:2ee:4826:cae3])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:518b:b0:2ee:b2fe:eeee
 with SMTP id 98e67ed59e1d1-2f548eba7d0mr20657931a91.15.1736569593696; Fri, 10
 Jan 2025 20:26:33 -0800 (PST)
Date: Fri, 10 Jan 2025 20:25:59 -0800
In-Reply-To: <20250111042604.3230628-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111042604.3230628-13-surenb@google.com>
Subject: [PATCH v9 12/17] mm: move lesser used vma_area_struct members into
 the last cacheline
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, david.laight.linux@gmail.com, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com, surenb@google.com
Content-Type: text/plain; charset="UTF-8"

Move several vma_area_struct members which are rarely or never used
during page fault handling into the last cacheline to better pack
vm_area_struct. As a result vm_area_struct will fit into 3 as opposed
to 4 cachelines. New typical vm_area_struct layout:

struct vm_area_struct {
    union {
        struct {
            long unsigned int vm_start;              /*     0     8 */
            long unsigned int vm_end;                /*     8     8 */
        };                                           /*     0    16 */
        freeptr_t          vm_freeptr;               /*     0     8 */
    };                                               /*     0    16 */
    struct mm_struct *         vm_mm;                /*    16     8 */
    pgprot_t                   vm_page_prot;         /*    24     8 */
    union {
        const vm_flags_t   vm_flags;                 /*    32     8 */
        vm_flags_t         __vm_flags;               /*    32     8 */
    };                                               /*    32     8 */
    unsigned int               vm_lock_seq;          /*    40     4 */

    /* XXX 4 bytes hole, try to pack */

    struct list_head           anon_vma_chain;       /*    48    16 */
    /* --- cacheline 1 boundary (64 bytes) --- */
    struct anon_vma *          anon_vma;             /*    64     8 */
    const struct vm_operations_struct  * vm_ops;     /*    72     8 */
    long unsigned int          vm_pgoff;             /*    80     8 */
    struct file *              vm_file;              /*    88     8 */
    void *                     vm_private_data;      /*    96     8 */
    atomic_long_t              swap_readahead_info;  /*   104     8 */
    struct mempolicy *         vm_policy;            /*   112     8 */
    struct vma_numab_state *   numab_state;          /*   120     8 */
    /* --- cacheline 2 boundary (128 bytes) --- */
    refcount_t          vm_refcnt (__aligned__(64)); /*   128     4 */

    /* XXX 4 bytes hole, try to pack */

    struct {
        struct rb_node     rb (__aligned__(8));      /*   136    24 */
        long unsigned int  rb_subtree_last;          /*   160     8 */
    } __attribute__((__aligned__(8))) shared;        /*   136    32 */
    struct anon_vma_name *     anon_name;            /*   168     8 */
    struct vm_userfaultfd_ctx  vm_userfaultfd_ctx;   /*   176     8 */

    /* size: 192, cachelines: 3, members: 18 */
    /* sum members: 176, holes: 2, sum holes: 8 */
    /* padding: 8 */
    /* forced alignments: 2, forced holes: 1, sum forced holes: 4 */
} __attribute__((__aligned__(64)));

Memory consumption per 1000 VMAs becomes 48 pages:

    slabinfo after vm_area_struct changes:
     <name>           ... <objsize> <objperslab> <pagesperslab> : ...
     vm_area_struct   ...    192   42    2 : ...

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/mm_types.h | 38 ++++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 9228d19662c6..d902e6730654 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -725,17 +725,6 @@ struct vm_area_struct {
 	 */
 	unsigned int vm_lock_seq;
 #endif
-
-	/*
-	 * For areas with an address space and backing store,
-	 * linkage into the address_space->i_mmap interval tree.
-	 *
-	 */
-	struct {
-		struct rb_node rb;
-		unsigned long rb_subtree_last;
-	} shared;
-
 	/*
 	 * A file's MAP_PRIVATE vma can be in both i_mmap tree and anon_vma
 	 * list, after a COW of one of the file pages.	A MAP_SHARED vma
@@ -755,14 +744,6 @@ struct vm_area_struct {
 	struct file * vm_file;		/* File we map to (can be NULL). */
 	void * vm_private_data;		/* was vm_pte (shared mem) */
 
-#ifdef CONFIG_ANON_VMA_NAME
-	/*
-	 * For private and shared anonymous mappings, a pointer to a null
-	 * terminated string containing the name given to the vma, or NULL if
-	 * unnamed. Serialized by mmap_lock. Use anon_vma_name to access.
-	 */
-	struct anon_vma_name *anon_name;
-#endif
 #ifdef CONFIG_SWAP
 	atomic_long_t swap_readahead_info;
 #endif
@@ -775,7 +756,6 @@ struct vm_area_struct {
 #ifdef CONFIG_NUMA_BALANCING
 	struct vma_numab_state *numab_state;	/* NUMA Balancing state */
 #endif
-	struct vm_userfaultfd_ctx vm_userfaultfd_ctx;
 #ifdef CONFIG_PER_VMA_LOCK
 	/* Unstable RCU readers are allowed to read this. */
 	refcount_t vm_refcnt ____cacheline_aligned_in_smp;
@@ -783,6 +763,24 @@ struct vm_area_struct {
 	struct lockdep_map vmlock_dep_map;
 #endif
 #endif
+	/*
+	 * For areas with an address space and backing store,
+	 * linkage into the address_space->i_mmap interval tree.
+	 *
+	 */
+	struct {
+		struct rb_node rb;
+		unsigned long rb_subtree_last;
+	} shared;
+#ifdef CONFIG_ANON_VMA_NAME
+	/*
+	 * For private and shared anonymous mappings, a pointer to a null
+	 * terminated string containing the name given to the vma, or NULL if
+	 * unnamed. Serialized by mmap_lock. Use anon_vma_name to access.
+	 */
+	struct anon_vma_name *anon_name;
+#endif
+	struct vm_userfaultfd_ctx vm_userfaultfd_ctx;
 } __randomize_layout;
 
 #ifdef CONFIG_NUMA
-- 
2.47.1.613.gc27f4b7a9f-goog

