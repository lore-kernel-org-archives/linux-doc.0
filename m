Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13A37081E
	for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 00:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781050394; cv=none; b=QTx5udHIbXzeAA6uZHfV5LBFBdCpFhSQYFn/Qgn44JVD7PC0y13yPTwWLtEeASVfnm6k0w0TWemlAclxsQWm/8cpUXT1Xj7X2Nr/NUGvho9HCvrX2xyk1irB+SWAn6JbnA0m+IhHxuyHDzBglYQ5jR8yv6clWXuBUQ2/xoJY5gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781050394; c=relaxed/simple;
	bh=c6Afjof3186R10N3oEQB1VIOdka+uqVO0M7bR2gVFh0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kqOZ0637sL2EZ27kYtSfnQjHimIhcde8mncnXrGz92VSdJ7ynwMfkd2a1vqy4l3VRuxT1w6hsjPSnX8RMAxytiXqE9P+AtOvC7IOBmX8QrbflyQEMVMin4VkMFnxaPFXT4yMxt6Wkxv8h96e6xvyBgIA+hlaSYpiGvYV+Dc4rW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LPxU43Tm; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LPxU43Tm"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-304f1820babso7703063eec.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 17:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781050392; x=1781655192; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=++tB77hzD2q8vCe8TMYSjrltZ0zPb6nZ4tH02lhBM58=;
        b=LPxU43TmcFLm4H82X733gc7l0U6nP1AeM0d661LnZXz3X7rz2vENzOcbm41PvP7O0w
         ZuO9hDu2zzSFYnY5Md4/1Vsd07BUJK7oY/fpNEt4/klAv/SyL1ZkIICv57K2GrLd9A1v
         q61+Wf84jL9ntW3KRbqxEzvMX2G+Jf72kXXwbeKg/gB1ZlHCgyBgL45q2EVxH6Trrebj
         nbCaN4q0QKDw/PqnPverk7zmqcVPzCchIIoCXrlsRTLocNPjyQ53pCcA+SCEd8lwAO4K
         frwTYAV2kQd8elmVkiRImHvz+G9FKmnyDO4vgz/VLlYDlA7JQ/98sWuf1ke8RfdUVG78
         Ojlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781050392; x=1781655192;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=++tB77hzD2q8vCe8TMYSjrltZ0zPb6nZ4tH02lhBM58=;
        b=ffTLCWKn5hHQaiWdjFDHcRVF08i9zkVktiGcf5gchIULui8NtF2NtImVwfEpu6Kwe7
         +zfB/Njs2rkBnHv2Tp/+ufBnfLbMJ4QpVTsa0Wtwaai+9TEA91HqRiy9Y9334pfZCr0v
         4cRNhI0LmJKq/zZAqvMxLdC9CbvmiKWBTSpDS3n/IvaEvpBJsdyvCrBkNwBgEm5UEcxm
         4gngO0nOAUM/nNTyI2ZhezLk+VdQkpiNnouVPI4QCpoPwinBvyhhxrYyaUhXVsCEnLj5
         pUskgMvvrq4a9WxNVQ37daKLAj7HTG38pGDQNOoZk4iryMfMYdEkMDbSfT3dUNXCPVSc
         Dluw==
X-Forwarded-Encrypted: i=1; AFNElJ9ccAp/+7NsF6RCaMM2Ny4vkXAX1mDXVzaL27FBbzVYuec00B+qvuep1yJ/d3fU1dGh59W6Y/y3fZk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEq726oCPAJ+Unwxwe7iaVr5HppQ872vJFX/j1qtOQqXTctagw
	ayxrNWr46A0zypiv8P0oPqENh9ZUTQlnpIav1mNJjntOiyAqsdtKKNFy3OtY+4USp243Ep4JgsK
	8IqbFebHKTx3CMA08osrdPhXKJbtUABzDPw==
X-Received: from dynm18.prod.google.com ([2002:a05:7300:2a92:b0:2df:46bf:2390])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:9f0f:b0:303:f295:4db2 with SMTP id 5a478bee46e88-3077ae8e8femr14895652eec.0.1781050391622;
 Tue, 09 Jun 2026 17:13:11 -0700 (PDT)
Date: Wed, 10 Jun 2026 00:12:56 +0000
In-Reply-To: <cover.1781042698.git.abhishekbapat@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1781042698.git.abhishekbapat@google.com>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
Message-ID: <4e2a75c69fe350358e1fef3e4e25435f6a3d4e77.1781042698.git.abhishekbapat@google.com>
Subject: [PATCH v4 3/6] alloc_tag: add size-based filtering to ioctl
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
index 378fcd63b6c9..a936cf18611a 100644
--- a/lib/alloc_tag.c
+++ b/lib/alloc_tag.c
@@ -191,15 +191,26 @@ static int allocinfo_cmp_str(const char *str, const char *template)
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
@@ -208,9 +219,9 @@ static void allocinfo_to_params(struct codetag *ct,
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
@@ -234,7 +245,9 @@ static int allocinfo_ioctl_get_content_id(struct seq_file *m, void __user *arg)
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
@@ -261,6 +274,19 @@ static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter)
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
 
@@ -274,6 +300,8 @@ static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
 	struct codetag *ct;
 	struct allocinfo_get_at params = {0};
 	__u64 skip_count;
+	struct alloc_tag_counters counters;
+	bool fetched_counters;
 
 	if (copy_from_user(&params, arg, sizeof(params)))
 		return -EFAULT;
@@ -281,6 +309,11 @@ static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
 	if (params.filter.mask & ~ALLOCINFO_FILTER_MASKS)
 		return -EINVAL;
 
+	if ((params.filter.mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) &&
+	    (params.filter.mask & ALLOCINFO_FILTER_MASK_MAX_SIZE) &&
+	    params.filter.min_size > params.filter.max_size)
+		return -EINVAL;
+
 	priv = m->private;
 
 	mutex_lock(&priv->ioctl_lock);
@@ -304,7 +337,8 @@ static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
 	ct = codetag_next_ct(&priv->ioctl_iter);
 
 	while (ct) {
-		if (matches_filter(ct, &priv->filter)) {
+		fetched_counters = false;
+		if (matches_filter(ct, &priv->filter, &counters, &fetched_counters)) {
 			if (skip_count == 0)
 				break;
 			skip_count--;
@@ -313,7 +347,7 @@ static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg)
 	}
 
 	if (ct) {
-		allocinfo_to_params(ct, &params.data);
+		allocinfo_to_params(ct, &params.data, fetched_counters ? &counters : NULL);
 		priv->positioned = true;
 	}
 
@@ -339,6 +373,8 @@ static int allocinfo_ioctl_get_next(struct seq_file *m, void __user *arg)
 	struct codetag *ct;
 	struct allocinfo_tag_data params;
 	int ret = 0;
+	struct alloc_tag_counters counters;
+	bool fetched_counters;
 
 	memset(&params, 0, sizeof(params));
 	priv = m->private;
@@ -352,10 +388,15 @@ static int allocinfo_ioctl_get_next(struct seq_file *m, void __user *arg)
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
2.54.0.1099.g489fc7bff1-goog

