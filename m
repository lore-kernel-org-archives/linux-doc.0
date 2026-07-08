Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937D32DB794
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 18:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783533695; cv=none; b=n4jqikz0IrdB5zoi7p3AD0IA4MupojWiqVAVj+QzJspLQzotqub6/bubTEYb5c2/5CBL/U6H2HUOJ0psrOjkgHiq/zmqWeOMXUd1z+TdqVeQNBqSliJFS1NU3WdcBYe7AFVUZUiCbHcIymHjA/wsGaJ0Z3loPBYTlP/A0Z2odu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783533695; c=relaxed/simple;
	bh=p8cdQjfzz7EKiQm/Mwy5BFQoVqmgRbKRVRMY7jCIsqY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EDe8KjamL5t+sijuUkl5o7qgDPKbkOaZE4rpoLR5lMJ7gHjRj813chTDNEGM9lqok5pM6IxZFZ/z+AZqM2Giu2ktIsigLPv0HxQnM55Cwu+sWoEBX3KxdA4/lNcVrkDM/xrZXEwlPgtNAc/DZllsHRgrSiJoTYNSmZejQwgqBuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BgnvQlqI; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BgnvQlqI"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c889d1eebafso2019056a12.0
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 11:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783533693; x=1784138493; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o22pL91tE+P4D0VLdFqeuEkk7oFP7QFbC5BsbPhxntE=;
        b=BgnvQlqIDpybuYVx8Q4vTZKenBR1fmScvnJMMaiVIl0A7OuBcTw4UdZWutNlk3esjU
         oTv1Za5D5SLgRcnHbv3rCrY+nDmweMfuC75nMp65xPH98fxZUjYE5U6wd11DUQ+NSpqc
         gG3cif+tqmZaAa9di4SQkPAW57x99M1B7xk7Evf8yrbS3SpIHR4s4OOOk4CKhdKkMcNx
         DLIeYOZas+JYBVs3hi4R7b0ZM5/FLtZPtcS39tflDDBlWcRPQjQQ0qzXvzMDB3pi7OL5
         gSEzOwDdzXH/0k5HJkysDtx1Y+L8QI9k5htE5NlLCqnOugfvn8N6P9lBmV9sI7vfIt39
         nJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783533693; x=1784138493;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o22pL91tE+P4D0VLdFqeuEkk7oFP7QFbC5BsbPhxntE=;
        b=b8MGHDPim84X29w0x8zYgtKslv/hoURahLd+1zUrGTcn3U8me1gsRka81D3v+7wiit
         S9Pjz8Wepjwkgnkgx7/nHWza7he7HWpneXYnW0WHCcvMz93INaVRIeVwXCE7NSo7iCPP
         h/thjYheX+zd+VGoj+9YK8ETQ4d4MmQGJxQVddjO854fWYjY5L7O4X/c/wDm82VFrMGY
         mvsJgDtYkT4gGWYGXutBGGTPQBJPeIuftzoSnZI1nLvbwvb4/1zmhXgfLfDazYTLjftJ
         nprqfMyozHEl+2SWk3z6bxUKCeaw05Nmf9OOGOyUq4LPBu8EwIh2j4OQa0QKIItv0T09
         MP+Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro2kBWO1/ia4zVPQKo6R2XLZa7OoEo8aAv2b5nBTIi1yc2vsxwajN0/YXa9As8mfPlQ3igeAeQQpcc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMLuax7MnXbaM6mGFKFZCwuDTM5D1FQ4vSwgJcG5xQqP9Jk0v1
	6RHd9nQK3+vENY7s2++wGbEsFuQ0mfElgBzUz2o3gm439ReahKkG8olMbYvfc53QdVQasGOMQZJ
	MoDtmM6IRQ7xoaRp9VF6TRPBGPIhavADqQQ==
X-Received: from dlbcj33.prod.google.com ([2002:a05:7022:69a1:b0:139:d9c7:3cf4])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:c5a7:b0:3bf:6363:11ec with SMTP id adf61e73a8af0-3c0bd06fe47mr3841527637.34.1783533692710;
 Wed, 08 Jul 2026 11:01:32 -0700 (PDT)
Date: Wed,  8 Jul 2026 18:01:25 +0000
In-Reply-To: <cover.1783532853.git.abhishekbapat@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1783532853.git.abhishekbapat@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <0a7653b70ae0d64e967fbea0e933bc35f8ac656e.1783532853.git.abhishekbapat@google.com>
Subject: [PATCH v8 3/6] alloc_tag: add size-based filtering to ioctl
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
Acked-by: Hao Ge <hao.ge@linux.dev>
Acked-by: Suren Baghdasaryan <surenb@google.com>
---
 include/uapi/linux/alloc_tag.h |  8 ++++-
 mm/alloc_tag.c                 | 64 +++++++++++++++++++++++++++-------
 2 files changed, 58 insertions(+), 14 deletions(-)

diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_tag.h
index 13e9b5916bf5..0de5fc180790 100644
--- a/include/uapi/linux/alloc_tag.h
+++ b/include/uapi/linux/alloc_tag.h
@@ -50,13 +50,17 @@ enum {
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
@@ -64,6 +68,8 @@ enum {
 struct allocinfo_filter {
 	__u64 mask; /* bitmask of the filter fields used */
 	struct allocinfo_tag fields;
+	__u64 min_size;
+	__u64 max_size;
 };
 
 struct allocinfo_get_at {
diff --git a/mm/alloc_tag.c b/mm/alloc_tag.c
index aa67c156bc4f..27aa47c4c1cc 100644
--- a/mm/alloc_tag.c
+++ b/mm/alloc_tag.c
@@ -201,16 +201,20 @@ static int allocinfo_cmp_str(const char *str, const char *template)
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
-
 	if (ct->modname)
 		allocinfo_copy_str(data->tag.modname, ct->modname);
 	else
@@ -218,9 +222,9 @@ static void allocinfo_to_params(struct codetag *ct,
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
@@ -244,7 +248,9 @@ static int allocinfo_ioctl_get_content_id(struct seq_file *m, void __user *arg)
  * Verifies whether a given codetag satisfies the active filtering criteria by
  * matching its characteristics against the specified filter.
  */
-static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter)
+static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter,
+			   struct alloc_tag_counters *counters,
+			   bool *fetched_counters)
 {
 	if (!filter || !filter->mask)
 		return true;
@@ -271,6 +277,19 @@ static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter)
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
 
@@ -284,6 +303,8 @@ static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
 	struct codetag *ct;
 	struct allocinfo_get_at params = {0};
 	__u64 skip_count;
+	struct alloc_tag_counters counters;
+	bool fetched_counters;
 
 	if (copy_from_user(&params, arg, sizeof(params)))
 		return -EFAULT;
@@ -291,6 +312,11 @@ static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
 	if (params.filter.mask & ~ALLOCINFO_FILTER_MASKS)
 		return -EINVAL;
 
+	if ((params.filter.mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) &&
+	    (params.filter.mask & ALLOCINFO_FILTER_MASK_MAX_SIZE) &&
+	    params.filter.min_size > params.filter.max_size)
+		return -EINVAL;
+
 	priv = m->private;
 
 	mutex_lock(&priv->ioctl_lock);
@@ -314,7 +340,8 @@ static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
 	ct = codetag_next_ct(&priv->ioctl_iter);
 
 	while (ct) {
-		if (matches_filter(ct, &priv->filter)) {
+		fetched_counters = false;
+		if (matches_filter(ct, &priv->filter, &counters, &fetched_counters)) {
 			if (skip_count == 0)
 				break;
 			skip_count--;
@@ -323,7 +350,9 @@ static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
 	}
 
 	if (ct) {
-		allocinfo_to_params(ct, &params.data);
+		if (!fetched_counters)
+			counters = allocinfo_prefetch_counters(ct);
+		allocinfo_to_params(ct, &params.data, &counters);
 		priv->positioned = true;
 	}
 
@@ -349,6 +378,8 @@ static int allocinfo_ioctl_get_next(struct seq_file *m, void __user *arg)
 	struct codetag *ct;
 	struct allocinfo_tag_data params;
 	int ret = 0;
+	struct alloc_tag_counters counters;
+	bool fetched_counters;
 
 	memset(&params, 0, sizeof(params));
 	priv = m->private;
@@ -362,11 +393,18 @@ static int allocinfo_ioctl_get_next(struct seq_file *m, void __user *arg)
 	}
 
 	ct = codetag_next_ct(&priv->ioctl_iter);
-	while (ct && !matches_filter(ct, &priv->filter))
+	while (ct) {
+		fetched_counters = false;
+		if (matches_filter(ct, &priv->filter, &counters, &fetched_counters))
+			break;
 		ct = codetag_next_ct(&priv->ioctl_iter);
-	if (ct)
-		allocinfo_to_params(ct, &params);
+	}
 
+	if (ct) {
+		if (!fetched_counters)
+			counters = allocinfo_prefetch_counters(ct);
+		allocinfo_to_params(ct, &params, &counters);
+	}
 	if (!ct) {
 		priv->positioned = false;
 		ret = -ENOENT;
-- 
2.55.0.795.g602f6c329a-goog

