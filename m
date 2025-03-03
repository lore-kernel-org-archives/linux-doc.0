Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CFE2405F9
	for <linux-doc@vger.kernel.org>; Mon,  3 Mar 2025 16:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741019445; cv=none; b=FhutzMMMtUFL1LV7tzZXo3B34IWWlN6OneDrJhaEEKwS/qntPxiKpSGMho0SUBPiIH8sPa/CaowtrnvjblMS8Azi/qbeQmJJj4I1bFuJ024jvk9WfEb8SB+xdUK+6a5ss3tIe5sT9C0WAaoWqnC/4foiXDiZ2WcQPtkQDWkA9s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741019445; c=relaxed/simple;
	bh=jBMc/6KfiUuhsqx8U3JCMjpv5FKb+tGdfD4lU0RajKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iyKV+8oP/uPZFCX6ONeIRrWa6Sh23EA15Z9sH/rW/NA9RweCRS1LGW8MCv7umlsbtRePd29x32XCwCrcBRKOrHyCLJ2cOpV6IMmSBzJI5QXAGAruiBV33EtvCuiE7J3F4/kW8RNmJ4r2xSRG/KbQUb/VVM+m7ZtvaD9Gz4ASF/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IPudkm1w; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IPudkm1w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741019442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lWnUBbJbNal4OtQP6KylSC1HMhJkWgV+LTGJMK3tR3E=;
	b=IPudkm1wdYzCESuqz/JLjfIU+UjH2w3OoMRS6jCZgD6X2OqgqcFtwJSLGILQJBuig30XU2
	iycQxYiNJdiMxWcf0a5ES/Eqfnj78dlY5BO299Ign/ii1xW1EeJQBlpNUlGTYYrjFxJAJZ
	6eiPaCEGiSVQIg3ydTA3ndjMNiLebXc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-gBoiDC6HM0yaeJHt2tgmBw-1; Mon, 03 Mar 2025 11:30:36 -0500
X-MC-Unique: gBoiDC6HM0yaeJHt2tgmBw-1
X-Mimecast-MFC-AGG-ID: gBoiDC6HM0yaeJHt2tgmBw_1741019435
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43942e82719so33183755e9.2
        for <linux-doc@vger.kernel.org>; Mon, 03 Mar 2025 08:30:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741019435; x=1741624235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lWnUBbJbNal4OtQP6KylSC1HMhJkWgV+LTGJMK3tR3E=;
        b=lWiVT71JSX/3pe/0GJRVZ7HjsspTBNPalk0lxr72B6gxhkems474xMmuBaUhRkl/Aa
         ZkvkJfrstabTDYjfiFy7F4bRAAkBsrFpvYbrpAAmZVENqwrJf1xrXMJBvf/wpvOP5aOB
         8OG/jz6zTaFBYrLZdL3JauvOzs4tyNRRSdLDhDOLE6heiM1qbhUdUZPOoaVA7GlAPEI7
         UTnALBUrAxG2/r1hqeNv68Ksc70fxgZ3MpiZcNzb8NWfq5JPyI8svZuWkuMAMGsE5sPQ
         f3NgKUIPaxYMxpxU4Brn/x1GwuuKuSv4xN/mSojE+FTovdWXJH0dDggrZYOQzKfquTz/
         1f0A==
X-Gm-Message-State: AOJu0YxOV5EW8lttNOT0ecMcGho5R1iNPCojlFbRe+B2lFrJa3HBZGZu
	gkmUr387iyQFsXlW2g5Rdy8/c2tzI/x3sD0/uvNkFICc55IrQaPsjlSI6tzIhZQYF+lSV1axlaB
	DW/PHsMdWU9bcc3AcPfvyz+qhOUr9b7BK/QUhD8Qk60HJ3n5M6ixx7ZtGyg==
X-Gm-Gg: ASbGncvJUC9jRQTLiyuQt2hhEVaExcpVcEywT4dCqij2JduSgYVOMTIBg49EOmyjqY5
	AACnl68Vc2c34RyUlhDNLdB85vBy6TqVBnoI9AjgIRQG8vIPv6X8CowwnUgMBa+TRlyvMVDdk91
	CMpqw4RUPpuz+I9GYsLlHmZNLyOzosbvHqBgf+IvRskXsUxNh+XPsMxwEmGSXXt99vAxRX9DuDQ
	AHmU9/Ex2o5CTdKZY1GHQ+xB6RM9ISFe6fWILez5XY7xv8KYuuYD+/lJMpSJZ/bNbsSWI7hGHpQ
	GASnGOAGW/MTyVBTpTzBixl49es7FeOBOAYLyXYNGf+J18min5rFZGPkSbJTHeh8F7BET3TN7a6
	v
X-Received: by 2002:a05:600c:19c7:b0:439:6b57:c68 with SMTP id 5b1f17b1804b1-43ba6710a51mr128366185e9.17.1741019435397;
        Mon, 03 Mar 2025 08:30:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHH2uqcGG6+HqLvILt026VDKtCx0hMTXydneDmvGOTb2RHDZET1RLo/ABtW5TIvoZEd6mWJw==
X-Received: by 2002:a05:600c:19c7:b0:439:6b57:c68 with SMTP id 5b1f17b1804b1-43ba6710a51mr128365725e9.17.1741019434989;
        Mon, 03 Mar 2025 08:30:34 -0800 (PST)
Received: from localhost (p200300cbc7349600af274326a2162bfb.dip0.t-ipconnect.de. [2003:cb:c734:9600:af27:4326:a216:2bfb])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43bc63877desm18077035e9.1.2025.03.03.08.30.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 08:30:33 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org,
	linux-api@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Tejun Heo <tj@kernel.org>,
	Zefan Li <lizefan.x@bytedance.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Muchun Song <muchun.song@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>
Subject: [PATCH v3 08/20] mm/rmap: pass vma to __folio_add_rmap()
Date: Mon,  3 Mar 2025 17:30:01 +0100
Message-ID: <20250303163014.1128035-9-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250303163014.1128035-1-david@redhat.com>
References: <20250303163014.1128035-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We'll need access to the destination MM when modifying the mapcount
large folios next. So pass in the VMA.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/rmap.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index bcec8677f68df..8a7d023b02e0c 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1242,8 +1242,8 @@ int pfn_mkclean_range(unsigned long pfn, unsigned long nr_pages, pgoff_t pgoff,
 }
 
 static __always_inline unsigned int __folio_add_rmap(struct folio *folio,
-		struct page *page, int nr_pages, enum rmap_level level,
-		int *nr_pmdmapped)
+		struct page *page, int nr_pages, struct vm_area_struct *vma,
+		enum rmap_level level, int *nr_pmdmapped)
 {
 	atomic_t *mapped = &folio->_nr_pages_mapped;
 	const int orig_nr_pages = nr_pages;
@@ -1411,7 +1411,7 @@ static __always_inline void __folio_add_anon_rmap(struct folio *folio,
 
 	VM_WARN_ON_FOLIO(!folio_test_anon(folio), folio);
 
-	nr = __folio_add_rmap(folio, page, nr_pages, level, &nr_pmdmapped);
+	nr = __folio_add_rmap(folio, page, nr_pages, vma, level, &nr_pmdmapped);
 
 	if (likely(!folio_test_ksm(folio)))
 		__page_check_anon_rmap(folio, page, vma, address);
@@ -1582,7 +1582,7 @@ static __always_inline void __folio_add_file_rmap(struct folio *folio,
 
 	VM_WARN_ON_FOLIO(folio_test_anon(folio), folio);
 
-	nr = __folio_add_rmap(folio, page, nr_pages, level, &nr_pmdmapped);
+	nr = __folio_add_rmap(folio, page, nr_pages, vma, level, &nr_pmdmapped);
 	__folio_mod_stat(folio, nr, nr_pmdmapped);
 
 	/* See comments in folio_add_anon_rmap_*() */
-- 
2.48.1

