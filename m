Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AADC3672B5
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 17:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779471953; cv=none; b=OvpT0aQmDUmfSXmZEbLniKotEGuwycDln033uAFRLvIzNgSdIroXr6dM9HHNcUb6pbI/eT8sGXGjciIhuXdbzPJ8FhJZ915WAAV7L3HlyMZj/vXCifHbHTXOteEnRjhvJQjFtyl37FtExRYAO8okfdOPdbeYxHWR61hNX4LeqS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779471953; c=relaxed/simple;
	bh=aKZ5bfhVwmK5K+spCgfndMhC/1ExC+Zsl0CevB+/mtQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PYc1sX1s4jdr1rV2tMkgd4Ly62jGK5fhzeSvqoUvvGq/9093Fly3A8D+XCb88/Eu57qbd/zMLxpTrM1P6xeLM59mka79lA/oYiBrFiThaW1FwH39/jblx5p81fe3v4wWmAFWt+BGOOg4mo/NboQUKc6/92bxtONr7jHea1y89Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=grG8ABz9; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="grG8ABz9"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2ee5b73c5f2so8476382eec.0
        for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 10:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779471950; x=1780076750; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mYiP6dsX2SKN5nuRcokWCB8bypHWDNwNiF3PrVV8B9k=;
        b=grG8ABz9AyqeeegmmeY9M3Dw7UtQkYLOIBq1mEhOPDHDLn5FgcApObu2M0RMGtyP2J
         pxQNuxII3dX6koTpHKIMO8Y+GiSxPNjNnXzFC3KREaRgVkC7BBgYQTiSl0cqAPfhI8jp
         GK6hmDXwr3ag2sDp2JpTfj7uggYIdpqLyYHe+cgze4IsF0jRoiKGVImMGrQzfP/Vh5CI
         RdpRJ08tkBoD0yi8i6FJhjDUkOA+UJ4uwrM4UzGl1bcxh9sRLdisF0fz1AjwHP+8XnsN
         /aU7uWusvBEGRVbJXmQaX2L/ShgVz8OMeyAlxevbvylum3ROhjMzU4uwjLIYQL2ZZvmm
         iVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779471950; x=1780076750;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mYiP6dsX2SKN5nuRcokWCB8bypHWDNwNiF3PrVV8B9k=;
        b=m6d0RTQ0k5LVsGBpnHnvTOwQ1h3z3/AekcUeVok8zZgbyBZjDLCKcS1aXf0oBNlsbw
         7bR2yZ8tgBpi5m+J4pGC9xYKuiamfOfkJbILIk/1x48G/BdeiFnIlxc4GIGxlxiYB8iT
         xb1AhWUb2flDMFpHf3PkGhl/aWZBGIdcl3gZaY3Ks0JCSAq5i83b4KRe57SVQBeVOeOs
         WnEPaYEgD8E/1+OjxIAP9pbwpYoo/stXFGPTNoxYFoHIQxvl6nDYL692amYh6/wP2JF2
         BzraHXQf9S97pVXO/W+SYp5aMzfnBu0ci/mqjqDoGzU5VosfAxVJpPJuM+3En1jEYmmg
         K1xw==
X-Forwarded-Encrypted: i=1; AFNElJ9pYMBd2m/i8MK3pmMYzDZ6MSj/5X2AQoKENGM+OcAROXeFw2yspgL0i8SngCa77ZahRt4V7ulBE4w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm9PG44ZeNryVOqfIDdrrxxlSP8zGnmxRqfjIPDKqwwOu07Mer
	ZUfJSYXM5X9rAifGi9/xgay/nX7/Qbnbmda7IaLPRWsyiog1BuqP3Aq6JQtoAtuRs9XzWyqdI7a
	KCVpfgZ0XNTzjh2vKqx22xAmKfW2XJWeUuA==
X-Received: from dybgn40.prod.google.com ([2002:a05:7301:2528:b0:303:971a:154d])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:2c0c:b0:2da:b77a:d7a0 with SMTP id 5a478bee46e88-30448ff25bamr2480409eec.9.1779471950175;
 Fri, 22 May 2026 10:45:50 -0700 (PDT)
Date: Fri, 22 May 2026 17:45:36 +0000
In-Reply-To: <cover.1779471082.git.abhishekbapat@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1779471082.git.abhishekbapat@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <453a36b27b33b01aabf1d7d020bbbcb4acb3e12d.1779471082.git.abhishekbapat@google.com>
Subject: [PATCH v2 4/6] alloc_tag: add accuracy based filtering to ioctl
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
---
 include/uapi/linux/alloc_tag.h | 3 +++
 lib/alloc_tag.c                | 8 ++++++++
 2 files changed, 11 insertions(+)

diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_tag.h
index 45f158bee0a6..6c4c0e609cd9 100644
--- a/include/uapi/linux/alloc_tag.h
+++ b/include/uapi/linux/alloc_tag.h
@@ -20,6 +20,7 @@ struct allocinfo_tag {
 	char function[ALLOCINFO_STR_SIZE];
 	char filename[ALLOCINFO_STR_SIZE];
 	__u64 lineno;
+	__u64 inaccurate;
 };
 
 struct allocinfo_counter {
@@ -39,6 +40,7 @@ enum {
 	ALLOCINFO_FILTER_FUNCTION,
 	ALLOCINFO_FILTER_FILENAME,
 	ALLOCINFO_FILTER_LINENO,
+	ALLOCINFO_FILTER_INACCURATE,
 	ALLOCINFO_FILTER_MIN_SIZE,
 	ALLOCINFO_FILTER_MAX_SIZE,
 	__ALLOCINFO_FILTER_LAST = ALLOCINFO_FILTER_MAX_SIZE
@@ -48,6 +50,7 @@ enum {
 #define ALLOCINFO_FILTER_MASK_FUNCTION		(1 << ALLOCINFO_FILTER_FUNCTION)
 #define ALLOCINFO_FILTER_MASK_FILENAME		(1 << ALLOCINFO_FILTER_FILENAME)
 #define ALLOCINFO_FILTER_MASK_LINENO		(1 << ALLOCINFO_FILTER_LINENO)
+#define ALLOCINFO_FILTER_MASK_INACCURATE	(1 << ALLOCINFO_FILTER_INACCURATE)
 #define ALLOCINFO_FILTER_MASK_MIN_SIZE		(1 << ALLOCINFO_FILTER_MIN_SIZE)
 #define ALLOCINFO_FILTER_MASK_MAX_SIZE		(1 << ALLOCINFO_FILTER_MAX_SIZE)
 
diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
index 6c8743eead2d..b1fc14eed7f2 100644
--- a/lib/alloc_tag.c
+++ b/lib/alloc_tag.c
@@ -217,6 +217,8 @@ static int allocinfo_ioctl_get_content_id(struct seq_file *m, void __user *arg)
 static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter,
 			   struct alloc_tag_counters *counters)
 {
+	bool inaccurate;
+
 	if (!filter || !filter->mask)
 		return true;
 
@@ -239,6 +241,12 @@ static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter,
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
 		/* We assume counters is not NULL here as per caller logic */
-- 
2.54.0.746.g67dd491aae-goog

