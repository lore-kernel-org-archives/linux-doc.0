Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9008B3BCD3A
	for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 23:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781564681; cv=none; b=lt8BCpeUk6u4E9svZ/xbu9VI7HR0/92CSUU7Rh8GUQ9+iTibBiBglGDMCNsvEcF8rKezuVE810jFFbSxuN/b1KkOcp4GA6wJkK+Dbe4tj6FSNGWMBIACYUj7N9Zg9LextMSXFeNKOlJ1trlcpev9I/bixnnqiHjeUhDrnziPpfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781564681; c=relaxed/simple;
	bh=PP7adVxpZ/bOHmFROLirUagDUCOEzA7/aSQtwrMdZBc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ihip9LumySezcXpIiybMt3HtScE29E48LcDsGeXWnA8FzC53ISa9SAn6Aha4MzZjUMQJY7S0btEQLkWGTAoZTmGMehkVOOdrbEgusFLrax0rWqGvUXkRmd5mQ/lIyJpqfVQN2AeeoNeCy7hsBPl9WGsuVdbglUuofaram1sAq28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RQngOxdU; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RQngOxdU"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-304d8613efbso4666047eec.1
        for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 16:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781564679; x=1782169479; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/TpFsIPJbCUj79TJpaXIfneCPfOgfU/vNVO+h9s06ks=;
        b=RQngOxdUx1F6au5qJ+aPzzeusZ08ZmBU3nL4M/HokgSELIM5Mb0nSaSyv5ssFu4HWO
         6AmPFgNi9IbMhNx0DQ3QiYnQnfdqh+ngJ2L1jQIHqG81zZVujVuvqKGw9/eL92+7Oxm7
         27iLf7m5z+1TqMWb0r00/ZXB72uOftqb2bUtF3Zw4wFPbnqllcaVRTCVIMl7grR5AaI8
         ouQbW0vTs+ep7EKRXzWrgvVPr7Z+eN1hZfyF2knHEJvf+Et1W6rlUafDW0bzrVrvORTW
         RQ8olrLK7tejTLUYwEDOKtctsPfFH+Pd0nOrlSa3DCIBYQUtbT4AGo8kMHJBfLXszNYs
         vbHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781564679; x=1782169479;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/TpFsIPJbCUj79TJpaXIfneCPfOgfU/vNVO+h9s06ks=;
        b=iGXwYWnFKCafa1ADspx0aKvL1wZGYhpU+nAGsdh/GgVdoRNCih00QZKsUcDGgHoeQo
         I/xS/s7m+sK7SBQb3TRUrDykMfBtq+cgMRtTdh4XdOJA/2lhda0eEpm2PXizZtg1WZr8
         L7GtvrVJK7fdptGqG5ThtWaH7e3oQQklAVZuDo8xwZOVgXQDOm5iP5Q3ChU0Ei2+A87Y
         cYG5yNzkC78yVwhuJ0bDJK3Tm3JMo1/hTCcHMMii0kSrjReiwp37g2D+nY8M0wZYkSLY
         Rv9NZK2K8Dqm90BgLaK1feU+/eO0Qb4vDTMHAOJj5E/+lw4fEA/2vlOzLELwGU68eh64
         MSLA==
X-Forwarded-Encrypted: i=1; AFNElJ9iIqYkvqWTDoYO/Oo4PNGkO9exJOj/Y2pTNK0bzp6PZ4d5rE1wTx4oXORIri9eMao61zTjVjZXEzg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/yE7CJNlFcZqC5V+tiUchTc+jSWFDgbPni6NXNQ3hVJvKKkKO
	xEKmuo+Dx9Vy6Un7/FQY2FL+Zsb1doCua5xRSMAE5eCoKdEHpQHCpdfs7wDZTBU9Am3fRi4HLFq
	G3HAfiNgbufXAIeu+zMdKqnb5xhEJoaWX5w==
X-Received: from dyev5.prod.google.com ([2002:a05:7300:4305:b0:2da:2af9:bfe2])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:7312:b0:303:f2dc:8ab4 with SMTP id 5a478bee46e88-30ba5b22866mr695366eec.2.1781564678200;
 Mon, 15 Jun 2026 16:04:38 -0700 (PDT)
Date: Mon, 15 Jun 2026 23:04:28 +0000
In-Reply-To: <cover.1781564384.git.abhishekbapat@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1781564384.git.abhishekbapat@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <7d98db60ab0fddab230b1a7a32140f3361ab42cf.1781564384.git.abhishekbapat@google.com>
Subject: [PATCH v5 3/6] alloc_tag: add size-based filtering to ioctl
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
---
 include/uapi/linux/alloc_tag.h |  8 ++++-
 lib/alloc_tag.c                | 63 ++++++++++++++++++++++++++++------
 2 files changed, 59 insertions(+), 12 deletions(-)

diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_tag.h
index 3b11877955b9..7f5acbb44c14 100644
--- a/include/uapi/linux/alloc_tag.h
+++ b/include/uapi/linux/alloc_tag.h
@@ -45,13 +45,17 @@ enum {
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
@@ -59,6 +63,8 @@ enum {
 struct allocinfo_filter {
 	__u64 mask; /* bitmask of the filter fields used */
 	struct allocinfo_tag fields;
+	__u64 min_size;
+	__u64 max_size;
 };
 
 struct allocinfo_get_at {
diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
index 5feb61d9fb92..b3d21834b61e 100644
--- a/lib/alloc_tag.c
+++ b/lib/alloc_tag.c
@@ -195,15 +195,26 @@ static int allocinfo_cmp_str(const char *str, const char *template)
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
@@ -212,9 +223,9 @@ static void allocinfo_to_params(struct codetag *ct,
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
@@ -238,7 +249,9 @@ static int allocinfo_ioctl_get_content_id(struct seq_file *m, void __user *arg)
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
@@ -265,6 +278,19 @@ static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter)
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
 
@@ -278,6 +304,8 @@ static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
 	struct codetag *ct;
 	struct allocinfo_get_at params = {0};
 	__u64 skip_count;
+	struct alloc_tag_counters counters;
+	bool fetched_counters;
 
 	if (copy_from_user(&params, arg, sizeof(params)))
 		return -EFAULT;
@@ -285,6 +313,11 @@ static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
 	if (params.filter.mask & ~ALLOCINFO_FILTER_MASKS)
 		return -EINVAL;
 
+	if ((params.filter.mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) &&
+	    (params.filter.mask & ALLOCINFO_FILTER_MASK_MAX_SIZE) &&
+	    params.filter.min_size > params.filter.max_size)
+		return -EINVAL;
+
 	priv = m->private;
 
 	mutex_lock(&priv->ioctl_lock);
@@ -308,7 +341,8 @@ static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
 	ct = codetag_next_ct(&priv->ioctl_iter);
 
 	while (ct) {
-		if (matches_filter(ct, &priv->filter)) {
+		fetched_counters = false;
+		if (matches_filter(ct, &priv->filter, &counters, &fetched_counters)) {
 			if (skip_count == 0)
 				break;
 			skip_count--;
@@ -317,7 +351,7 @@ static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
 	}
 
 	if (ct) {
-		allocinfo_to_params(ct, &params.data);
+		allocinfo_to_params(ct, &params.data, fetched_counters ? &counters : NULL);
 		priv->positioned = true;
 	}
 
@@ -343,6 +377,8 @@ static int allocinfo_ioctl_get_next(struct seq_file *m, void __user *arg)
 	struct codetag *ct;
 	struct allocinfo_tag_data params;
 	int ret = 0;
+	struct alloc_tag_counters counters;
+	bool fetched_counters;
 
 	memset(&params, 0, sizeof(params));
 	priv = m->private;
@@ -356,10 +392,15 @@ static int allocinfo_ioctl_get_next(struct seq_file *m, void __user *arg)
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
2.54.0.1136.gdb2ca164c4-goog

