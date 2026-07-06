Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC423F5BE4
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 18:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783362360; cv=none; b=jY9glwCwz0Qbe6xeic511AJ6X33p1nU/4xyq3yKCEbjPcv2uczg3CUctHCMUwyyXsoKfCRYYHz9MiUCmEUsa/dI24Ut6MMI4pKNBDSapKmwAAzBySro9N7H+n+A7uTxDDIMgc8wnkpe4KdzYTQUDaK1JPTqClZUn6M9IMyov27A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783362360; c=relaxed/simple;
	bh=aTgcxiStllUxnMeToPMA6xOWeh19d1I/lKlSHGcvIwA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oaUADwImyJ5O9+s6+DfUQul6D2mFG8NoZsYH0F7wtoSFpCaykVgGrPZnFDhE6q8B1cjiXrWesibdm8UpobDW8LupbJ/at1CsgQtJfkOwg3qUhWlt+WBBloRECaUONH/1mXxqb0hlNvyEHqkhDob19SuV0MPl65BOCz3fibj2HdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VmOoY1up; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VmOoY1up"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c8894570b58so2332571a12.3
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 11:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783362358; x=1783967158; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p7fUX0ZdGauLCkjWca8P4cqWqvbciuJ9Brjs9Fe390M=;
        b=VmOoY1upz7a0nBCpHZaDfXmBfcfXmPGOMOa6a7iZ4CUQTaXRJeFTJObYkGI2xtT9Jj
         jk8whI7dB+tOJ2c4EmAwAeZWxTX8Mbw7MVOP/wZtJsWNsUSDo0QEltf8BFEhD0XYRRmq
         KdgVG9EN5qXMtV1r1TtN+rBo3nWehrspycrdWF551AI3/gDRu5UcL9TY5wRyraVT+1cS
         sGpUPUkzG1SzMeNSmLow3fiFHS6GMxVfsGasIlcBxbcP3fqWbK565wlmxVbX6VTIMu21
         ZELO5cpZdfB1enuBdufKwDN+tuCBnuOeXjz9Aq72//fySxAMSGVkbAAry7R8XAjpDTvK
         4I0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783362358; x=1783967158;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p7fUX0ZdGauLCkjWca8P4cqWqvbciuJ9Brjs9Fe390M=;
        b=qFqCAispoxl7SUMwq9CrR6ve+A258ys7RpnBjHAFmtbHtkqwOtxbGoh3Fe8iwAHY9p
         nQDUhVPr3CxMlnp9EmArIBPznkr3bkvDdSnnV62SsNFezvzpigxONi0j1zWrD9t2Vs8f
         ljrxbbUZ6g9XjlaQSJAnVTPZv8OZRglyNBpsOhM6I2ovwBzxozqRkNwRML+xS5kv2Zjt
         hA17SizJ+ItpbCLI9mSsMJkbFwD/ngBul6Aov+0uWQUo3KEraKFJ8FpooKgmpR8pXtrM
         +8bqztmzjQ0RMSOU8O0SD66bMmiK8jt4ZDbbrg8242hiUPVr69x+BrRzjhQ4vxksd5lX
         FRwA==
X-Forwarded-Encrypted: i=1; AHgh+Rp1j4QiQZwAA/7Hx/OlbAMduAE6FFpkmIlh/C5J/jd7DOQ0Dvup4j4cvU8kZMccj9jXYp+SSsPkwXc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH2XuX2uIhLs6/PkRNh+5uRoM+YKZw1+HFo4HoJ0Hnu4PMOW5a
	RbebtHWVM9kHllEJ7ARhazVJE+GeaOUAfvm/SV0kNMVX0VRXmyhK8m77MPU5VedwJ0OdkmB/D4E
	lT8ahRbhkmycmopBMP4FCG16WXM2sgJNpkQ==
X-Received: from dlbqq2.prod.google.com ([2002:a05:7022:ed02:b0:138:5e8:1b36])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:d70f:b0:3bf:6c08:2b2b with SMTP id adf61e73a8af0-3c08ef2d409mr2321399637.51.1783362357729;
 Mon, 06 Jul 2026 11:25:57 -0700 (PDT)
Date: Mon,  6 Jul 2026 18:25:47 +0000
In-Reply-To: <cover.1783361692.git.abhishekbapat@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1783361692.git.abhishekbapat@google.com>
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
Message-ID: <a686bb6fb07778c8ca73ce0419f938f518f4dc17.1783361692.git.abhishekbapat@google.com>
Subject: [PATCH v7 4/6] alloc_tag: add accuracy based filtering to ioctl
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
index ad33d63ef7b4..32ac0674d8bf 100644
--- a/mm/alloc_tag.c
+++ b/mm/alloc_tag.c
@@ -249,6 +249,8 @@ static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter,
 			   struct alloc_tag_counters *counters,
 			   bool *fetched_counters)
 {
+	bool inaccurate;
+
 	if (!filter || !filter->mask)
 		return true;
 
@@ -274,6 +276,12 @@ static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter,
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
2.55.0.rc2.803.g1fd1e6609c-goog

