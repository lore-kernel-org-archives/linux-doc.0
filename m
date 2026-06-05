Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFCB3F7AB8
	for <linux-doc@vger.kernel.org>; Fri,  5 Jun 2026 23:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780702620; cv=none; b=rhppUR9pdLO49WKR8jcE5HTLczJQNZeS6etBuGpY8EY0H6uoaPnj58Nq7Kh8efUVpYTBN0j1lL4iHzgdodcJc5H1+wNKld4yJulRN19dPPSr8iKas37WDvQpd+uUMTLbMo2fV/rAahYH0uw2St7ccNZfhmhoNcNhjHHk3c5OhBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780702620; c=relaxed/simple;
	bh=SoEAP8EZFSElkjNp12+P+W8eAzWWZNKyZe7QThIlPJs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=D+q5AL5mMcG13HGDhuYqoeuapcD1+E/1stOR5O2h0ArMtTdQFYBsN91GrzOi3sbSrOyOKWKp8zEBQ5v2EIWFdu2ppLvUQFQtL/OtqUa5jJSBvQZlIsxiDky/hBHl+orqV+VP4I1XW1E6K7/SluJCkM0dTRSBfumagLsCX1BGA8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GoFqafWV; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GoFqafWV"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-304f23c55b2so2401951eec.0
        for <linux-doc@vger.kernel.org>; Fri, 05 Jun 2026 16:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780702618; x=1781307418; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JoFYWRQDoOC6tOfcHj/jj7qJpnwdSFC+5s/raUx2KnQ=;
        b=GoFqafWVsfzzqS34SFL9mRLxJXLff7KPDuR/LbttOK/JA2sytjmxCd9q6MLHlXaFR1
         EE3/9ghm1MvXMvT5CmyFH0vfry3qlxkzoX3bHxqgmSP3fmMgo849VLoDdNkldE7bzK/N
         cgXLRCAuckoWqx2kee5Nlka8anU6YVBy5qru7nsfkwjppIg4hWam+6Git2P59SvdfsvS
         hCpwazi+fcDBfIYSt7soP2sS82sJ+RkOZ73voGI4y7M1XhGeXsryWD6mTDb11MZHC+YN
         HqIwODrOhZW/IV6z4RxQVuAhoO1T+JbIyAR5lAJbplJEPyDWqnqqb7H1dg7Q8Vezw3Md
         ReGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780702618; x=1781307418;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JoFYWRQDoOC6tOfcHj/jj7qJpnwdSFC+5s/raUx2KnQ=;
        b=HlmjLdjYTSueSRUQ2HcsFeDKYXXcUNQWQwNuJua3fhPtQxaj0jIX/fNjUvd5wzRPLu
         IjYdEivnOqW9V5LZGh1MV0sumqDlNebrZABrF44ewIwpT4WPDuhKgt+xdlFlOKJCwOiC
         DbOlYvkQJutjIXA5fNSk32kYyWtfAAhI2XgcOWZoVZHAgX9tg6pW6kKExaV0ZIAJLk9H
         1rjB1Ed4I4ErTo8O5+oeWRYQftd89kYHE4AdX1cWvX/tbmDDoEJmDjSDcIHBaPCfupFn
         Q3H4eEw9N8BOhQzUGKs8StD46loOBeSrkRmVSvRG6KWHjn6jq16ppw5DX0uwthOz3Euw
         tNvQ==
X-Forwarded-Encrypted: i=1; AFNElJ+h6tV75G+1QfqiwoVKPjG7eYzO5Cc6Tcy0mfrxHHNooxZAoJuund9vB4NOvj3pqkJ9iQ4FWzTEe40=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVmgJI+bKPLq+aeO+WmfbtjpxTWylTPYf4POFToeDFDPZK9fgH
	EttwalzNn/OnvcUvJOnnOIW7J9RO4SWfAlt2p2yYE4PNx4hOdr0vkiDiJWKqRjgfuKMaWwxcEie
	Le3zPJbhYpf9iyMw2Tb9Rmx6+oTUqX3ZgGg==
X-Received: from dyek9.prod.google.com ([2002:a05:7300:6409:b0:2f9:af7:5039])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:d517:b0:304:de94:1c2c with SMTP id 5a478bee46e88-3077b866467mr3627728eec.34.1780702618006;
 Fri, 05 Jun 2026 16:36:58 -0700 (PDT)
Date: Fri,  5 Jun 2026 23:36:48 +0000
In-Reply-To: <cover.1780701922.git.abhishekbapat@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1780701922.git.abhishekbapat@google.com>
X-Mailer: git-send-email 2.54.0.1032.g2f8565e1d1-goog
Message-ID: <ef88e52368463e312086a966f10287a29d0edeca.1780701922.git.abhishekbapat@google.com>
Subject: [PATCH v3 3/6] alloc_tag: add size-based filtering to ioctl
From: Abhishek Bapat <abhishekbapat@google.com>
To: Suren Baghdasaryan <surenb@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Hao Ge <hao.ge@linux.dev>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Sourav Panda <souravpanda@google.com>, Abhishek Bapat <abhishekbapat@google.com>
Content-Type: text/plain; charset="UTF-8"

Extend the allocinfo filtering mechanism to allow users to filter tags
based on the total number of bytes allocated [min_size, max_size]. The
size range is inclusive.

Filtering by size involves retrieving allocinfo per-CPU counters, which
is an expensive operation. Hence, the performance of size-based
filtering will be worse than other filters.

Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
---
 include/uapi/linux/alloc_tag.h |  8 +++-
 lib/alloc_tag.c                | 68 +++++++++++++++++++++++++++-------
 2 files changed, 62 insertions(+), 14 deletions(-)

diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_tag.h
index cffb0c46e0b1..0e648192df4d 100644
--- a/include/uapi/linux/alloc_tag.h
+++ b/include/uapi/linux/alloc_tag.h
@@ -39,13 +39,17 @@ enum {
 	ALLOCINFO_FILTER_FUNCTION,
 	ALLOCINFO_FILTER_FILENAME,
 	ALLOCINFO_FILTER_LINENO,
-	__ALLOCINFO_FILTER_LAST = ALLOCINFO_FILTER_LINENO
+	ALLOCINFO_FILTER_MIN_SIZE,
+	ALLOCINFO_FILTER_MAX_SIZE,
+	__ALLOCINFO_FILTER_LAST = ALLOCINFO_FILTER_MAX_SIZE
 };
 
 #define ALLOCINFO_FILTER_MASK_MODNAME		(1 << ALLOCINFO_FILTER_MODNAME)
 #define ALLOCINFO_FILTER_MASK_FUNCTION		(1 << ALLOCINFO_FILTER_FUNCTION)
 #define ALLOCINFO_FILTER_MASK_FILENAME		(1 << ALLOCINFO_FILTER_FILENAME)
 #define ALLOCINFO_FILTER_MASK_LINENO		(1 << ALLOCINFO_FILTER_LINENO)
+#define ALLOCINFO_FILTER_MASK_MIN_SIZE		(1 << ALLOCINFO_FILTER_MIN_SIZE)
+#define ALLOCINFO_FILTER_MASK_MAX_SIZE		(1 << ALLOCINFO_FILTER_MAX_SIZE)
 
 #define ALLOCINFO_FILTER_MASKS \
 	((1 << (__ALLOCINFO_FILTER_LAST + 1)) - 1)
@@ -53,6 +57,8 @@ enum {
 struct allocinfo_filter {
 	__u64 mask; /* bitmask of the filter fields used */
 	struct allocinfo_tag fields;
+	__u64 min_size;
+	__u64 max_size;
 };
 
 struct allocinfo_get_at {
diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
index 93bc976ac505..ddc6946f56ab 100644
--- a/lib/alloc_tag.c
+++ b/lib/alloc_tag.c
@@ -191,15 +191,26 @@ static int allocinfo_cmp_str(const char *str, const char *template)
 	return strncmp(allocinfo_str(str), template, ALLOCINFO_STR_SIZE);
 }
 
+/* Fetch the per-CPU counters */
+static inline struct alloc_tag_counters allocinfo_prefetch_counters(struct codetag *ct)
+{
+	return alloc_tag_read(ct_to_alloc_tag(ct));
+}
+
 /*
  * Populates the UAPI allocinfo_tag_data structure with active runtime
  * profiling counters extracted from the given kernel codetag.
  */
 static void allocinfo_to_params(struct codetag *ct,
-				struct allocinfo_tag_data *data)
+				struct allocinfo_tag_data *data,
+				struct alloc_tag_counters *counters)
 {
-	struct alloc_tag *tag = ct_to_alloc_tag(ct);
-	struct alloc_tag_counters counter = alloc_tag_read(tag);
+	struct alloc_tag_counters local_counters;
+
+	if (!counters) {
+		local_counters = allocinfo_prefetch_counters(ct);
+		counters = &local_counters;
+	}
 
 	if (ct->modname)
 		allocinfo_copy_str(data->tag.modname, ct->modname);
@@ -208,9 +219,9 @@ static void allocinfo_to_params(struct codetag *ct,
 	allocinfo_copy_str(data->tag.function, ct->function);
 	allocinfo_copy_str(data->tag.filename, ct->filename);
 	data->tag.lineno = ct->lineno;
-	data->counter.bytes = counter.bytes;
-	data->counter.calls = counter.calls;
-	data->counter.accurate = !alloc_tag_is_inaccurate(tag);
+	data->counter.bytes = counters->bytes;
+	data->counter.calls = counters->calls;
+	data->counter.accurate = !alloc_tag_is_inaccurate(ct_to_alloc_tag(ct));
 }
 
 /*
@@ -234,7 +245,9 @@ static int allocinfo_ioctl_get_content_id(struct seq_file *m, void __user *arg)
  * Verifies whether a given codetag satisfies the active filtering criteria by
  * matching it's characteristics against the specified filter.
  */
-static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter)
+static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter,
+			   struct alloc_tag_counters *counters,
+			   bool *fetched_counters)
 {
 	if (!filter || !filter->mask)
 		return true;
@@ -247,20 +260,34 @@ static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter)
 				return false;
 		} else if (allocinfo_cmp_str(ct->modname, filter->fields.modname))
 			return false;
+		}
 	}
 
 	if ((filter->mask & ALLOCINFO_FILTER_MASK_FUNCTION) &&
-	    ct->function && (allocinfo_cmp_str(ct->function, filter->fields.function)))
+	    ct->function && allocinfo_cmp_str(ct->function, filter->fields.function))
 		return false;
 
 	if ((filter->mask & ALLOCINFO_FILTER_MASK_FILENAME) &&
-	    ct->filename && (allocinfo_cmp_str(ct->filename, filter->fields.filename)))
+	    ct->filename && allocinfo_cmp_str(ct->filename, filter->fields.filename))
 		return false;
 
 	if ((filter->mask & ALLOCINFO_FILTER_MASK_LINENO) &&
 	    ct->lineno != filter->fields.lineno)
 		return false;
 
+	if (filter->mask & (ALLOCINFO_FILTER_MASK_MIN_SIZE | ALLOCINFO_FILTER_MASK_MAX_SIZE)) {
+		if (!*fetched_counters) {
+			*counters = allocinfo_prefetch_counters(ct);
+			*fetched_counters = true;
+		}
+		if ((filter->mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) &&
+		    counters->bytes < filter->min_size)
+			return false;
+		if ((filter->mask & ALLOCINFO_FILTER_MASK_MAX_SIZE) &&
+		    counters->bytes > filter->max_size)
+			return false;
+	}
+
 	return true;
 }
 
@@ -274,6 +301,8 @@ static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
 	struct codetag *ct;
 	struct allocinfo_get_at params = {0};
 	__u64 skip_count;
+	struct alloc_tag_counters counters;
+	bool fetched_counters;
 
 	if (copy_from_user(&params, arg, sizeof(params)))
 		return -EFAULT;
@@ -281,6 +310,11 @@ static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
 	if (params.filter.mask & ~ALLOCINFO_FILTER_MASKS)
 		return -EINVAL;
 
+	if ((params.filter.mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) &&
+	    (params.filter.mask & ALLOCINFO_FILTER_MASK_MAX_SIZE) &&
+	    params.filter.min_size > params.filter.max_size)
+		return -EINVAL;
+
 	priv = m->private;
 
 	mutex_lock(&priv->ioctl_lock);
@@ -304,7 +338,8 @@ static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
 	ct = codetag_next_ct(&priv->ioctl_iter);
 
 	while (ct) {
-		if (matches_filter(ct, &priv->filter)) {
+		fetched_counters = false;
+		if (matches_filter(ct, &priv->filter, &counters, &fetched_counters)) {
 			if (skip_count == 0)
 				break;
 			skip_count--;
@@ -313,7 +348,7 @@ static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
 	}
 
 	if (ct) {
-		allocinfo_to_params(ct, &params.data);
+		allocinfo_to_params(ct, &params.data, fetched_counters ? &counters : NULL);
 		priv->positioned = true;
 	}
 
@@ -339,6 +374,8 @@ static int allocinfo_ioctl_get_next(struct seq_file *m, void __user *arg)
 	struct codetag *ct;
 	struct allocinfo_tag_data params;
 	int ret = 0;
+	struct alloc_tag_counters counters;
+	bool fetched_counters;
 
 	memset(&params, 0, sizeof(params));
 	priv = m->private;
@@ -352,10 +389,15 @@ static int allocinfo_ioctl_get_next(struct seq_file *m, void __user *arg)
 	}
 
 	ct = codetag_next_ct(&priv->ioctl_iter);
-	while (ct && !matches_filter(ct, &priv->filter))
+	while (ct) {
+		fetched_counters = false;
+		if (matches_filter(ct, &priv->filter, &counters, &fetched_counters))
+			break;
 		ct = codetag_next_ct(&priv->ioctl_iter);
+	}
+
 	if (ct)
-		allocinfo_to_params(ct, &params);
+		allocinfo_to_params(ct, &params, fetched_counters ? &counters : NULL);
 
 	if (!ct) {
 		priv->positioned = false;
-- 
2.54.0.1032.g2f8565e1d1-goog

