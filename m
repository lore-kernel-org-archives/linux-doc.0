Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A213D3329
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 15:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780501458; cv=none; b=TUQfXzP1DIfJCGr7hT2kzJbKFfqUtb+K57kGjk0H/gcKHqo6dmzvMBqw6Pszx3NzgcEfLNLoqe82LmYnYjPj+kHIBX53c+/e0xiP0da7JBY3HSgEPNHJOB2/+jLL2mTLXWO9CF4PcJ4zT65/MajnAi08tTrx2Nr6Dyqz3BvKZlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780501458; c=relaxed/simple;
	bh=IMbuGTukyT8IG40YTi+316UrswHf2CnDFbSS3RnRmnE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bQhgLiMFgqgk5/a0XsorZjL+4FKqYI4xpE7IM+ojShnmXiquML5UNSeAp7LiItN1t4UoAOhG2oEtUHpWApGwvSYrjx2QR6NW6KNTvUBjMnuP5Z3Duo0YG02gZwp3UyapTSINztE8uOe7gFZt/rxs0uX9pEAe2Luone5tfYO1i8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=DdNbKUsI; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="DdNbKUsI"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-91550dfc11fso440661685a.1
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 08:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780501456; x=1781106256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yVlCXZe8SHDSOJUkKVBaYBikNvs5G4Pkl6SfmcOaAr0=;
        b=DdNbKUsIU5cZRabA2KkMfpHsJx9+gbaLDAO2hsFZTQLwT+dPPU50h1GalJSF0s6SDJ
         vgsUSLpdZ6P62da6JT+InKSSvkZzRZ4qQiDXuEKqazYyR63P0GV/ju7Ghz08/QnOUgn4
         bLlPGJ6S2ptv4MvgK7ZMC9aSA2aIJ9quqSZtEce1SupHyqHVdYRRQ/PrX5uCavtGKAZw
         uWHU53+LUXvUqntaw/aMI6AIptwGBZn4cIz7LLJmminRZWNp09HWlJyNbEPExt4opphg
         64OQOoCwQ4I+YN4yhoMiu8wG5AqAFUL45z0htUs5iLXW37xRBLHMn4RHSSpGPdcLtk7i
         aPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780501456; x=1781106256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yVlCXZe8SHDSOJUkKVBaYBikNvs5G4Pkl6SfmcOaAr0=;
        b=p92Dlr1dVasscA0ceIKKe8AD6X/pqH+v3X8qoMtF3Km6337z0wbm4vNB0yBz6swjJ0
         DDTqK5gUhQkuxCUS7pjgp1IWBgNCqwfElEFwHpO893AXr8Zbb2Fp2Zqj32mKSqJrnvp1
         TzdEXXUhXarB4Iw7OfPoOp+WRRbzSkmiL2n5C5uXwrjJPN3Xhqh/QiJLF7cf9VjuSrIP
         4p67pLSyXJk+imQ+5rIPPISYtzdSmxud9Z4Qvig4ql59aeE4dN9SOgeMJjVPURqpYBJg
         5FEKfMBrdl+EGiH9nKjAJ8uUlVQ+74B8/0O3P7qAdXGlMZLTrgMFSguIk1/IvGoiYMjG
         rlxg==
X-Forwarded-Encrypted: i=1; AFNElJ/PdvGDfkP/vV+CX+YGN9pJUOA8MdjYclTKnO+Yn+ba73J92y49FOk2SSrP0ylFlOIVgBCQVb7hLog=@vger.kernel.org
X-Gm-Message-State: AOJu0YypA6ERXqhRPP3UxEJTZpgoOVfRDFqGcKFg3qWYm/WMhuokQT+M
	IVRrwfjxXc2CRZ9Afak2Pj/QmhzzVWkbaGMfgNBZ+J7MRknPudD1ZJ1BpKMm0BHO/GE=
X-Gm-Gg: Acq92OE30pGy6u+BzHxR0dlyGoJ1akKVk5zg3v+1zlkxSqwzAVh2Xzef0gzBaRPd48/
	HXInnyPC9BljDLf0qgYYjmnGiDDvtmTmfdNTzx8dC77zH3b1/W6wB+u/5GjCAylEzLweRrTGfNa
	5XaVfMB4f1E7wShUfx5YmvrgaR8zdf2yR/GV7zG1lmmEfhnKH/NxxyEfQBjvpzr0JobO3AHSQOg
	zX1RcWL9mRbCWkuc/4o2eQ08WgNgI67Uw7chscEWhqdPMeURn7Yr7vU2i9X1f8HUyRATl7PkPwU
	ZX8w9fpl3qa1tfJhoYKrtXCICIaZlOoS0SNTtOP/sWiM4n3eoloAxzPpFj7AXnlXQfqwA2qzjx8
	J6E5lkjf4Ibzah08IntJ/1sqfIGhwC6J8xemhbN0mfqjUJ+KBWCmjw/2s8vberVs39cK/e2Fy9c
	3oD55AHWv2eT6Ppco+Cksvln/nS+DChKqjipGuLl4WHF2eYwtu5poID6WVF72F6g==
X-Received: by 2002:a05:620a:2890:b0:915:6cab:768e with SMTP id af79cd13be357-9158a849a62mr658252485a.60.1780501455872;
        Wed, 03 Jun 2026 08:44:15 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a40d566sm266574585a.47.2026.06.03.08.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:44:15 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	skhawaja@google.com,
	graf@amazon.com
Subject: [PATCH v7 01/13] liveupdate: change file_set->count type to u64 for type safety
Date: Wed,  3 Jun 2026 15:43:50 +0000
Message-ID: <20260603154402.468928-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260603154402.468928-1-pasha.tatashin@soleen.com>
References: <20260603154402.468928-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This improves type safety and aligns the in-memory file_set->count with
the serialized count type. It avoids potential truncation or sign
conversion mismatch issues.

Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index dd53d4a7277e..ae58206f14ac 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -52,7 +52,7 @@ static inline int luo_ucmd_respond(struct luo_ucmd *ucmd,
 struct luo_file_set {
 	struct list_head files_list;
 	struct luo_file_ser *files;
-	long count;
+	u64 count;
 };
 
 /**
-- 
2.53.0

