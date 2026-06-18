Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD55B346A04
	for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 17:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781804205; cv=none; b=ubniXNBQ/jUICUJHUn4nyStu/zob7Mnpvr5tOqDE8Y1rn/7UOZOWQrn3Z/3xXEjqhCYUFwjaHK5o+886c8Q7M2e4Tqzl1qh8k1Ym+sY5G6GC0eNPRYl6L8Psy9i9hamho+C0YQAmkqaSCn3cqbGstR0q1KMRQJ86hbt/hi7Wey0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781804205; c=relaxed/simple;
	bh=Y3sanpjKdCcYm+ZMDa/2RLR+quJCGnQ3tTczyoKyUhA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NfilZdtWQKmMFeHIi7YHt0EXOK9lym2easWdjmC2IryCxUdEpfzP1Qka2UotuXXYoX/ojjWTT6jZ9u2OpbFxokh+yx9+jFnCjzGgi4HOCnsHM1sxwByLPE+ai8Hb3IGR1MhhEwh0H/I9l3H6TtcR/ZqElPJQbaoEC6gr023XmpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LnqTVVdd; arc=none smtp.client-ip=74.125.82.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LnqTVVdd"
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-1384427c3efso4812692c88.0
        for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 10:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781804203; x=1782409003; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2HvIid687XPWlqwQBXwULFWBBKUy8bJsEI/wYE9guJc=;
        b=LnqTVVddIht/t+GrCK+8N0gmT/LyY79nc9w1mtsFLyWT3rNlDAX9UrqANXduRvXeRG
         X72FhBBNXA20T1AaWEFjKJGtSJQlp0G8HT5sCTHyhXQBSm92CAg9vFMQDSzUwA6/Edlt
         sDH74kFDC5QEXHfav46KomqiOct/DaCvv6uVyFnIi0nWu2IjqsVsFCqtfEFRsK/nrM/g
         +1fbN/Nx3SJFuaGTwZb9s6uLotbvD3AvcltYDZAcNbU9GcyXokp/plIfDwyZDmzgAsIE
         7eYXCcS8z30oZx/m6yHjSiSFlkdgBydTVRvV9Hcm8WezszJ2lZMANP9s36shIUt2uS3h
         XDTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781804203; x=1782409003;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2HvIid687XPWlqwQBXwULFWBBKUy8bJsEI/wYE9guJc=;
        b=ZkJa7QJrLRHcY7Te27Z5pBhqNMWfrnX9gyPXTPQmKu6/+wsaccC4uINL9xlhYrNhci
         Tbj72fz/3Aocge+mmE4xFT16Dg7Hg68+ABiZ5Cy3WCEP+IzSb7ua0w5xxHIXRAoaDP4y
         kv1pVH6/s4fLfgNNfQvJ9pFeLDDP4Ed0cZbABxaZlhTV1LFAlh76GN6n7NLwnJISXBn8
         48nR8Re+Kr2F6no4q/Y4nq0rQ1oVxQA8/3iy97Y8OhAjhplw3NCXYvQobrBdzxezGytH
         jhRMSd2irqFP174pRnhGEb6jp77T2ZAcq8tGzGdUj3Yy4Q/7QaVzDOnK0EtHUTReMJnK
         mc5w==
X-Forwarded-Encrypted: i=1; AFNElJ8cYha/jvbehkz6s35sxRdxVkTaLxSh6fEIYhX6EKPdj0WZolqMef3tu6RKsSA0LAuQnOYAPBovLl4=@vger.kernel.org
X-Gm-Message-State: AOJu0YweUey4jrDihyEOz5nGPIvWMeWvwOGtmw9vzZqlLXOjVfUewJri
	SAzdy5en32tEEtcxO3OD0G6Cs6BtL8JnQzVhSR3iMMT1TBZakjnnMid2qsabJ80WLLaNHYO34Cf
	2yAwCHqOUEhanN66lkCF/+maqY6bO7W+kbw==
X-Received: from dlbqd13.prod.google.com ([2002:a05:7023:b0d:b0:137:e7d3:1490])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:688a:b0:138:2f96:dc0d with SMTP id a92af1059eb24-139a20faaf9mr460012c88.9.1781804202465;
 Thu, 18 Jun 2026 10:36:42 -0700 (PDT)
Date: Thu, 18 Jun 2026 17:36:33 +0000
In-Reply-To: <cover.1781803482.git.abhishekbapat@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1781803482.git.abhishekbapat@google.com>
X-Mailer: git-send-email 2.55.0.rc0.786.g65d90a0328-goog
Message-ID: <bf5b4b584f01b35d8b8193fe45b55de252d102bd.1781803482.git.abhishekbapat@google.com>
Subject: [PATCH v6 4/6] alloc_tag: add accuracy based filtering to ioctl
From: Abhishek Bapat <abhishekbapat@google.com>
To: Suren Baghdasaryan <surenb@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Hao Ge <hao.ge@linux.dev>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Sourav Panda <souravpanda@google.com>, Abhishek Bapat <abhishekbapat@google.com>
Content-Type: text/plain; charset="UTF-8"

Extend the allocinfo filtering mechanism to allow users to filter tags
based on their accuracy.

Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
Acked-by: Hao Ge <hao.ge@linux.dev>
Acked-by: Suren Baghdasaryan <surenb@google.com>
---
 include/uapi/linux/alloc_tag.h | 4 ++++
 lib/alloc_tag.c                | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_tag.h
index 0de5fc180790..270f693b1822 100644
--- a/include/uapi/linux/alloc_tag.h
+++ b/include/uapi/linux/alloc_tag.h
@@ -31,6 +31,8 @@ struct allocinfo_tag {
 	char function[ALLOCINFO_STR_SIZE];
 	char filename[ALLOCINFO_STR_SIZE];
 	__u64 lineno;
+	/* filter criteria only; see allocinfo_counter.accurate for actual accuracy */
+	__u64 inaccurate;
 };
 
 /* The alignment ensures 32-bit compatible interfaces are not broken */
@@ -50,6 +52,7 @@ enum {
 	ALLOCINFO_FILTER_FUNCTION,
 	ALLOCINFO_FILTER_FILENAME,
 	ALLOCINFO_FILTER_LINENO,
+	ALLOCINFO_FILTER_INACCURATE,
 	ALLOCINFO_FILTER_MIN_SIZE,
 	ALLOCINFO_FILTER_MAX_SIZE,
 	__ALLOCINFO_FILTER_LAST = ALLOCINFO_FILTER_MAX_SIZE
@@ -59,6 +62,7 @@ enum {
 #define ALLOCINFO_FILTER_MASK_FUNCTION		(1 << ALLOCINFO_FILTER_FUNCTION)
 #define ALLOCINFO_FILTER_MASK_FILENAME		(1 << ALLOCINFO_FILTER_FILENAME)
 #define ALLOCINFO_FILTER_MASK_LINENO		(1 << ALLOCINFO_FILTER_LINENO)
+#define ALLOCINFO_FILTER_MASK_INACCURATE	(1 << ALLOCINFO_FILTER_INACCURATE)
 #define ALLOCINFO_FILTER_MASK_MIN_SIZE		(1 << ALLOCINFO_FILTER_MIN_SIZE)
 #define ALLOCINFO_FILTER_MASK_MAX_SIZE		(1 << ALLOCINFO_FILTER_MAX_SIZE)
 
diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
index ad33d63ef7b4..32ac0674d8bf 100644
--- a/lib/alloc_tag.c
+++ b/lib/alloc_tag.c
@@ -249,6 +249,8 @@ static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter,
 			   struct alloc_tag_counters *counters,
 			   bool *fetched_counters)
 {
+	bool inaccurate;
+
 	if (!filter || !filter->mask)
 		return true;
 
@@ -274,6 +276,12 @@ static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter,
 	    ct->lineno != filter->fields.lineno)
 		return false;
 
+	if (filter->mask & ALLOCINFO_FILTER_MASK_INACCURATE) {
+		inaccurate = !!(ct->flags & CODETAG_FLAG_INACCURATE);
+		if (inaccurate != !!(filter->fields.inaccurate))
+			return false;
+	}
+
 	if (filter->mask & (ALLOCINFO_FILTER_MASK_MIN_SIZE | ALLOCINFO_FILTER_MASK_MAX_SIZE)) {
 		if (!*fetched_counters) {
 			*counters = allocinfo_prefetch_counters(ct);
-- 
2.55.0.rc0.786.g65d90a0328-goog

