Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3723E5ED1
	for <linux-doc@vger.kernel.org>; Mon,  4 May 2026 23:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777937795; cv=none; b=ID465dcbY2HxVqSb4E18I4q9wJREHBmowqql9HD4A9LG2q2Z0AUP2+B4/OXRYhQWuMRHx90a8gWVy/DjQkfw8bIGl+0MGI4ztUiSOzOlrWv1Osg3iQxnsyo08+oeeyWD2QUveZRkXlVGpVOocT+yUb1wmw3CoeTg314nv20L2lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777937795; c=relaxed/simple;
	bh=O5GFVRYXtZjXkiZL0LDRQ6w4GTBctnx+XTp600SssqU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CnhbxymSYZPRlPJNc2HibGZpzJ8wCAHZZKhj2oGSt7OkowrTY7BrsC976F0Tn7oATEANVfD3OO3mtgkNiLwwmSONSWoXM3X9AcxpgTDfo93oRwTui8nQuTL4wgTVAzU42QWnXbjxEXOzSfDbErb3M3H7ekYSKO65L9u/KHw1Z3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VKC+v2fO; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VKC+v2fO"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2ef62078ee7so2462615eec.0
        for <linux-doc@vger.kernel.org>; Mon, 04 May 2026 16:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777937793; x=1778542593; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=P8In7SqV1CDaELSYurDVfz0X7xi71y9ocBNy94kYNvE=;
        b=VKC+v2fOEw4FqQ1siRB9N8EEcikOQQzarTkwrhzGxiedMEAqCgkD1uqlp/kk3hG08H
         oIFg6X3qv+4ciAkqHihUzVU1yn837bpBLoHQPLTf/BEdQfeAJNjkJZmszy/ryIEkubqh
         OlTSQNk1uwKRZSqtyyvIimmh8UKl/vmn53b8X0v1KKe1daHZe4jt/foDGQsi9GGw3vRX
         pKe+B9CEgDOob34WGQqQPJaNREENS/OhhX3eU7WHDQvBhPEVJO5y0jtCeNSiqIzAQizu
         s4XWMA1FHxf39+IHpt1ATRl6tvYT5dAtXqnRQvezaH8G0O2UpO9xN4AzaHUifuNrrcmB
         6R6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777937793; x=1778542593;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P8In7SqV1CDaELSYurDVfz0X7xi71y9ocBNy94kYNvE=;
        b=bdFCuNHCPh8rIe6ugPiuqwvrDEGGcjtJHl/TIDEke8UgQLgdLjT/FQR/8YysQdMXoG
         2KIy3rSaAfaRBY13WfQonNxJN4MB7KGcA71VxGblKKkN4/0vN45poS509RNI2XpoT1IZ
         RHkLz50uQTDkNuQKAAcvSEa56sCt4zXBkGVoHD7iVf3Fwmx9Twl8gZGTSqN5Orrtbwlz
         yxSQ5bmTjv9meXb56jglx86DAlxCknGSG9HPBdKwWTsG//oBMPB8q3ttSvSi09cdLm1P
         n5RjwZfTHICJyqZ1ssEFQSqwhncNkyJDilS18Fm6xm4kjrEKzDQf7krxfJ2V91WWWvGS
         9AOQ==
X-Forwarded-Encrypted: i=1; AFNElJ+9NJrgQz9RaiG4l4fiHYTs1kUKykLYoRac5I2optg6qApIgmMVl5aazgAw8hQVvS1LjiivOKjPW8c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5BL8I5yb+mftdiISUxEAD/WEU5JWN5cx59cpW8Vnl+YxIHBH3
	qp8oXi6ihKBM6CeZYZNa2cwbjjVLrb58Gd3FlyKfavMXFlVwqHxk1CVi4e1kHYEvFL7zrhsvMrQ
	OPSp6GASXydGOLAbaQuVu9WdBD+BgsRCLnA==
X-Received: from dybmk34.prod.google.com ([2002:a05:7301:ea2:b0:2ed:a84e:18d3])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:7fa0:b0:2ea:e93a:ff9b with SMTP id 5a478bee46e88-2f408519825mr409335eec.13.1777937792756;
 Mon, 04 May 2026 16:36:32 -0700 (PDT)
Date: Mon,  4 May 2026 23:36:20 +0000
In-Reply-To: <cover.1777936301.git.abhishekbapat@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1777936301.git.abhishekbapat@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <2d1cbd93b987198d9569ff54b7fee4ae6aad5ff6.1777936301.git.abhishekbapat@google.com>
Subject: [PATCH 2/6] alloc_tag: add ioctl filters to /proc/allocinfo
From: Abhishek Bapat <abhishekbapat@google.com>
To: Suren Baghdasaryan <surenb@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Sourav Panda <souravpanda@google.com>, Abhishek Bapat <abhishekbapat@google.com>
Content-Type: text/plain; charset="UTF-8"

Extend the capability of the IOCTL mechanism to filter allocations based
on tag's module name, function name, file name and line number.

Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
---
 include/uapi/linux/alloc_tag.h | 26 +++++++++++++++-
 lib/alloc_tag.c                | 55 ++++++++++++++++++++++++++++++++--
 2 files changed, 77 insertions(+), 4 deletions(-)

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
index 5c24d2f954d4..7ff936e15e97 100644
--- a/lib/alloc_tag.c
+++ b/lib/alloc_tag.c
@@ -47,6 +47,7 @@ int alloc_tag_ref_offs;
 struct allocinfo_private {
 	struct codetag_iterator iter;
 	bool print_header;
+	struct allocinfo_filter filter;
 	/* ioctl uses a separate iterator not to interfere with reads */
 	struct codetag_iterator ioctl_iter;
 	bool positioned; /* seq_open_private() sets to 0 */
@@ -156,6 +157,11 @@ static void allocinfo_copy_str(char *dest, const char *src)
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
@@ -187,26 +193,67 @@ static int allocinfo_ioctl_get_content_id(struct seq_file *m, void __user *arg)
 	return 0;
 }
 
+static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter)
+{
+	if (!ct || !filter || !filter->mask)
+		return true;
+
+	if ((filter->mask & ALLOCINFO_FILTER_MASK_MODNAME) &&
+	    ct->modname && (allocinfo_cmp_str(ct->modname, filter->fields.modname)))
+		return false;
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
@@ -240,6 +287,8 @@ static int allocinfo_ioctl_get_next(struct seq_file *m, void __user *arg)
 	}
 
 	ct = codetag_next_ct(&priv->ioctl_iter);
+	while (ct && !matches_filter(ct, &priv->filter))
+		ct = codetag_next_ct(&priv->ioctl_iter);
 	if (ct)
 		allocinfo_to_params(ct, &params);
 
-- 
2.54.0.545.g6539524ca2-goog

