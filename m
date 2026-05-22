Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD2F356772
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 17:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779471952; cv=none; b=lNKgo61DUVMgtpP6xcRsou9KhhCjub6vUF/9WJfFp+ccHJgAGC7KRQjsTJBGURJCfrssE6K4n3lOLRnYGIKPInMbk4nwb0ovTSWgAMZXFTXm39WNfr821cIkzj2iXzBbTmjI2Ugl4131ALBbtah5r1UC4DpDV7bFcZUIKcIMLOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779471952; c=relaxed/simple;
	bh=qti+yLFgmQzV95XINCYKK/2p+6Pek0xhYmrbzM7Zicw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=beJiIWAfE+qlQD3ynB24DmEH5rln4mKrKsXA10EI+WC7WARb8q8vdtPmYiGn0Ja0if5H20t90xFv7zcn3IhENI4JfqKjhmmIss9FvVP643WwDXe3nQu6Gn3c4B9JuuY7ScbzScLGoeylpPUJspFjafCc+nWkE34n79uDYzOAy9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JMHtqxJ4; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JMHtqxJ4"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2fded513994so6381947eec.1
        for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 10:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779471949; x=1780076749; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=m+ziR3ir5mA6/jcqBzHRUrW8UazgUIvdAYJekJ5g/uA=;
        b=JMHtqxJ40WB7eDRcKJrkoYMb7/2+7cfTaB5vpHrBgNduMUeDdcGIbw4qfftB3vBrmj
         Ub9C1deYcFNqokn7myw5dAmWukqB4cRJCmo0jmAASRFZNLMxc3iCM9TwMDOi2K1Mbqjj
         cJhe39AIjNTne1Ey7RUarct4T+8COStuakLOcD7bsljfMpXt1G4amNZQ1Ib9gchXZdqR
         UvIuXLNdP4rxGU4GH/2yNVxAcLOjvWBsvjRM6tuGRvhrQtdXYdsIHjYn658HPD9TFDAR
         yuYANbb1NDTro1Hu2riDlvRVIGvgBATMEUYkbkSO61admxrJQMLywPqaciSmNKhsOwcq
         Su5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779471949; x=1780076749;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m+ziR3ir5mA6/jcqBzHRUrW8UazgUIvdAYJekJ5g/uA=;
        b=BlH+mRx+KPmR/gAHrH1dkZ2DSrql5akQAKbMO2sQJxxXps6kn8fqkYrEUi5AJMAAxj
         za959AZ21f4IaRQWBY76DNJJ1ZEuRj268o+ABhuu2KA8lPIahY1RXfsDNFfPW4O8a1g6
         ZnjWhBZuBzOOxbTb5n8rPFtX/wlQpdWd2oC3/kE2yGbIq+fgh0kzg7ja/BnILiiSm4SK
         sBw+85UXqQKU+bUwUMcIP0a7mtAKgc7IJW0K6lP+HT2GFgNJfQhkT+sAjfCazrVI1INS
         6Ym1+jmjGii8Oorzk0izFF/rxT/qJcypHXnaew6SI2ObKBLCH6NFIEZrNTq9P/dvoQ53
         o3Aw==
X-Forwarded-Encrypted: i=1; AFNElJ8r8hZ+ppWO1jirtJsCuMTgXgWzyq1aAbeYWbvj7ErQgTQkrGRISpfybMZ5quLkDzKPQz7ELrkiREc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtuWSMgMg/6IsE4G/wBU+KSlcZ9mT2VF54dWXxCB7F5Sy6WmSe
	1fzf/ZhdRy0tkTwTgSQqylbaj78DKfaQZLFnKAMq/UfyBl5+o9bb8r2fl6B/QUQzW1MdIHv6ALJ
	niENGGwnI4FQo3hu4INsWnUXD95rh/VRSWg==
X-Received: from dyox40.prod.google.com ([2002:a05:7300:7fa8:b0:303:9ed8:4d8a])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:6446:b0:2f2:8857:1804 with SMTP id 5a478bee46e88-3044905b3ecmr2504647eec.9.1779471949234;
 Fri, 22 May 2026 10:45:49 -0700 (PDT)
Date: Fri, 22 May 2026 17:45:35 +0000
In-Reply-To: <cover.1779471082.git.abhishekbapat@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1779471082.git.abhishekbapat@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <c4b425d1f9192caca3cad830f322aa048ed26d45.1779471082.git.abhishekbapat@google.com>
Subject: [PATCH v2 3/6] alloc_tag: add size-based filtering to ioctl
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
 lib/alloc_tag.c                | 72 ++++++++++++++++++++++++++++------
 2 files changed, 68 insertions(+), 12 deletions(-)

diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_tag.h
index 0cc9db5298c6..45f158bee0a6 100644
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
index 56c394ef721f..6c8743eead2d 100644
--- a/lib/alloc_tag.c
+++ b/lib/alloc_tag.c
@@ -173,11 +173,21 @@ static int allocinfo_cmp_str(const char *str, const char *template)
 	return strncmp(allocinfo_str(str), template, ALLOCINFO_STR_SIZE);
 }
 
+static inline struct alloc_tag_counters allocinfo_prefetch_counters(struct codetag *ct)
+{
+	return alloc_tag_read(ct_to_alloc_tag(ct));
+}
+
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
@@ -186,9 +196,9 @@ static void allocinfo_to_params(struct codetag *ct,
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
 
 static int allocinfo_ioctl_get_content_id(struct seq_file *m, void __user *arg)
@@ -204,7 +214,8 @@ static int allocinfo_ioctl_get_content_id(struct seq_file *m, void __user *arg)
 	return 0;
 }
 
-static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter)
+static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter,
+			   struct alloc_tag_counters *counters)
 {
 	if (!filter || !filter->mask)
 		return true;
@@ -228,6 +239,17 @@ static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter)
 	    ct->lineno != filter->fields.lineno)
 		return false;
 
+	if ((filter->mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) ||
+	    (filter->mask & ALLOCINFO_FILTER_MASK_MAX_SIZE)) {
+		/* We assume counters is not NULL here as per caller logic */
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
 
@@ -237,6 +259,9 @@ static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
 	struct codetag *ct;
 	struct allocinfo_get_at params = {0};
 	__u64 skip_count;
+	bool sizes_set;
+	struct alloc_tag_counters counters;
+	struct alloc_tag_counters *counters_ptr = NULL;
 
 	if (copy_from_user(&params, arg, sizeof(params)))
 		return -EFAULT;
@@ -244,9 +269,16 @@ static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
 	if (params.filter.mask & ~ALLOCINFO_FILTER_MASKS)
 		return -EINVAL;
 
+	if ((params.filter.mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) &&
+	    (params.filter.mask & ALLOCINFO_FILTER_MASK_MAX_SIZE) &&
+	    params.filter.min_size > params.filter.max_size)
+		return -EINVAL;
+
 	priv = (struct allocinfo_private *)m->private;
 
 	skip_count = params.pos;
+	sizes_set = (params.filter.mask &
+		     (ALLOCINFO_FILTER_MASK_MIN_SIZE | ALLOCINFO_FILTER_MASK_MAX_SIZE));
 
 	mutex_lock(&priv->ioctl_lock);
 	codetag_lock_module_list(alloc_tag_cttype, true);
@@ -261,7 +293,11 @@ static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
 	ct = codetag_next_ct(&priv->ioctl_iter);
 
 	while (ct) {
-		if (matches_filter(ct, &priv->filter)) {
+		if (sizes_set) {
+			counters = allocinfo_prefetch_counters(ct);
+			counters_ptr = &counters;
+		}
+		if (matches_filter(ct, &priv->filter, counters_ptr)) {
 			if (skip_count == 0)
 				break;
 			skip_count--;
@@ -270,7 +306,7 @@ static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
 	}
 
 	if (ct) {
-		allocinfo_to_params(ct, &params.data);
+		allocinfo_to_params(ct, &params.data, counters_ptr);
 		priv->positioned = true;
 	}
 
@@ -292,9 +328,15 @@ static int allocinfo_ioctl_get_next(struct seq_file *m, void __user *arg)
 	struct codetag *ct;
 	struct allocinfo_tag_data params = {0};
 	int ret = 0;
+	bool sizes_set;
+	struct alloc_tag_counters counters;
+	struct alloc_tag_counters *counters_ptr = NULL;
 
 	priv = (struct allocinfo_private *)m->private;
 
+	sizes_set = (priv->filter.mask &
+		     (ALLOCINFO_FILTER_MASK_MIN_SIZE | ALLOCINFO_FILTER_MASK_MAX_SIZE));
+
 	mutex_lock(&priv->ioctl_lock);
 	codetag_lock_module_list(alloc_tag_cttype, true);
 
@@ -304,10 +346,18 @@ static int allocinfo_ioctl_get_next(struct seq_file *m, void __user *arg)
 	}
 
 	ct = codetag_next_ct(&priv->ioctl_iter);
-	while (ct && !matches_filter(ct, &priv->filter))
+	while (ct) {
+		if (sizes_set) {
+			counters = allocinfo_prefetch_counters(ct);
+			counters_ptr = &counters;
+		}
+		if (matches_filter(ct, &priv->filter, counters_ptr))
+			break;
 		ct = codetag_next_ct(&priv->ioctl_iter);
+	}
+
 	if (ct)
-		allocinfo_to_params(ct, &params);
+		allocinfo_to_params(ct, &params, counters_ptr);
 
 	if (!ct) {
 		priv->positioned = false;
-- 
2.54.0.746.g67dd491aae-goog

