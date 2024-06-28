Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E7D315BA
	for <linux-doc@vger.kernel.org>; Fri, 28 Jun 2024 21:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719608404; cv=none; b=Syv6UIG9hZoUoFZ89A3crLHsBlNxs0jjr6A1sFXv7WCnGFtw5u+zC6ETzTqsDWxReceWk5RDODUbMZeb2TFkXISwNQd1nHMibvshjbwLqXMz+PCjc1jbeL9LOB7/mB6IEPB/RnTb9w1+W4PmoYFv9n3QI4GNfLrP8VMsofzXagU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719608404; c=relaxed/simple;
	bh=8I231QFuiBSGPyr0EMhXn+o2nbNjY4SIkiFEY5MIBaE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=G8PX7+yPy4hrrFEG+Jy+SwuZbBvOL0vZwYXQuXd3ZPkEAAIguYzK7S9NtlzTXzKYHy5iXchic8d3CC+dOuMPQ37SQOzXrcMYIAwVZ0aq/B3yWzmcRWUHsWLbhqSXFEYPF13D71x4AHYkznzIq5f0NKQbDkWD8ChL4ZDtnUG63Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TtedybNK; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TtedybNK"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-1fad2037870so4354285ad.2
        for <linux-doc@vger.kernel.org>; Fri, 28 Jun 2024 14:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719608403; x=1720213203; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=r0CbibTHvg/Mc5IP1SBIsRIj2TjPoTYgF7QMmo8HErQ=;
        b=TtedybNK7yGdtTf8OVxN/dH0Me08nGmeLaCi5v+u0eTJDvDaMhRLdxhN9BNBWYLF/S
         DsFuvX0DA+chB/AIeh32xcL4GmhWsucYxHSZ7OyZdeRigly3Cwht7ej4fipRs8/GUTFu
         4l8hiDaURfSG4ubcSw3HSXKxnhSujPRyY3xUl0gZ5lsugqLzReYX/+IyAOGrO4BCECYe
         MyE1AOXrEzwCNZvgZ89dX+WO/mu+EreDzCJv9KRu0LJurtsf0AKxnP1/hvQamYoZBy1z
         yEvXI3FdfeR3NaXfQOmkjJ5EgT29kcXEOVQjtiEh75342koORoxxHnVNXRsmHmDFMve2
         fRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719608403; x=1720213203;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r0CbibTHvg/Mc5IP1SBIsRIj2TjPoTYgF7QMmo8HErQ=;
        b=W6jAIZFXZSBCDVEp+NKrHGyZnZE6jf3SW3dDG6IpYLxkkIvoyfkz8yCviZFSN3dndH
         +UYPNE8qgkhADeFXmKHuwsruoZzOYJMnwLnrl0zjVA1B/HF80OzJkv936/fmOqjzR/Us
         edt981l838r5sBAegZOfTHOz6RcmVGxktvyQnX3Z5ROaAVJxre+Y9wKdewxl8StTf6+w
         yDXyrFYMLQAUZeuYqKNNRleFKHdGIc+IXITWSl86RyEdJB83QdYgBn+aRjSqbzdXw2DY
         FGQMIjtAFbpYyHVEyxsmYGYKXWNk+O270FXJP+V/ZF0yCWVKgqkP19N1fiO14Lzhd17Y
         fstw==
X-Forwarded-Encrypted: i=1; AJvYcCWk7/GqAcve2IbJW0ah1HPKBLdycdMtIt+VvbCpMz8KGmv0HthpzpjWWkvMGWQv8QqrKLmYaEELHhZsWzITCi4qnvW9t+brTwgc
X-Gm-Message-State: AOJu0YyBhIs/Vn7Kci8rqtKgRcXhWDJ/4c2lnmvSTg5MeRgR8CHvX6NR
	6u2lDvpuHTilI9/UrVfZZCnL8IMuAYvDVAJ6pI6ATp/B9R8LM7mvvIUh5DWWZ2AxxEFAfMADe6z
	x0zrumfhNxw==
X-Google-Smtp-Source: AGHT+IHvSyTDpXGxBgupVIRFAkBG3VdCY5GUBbjJLmgeOIsfaxOiwkfDkgH572hLnULmbZAu+zNkcopy7a37Yw==
X-Received: from yjq3.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:272f])
 (user=jiaqiyan job=sendgmr) by 2002:a17:902:facf:b0:1f7:1640:cef0 with SMTP
 id d9443c01a7336-1fa1d668ce5mr424595ad.12.1719608402621; Fri, 28 Jun 2024
 14:00:02 -0700 (PDT)
Date: Fri, 28 Jun 2024 20:59:55 +0000
In-Reply-To: <20240628205958.2845610-1-jiaqiyan@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240628205958.2845610-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240628205958.2845610-2-jiaqiyan@google.com>
Subject: [PATCH v7 1/4] mm/memory-failure: refactor log format in soft offline code
From: Jiaqi Yan <jiaqiyan@google.com>
To: nao.horiguchi@gmail.com, linmiaohe@huawei.com
Cc: jane.chu@oracle.com, ioworker0@gmail.com, muchun.song@linux.dev, 
	akpm@linux-foundation.org, shuah@kernel.org, rdunlap@infradead.org, 
	corbet@lwn.net, osalvador@suse.de, rientjes@google.com, duenwen@google.com, 
	fvdl@google.com, ak@linux.intel.com, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"

Logs from soft_offline_page and soft_offline_in_use_page have
different formats than majority of the memory failure code:

  "Memory failure: 0x${pfn}: ${lower_case_message}"

Convert them to the following format:

  "Soft offline: 0x${pfn}: ${lower_case_message}"

No functional change in this commit.

Acked-by: Miaohe Lin <linmiaohe@huawei.com>
Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
---
 mm/memory-failure.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index 2cf7acc286de..685ab9a77966 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -2640,6 +2640,9 @@ int unpoison_memory(unsigned long pfn)
 }
 EXPORT_SYMBOL(unpoison_memory);
 
+#undef pr_fmt
+#define pr_fmt(fmt) "Soft offline: " fmt
+
 static bool mf_isolate_folio(struct folio *folio, struct list_head *pagelist)
 {
 	bool isolated = false;
@@ -2695,7 +2698,7 @@ static int soft_offline_in_use_page(struct page *page)
 
 	if (!huge && folio_test_large(folio)) {
 		if (try_to_split_thp_page(page, true)) {
-			pr_info("soft offline: %#lx: thp split failed\n", pfn);
+			pr_info("%#lx: thp split failed\n", pfn);
 			return -EBUSY;
 		}
 		folio = page_folio(page);
@@ -2707,7 +2710,7 @@ static int soft_offline_in_use_page(struct page *page)
 	if (PageHWPoison(page)) {
 		folio_unlock(folio);
 		folio_put(folio);
-		pr_info("soft offline: %#lx page already poisoned\n", pfn);
+		pr_info("%#lx: page already poisoned\n", pfn);
 		return 0;
 	}
 
@@ -2720,7 +2723,7 @@ static int soft_offline_in_use_page(struct page *page)
 	folio_unlock(folio);
 
 	if (ret) {
-		pr_info("soft_offline: %#lx: invalidated\n", pfn);
+		pr_info("%#lx: invalidated\n", pfn);
 		page_handle_poison(page, false, true);
 		return 0;
 	}
@@ -2737,13 +2740,13 @@ static int soft_offline_in_use_page(struct page *page)
 			if (!list_empty(&pagelist))
 				putback_movable_pages(&pagelist);
 
-			pr_info("soft offline: %#lx: %s migration failed %ld, type %pGp\n",
+			pr_info("%#lx: %s migration failed %ld, type %pGp\n",
 				pfn, msg_page[huge], ret, &page->flags);
 			if (ret > 0)
 				ret = -EBUSY;
 		}
 	} else {
-		pr_info("soft offline: %#lx: %s isolation failed, page count %d, type %pGp\n",
+		pr_info("%#lx: %s isolation failed, page count %d, type %pGp\n",
 			pfn, msg_page[huge], page_count(page), &page->flags);
 		ret = -EBUSY;
 	}
@@ -2795,7 +2798,7 @@ int soft_offline_page(unsigned long pfn, int flags)
 	mutex_lock(&mf_mutex);
 
 	if (PageHWPoison(page)) {
-		pr_info("%s: %#lx page already poisoned\n", __func__, pfn);
+		pr_info("%#lx: page already poisoned\n", pfn);
 		put_ref_page(pfn, flags);
 		mutex_unlock(&mf_mutex);
 		return 0;
-- 
2.45.2.803.g4e1b14247a-goog

