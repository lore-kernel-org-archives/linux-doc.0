Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C171134E745
	for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 17:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781804204; cv=none; b=JTuWwjoDgR1qIuSxX12bmO9nuKC0rSfePhTWl0pv2qEHoNAzTUNML0+ZmhiGtlwHUdiP2rkHolQHX3ybPLf2uA9nR8sX5zVfus/WFCjCbQiqKZ73On15kOFb9OcNB5/YXLKsgB5WPq9acFWX2nwXS0ZYm9UEhIwb2qdFD0AP4UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781804204; c=relaxed/simple;
	bh=/65iuVbWXZWJNbI/HcTYI7feMzMolTXI82K/xqiPh6k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FOv/dGZqIyV2pHTyC+PhBdGODrrWcFjl7tXsfH6LDUtB9BhRXFAzRt6C0k4Y+EyWsQ4YSvHED4gmB7L90QsSW4nXKHr/YUKqNQvoqrr9PY3sU+cLrO8LXSRE3KuDHsNR+XiIDANtJpofUV3Pv3izOIo8JSD+FUwwPKlOzkKLICs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wXXsDxgM; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wXXsDxgM"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-30762d67a64so1700431eec.0
        for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 10:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781804202; x=1782409002; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kcggm+vLyoh+gfR/AuH54hFzP3M8T4keypwurXRVhSU=;
        b=wXXsDxgMrX81D/J0PnjxHBXgDBdpOUVAV17VpIUoOU3PbRrvDqEo/J473s1EMFm7hm
         96vvIbS/vD2zqiIQB9MqXJ2QxC8eFDrSeIsUKTwIkXNXZb8qc0re0iATFKR1et1426c/
         vBzjTNhQf9wV7G23V1hyvswUYGZlkdwRvTyIT2q3OP479TtiLmcw+BgAhG/eCDTiPKjm
         v3kgKx2YynJQsOl/WhDxLHvccl0r9a49YTr2CalR4nhi/OXnfAn5h029aEY75S4JmgS7
         +MMkdel2CDw6JYh5k7cvO+it7PBARD7OAXTivgfPzTIDeM5dNF7oY+hS7ijZJAdL9svr
         ir3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781804202; x=1782409002;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kcggm+vLyoh+gfR/AuH54hFzP3M8T4keypwurXRVhSU=;
        b=i6SLhDEVp9fj4g4QxXUAVStJRrk/1vkldDSbfHMrJmp1EZPrW7j42oAHL/YaQbmuM5
         nDHObHzhOysThcb4vlLlwMtbLHEciHtTShhoui8po5+EqckYE/fctoCIBlNKasp77uVj
         zwYb+oQc9s5WFj92+BtcOsBu/ltlnzWoPqmdcmOrdgGsZsLKhzl3cpB+NHJtTt245M7s
         Dj6aHIeadItbSc7Ozu3onir0/P4+v8nKo1YTufaUTx4oGgUK+gimTd5LhIeDn5a4qycP
         VII9NjmtsHFOPDWf2Zshi/BFynW/TH1H7sN+AwxOAFGPz2eDXeVdjjElNxD/kOsoRa7W
         d3PA==
X-Forwarded-Encrypted: i=1; AFNElJ/gFf2kkoqNQyqyynnIGE2W3mrbLLl/4JgMjsW8O11kttvyOKuoRBBmSCqUxg1EIUr/WtbB/GFfCLw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzquucw2MlSh4kz0+yYKkBo9cjDhVKrUI74ptiqfXFvG7H4s+/
	+aUvE8DAIcLPe2IcD/TCNdlgqKJFoxb2ARS+oNaX1upgvbbMYShR4bnaakgtZt6+nvQYaVcVPxH
	DJPbf7VbxZuVl0UKunqAjion8CqKHA2C95w==
X-Received: from dydn14.prod.google.com ([2002:a05:7300:730e:b0:2f9:af7:5041])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:4306:b0:30b:f6cd:fdca with SMTP id 5a478bee46e88-30c06e0c62bmr222134eec.17.1781804201397;
 Thu, 18 Jun 2026 10:36:41 -0700 (PDT)
Date: Thu, 18 Jun 2026 17:36:32 +0000
In-Reply-To: <cover.1781803482.git.abhishekbapat@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1781803482.git.abhishekbapat@google.com>
X-Mailer: git-send-email 2.55.0.rc0.786.g65d90a0328-goog
Message-ID: <6944ab65167d8884ce0d856184730d06ead68cb5.1781803482.git.abhishekbapat@google.com>
Subject: [PATCH v6 3/6] alloc_tag: add size-based filtering to ioctl
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
 lib/alloc_tag.c                | 64 +++++++++++++++++++++++++++-------
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
diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
index f00d731b81cf..ad33d63ef7b4 100644
--- a/lib/alloc_tag.c
+++ b/lib/alloc_tag.c
@@ -198,16 +198,20 @@ static int allocinfo_cmp_str(const char *str, const char *template)
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
@@ -215,9 +219,9 @@ static void allocinfo_to_params(struct codetag *ct,
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
@@ -241,7 +245,9 @@ static int allocinfo_ioctl_get_content_id(struct seq_file *m, void __user *arg)
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
@@ -268,6 +274,19 @@ static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter)
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
 
@@ -281,6 +300,8 @@ static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
 	struct codetag *ct;
 	struct allocinfo_get_at params = {0};
 	__u64 skip_count;
+	struct alloc_tag_counters counters;
+	bool fetched_counters;
 
 	if (copy_from_user(&params, arg, sizeof(params)))
 		return -EFAULT;
@@ -288,6 +309,11 @@ static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
 	if (params.filter.mask & ~ALLOCINFO_FILTER_MASKS)
 		return -EINVAL;
 
+	if ((params.filter.mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) &&
+	    (params.filter.mask & ALLOCINFO_FILTER_MASK_MAX_SIZE) &&
+	    params.filter.min_size > params.filter.max_size)
+		return -EINVAL;
+
 	priv = m->private;
 
 	mutex_lock(&priv->ioctl_lock);
@@ -311,7 +337,8 @@ static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
 	ct = codetag_next_ct(&priv->ioctl_iter);
 
 	while (ct) {
-		if (matches_filter(ct, &priv->filter)) {
+		fetched_counters = false;
+		if (matches_filter(ct, &priv->filter, &counters, &fetched_counters)) {
 			if (skip_count == 0)
 				break;
 			skip_count--;
@@ -320,7 +347,9 @@ static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
 	}
 
 	if (ct) {
-		allocinfo_to_params(ct, &params.data);
+		if (!fetched_counters)
+			counters = allocinfo_prefetch_counters(ct);
+		allocinfo_to_params(ct, &params.data, &counters);
 		priv->positioned = true;
 	}
 
@@ -346,6 +375,8 @@ static int allocinfo_ioctl_get_next(struct seq_file *m, void __user *arg)
 	struct codetag *ct;
 	struct allocinfo_tag_data params;
 	int ret = 0;
+	struct alloc_tag_counters counters;
+	bool fetched_counters;
 
 	memset(&params, 0, sizeof(params));
 	priv = m->private;
@@ -359,11 +390,18 @@ static int allocinfo_ioctl_get_next(struct seq_file *m, void __user *arg)
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
2.55.0.rc0.786.g65d90a0328-goog

