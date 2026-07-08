Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FCF3BBFAF
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 18:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783533695; cv=none; b=HW9IuKxLRiV+qeHP8i0Em8kNt+xdQVGmLiyO51Jl0JpIdgtY4klnnLO9uMbRmwhcKE/uLGv01rPljM5DtNzm9a7dz9dWZmKyJU2J6AI07c0+SM+0eV/NEpqL8l4Y/JO9I+WDBOW7wL6xCteWeN215IpFwgeOd5Hk35aw6KnAdlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783533695; c=relaxed/simple;
	bh=N1S8GOpNY9rJIvCjWYzyBQXGCCBEGOD6GmjSrRHajy0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=otkORKBQtVRqxfzKW8sJFv0EFMm7/+1bqHK2MRylowb5gMt65K4KV3IRDzrT0W0IwySXYr3CfI0+RTcMjHi0qdx/W8BE4I+BbDPzoFYWf9lBzSdLs/zmVRXDQrMzGNcbtLaKN2WUH/oLk91T33sBJruHcmnCGSyy1UlBEytlTok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nBE7jnVJ; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nBE7jnVJ"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-38827cee19eso126037a91.3
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 11:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783533694; x=1784138494; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NLJpSpD1IM/2/PSTnk3FZM0FGzokCq3B5xO8uzDBMuw=;
        b=nBE7jnVJvGBh5INb3uVEgCyAmwOI1l0e0ZZKc5psWcBvYS68bhetmL3hHvy8CwaKOP
         1yyW7AtTNh0hf1os0gH8hF73fU0yP7P0BmyTU3oywWaovFVPmW9lXoHeCo54wpFsQfCi
         ydXqXFz9QbHLNyLOdHHQ20veLkBRrh9I+9JSz4JWAmJ8LahaS6lZew9PBKayqqpgP9QI
         dUzepWCnuS5xJs8wE0rpdLKljQW1qkaiuzplpSwGESVnLqMM9pr03aCRlFizR33Al2pR
         It3pJ+s00/Hu1/a57wit1O697MQqYpChULp8cFEvc4GooFOBX03H5ciPro+FPEhJuWO5
         TS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783533694; x=1784138494;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NLJpSpD1IM/2/PSTnk3FZM0FGzokCq3B5xO8uzDBMuw=;
        b=FfkNzFSyBu1HwknNBQ79wWOOrZ9DYCwhs14CdHF0bbBpBIlNVNX4lX5HjvUFlBkiQF
         OnJNR66hFZJEOFdRXvn4jWQWimq06EO9i76Y8kRFgiI6R2AT7+JUw3hDSJcMDrC8cNIw
         Txanw158Ge1DwOm/XCxfGwCvdNPqxPB5uaT+M7GxOzPwK95zmoRO8/Oung3K/B+/FnlP
         CJMlxKpkLmLiNNK57aResK7Ji+kKImI9M3rseyGRBQdIjeE1gH1PPuSjO5gV+nabFpQd
         OgMlviZuBJyBsXUHHb5N+emvCE4X0ND6E3uQBiekvhgsTPcKs2wPAfbdx49bC6MQzILK
         1yRg==
X-Forwarded-Encrypted: i=1; AHgh+RrfbNgIDCFd7ZknwNFhoe1tYpBL7dZ/NpueNq1C2Wb1mtk0NEhzwtPm9A6w25kQCHoyCMJbbb0Gufk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTMqPn3GHOKkZPx3AWDURAOcQs8xFt9TRw4X8CbiE9qj9laOgH
	lUneWeo5uHz8XNJxIVGQlLF+iawoQKtCZ1rV5yLG+68kfkPBEJJIUF95ZImAQU3skx0F1QAJDzi
	1HBAneUUzh3+gZ5SU8UCBkh7w2xRzlsKa+Q==
X-Received: from dybgs35.prod.google.com ([2002:a05:7301:20a3:b0:2f9:af7:504e])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:41:b0:381:2684:519c with SMTP id 98e67ed59e1d1-3893f694d9dmr3449270a91.6.1783533693427;
 Wed, 08 Jul 2026 11:01:33 -0700 (PDT)
Date: Wed,  8 Jul 2026 18:01:26 +0000
In-Reply-To: <cover.1783532853.git.abhishekbapat@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1783532853.git.abhishekbapat@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <396a5e4bc3b2990223ab355f2cd3ceb6aa15499e.1783532853.git.abhishekbapat@google.com>
Subject: [PATCH v8 4/6] alloc_tag: add accuracy based filtering to ioctl
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
Acked-by: Suren Baghdasaryan <surenb@google.com>
---
 include/uapi/linux/alloc_tag.h | 4 ++++
 mm/alloc_tag.c                 | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_tag.h
index 0de5fc180790..270f693b1822 100644
--- a/include/uapi/linux/alloc_tag.h
+++ b/include/uapi/linux/alloc_tag.h
@@ -31,6 +31,8 @@ struct allocinfo_tag {
 	char function[ALLOCINFO_STR_SIZE];
 	char filename[ALLOCINFO_STR_SIZE];
 	__u64 lineno;
+	/* filter criteria only; see allocinfo_counter.accurate for actual accuracy */
+	__u64 inaccurate;
 };
 
 /* The alignment ensures 32-bit compatible interfaces are not broken */
@@ -50,6 +52,7 @@ enum {
 	ALLOCINFO_FILTER_FUNCTION,
 	ALLOCINFO_FILTER_FILENAME,
 	ALLOCINFO_FILTER_LINENO,
+	ALLOCINFO_FILTER_INACCURATE,
 	ALLOCINFO_FILTER_MIN_SIZE,
 	ALLOCINFO_FILTER_MAX_SIZE,
 	__ALLOCINFO_FILTER_LAST = ALLOCINFO_FILTER_MAX_SIZE
@@ -59,6 +62,7 @@ enum {
 #define ALLOCINFO_FILTER_MASK_FUNCTION		(1 << ALLOCINFO_FILTER_FUNCTION)
 #define ALLOCINFO_FILTER_MASK_FILENAME		(1 << ALLOCINFO_FILTER_FILENAME)
 #define ALLOCINFO_FILTER_MASK_LINENO		(1 << ALLOCINFO_FILTER_LINENO)
+#define ALLOCINFO_FILTER_MASK_INACCURATE	(1 << ALLOCINFO_FILTER_INACCURATE)
 #define ALLOCINFO_FILTER_MASK_MIN_SIZE		(1 << ALLOCINFO_FILTER_MIN_SIZE)
 #define ALLOCINFO_FILTER_MASK_MAX_SIZE		(1 << ALLOCINFO_FILTER_MAX_SIZE)
 
diff --git a/mm/alloc_tag.c b/mm/alloc_tag.c
index 27aa47c4c1cc..2c819fa9eafa 100644
--- a/mm/alloc_tag.c
+++ b/mm/alloc_tag.c
@@ -252,6 +252,8 @@ static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter,
 			   struct alloc_tag_counters *counters,
 			   bool *fetched_counters)
 {
+	bool inaccurate;
+
 	if (!filter || !filter->mask)
 		return true;
 
@@ -277,6 +279,12 @@ static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter,
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
2.55.0.795.g602f6c329a-goog

