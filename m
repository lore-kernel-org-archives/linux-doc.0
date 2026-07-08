Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97FE37C0E6
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 18:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783533694; cv=none; b=dNFNgofyLxT+0CrXQXqYv5+U7a1KnUVrW4voY0hIA9fSdFzj5KYHVapFKYMD1itiyt5z30+ypaX7SA5NsiTyfkVKI2qsKtpV37rr0hRcVh5J4pecyybUkdsJwMLdxmLSvfVBS865IyXpqSdPJWEfC+jHFvi+x/MkCn7zPGwzVNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783533694; c=relaxed/simple;
	bh=F1yAC+ibbPiikpM2oWA2mPSIbcughQ0N4AqRB4fYFjw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LDZaodnJc4YSJshxjdHxCk3sad73ZbHk3UyyrMNaBzlc6qEyBDfRD3YnlUfa1J6+jW3Q4LkcwssNaMcKJdakwRyoeVtSqZ1+/oQGWJc5TdePL5fd70CeNlONaJuJtsfEDnddP5lVfYMJWaAImZ+W0HZSV6sgeBioHhj2bi07PUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mf/VquNN; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mf/VquNN"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-384636ba25dso1447632a91.2
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 11:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783533692; x=1784138492; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2+8XQS9kX86TaKTDVFizNxuv4HEp3Ew7yMZEy877UDU=;
        b=mf/VquNNFAQo/9UvdJ0unPmqkeyAjdJEVA5ZgKNa8K3CTlYZh9Vk/R1DWDJAZ9GHpd
         SGOmg//bmYIZ3sctHlUXaevoc2TylfB9n44i0Bj+9HrnQABEeSltzLnxBixGhDJl1OSE
         tBwRgJ2vFGS57kExYSHBmXWL2wVIdlCAUtt2Rib84t8j79bu44IAvBDD1yTnyEWqLVZT
         k/Yh5OlogC6AjjHmgrQGaBjC7Rm0cz81w6IyozYiKbEjTQRaUsUm4cNYA/wH3DlAFbMB
         dWiIVrhvcdQKMCIR9PYcVCqsp8KKMv0VWWnoygAtZvJt2Q5M/SEA+5XHBPj4xXw/6SYe
         Cs0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783533692; x=1784138492;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2+8XQS9kX86TaKTDVFizNxuv4HEp3Ew7yMZEy877UDU=;
        b=p5CLLOTK9gkuQDFaBPqYGNwJyUnBWIuzWOgFYvb4Rd+az9hOg9DN0MHyqsyzZVYaeZ
         UpaC9Rv/ubiQq/YwH+ZTfFjYofuRCG4JrAnJgL8XGurk9AiNbqXVYhDMSnOKNX8n1BO6
         IgOu8OrWWoF/vZ79QkyLu+VahRvPooJ8xfWzb3DHXzxFfnYqqz0CRbSxIZCoceYlbN5M
         6FOnocp4PNp6SAVsmmOxqt962cH6Fy+TBs27WlmnA1gqgiMQ42vVTtThCSgRxL5h8jCC
         fS6qmTwvnPVDIGJo8cMo+9xcL5sxYglhwM5+H97XafPXXIs8mKjsm+HRD4EH2/V6jvnI
         1/gg==
X-Forwarded-Encrypted: i=1; AHgh+RpwEzT1N7L+qrwCSpZLaK3tg2ED/AOL3883mmMp54G7CllF/bnph6YcyJ2triOu+l6+Krv8bWwDX8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlbKIXU86TIH9KU+FCTUDoVwvNkRvEjXHhRQqKohrmdoYie1Xs
	JZFlYRr4QOUFFZgjGtjCvXdB6J7+TyL6BZ3v5trodTkXwD1CgmlpcQOy84CD3puCZ8TiD+u74Gy
	TLwM34tEMYp4pSA3wuRKtHEegMov/SH/mqQ==
X-Received: from dybmt1.prod.google.com ([2002:a05:7300:d581:b0:30f:1e22:c0ee])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2d87:b0:382:5c31:1f8a with SMTP id 98e67ed59e1d1-389421ae167mr3972883a91.27.1783533691909;
 Wed, 08 Jul 2026 11:01:31 -0700 (PDT)
Date: Wed,  8 Jul 2026 18:01:24 +0000
In-Reply-To: <cover.1783532853.git.abhishekbapat@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1783532853.git.abhishekbapat@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <6a6100c0c58cb2911f39126b9fe177a8c17db16f.1783532853.git.abhishekbapat@google.com>
Subject: [PATCH v8 2/6] alloc_tag: add ioctl filters to /proc/allocinfo
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
 mm/alloc_tag.c                 | 68 ++++++++++++++++++++++++++++++++--
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
 
diff --git a/mm/alloc_tag.c b/mm/alloc_tag.c
index c414117e1e97..aa67c156bc4f 100644
--- a/mm/alloc_tag.c
+++ b/mm/alloc_tag.c
@@ -52,6 +52,7 @@ struct allocinfo_private {
 	struct codetag_iterator iter;
 	struct codetag_iterator reported_iter;
 	bool print_header;
+	struct allocinfo_filter filter;
 	/* ioctl uses a separate iterator not to interfere with reads */
 	struct codetag_iterator ioctl_iter;
 	bool positioned; /* seq_open_private() sets to 0 */
@@ -194,6 +195,12 @@ static void allocinfo_copy_str(char *dest, const char *src)
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
@@ -233,6 +240,40 @@ static int allocinfo_ioctl_get_content_id(struct seq_file *m, void __user *arg)
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
@@ -241,29 +282,46 @@ static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
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
@@ -304,6 +362,8 @@ static int allocinfo_ioctl_get_next(struct seq_file *m, void __user *arg)
 	}
 
 	ct = codetag_next_ct(&priv->ioctl_iter);
+	while (ct && !matches_filter(ct, &priv->filter))
+		ct = codetag_next_ct(&priv->ioctl_iter);
 	if (ct)
 		allocinfo_to_params(ct, &params);
 
-- 
2.55.0.795.g602f6c329a-goog

