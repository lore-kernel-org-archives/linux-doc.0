Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7191F3655FF
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 17:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779471951; cv=none; b=F1jfv2Ss1MbZBBff0oDiiA/Jl6KqWJnjePIA7GPzYsKicZJ9p9CUBeBz/VKSNl1CAAfzF5aNKtLiGcIviFL5mY+aYostRX5LPzOC0YCyub/yoIG/nlPNwHTY9gJ08EljJrsleWumcoNHcPbPCgNSQvjqbkypuDjpSjr4yPxBKo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779471951; c=relaxed/simple;
	bh=u272ECOiUuYXoSauc1/mPi1P5NrYx29FhZNXkFrNXso=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lIcatKOTdJPNASTm+f/9LvByAcQgzlGk3P1r5T0hHvVTta04RpN5z0LnOVx5+b2BbjWTN3yEfdkT02u0qfDeKDosnrUsI4GcU4tcn4iipu+8Qc07ax6LXYXmGJyzEz7f9vuME9G+7xVSd3wM4M1Z5+6IEMUoiyaQLUYTB4a8pIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kpwlcvI1; arc=none smtp.client-ip=74.125.82.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kpwlcvI1"
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-13312be8a31so3270262c88.1
        for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 10:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779471948; x=1780076748; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/jYkf4xPE5NaHstf7F4psma2bVLV13GjTGY2UjXb0AI=;
        b=kpwlcvI1qVPnJofcxcyTjzcGt8FkkXPcdI+sRd3zE5Whpt3imGUKqBBlSJUs76UASD
         XkUhTMRoEhsqRykQ0DUE82huhiUsVeTvCGdLeYogKSZ706fls/VfRZHN2ysPD6GMEFmr
         Z9o1iDHOFD+z2L6MNF9aWF/eC3Vl6kgrd2wYRTDEFvQaQcGT1wjDBPNncklVxnkY7SRT
         qqZFq8fwAZU9uJk0UqtfcAe82++m7de2Ju7KYiAzMEU1MXag1XXT7k72um2wqugRH/rh
         3XcxhIstj47WMHui1VUj8CWCM+j2EvOx6Y+z8CQLHmDkLn0runfQtaBY+fdN95T28rwW
         ZxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779471948; x=1780076748;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/jYkf4xPE5NaHstf7F4psma2bVLV13GjTGY2UjXb0AI=;
        b=MNGtG3x9mY8d3pw38tFBIFQIy30ows8ZCMq9YbpB1V3WqyoxXsG1Y0q+FDFcfYXIjN
         YgtSg2EQudv7mzSxgUESFLYeSc2uAY0muxFC9ZKAICfSsuWPFxVY+p/KLmMxFwLZUGos
         DYwxoJZ9oFpNOPB4FFJsyEzViEjlNvcglk9QHjK2HjWqwb4+z+YqksgHLlLyUgwE1bZ8
         SGmOda1yd1mtOV0hsYGz4QZNeQ0wQEajLqZh7alBlM5wr4vl7qvbUpBw/9LRrGWsDyLt
         bLAFt+bXDHzOFIEGkSMhuW9+NAfJCEq0MrSWMQp3xbcaSU6nD1SbcU/OC/KenHJFdGQv
         8Z1A==
X-Forwarded-Encrypted: i=1; AFNElJ8oEZ4GDMtEzIiy4CQvfCrTI+d5QwNKrS/2fZD3yzCFxpoHBNSumkGhlFBtywrbi5XBVokaJarLV+k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhK9j5R+kn+SfLL69TwGAOi/2g1GDnvzJApDXZOgfMbLa8fywG
	mmROMkCZj6lVs9VAyAlZT3xq9QKDuvpE7XPEUKfZUXBMta/82rFTchLUZ0Zek5nitDLodQTf5oa
	iwhLDCkE7BJg8q/gAcslrFFxdaXsVc674vg==
X-Received: from dykh11.prod.google.com ([2002:a05:7300:570b:b0:2f9:af7:504e])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:2c8b:b0:304:67:ba1c with SMTP id 5a478bee46e88-30448ffd0f3mr2906032eec.6.1779471948351;
 Fri, 22 May 2026 10:45:48 -0700 (PDT)
Date: Fri, 22 May 2026 17:45:34 +0000
In-Reply-To: <cover.1779471082.git.abhishekbapat@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1779471082.git.abhishekbapat@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <f177efebdfda5c2a179d7cd6768e0c6f37efb9c4.1779471082.git.abhishekbapat@google.com>
Subject: [PATCH v2 2/6] alloc_tag: add ioctl filters to /proc/allocinfo
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
---
 include/uapi/linux/alloc_tag.h | 26 ++++++++++++++-
 lib/alloc_tag.c                | 58 ++++++++++++++++++++++++++++++++--
 2 files changed, 80 insertions(+), 4 deletions(-)

diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_tag.h
index e9a5b55fcc7a..0cc9db5298c6 100644
--- a/include/uapi/linux/alloc_tag.h
+++ b/include/uapi/linux/alloc_tag.h
@@ -34,8 +34,32 @@ struct allocinfo_tag_data {
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
index 3598735b6c93..56c394ef721f 100644
--- a/lib/alloc_tag.c
+++ b/lib/alloc_tag.c
@@ -48,6 +48,7 @@ int alloc_tag_ref_offs;
 struct allocinfo_private {
 	struct codetag_iterator iter;
 	bool print_header;
+	struct allocinfo_filter filter;
 	/* ioctl uses a separate iterator not to interfere with reads */
 	struct codetag_iterator ioctl_iter;
 	bool positioned; /* seq_open_private() sets to 0 */
@@ -167,6 +168,11 @@ static void allocinfo_copy_str(char *dest, const char *src)
 	strscpy(dest, allocinfo_str(src), ALLOCINFO_STR_SIZE);
 }
 
+static int allocinfo_cmp_str(const char *str, const char *template)
+{
+	return strncmp(allocinfo_str(str), template, ALLOCINFO_STR_SIZE);
+}
+
 static void allocinfo_to_params(struct codetag *ct,
 				struct allocinfo_tag_data *data)
 {
@@ -198,27 +204,71 @@ static int allocinfo_ioctl_get_content_id(struct seq_file *m, void __user *arg)
 	return 0;
 }
 
+static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter)
+{
+	if (!filter || !filter->mask)
+		return true;
+
+	if (filter->mask & ALLOCINFO_FILTER_MASK_MODNAME) {
+		if (!ct->modname)
+			return false;
+		if (allocinfo_cmp_str(ct->modname, filter->fields.modname))
+			return false;
+	}
+
+	if ((filter->mask & ALLOCINFO_FILTER_MASK_FUNCTION) &&
+	    ct->function && (allocinfo_cmp_str(ct->function, filter->fields.function)))
+		return false;
+
+	if ((filter->mask & ALLOCINFO_FILTER_MASK_FILENAME) &&
+	    ct->filename && (allocinfo_cmp_str(ct->filename, filter->fields.filename)))
+		return false;
+
+	if ((filter->mask & ALLOCINFO_FILTER_MASK_LINENO) &&
+	    ct->lineno != filter->fields.lineno)
+		return false;
+
+	return true;
+}
+
 static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
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
 	priv = (struct allocinfo_private *)m->private;
-	pos = params.pos;
+
+	skip_count = params.pos;
 
 	mutex_lock(&priv->ioctl_lock);
 	codetag_lock_module_list(alloc_tag_cttype, true);
 
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
@@ -254,6 +304,8 @@ static int allocinfo_ioctl_get_next(struct seq_file *m, void __user *arg)
 	}
 
 	ct = codetag_next_ct(&priv->ioctl_iter);
+	while (ct && !matches_filter(ct, &priv->filter))
+		ct = codetag_next_ct(&priv->ioctl_iter);
 	if (ct)
 		allocinfo_to_params(ct, &params);
 
-- 
2.54.0.746.g67dd491aae-goog

