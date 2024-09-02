Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9422D154BEA
	for <linux-doc@vger.kernel.org>; Mon,  2 Sep 2024 04:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725252102; cv=none; b=ItH2mztnOjk1NZH/832/cZnGyWNeLWD4Fq3z3RCP1gt1LQYu5B+VU7jw1OjY89n7LzZJyDYvYf8burByp8gdG66Ui0uGht8z8kuJIessq6xUWgB/oIvEpFrtXluQiyWgwBEx5d++0lwJXd09dCR0cmZrwkBFpmZaZYJAe+6huZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725252102; c=relaxed/simple;
	bh=WZGSZDDwwBcvVvHjYbdkt42ukG4S2dTzJF74pYfBzvM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sPt/gdGydod2WvJOCu+Nc+39e41sWu55oqA2RQhwPADGUi2ABTXVLf5OGkIwC0ZjtwUQw456GPQdmv0tuZk43/yqQUhN/ekktNkRwKMN9frnw2pqQ5XgUlZykT/CoqMv1L5TQ1/aBiXC5GfMRRKONoDvco1TO3swSuYrW9biVPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4JmcXONf; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4JmcXONf"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e1173581259so6941367276.2
        for <linux-doc@vger.kernel.org>; Sun, 01 Sep 2024 21:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725252099; x=1725856899; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GtHW3QbMIbL8VkRhZ9UoruDWIR+5Ejb5CjRZSzRSfG0=;
        b=4JmcXONfpduox86Z3T05T4h09vS+JR41ggjQq6WCOLEgnoRyFAMTcFf3DOepWglhnB
         riXhLkSAS+5zSOeFkeJ56aRodHoLWuayhLtpXrtzWY05cLrjvjsqcCbGJ4wB8jE82tqT
         Isd5rtc0Tqa5jga9M7OhgSXpSPf2gMhRlr2+YoM50ANE/fRhFkMsgTMo39ZHIweY1yIM
         IId71c0yzaJKmVmDZpZQhLcLSVCVKsfRuSeO1Yk0INoWJtxcZBDCp7w1mqX/46NsOJ5X
         U7NHWHGF1RSIV5xKICoWdy2e/cAFpK4TNFWRT55MzckkodKgT7/+ZMvhArFjhrjGtBoC
         KdkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725252099; x=1725856899;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GtHW3QbMIbL8VkRhZ9UoruDWIR+5Ejb5CjRZSzRSfG0=;
        b=q5bMbYI/GSkMUl19sXzrjrGnWqABHkMpvxEGT5Brl8SBZ2SItbGy/dh3ukGCvd0JKI
         PzeAQ/CRwK4lg6R5FV/kRkuI0jeUox8tKy5PCwJT4GAD+jt2HAKTf1Jn490+S78YMLFz
         qpTfah0N2atGyH8CLNI5zXEIdL9l1rg5ZZVXWrV+Sinbq1G64YAb2dfrpMdLbpTU5TyT
         YSxVNmFovmAW4yLwa4No8KFLhiyYsWfGY4cvO85cdeJwY/xpEQc7+jY2Zbr6QUQMg8oS
         i9jpH29/5KhRLCf+qamIzdFmI/sx1f0aQT4fIdkveQ13hjxk0sZihAvKq1wVSTSlwzmS
         2/Mg==
X-Forwarded-Encrypted: i=1; AJvYcCV4KVNZ6uFeGx5176KuYiDvb5wlVpeC73Vc4X8iC9n07AandJ7+EeQ58dWJpDWcoDumfifOUBGgJ2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+96UC8cE/LEdEnE0bBJyQK69h0yta5rkRRq/DlR7dUIkBWyPr
	jdvE+s20eYgEYU2vAbCNrBBtHt2ViYAYhJC7IZnagM7q4zD/bfc9079PWjBun4bmsT3jAw6dJ/T
	Zjg==
X-Google-Smtp-Source: AGHT+IGHUG44Vos/pxlFWbZNjhZtZ0OaAmv4KSGmEpEw821HAQXG3t5pT+l+pURZYG9PiSEp/j/9qgeoB6s=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:7343:ecd2:aed:5b8f])
 (user=surenb job=sendgmr) by 2002:a25:7e46:0:b0:e0b:ab63:b9c8 with SMTP id
 3f1490d57ef6-e1a7a3dbab3mr14893276.11.1725252098507; Sun, 01 Sep 2024
 21:41:38 -0700 (PDT)
Date: Sun,  1 Sep 2024 21:41:25 -0700
In-Reply-To: <20240902044128.664075-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240902044128.664075-1-surenb@google.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
Message-ID: <20240902044128.664075-4-surenb@google.com>
Subject: [PATCH v2 3/6] alloc_tag: eliminate alloc_tag_ref_set
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: kent.overstreet@linux.dev, corbet@lwn.net, arnd@arndb.de, 
	mcgrof@kernel.org, rppt@kernel.org, paulmck@kernel.org, thuth@redhat.com, 
	tglx@linutronix.de, bp@alien8.de, xiongwei.song@windriver.com, 
	ardb@kernel.org, david@redhat.com, vbabka@suse.cz, mhocko@suse.com, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, dave@stgolabs.net, 
	willy@infradead.org, liam.howlett@oracle.com, pasha.tatashin@soleen.com, 
	souravpanda@google.com, keescook@chromium.org, dennis@kernel.org, 
	jhubbard@nvidia.com, yuzhao@google.com, vvvvvv@google.com, 
	rostedt@goodmis.org, iamjoonsoo.kim@lge.com, rientjes@google.com, 
	minchan@google.com, kaleshsingh@google.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kernel-team@android.com, surenb@google.com
Content-Type: text/plain; charset="UTF-8"

To simplify further refactoring, open-code the only two callers
of alloc_tag_ref_set().

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/alloc_tag.h   | 25 ++-----------------------
 include/linux/pgalloc_tag.h | 12 +++++++++++-
 2 files changed, 13 insertions(+), 24 deletions(-)

diff --git a/include/linux/alloc_tag.h b/include/linux/alloc_tag.h
index 99cbc7f086ad..21e3098220e3 100644
--- a/include/linux/alloc_tag.h
+++ b/include/linux/alloc_tag.h
@@ -143,36 +143,15 @@ static inline void alloc_tag_add_check(union codetag_ref *ref, struct alloc_tag
 static inline void alloc_tag_sub_check(union codetag_ref *ref) {}
 #endif
 
-/* Caller should verify both ref and tag to be valid */
-static inline void __alloc_tag_ref_set(union codetag_ref *ref, struct alloc_tag *tag)
-{
-	ref->ct = &tag->ct;
-	/*
-	 * We need in increment the call counter every time we have a new
-	 * allocation or when we split a large allocation into smaller ones.
-	 * Each new reference for every sub-allocation needs to increment call
-	 * counter because when we free each part the counter will be decremented.
-	 */
-	this_cpu_inc(tag->counters->calls);
-}
-
-static inline void alloc_tag_ref_set(union codetag_ref *ref, struct alloc_tag *tag)
-{
-	alloc_tag_add_check(ref, tag);
-	if (!ref || !tag)
-		return;
-
-	__alloc_tag_ref_set(ref, tag);
-}
-
 static inline void alloc_tag_add(union codetag_ref *ref, struct alloc_tag *tag, size_t bytes)
 {
 	alloc_tag_add_check(ref, tag);
 	if (!ref || !tag)
 		return;
 
-	__alloc_tag_ref_set(ref, tag);
+	ref->ct = &tag->ct;
 	this_cpu_add(tag->counters->bytes, bytes);
+	this_cpu_inc(tag->counters->calls);
 }
 
 static inline void alloc_tag_sub(union codetag_ref *ref, size_t bytes)
diff --git a/include/linux/pgalloc_tag.h b/include/linux/pgalloc_tag.h
index 207f0c83c8e9..244a328dff62 100644
--- a/include/linux/pgalloc_tag.h
+++ b/include/linux/pgalloc_tag.h
@@ -103,7 +103,17 @@ static inline void pgalloc_tag_split(struct page *page, unsigned int nr)
 	page_ext = page_ext_next(page_ext);
 	for (i = 1; i < nr; i++) {
 		/* Set new reference to point to the original tag */
-		alloc_tag_ref_set(codetag_ref_from_page_ext(page_ext), tag);
+		ref = codetag_ref_from_page_ext(page_ext);
+		alloc_tag_add_check(ref, tag);
+		if (ref) {
+			ref->ct = &tag->ct;
+			/*
+			 * We need in increment the call counter every time we split a
+			 * large allocation into smaller ones because when we free each
+			 * part the counter will be decremented.
+			 */
+			this_cpu_inc(tag->counters->calls);
+		}
 		page_ext = page_ext_next(page_ext);
 	}
 out:
-- 
2.46.0.469.g59c65b2a67-goog

