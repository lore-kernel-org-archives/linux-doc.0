Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB8C436BF1
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 18:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783362359; cv=none; b=ucDPQ8ErFDb3DnMzYQ4yhqF1UrSvAHmBzU0ZXtRJpU3izZw9dn996hHwRXpcH+rY/GNNa6cEU1DDVYKkiWHa4e5wCYC6rFqly22agmbwHE5aBgDDSppQzvPne1mfeO3X97t4YBktjKxxOrGn3hQ86DhI1mxf09XeRFrEMrlW55s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783362359; c=relaxed/simple;
	bh=5CJdXqATq8sMzQ585eOvPaiKNfcHJ6eZ6whhlNh3Xiw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kvtRC4V1xhRSSxWcU2J3kpjO65Dg8962RBDhy7c1LuFimpWlOGAGulykCWVY6duTLYowKmSZwb86u7aitcaJLefS3isxgu/zEsUkLVCsMKiYLQ0NVseArIfNbVpta22QSvBVlH9HF7U2FGjlALlC1mz1E1q4fiNpdTdYRpidL88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G78C9hhq; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G78C9hhq"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c9aa197d5easo95584a12.1
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 11:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783362356; x=1783967156; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wii6nX8AGBJij88y/K868cO+98u+SKZQ5HlBNi/w6Tw=;
        b=G78C9hhqgg3UK98E0ZFacREunMDknYA71dmOlk3IdnT67q65a2mJff4uYXKGWenmmW
         mllA5mRKGVxb0D63oKPMpXSfX5XqjEQ0J6ebwpLODtyLWKLGu0FFrJxrsFmIQ8tgscO0
         qeG4DDJIcy65tid2jClaC1nkXOYPPx0OVTs8CvV3j4sbeVvQlxqn+T1gLu6TK5loVoGZ
         KiXtfYK47gqdq9xIor1+fv2/xq7ZiiG/OmAaq+ztueGkXddK5Xfo3pOAFHZs6iCvsbIn
         tDW8Ms30gC80MT+6IlGdVfVDGJQ375rxcmYkHEmPr2aiRdg4R+6PS2uFtjXR/tslzKLh
         tKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783362356; x=1783967156;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wii6nX8AGBJij88y/K868cO+98u+SKZQ5HlBNi/w6Tw=;
        b=O0gBkhRukz3+vnkNIgY3y69dJWhnYxudZPZDmz/I0Uj6Uhw1WsYaKpRpBobtRJqBjT
         N55L+ScUjjjUE1vWbN5vI7YdnljCRCsQuW363wNaWX286SJzD+Wp8paB//vyj5Pzk0Dn
         FUVsy0TWRBpoPVFaMk3uqyEW4VSebuT/JuTxUly/uZmFogmXIKRBnjmE9DRmophc+rLt
         bnqNyjpk/kUf2RkYARM2GJKhgV+DMgO3HzelRUXw8tIP8/8oGSuA8FpiJmNzHMfduX/f
         gBGbGnaKda33GqopXE4sW+5+x9FFDTZt10LvKIOvz1lU5XswG2VQ+hixLzOsCMl1R9Gb
         GPZQ==
X-Forwarded-Encrypted: i=1; AHgh+RrZAzEHhndbrZd88NpK9V3SimKTV0KSPaUjlshDWAkzAhsTQzbEHr3mniWRpcd6vC2pJ46sM4e3VGA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3xahEAt7h4KWSanr+ruaFfTMq4UDHCDeEHz8lIUVcVizXeQHc
	7y+S3IxCGbXBvolmne6ArMjk2nZ/tCY0pW4DKJ62zsgYBDleft/7tEHLOt83zKsDkTdY0CJ+x/C
	XWixR/l0cZgVYuhefPgBgCglOEI2CAHKtAw==
X-Received: from dyuw16-n2.prod.google.com ([2002:a05:693c:8810:20b0:30c:86eb:3114])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:938e:b0:3bf:a8fa:a7b1 with SMTP id adf61e73a8af0-3c01cbe495dmr18148893637.37.1783362355996;
 Mon, 06 Jul 2026 11:25:55 -0700 (PDT)
Date: Mon,  6 Jul 2026 18:25:45 +0000
In-Reply-To: <cover.1783361692.git.abhishekbapat@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1783361692.git.abhishekbapat@google.com>
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
Message-ID: <b0fc4d7dc587aed6376a29bd8dd03896cc1e1704.1783361692.git.abhishekbapat@google.com>
Subject: [PATCH v7 2/6] alloc_tag: add ioctl filters to /proc/allocinfo
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
index c73195000830..f00d731b81cf 100644
--- a/mm/alloc_tag.c
+++ b/mm/alloc_tag.c
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
2.55.0.rc2.803.g1fd1e6609c-goog

