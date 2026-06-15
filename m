Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843BF3BED63
	for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 23:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781564681; cv=none; b=YCnu9D4xue5NSJ0qbPfxpONbr2iYbDaF2G3MD7scEZPY6th+UD0I0yjLoxciVx1sApiEDP9LzfcLtRicSeSz5qcBQenLIt6KfH03Q4JrH9/Dfi3z3qfYFiAkZshulcu6jYoJDf70zHw11N/HD6YP3Sj87GcOHg5MPL6nRKkobiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781564681; c=relaxed/simple;
	bh=kuibJ/6eINoKGnNL23MvnyqUGQeXGmHr6GAaRbAvchE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=t4DLqfmHGiPHJck43J9At1aRcGLftU6uO31JazsHQ6k5tJxr+dzldm/N+7+UApzccIzMHWHh1WiK3Q4ouZj8/KMJByA83h/96YPO+7/V9KwbG0xoHAaQL8yk5W/aZ+sdvi2SkBnjp7mtRnq09GzszRWkHnAyGSVgE216NkVvEYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=krD7uSrY; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="krD7uSrY"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-307625ee07fso13566276eec.1
        for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 16:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781564680; x=1782169480; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4v2TgaNjzfY61VnQYb+HVVoB+/6c3jWQINhLisvV9mg=;
        b=krD7uSrYPRtiW/2OT/aWGeDSWBwor584oI5ANOwAtWbTeThGz8rP+N8icnCElGPbnZ
         Geo1xbgstXd7dt1hmrTps1UehmJ4yLYxLtSqPZ3r5XwTwXwDT8qkhQT1BAkOjXNrBABm
         bzwpYXn31JGcQRalZ+ze4f0hgLNF+gjmF0V1WppemZHBCAKNcfw3fMwNTF2zg8VGdizR
         jjRhcY+1kEaR8f1hmFAk+nX81jS0TcwvdlerPw9poxqxJXpM2bq+ztaJvHcCj+U9SgPz
         SMNQlAa423ZBcX8S/K4HPBE2Lzu1K7/4YQ1DidsOgACQ09lLlPDCWk8WPRfJ+FXU7GwP
         v8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781564680; x=1782169480;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4v2TgaNjzfY61VnQYb+HVVoB+/6c3jWQINhLisvV9mg=;
        b=Y3GyHyhz1XpNLxBGHBK6oBzDOshhxJpvzyR2F12CXIhhmsd9Nf6wgjJHXlLkPhrG7w
         wJ+NrQpHy+bfq1GAy2/Rku/8hIiBi1i/REDLtl3whtMgJ8fu9SBScjS+TGNCP9/isoRY
         UV8yPgz27dVcl7YyDA4VtVDmLfqPs+wV52gEEVDlRrly/gTQXzLbLMvl0LecKWQI2yTP
         vZvNBC9a2wTOBECQm0/XHLYfNssvBjyAR+Q4rPRDEwM/+Xg19BN5QXhsL7drYX+EBAx8
         Gf2QOYubYzxRGmfYT78/zxGadg8mMVosuL+cn4tm6xEgQA+RZKzSebW1nOtwofx9pVJW
         V8Cw==
X-Forwarded-Encrypted: i=1; AFNElJ/Mw8cDOYSc3Ud647WD7OQSZ5WFBDCXSZH77gue7/Cun6ggC9FzptxVMCaN90WMS0H50MOHGfofqAo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwwxMRs7NY5XChzi9N3nAiKxpnwcyZacfl1jFwwD7IRQ9XHruB
	P6MLszzp8I2Lah5uzKN1E/WPT9b3hK7Ing+6igokYOmbwE53Pzs8alwG1BeVB4Fu+vfsBg7+EZt
	L1kYVDNMdrCab6WJoXPrjvaLS7aBwrFRqCg==
X-Received: from dybli9.prod.google.com ([2002:a05:7301:1289:b0:304:d169:68d5])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:2148:b0:2f5:5dd3:1fcf with SMTP id 5a478bee46e88-3081ff97b78mr10831246eec.10.1781564679248;
 Mon, 15 Jun 2026 16:04:39 -0700 (PDT)
Date: Mon, 15 Jun 2026 23:04:29 +0000
In-Reply-To: <cover.1781564384.git.abhishekbapat@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1781564384.git.abhishekbapat@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <db41f6b4a1ec7429be79b3b342f1ac8cf1300e72.1781564384.git.abhishekbapat@google.com>
Subject: [PATCH v5 4/6] alloc_tag: add accuracy based filtering to ioctl
From: Abhishek Bapat <abhishekbapat@google.com>
To: Suren Baghdasaryan <surenb@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Hao Ge <hao.ge@linux.dev>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Sourav Panda <souravpanda@google.com>, Abhishek Bapat <abhishekbapat@google.com>
Content-Type: text/plain; charset="UTF-8"

Extend the allocinfo filtering mechanism to allow users to filter tags
based on their accuracy.

Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
Acked-by: Hao Ge <hao.ge@linux.dev>
---
 include/uapi/linux/alloc_tag.h | 4 ++++
 lib/alloc_tag.c                | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_tag.h
index 7f5acbb44c14..6ea39c4869fe 100644
--- a/include/uapi/linux/alloc_tag.h
+++ b/include/uapi/linux/alloc_tag.h
@@ -26,6 +26,8 @@ struct allocinfo_tag {
 	char function[ALLOCINFO_STR_SIZE];
 	char filename[ALLOCINFO_STR_SIZE];
 	__u64 lineno;
+	/* filter criteria only; see allocinfo_counter.accurate for actual accuracy */
+	__u64 inaccurate;
 };
 
 /* The alignment ensures 32-bit compatible interfaces are not broken */
@@ -45,6 +47,7 @@ enum {
 	ALLOCINFO_FILTER_FUNCTION,
 	ALLOCINFO_FILTER_FILENAME,
 	ALLOCINFO_FILTER_LINENO,
+	ALLOCINFO_FILTER_INACCURATE,
 	ALLOCINFO_FILTER_MIN_SIZE,
 	ALLOCINFO_FILTER_MAX_SIZE,
 	__ALLOCINFO_FILTER_LAST = ALLOCINFO_FILTER_MAX_SIZE
@@ -54,6 +57,7 @@ enum {
 #define ALLOCINFO_FILTER_MASK_FUNCTION		(1 << ALLOCINFO_FILTER_FUNCTION)
 #define ALLOCINFO_FILTER_MASK_FILENAME		(1 << ALLOCINFO_FILTER_FILENAME)
 #define ALLOCINFO_FILTER_MASK_LINENO		(1 << ALLOCINFO_FILTER_LINENO)
+#define ALLOCINFO_FILTER_MASK_INACCURATE	(1 << ALLOCINFO_FILTER_INACCURATE)
 #define ALLOCINFO_FILTER_MASK_MIN_SIZE		(1 << ALLOCINFO_FILTER_MIN_SIZE)
 #define ALLOCINFO_FILTER_MASK_MAX_SIZE		(1 << ALLOCINFO_FILTER_MAX_SIZE)
 
diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
index b3d21834b61e..4fb3653cb876 100644
--- a/lib/alloc_tag.c
+++ b/lib/alloc_tag.c
@@ -253,6 +253,8 @@ static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter,
 			   struct alloc_tag_counters *counters,
 			   bool *fetched_counters)
 {
+	bool inaccurate;
+
 	if (!filter || !filter->mask)
 		return true;
 
@@ -278,6 +280,12 @@ static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter,
 	    ct->lineno != filter->fields.lineno)
 		return false;
 
+	if (filter->mask & ALLOCINFO_FILTER_MASK_INACCURATE) {
+		inaccurate = !!(ct->flags & CODETAG_FLAG_INACCURATE);
+		if (inaccurate != !!(filter->fields.inaccurate))
+			return false;
+	}
+
 	if (filter->mask & (ALLOCINFO_FILTER_MASK_MIN_SIZE | ALLOCINFO_FILTER_MASK_MAX_SIZE)) {
 		if (!*fetched_counters) {
 			*counters = allocinfo_prefetch_counters(ct);
-- 
2.54.0.1136.gdb2ca164c4-goog

