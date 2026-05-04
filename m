Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BC83E6387
	for <linux-doc@vger.kernel.org>; Mon,  4 May 2026 23:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777937804; cv=none; b=tcDffcmk7OMD+DyScXSoq3ZeaBpjIboqTOSIkhk43mO8SzqLAlZIB+oCbdQIaQ4eHUaY/MUiu1eInEay7nPEvudt/upQ/zIk0vNLkR3lSxaGVF1NppVSBUQRFhK/xPqhSOhsS8RWafBCzcwhd0SsjGAvPcLLUqrg/XF03lA0daw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777937804; c=relaxed/simple;
	bh=51JYkKcoObz7U76H6J2lOAG7KYNGj04Z1Oio5sQiOrU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=anYwFIWbp/CW+SBXu2tf/b3tfJTH7zJ/vrwfx5rkofuJYpBMAWT1gQydlfc+NZZEdUhk6CezWxf1KirbAtFYHHd8pA9mAwRqstZn0GXfcVRNsQ/Qe5OEwrukS0Y75sqPbZPin5kIQID5obbtEg+jhRmsk5NW9bffYBZdiChEm4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AEQsM+q4; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AEQsM+q4"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2cc75e79b97so9759183eec.1
        for <linux-doc@vger.kernel.org>; Mon, 04 May 2026 16:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777937798; x=1778542598; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vwKDNFxCHplCHNXs9frgTkD+bqZx+jlVLXfcJGvps6s=;
        b=AEQsM+q4cmutv44ucAjZX6g4c5L/PmpPXzUh0Ddqs1/Mav0Ar7UF1y11nKAe2QDYaW
         tMQW03grecKTFhhrvUvuATUriBbIlUByNp9hpm5BUd2aaX+b4U1gcD4MXDGrFFXlQnQ+
         VxvLTm3iGzEAH0Kj+Nrn5xfljEyvWDhdjtr9OrWEyvOc4YBycKGVvgOWufeV0qnRq3fR
         gpypXAJKNt1vXcejElyzItzSPR1PuorFE4c4erd3HgF8BRGyyaA2dmjF5AeeaH0Co3/y
         Au2KC01XRUrkudXVL16YaGikRSssHpmi17OLYs5b+pNDeV4luq87cVWXBJDa2mZCGvEt
         COhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777937798; x=1778542598;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vwKDNFxCHplCHNXs9frgTkD+bqZx+jlVLXfcJGvps6s=;
        b=Qkgujl8TejQSD9pFgIDWthkwwvNv+MgvzfTeWoaDwKv6w9xD/htlJzOT8wco29tn+i
         18Oior1ez7lpm2gCTuh2FsbOFqqIt9kdkliPe3qzKZQ2CRiVkLFnkKyVgQsPBtAHr4Ck
         V8eioTiCt8UZGB+GuHqzeoBmem6eSy5eCEZcjyj0H+k4jF9aIW1JC8W0AzBZQhfL5POP
         QVaMbBkOP8DCtStHAl2gUiHY0OoKSyhShjqwaJkPfN32qz7rR5BPdyQvHFBDlFnNboEb
         1oqEU1COpRfhQmR7TBZ2T7P6aZYsAG1N4zUqD7bC0QhhkK4BCeJ4m/hXCS+kjUE2g3ry
         saDA==
X-Forwarded-Encrypted: i=1; AFNElJ/+nNBDAfvfDS6GxhG6ioITgaqwGLm6i5gb7bEYNdkjJfu4odvDUFbPkin/QZsyPd9uxxGzD7avwy8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYI5hnqy552UAdtb6f9DkakVqOsUQIkaKWIhBC/42DdBLyKzl8
	nNuI1wxzb4yjkg1XMuVX+KTpdUgi78NgLl0joS6+ylY0Mzxf7nzuQJXV35Yjuu4bgsl+VAojPhA
	Mg7nms1TzTc+4dNw6FznZOzSFKXoIb3ZHMg==
X-Received: from dyctt4.prod.google.com ([2002:a05:693c:3e44:b0:2f1:5dbf:fd4e])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:fe0b:b0:2e0:4edd:64e4 with SMTP id 5a478bee46e88-2efba178867mr6138179eec.26.1777937797656;
 Mon, 04 May 2026 16:36:37 -0700 (PDT)
Date: Mon,  4 May 2026 23:36:22 +0000
In-Reply-To: <cover.1777936301.git.abhishekbapat@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1777936301.git.abhishekbapat@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <3d6ba4a1b49489b8138a4736704fccb9ed00bef3.1777936301.git.abhishekbapat@google.com>
Subject: [PATCH 4/6] alloc_tag: add accuracy based filtering to ioctl
From: Abhishek Bapat <abhishekbapat@google.com>
To: Suren Baghdasaryan <surenb@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Sourav Panda <souravpanda@google.com>, Abhishek Bapat <abhishekbapat@google.com>
Content-Type: text/plain; charset="UTF-8"

Extend the allocinfo filtering mechanism to allow users to filter tags
based on their accuracy.

Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
---
 include/uapi/linux/alloc_tag.h | 3 +++
 lib/alloc_tag.c                | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_tag.h
index 229068efd24c..99dfe951b185 100644
--- a/include/uapi/linux/alloc_tag.h
+++ b/include/uapi/linux/alloc_tag.h
@@ -20,6 +20,7 @@ struct allocinfo_tag {
 	char function[ALLOCINFO_STR_SIZE];
 	char filename[ALLOCINFO_STR_SIZE];
 	__u64 lineno;
+	__u64 inaccurate;
 	__u64 min_size;
 	__u64 max_size;
 };
@@ -41,6 +42,7 @@ enum {
 	ALLOCINFO_FILTER_FUNCTION,
 	ALLOCINFO_FILTER_FILENAME,
 	ALLOCINFO_FILTER_LINENO,
+	ALLOCINFO_FILTER_INACCURATE,
 	ALLOCINFO_FILTER_MIN_SIZE,
 	ALLOCINFO_FILTER_MAX_SIZE,
 	__ALLOCINFO_FILTER_LAST = ALLOCINFO_FILTER_MAX_SIZE
@@ -50,6 +52,7 @@ enum {
 #define ALLOCINFO_FILTER_MASK_FUNCTION		(1 << ALLOCINFO_FILTER_FUNCTION)
 #define ALLOCINFO_FILTER_MASK_FILENAME		(1 << ALLOCINFO_FILTER_FILENAME)
 #define ALLOCINFO_FILTER_MASK_LINENO		(1 << ALLOCINFO_FILTER_LINENO)
+#define ALLOCINFO_FILTER_MASK_INACCURATE	(1 << ALLOCINFO_FILTER_INACCURATE)
 #define ALLOCINFO_FILTER_MASK_MIN_SIZE		(1 << ALLOCINFO_FILTER_MIN_SIZE)
 #define ALLOCINFO_FILTER_MASK_MAX_SIZE		(1 << ALLOCINFO_FILTER_MAX_SIZE)
 
diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
index 98a27c302928..576ecb3c5b6c 100644
--- a/lib/alloc_tag.c
+++ b/lib/alloc_tag.c
@@ -197,6 +197,7 @@ static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter)
 {
 	struct alloc_tag *tag;
 	struct alloc_tag_counters counters;
+	bool inaccurate;
 
 	if (!ct || !filter || !filter->mask)
 		return true;
@@ -217,6 +218,12 @@ static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter)
 	    ct->lineno != filter->fields.lineno)
 		return false;
 
+	if (filter->mask & ALLOCINFO_FILTER_MASK_INACCURATE) {
+		inaccurate = !!(ct->flags & CODETAG_FLAG_INACCURATE);
+		if (inaccurate != filter->fields.inaccurate)
+			return false;
+	}
+
 	if ((filter->mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) ||
 	    (filter->mask & ALLOCINFO_FILTER_MASK_MAX_SIZE)) {
 		tag = ct_to_alloc_tag(ct);
-- 
2.54.0.545.g6539524ca2-goog

