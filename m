Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8C33E3C52
	for <linux-doc@vger.kernel.org>; Mon,  4 May 2026 23:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777937798; cv=none; b=Vrngyqj2wrFRCObX6xdMiujAN49oY/ih3Q4gjSfNQ5XuQBS06n2A8u/ce+0AEOiGuwrYzp01zkfMIUG8zGT6FIrEijxsLtNnuL1gsk+I+XMSeIxaDuVg3CcJhNkipZDWq5tFMUjA/E16HFt1srRBZcxFJ7sbFktEWj2NuMFoRQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777937798; c=relaxed/simple;
	bh=2tj/mjQmlaxHamp83p2PwwrXMefMcBjdUBuZAQhz9X8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eK2ZNBSFs8rODvlehAFTLTYow/DErrhcIN8RUU6eUdIA2Ml9RIpHW3RddwjzlD0esPfD1+EMtpdMHRBDsrUqbE12lXj6YLgPwteBJNnHjT1kPNHCrylkqATFGaRlbcViMEmHEaZwgJRjN4gnefF9uuiS5EvwcdZpKhjTttkaFxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j/6q5Mu5; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j/6q5Mu5"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2ef62078ee7so2462639eec.0
        for <linux-doc@vger.kernel.org>; Mon, 04 May 2026 16:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777937796; x=1778542596; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=a6S6DlMMQcGikJO+VWHR/PLbk/eNEQ6Kb3xIzqUHnnk=;
        b=j/6q5Mu5Y2VIcpXATqSXoA2NfFLtOMR+HB9JV4TCHeKpXG/ibhjUV+H8VAWB2eqUUR
         Hxl+pHjeyd/rbnPOTtYzC5d8+SQUZwdHNgcMYRx7Yj3u5RCIoC3vI6bM7i+QJfm5NKjj
         XAAtUx+uIrUxNTH10qcmbDIlefcnFUhqTNYt7u0AfU1QImH8jCx6rs3pJYjPwGkjk2hn
         4wOacM9zzCwo96HOjJYzwoZ7W9pkF8AofDEWoOD+vc0wtSt+iR6/7naerBuou6dIqHk/
         +UkIbPARie6+iymU2GpyvejefKXJkXoSjuRjf31/1cmimxF9R73ApMq4Oey6kKHJXtf3
         Jk9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777937796; x=1778542596;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a6S6DlMMQcGikJO+VWHR/PLbk/eNEQ6Kb3xIzqUHnnk=;
        b=RIbbdZbtZkFca1X6JiQrsy6K+frGghelLFDCZFQiRzwHs0VE71x+InzP0Zmhe9zS2L
         aXnDu2w7jVUF27cyRIRyt/WXH+/mj9ix963/yVMcH99LbrlpBQJJzuBLemMga2nLtcEO
         HTzgRkgNDTIYGuQFEQRGApBOQPYql1wv7fp2/hck57KSoy1Ipy9+7BxH116krQfaDb/M
         ExC/ekXcQQLahj8goDPi/JkRflJrnHrJWnJxVOcpAib+7UKf1n3lilv5sedjol+3mVwY
         ui+8N7KUUvQgl4ffG4ehWHdAJJLNPCTPWEUo4yIX8yh0jPsGYSjHj+NtCx1RZhzKVZNA
         B8IA==
X-Forwarded-Encrypted: i=1; AFNElJ8cnK1baYltSRIAUtWI55zkJ4TPgGXn9AwAab3cDPwIHj8TUc+EtgrCKHR6ipDXULEWCbz7G1eBlPk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDjirgETdt5OfJvobLqtSoEZhaJr7hM7bRqDmm4/NSVCy6aoBG
	ErbxM41T70IuhmquKS1GRhCuuz3CUWyMdljtSrVIrE6rdYrt9UpNmhFBQlgVT4Fip4Kgx8uP44t
	+7vwoURoGOVBE8bq320NRmv+d9O60rhrE4g==
X-Received: from dycoh3.prod.google.com ([2002:a05:7301:da03:b0:2f2:3f95:c586])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:5709:b0:2ed:e14:7f5c with SMTP id 5a478bee46e88-2f40a190047mr396805eec.32.1777937795111;
 Mon, 04 May 2026 16:36:35 -0700 (PDT)
Date: Mon,  4 May 2026 23:36:21 +0000
In-Reply-To: <cover.1777936301.git.abhishekbapat@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1777936301.git.abhishekbapat@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <06b4fc2457fb4b75eb1ef18320a8722ddb5a850f.1777936301.git.abhishekbapat@google.com>
Subject: [PATCH 3/6] alloc_tag: add size-based filtering to ioctl
From: Abhishek Bapat <abhishekbapat@google.com>
To: Suren Baghdasaryan <surenb@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>
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
 include/uapi/linux/alloc_tag.h |  8 +++++++-
 lib/alloc_tag.c                | 15 +++++++++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_tag.h
index 0cc9db5298c6..229068efd24c 100644
--- a/include/uapi/linux/alloc_tag.h
+++ b/include/uapi/linux/alloc_tag.h
@@ -20,6 +20,8 @@ struct allocinfo_tag {
 	char function[ALLOCINFO_STR_SIZE];
 	char filename[ALLOCINFO_STR_SIZE];
 	__u64 lineno;
+	__u64 min_size;
+	__u64 max_size;
 };
 
 struct allocinfo_counter {
@@ -39,13 +41,17 @@ enum {
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
diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
index 7ff936e15e97..98a27c302928 100644
--- a/lib/alloc_tag.c
+++ b/lib/alloc_tag.c
@@ -195,6 +195,9 @@ static int allocinfo_ioctl_get_content_id(struct seq_file *m, void __user *arg)
 
 static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter)
 {
+	struct alloc_tag *tag;
+	struct alloc_tag_counters counters;
+
 	if (!ct || !filter || !filter->mask)
 		return true;
 
@@ -214,6 +217,18 @@ static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter)
 	    ct->lineno != filter->fields.lineno)
 		return false;
 
+	if ((filter->mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) ||
+	    (filter->mask & ALLOCINFO_FILTER_MASK_MAX_SIZE)) {
+		tag = ct_to_alloc_tag(ct);
+		counters = alloc_tag_read(tag);
+		if ((filter->mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) &&
+		    counters.bytes < filter->fields.min_size)
+			return false;
+		if ((filter->mask & ALLOCINFO_FILTER_MASK_MAX_SIZE) &&
+		    counters.bytes > filter->fields.max_size)
+			return false;
+	}
+
 	return true;
 }
 
-- 
2.54.0.545.g6539524ca2-goog

