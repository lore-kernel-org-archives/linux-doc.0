Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590773BED0F
	for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 23:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781564679; cv=none; b=DZhdnbQGQPcFUar6HcGna6OvanB4XnX/yOUqrzCsbACVCIIKDpZTc+jd6oKB8msC7tJQ9is6uOmNgcyiqx3GME9vtXMzPj6L9XS5kqJ4ytYu7o9rwADIAxvUB/4Cfcavknovq7xR3P2dDVZyKd7RUucwT8tQ7FDFYVlAjci+o+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781564679; c=relaxed/simple;
	bh=wKsoDZEnYaWaglxiIzle/e0IHh+ebD0LX1m/juEXA74=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dEHDuqag/WKlnZfWUSi2pv7Cckq0pWvs5PMRkQQt5qDTidK+5xNnei7/4bAoH56zz4ij30swgv1D+IdyLCt5FmLr1DVxG5qSftjLzUI/83lGiMsLC8zXCKEytDfBxWIlPTdV1PJ8ygLo8fc6RWhQxSslmIwidcAFRev+4JLf+4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dqeuKQtY; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dqeuKQtY"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-307fd7138b1so5922885eec.0
        for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 16:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781564678; x=1782169478; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RzMYIMHbHpYwUDuANjUFWjntqVLUMERivn/jHDqhN+w=;
        b=dqeuKQtY3eV8PagBsCzNX1torieiWUN+atoSedikjRxGN2Lb62Y/gp5Jrvvj0soX6C
         WAeiXEjFh1lv7M8ecuXixzcfJddfa3BJdwKl8ytdcZhtjQdUx6034fW0MVpoWyGL9iPr
         E7nGOSzcdyzGRl/VlnVhhOgPTKBHziw5okVKVS8TlSTuv4/s3w7do4ImNBUMguiRAtvS
         gjYxD9ylBMiTnOGRktdW83LiUE4w8M98CIe+9TCAwXex9oy6rIMU+s+U1vitmb/x4Dbs
         TMbJwPgFb8hBc8ILtUOyiPYGq1y7DvG4q2MyL2ENrZGODTSco3WxAJLrSHLfWBHCSu1b
         AZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781564678; x=1782169478;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RzMYIMHbHpYwUDuANjUFWjntqVLUMERivn/jHDqhN+w=;
        b=eScyOIzYuXYL+nq2UWaiggdqQe+Dzvh909sn9oqZ+T3J1R6Hh3k7Xk252mmJd2QDrA
         IZvLE+JCl1iEE4DW1p7SF+xFo60DkmEBvy0bdgJZOdpHQjJ61tQVyp3QibguJ6NDI43V
         32KxadDK0GAjx5Olum56BIM5ESm8RoZ2wofqDLHVAG2j69WoTV4QB5Qv0zEMsmsfO9RQ
         +cFlSUzJgard/QNeJ5fmzq8xy4AsurOENgvnP7wzACWWPxVAPfE2DF9Fh3CqXFI7eXev
         JplDESqOtg0HDLLPjKXDTu7WYQiBGEI//T2w5se98XqPiHZqg5tvEapkp/VlLETwdkGk
         sfJQ==
X-Forwarded-Encrypted: i=1; AFNElJ9o7J3DLAiI65gs+/wVrUsUrx0jk2my/WHLWk+b5UwIn1UzkdWsxxrStQfip0zRsVm2uw/IOEbtFus=@vger.kernel.org
X-Gm-Message-State: AOJu0YysE8hyEnsQwAb2dMtQHWWNEBo5FZ0ysyHnoTIDxCTjoeaq0wty
	+bGYWU29EPO1Z+wq6gquUq+3hTbKggQiyKaT+3bO+F7GZo9dw4cI10nE5y2v86iD4PggFFNtsiB
	pJipnfZMzJllQUzbKgNwsIHhl4nb2ziH70A==
X-Received: from dyay5.prod.google.com ([2002:a05:693c:62c5:b0:30b:a8b6:ab44])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:df41:b0:2d9:5cd9:b8ff with SMTP id 5a478bee46e88-309356121d0mr7234604eec.6.1781564677231;
 Mon, 15 Jun 2026 16:04:37 -0700 (PDT)
Date: Mon, 15 Jun 2026 23:04:27 +0000
In-Reply-To: <cover.1781564384.git.abhishekbapat@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1781564384.git.abhishekbapat@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <2f9c58f6fd8a81325ec03e19327e03b0b7dca2aa.1781564384.git.abhishekbapat@google.com>
Subject: [PATCH v5 2/6] alloc_tag: add ioctl filters to /proc/allocinfo
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
---
 include/uapi/linux/alloc_tag.h | 26 ++++++++++++-
 lib/alloc_tag.c                | 68 ++++++++++++++++++++++++++++++++--
 2 files changed, 89 insertions(+), 5 deletions(-)

diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_tag.h
index 0928e1a48d49..3b11877955b9 100644
--- a/include/uapi/linux/alloc_tag.h
+++ b/include/uapi/linux/alloc_tag.h
@@ -40,8 +40,32 @@ struct allocinfo_tag_data {
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
index 82e3b5f32dff..5feb61d9fb92 100644
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
@@ -188,6 +189,12 @@ static void allocinfo_copy_str(char *dest, const char *src)
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
@@ -227,6 +234,40 @@ static int allocinfo_ioctl_get_content_id(struct seq_file *m, void __user *arg)
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
@@ -235,29 +276,46 @@ static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
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
@@ -298,6 +356,8 @@ static int allocinfo_ioctl_get_next(struct seq_file *m, void __user *arg)
 	}
 
 	ct = codetag_next_ct(&priv->ioctl_iter);
+	while (ct && !matches_filter(ct, &priv->filter))
+		ct = codetag_next_ct(&priv->ioctl_iter);
 	if (ct)
 		allocinfo_to_params(ct, &params);
 
-- 
2.54.0.1136.gdb2ca164c4-goog

