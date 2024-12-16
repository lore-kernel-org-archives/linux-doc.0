Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B243720C022
	for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 19:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734377085; cv=none; b=NV3kR/BoLsuZhs81WMxAjo6Yt9ee1Mf4o4TYGv2T/+LlMeS9AezpCHQWmcL+XQ49MBgtUvG2rHgDcQdiqmIx4zK47TOWpyK8k3Z9Ttxm/gHwfCaZR69E3HIQ4RbeOsuFQsmd18hC9RFbUK9e3Z17GvRBJh9FSvUNHHyFpaTTQgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734377085; c=relaxed/simple;
	bh=slEyDSyOmggj5mJJINjjr/YocKsmeusN6XkbngdxcOw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OC4HzmBDDVuqIcVyejeer+6ldAEQA0sFmb/Ng8dzAmMnlBckq7zSxBQA8ePw6jTJxL1uB+tt0WPzbVXpXSzZsc4Wl+mcEA4LSaEKaA8JFeb3i9wdUyhWPZINfmURkCjY/3lVC/+9Lied3IVi9CzJ0tReEnIuZnoQUzWLdoIfku4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G1zLWh1U; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G1zLWh1U"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ef9b9981f1so6675915a91.3
        for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 11:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734377082; x=1734981882; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PJyEpzu4DU8rJRmq3ow3hqlNy2LMWwwp3HWnjTLdNPo=;
        b=G1zLWh1UH/CfwHm+0Ij2DjpAsoptAMaKm7hv7WFaV6EcwkIrLbnQEWiMPvN3afu7VA
         9rCE8H3PJIDq5Llbc5WxDZeHMwBMkKA6weIARvQVeoAdYmil13sM8IUGu2u6/2oqYQUN
         1S5uvbOT/CoIgu7bwBFL6QWGB1pRnPbBNWvrN4KBQqHHa6L1lHxyNNtmGAYw3h19wkTk
         T+EsMGfMvpXuVlL+b+Rv+21hRhi0LD84U5jFFDMWTx5Pa4LHYCUdAuaf0Lrw+iIanW3x
         bk9mZMOHCMvmir4CDf3QV7rTp4XsEhtI/Qcu/55Q2+yx0aHDY0WcI4JuVuyvwND2stA4
         Mxpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734377082; x=1734981882;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PJyEpzu4DU8rJRmq3ow3hqlNy2LMWwwp3HWnjTLdNPo=;
        b=tXwJOmTl2CyGWOBE2vmEcSwYExEYsSm4OpdvD7+WOfAdG1HRxYHFf+SZpJmYuETsHH
         bU8eRRV2kQh/xsh56Po73gUdZrirJpwWI9qoNXYkeviIbnN7rK8yVVDGOnjzlUGmdYIV
         d1VnJSAfDF8VP6In445OoaSzIEw9p7VH0hsUBgyhMU1f5ar7Af0ZIFj6S9fPmPRkTIxr
         fpqDLqLvaR2D4XH1RRY6kFpw/YtPNVD2CvTUQrC7QefIksC2O32rwTi0X9fe2lmb0hPz
         4BkMu4igaLp0toVzFGV3D3JujKWkq+gwo62C85ktuyFqaocEnTsvf88o8jXDFu2QuP8e
         baGA==
X-Forwarded-Encrypted: i=1; AJvYcCUxqeJigAcv9WABFl5YMYOnHNlgxB1nEi3ZaruZx8/+uw4KepSjhe3Ez6Wu1gP+NyYtuMarsdFljRk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj+2u1rJA+CN5kn/+ArYDFQX1BJNBy8RPlwQWPlqE0YvMpchL8
	jtfZAOyNiAKhs5ALKhK1gl7umAuWS4UsQq92ZbFCvOJlKZEpTBDw3tp6L8U4qPpK6gJXDQ4Q7yh
	ahQ==
X-Google-Smtp-Source: AGHT+IGSC/WDrL2DnP38qBt3Yi0DRZx0zLMWebStlpO2MkkwMeYlYALEb8oRG5sXg1v7sD7oiSjMQ3XiMF4=
X-Received: from pjboi16.prod.google.com ([2002:a17:90b:3a10:b0:2e2:9021:cf53])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c4a:b0:2ee:7233:4e8c
 with SMTP id 98e67ed59e1d1-2f28fb522d7mr20621018a91.8.1734377082197; Mon, 16
 Dec 2024 11:24:42 -0800 (PST)
Date: Mon, 16 Dec 2024 11:24:12 -0800
In-Reply-To: <20241216192419.2970941-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241216192419.2970941-1-surenb@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241216192419.2970941-10-surenb@google.com>
Subject: [PATCH v6 09/16] refcount: introduce __refcount_{add|inc}_not_zero_limited
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	surenb@google.com
Content-Type: text/plain; charset="UTF-8"

Introduce functions to increase refcount but with a top limit above
which they will fail to increase. Setting the limit to 0 indicates
no limit.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/refcount.h | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/include/linux/refcount.h b/include/linux/refcount.h
index 35f039ecb272..e51a49179307 100644
--- a/include/linux/refcount.h
+++ b/include/linux/refcount.h
@@ -137,13 +137,19 @@ static inline unsigned int refcount_read(const refcount_t *r)
 }
 
 static inline __must_check __signed_wrap
-bool __refcount_add_not_zero(int i, refcount_t *r, int *oldp)
+bool __refcount_add_not_zero_limited(int i, refcount_t *r, int *oldp,
+				     int limit)
 {
 	int old = refcount_read(r);
 
 	do {
 		if (!old)
 			break;
+		if (limit && old + i > limit) {
+			if (oldp)
+				*oldp = old;
+			return false;
+		}
 	} while (!atomic_try_cmpxchg_relaxed(&r->refs, &old, old + i));
 
 	if (oldp)
@@ -155,6 +161,12 @@ bool __refcount_add_not_zero(int i, refcount_t *r, int *oldp)
 	return old;
 }
 
+static inline __must_check __signed_wrap
+bool __refcount_add_not_zero(int i, refcount_t *r, int *oldp)
+{
+	return __refcount_add_not_zero_limited(i, r, oldp, 0);
+}
+
 /**
  * refcount_add_not_zero - add a value to a refcount unless it is 0
  * @i: the value to add to the refcount
@@ -213,6 +225,12 @@ static inline void refcount_add(int i, refcount_t *r)
 	__refcount_add(i, r, NULL);
 }
 
+static inline __must_check bool __refcount_inc_not_zero_limited(refcount_t *r,
+								int *oldp, int limit)
+{
+	return __refcount_add_not_zero_limited(1, r, oldp, limit);
+}
+
 static inline __must_check bool __refcount_inc_not_zero(refcount_t *r, int *oldp)
 {
 	return __refcount_add_not_zero(1, r, oldp);
-- 
2.47.1.613.gc27f4b7a9f-goog

