Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB66A349CCC
	for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 17:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781804204; cv=none; b=fQpAc65ZfGnYQBEVlCkYbkKwcg67KKxPHa+55VRFVs75gAWwtY5RH4gF2pXkGr/uzLO7irxnj2OkXV0PdWxkKop0hxBsA+tWEptEJETgD1pfXyQ4oRMi/Cz0Z1fzkEKM4qNSA1oky64FBWKTXCkvE9siUkPOVF5dL4Lu3kIoIsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781804204; c=relaxed/simple;
	bh=cUjQS07B251HxhgYe8x119C3DSLaApPbrYj/OT5KTQQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BY9JeCwLIldiJXTPlrNYAnarKANSe7s222w1Z7a5SLKb8Jq4zbfiG3yhV02Yv407pqWmJd/6FogErMinskuZmH/i+e67RIZJvh54mpAMuKTkJnT3FHqYHr2zpIXPzD/FP/6MBvY+Dv64/aNB+pWngUrN2hOGQjB9dWh1TgEGct0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HLrcDk2/; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HLrcDk2/"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-30c03c1dda3so1080029eec.1
        for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 10:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781804201; x=1782409001; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DrCKQmndYCTLKZMT11TnLt2FQ5FzBuck7HJJlx0dbhM=;
        b=HLrcDk2/7V2AZv1OI6i4MpnzCtfs97JP1VVv0G8JRUm2l8XVdDKiCFsQNvgMuhaKKV
         7BElrjnCcn82tbDN3PP1KFERuiVx/M5EkXZqF9bcLACgNJhY39ieZ/1tAM/+sOu1V+lT
         P0P2viMBrdkw4NZ/+qYGJF4hXuBtSlHHmfXVdV+0GqK7aUMqbU2R91ItF7M0+EMq5nKp
         hNwfKIVXUML+BmxnMYY4MZfxGf94m2YiJTKSbHXjeyM7vyKvadbewTyxoAkpD1e9/zZs
         Ch7q50J27eykQYUpKpcqjbi1W52CGu5HzOBFNW3YeEkulRUcOVggHX6OppQ+klKRqSMX
         avvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781804201; x=1782409001;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DrCKQmndYCTLKZMT11TnLt2FQ5FzBuck7HJJlx0dbhM=;
        b=p7jpypRig3NCLkx4/tZU2qjlbMbq2z9WaW17HXRhrUCDQ6DARX6KUTQNzoJ/xAX50e
         ATtu9IXMneCmkPdlRzaSIAb8YYTtVMAO7cqR5Cbu2bL4AKpkrzVJAzYpJSTbP/ECwAtt
         f1rUyv0K826D6vFSL34sK/1bHvubNv3oJzU0nRHkcYAyn5DvzSbicI+7cVW8QpvUzuCc
         bWig0sIIctFJWZNBbpOMLj5ylLKl08oM2PifeOA9aktqCX9+z3SXAaWvbzrbXs42JKTS
         nGO3crGhAEVs92ECuzcpmek7svwHANmdBKthASsQPiqFoXuFCm0cgg9En3fPDNtZ0CMQ
         Dztg==
X-Forwarded-Encrypted: i=1; AFNElJ/w4isuJ/fFPQnMxQavGrq3KonFKYXBpvhPljMtUZg8yCKryxCUarmJcRRjhr/qMumeWqJWNcp3LXI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfNy4ZLU1NCIn9WFYMXSohFUwY0ISGv1oMd9JKgBqb48jzcgt5
	7pIvtW87AsF2jtohk/YHuckpAp7rHiG21mHYCqIB1aNlEbYkXn7lK2G130gwX7Fo1YosrxM4Mq3
	yRWAH7/daN+vJ9GLbg2qGcbzr/VQvMBxigQ==
X-Received: from dycmd11.prod.google.com ([2002:a05:693c:23cb:b0:30b:f184:dc27])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:7fab:b0:2ed:27a3:eae2 with SMTP id 5a478bee46e88-30c070b3bf4mr148588eec.15.1781804200369;
 Thu, 18 Jun 2026 10:36:40 -0700 (PDT)
Date: Thu, 18 Jun 2026 17:36:31 +0000
In-Reply-To: <cover.1781803482.git.abhishekbapat@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1781803482.git.abhishekbapat@google.com>
X-Mailer: git-send-email 2.55.0.rc0.786.g65d90a0328-goog
Message-ID: <e82e6ec3eed46a93dfd794c66a9b7b11169df0fa.1781803482.git.abhishekbapat@google.com>
Subject: [PATCH v6 2/6] alloc_tag: add ioctl filters to /proc/allocinfo
From: Abhishek Bapat <abhishekbapat@google.com>
To: Suren Baghdasaryan <surenb@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Hao Ge <hao.ge@linux.dev>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Sourav Panda <souravpanda@google.com>, Abhishek Bapat <abhishekbapat@google.com>
Content-Type: text/plain; charset="UTF-8"

Extend the capability of the IOCTL mechanism to filter allocations based
on tag's module name, function name, file name and line number.

Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
Acked-by: Hao Ge <hao.ge@linux.dev>
Acked-by: Suren Baghdasaryan <surenb@google.com>
---
 include/uapi/linux/alloc_tag.h | 26 ++++++++++++-
 lib/alloc_tag.c                | 68 ++++++++++++++++++++++++++++++++--
 2 files changed, 89 insertions(+), 5 deletions(-)

diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_tag.h
index ee6a023cbaf4..13e9b5916bf5 100644
--- a/include/uapi/linux/alloc_tag.h
+++ b/include/uapi/linux/alloc_tag.h
@@ -45,8 +45,32 @@ struct allocinfo_tag_data {
 	struct allocinfo_counter counter;
 };
 
+enum {
+	ALLOCINFO_FILTER_MODNAME,
+	ALLOCINFO_FILTER_FUNCTION,
+	ALLOCINFO_FILTER_FILENAME,
+	ALLOCINFO_FILTER_LINENO,
+	__ALLOCINFO_FILTER_LAST = ALLOCINFO_FILTER_LINENO
+};
+
+#define ALLOCINFO_FILTER_MASK_MODNAME		(1 << ALLOCINFO_FILTER_MODNAME)
+#define ALLOCINFO_FILTER_MASK_FUNCTION		(1 << ALLOCINFO_FILTER_FUNCTION)
+#define ALLOCINFO_FILTER_MASK_FILENAME		(1 << ALLOCINFO_FILTER_FILENAME)
+#define ALLOCINFO_FILTER_MASK_LINENO		(1 << ALLOCINFO_FILTER_LINENO)
+
+#define ALLOCINFO_FILTER_MASKS \
+	((1 << (__ALLOCINFO_FILTER_LAST + 1)) - 1)
+
+struct allocinfo_filter {
+	__u64 mask; /* bitmask of the filter fields used */
+	struct allocinfo_tag fields;
+};
+
 struct allocinfo_get_at {
-	__u64 pos;	/* input */
+	/* inputs */
+	__u64 pos;
+	struct allocinfo_filter filter;
+	/* output */
 	struct allocinfo_tag_data data;
 };
 
diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
index c73195000830..f00d731b81cf 100644
--- a/lib/alloc_tag.c
+++ b/lib/alloc_tag.c
@@ -49,6 +49,7 @@ struct allocinfo_private {
 	struct codetag_iterator iter;
 	struct codetag_iterator reported_iter;
 	bool print_header;
+	struct allocinfo_filter filter;
 	/* ioctl uses a separate iterator not to interfere with reads */
 	struct codetag_iterator ioctl_iter;
 	bool positioned; /* seq_open_private() sets to 0 */
@@ -191,6 +192,12 @@ static void allocinfo_copy_str(char *dest, const char *src)
 	strscpy_pad(dest, allocinfo_str(src), ALLOCINFO_STR_SIZE);
 }
 
+/* Compare two strings and only consider the trimmed suffix if s1 is too long */
+static int allocinfo_cmp_str(const char *str, const char *template)
+{
+	return strncmp(allocinfo_str(str), template, ALLOCINFO_STR_SIZE);
+}
+
 /*
  * Populates the UAPI allocinfo_tag_data structure with active runtime
  * profiling counters extracted from the given kernel codetag.
@@ -230,6 +237,40 @@ static int allocinfo_ioctl_get_content_id(struct seq_file *m, void __user *arg)
 	return 0;
 }
 
+/*
+ * Verifies whether a given codetag satisfies the active filtering criteria by
+ * matching its characteristics against the specified filter.
+ */
+static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter)
+{
+	if (!filter || !filter->mask)
+		return true;
+
+	if (filter->mask & ALLOCINFO_FILTER_MASK_MODNAME) {
+		/* user wants to filter by modname but ct->modname is NULL */
+		if (!ct->modname) {
+			/* validate if user was attempting to filter for built-in allocations */
+			if (filter->fields.modname[0] != '\0')
+				return false;
+		} else if (allocinfo_cmp_str(ct->modname, filter->fields.modname))
+			return false;
+	}
+
+	if ((filter->mask & ALLOCINFO_FILTER_MASK_FUNCTION) &&
+	    ct->function && allocinfo_cmp_str(ct->function, filter->fields.function))
+		return false;
+
+	if ((filter->mask & ALLOCINFO_FILTER_MASK_FILENAME) &&
+	    ct->filename && allocinfo_cmp_str(ct->filename, filter->fields.filename))
+		return false;
+
+	if ((filter->mask & ALLOCINFO_FILTER_MASK_LINENO) &&
+	    ct->lineno != filter->fields.lineno)
+		return false;
+
+	return true;
+}
+
 /*
  * Seeks the ioctl iterator to the specified 0-indexed tag position, reads its
  * profiling data and returns it to userspace.
@@ -238,29 +279,46 @@ static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
 {
 	struct allocinfo_private *priv;
 	struct codetag *ct;
-	__u64 pos;
 	struct allocinfo_get_at params = {0};
+	__u64 skip_count;
 
 	if (copy_from_user(&params, arg, sizeof(params)))
 		return -EFAULT;
 
+	if (params.filter.mask & ~ALLOCINFO_FILTER_MASKS)
+		return -EINVAL;
+
 	priv = m->private;
-	pos = params.pos;
 
 	mutex_lock(&priv->ioctl_lock);
 	codetag_lock_module_list(alloc_tag_cttype);
 
-	if (pos >= codetag_get_count(alloc_tag_cttype)) {
+	if (params.pos >= codetag_get_count(alloc_tag_cttype)) {
 		codetag_unlock_module_list(alloc_tag_cttype);
 		mutex_unlock(&priv->ioctl_lock);
 		return -ENOENT;
 	}
 
+	skip_count = params.pos;
+
+	if (params.filter.mask)
+		priv->filter = params.filter;
+	else
+		priv->filter.mask = 0;
+
 	/* Find the codetag */
 	priv->ioctl_iter = codetag_get_ct_iter(alloc_tag_cttype);
 	ct = codetag_next_ct(&priv->ioctl_iter);
-	while (ct && pos--)
+
+	while (ct) {
+		if (matches_filter(ct, &priv->filter)) {
+			if (skip_count == 0)
+				break;
+			skip_count--;
+		}
 		ct = codetag_next_ct(&priv->ioctl_iter);
+	}
+
 	if (ct) {
 		allocinfo_to_params(ct, &params.data);
 		priv->positioned = true;
@@ -301,6 +359,8 @@ static int allocinfo_ioctl_get_next(struct seq_file *m, void __user *arg)
 	}
 
 	ct = codetag_next_ct(&priv->ioctl_iter);
+	while (ct && !matches_filter(ct, &priv->filter))
+		ct = codetag_next_ct(&priv->ioctl_iter);
 	if (ct)
 		allocinfo_to_params(ct, &params);
 
-- 
2.55.0.rc0.786.g65d90a0328-goog

