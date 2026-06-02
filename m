Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8275E33AD81
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 03:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370242; cv=none; b=O9ssVBLPhOL+NtXmLW1pXMRn9u8T+bekTDnKqikNkxOLp+zSqKBWnmxkCW1rB2K6WbqEJNYI7RECQKfw8mLFtRAOpqS4nnbglDhg4M/MJgxyPvtZOc6rpKGrXAuBcnILljM/bJmTGU7pI6TeTGewIrFIYinBf7JTPWER1FXCEfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370242; c=relaxed/simple;
	bh=iLcdCc0te5fqBZzAelrcWbzlLEUfrhfSCvMibuoqogY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dAR+OZ3jt/E+qsHJxHyN1MgnTDAWf4hwz1M6jeos67CZMRs/O7qyzaymXq42/c/6z7550ujOgd2L3nQWLADacveTetkkuNmw7eybcq4ulENdaMRwQqRt5qjZ1GMfPHxcQ7JWRhfpZC5TbiPfbA8TxTss/T0/97KzGtCb7vmfTCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=B7dKe+we; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="B7dKe+we"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51749ff0a97so17963501cf.0
        for <linux-doc@vger.kernel.org>; Mon, 01 Jun 2026 20:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780370240; x=1780975040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=57XHE07VPesg/638uO62i0q1esIWZpU9ZAzOqv5wFOw=;
        b=B7dKe+wemC9eOcrpQ48Ze1TDlRVjIA8tbs8n/SNsel1eg8SZwWYR6ToQxp7CzhYFGs
         urR+XeArtQEjq5eXFph/aEMCqELs6Rg9jnO/RkeyPP7ld4pJ/fKHxWXZCJsqnZAOLByz
         bmshjpimuJYCgjot2OVq+Gbe4s6pOPqPDKwd99cWkLvTWNZ52CPaZDgu4aM+3cTe4DO/
         Nfhb0FYf1bR4IcV3UzgYgN+wXhm4Gs95B5tgWgoH7faOB5wgyhwrnj5KXxcdRR7K8UvS
         JkK3JlvMwiCkCKs+HMMmAQok9pq2Md2JLkI5KUlR7zSDdh61IoWk7axZZ6XqTGluxnyl
         HWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780370240; x=1780975040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=57XHE07VPesg/638uO62i0q1esIWZpU9ZAzOqv5wFOw=;
        b=V2VuwcMWD4En1xXvxB/Y6BRhdyYn5ci/wytPrHa/kNK+mHj739DeBZ9yoO8vEUdRxh
         NJLok7d24Fi5JeGvC+bQgg+8GvNUOV6oN7WqgNBeDLJM8JhoMHawKkyqJ3QdkCtKCbfa
         afgJF6+9uLdK5YwOmE4ltKq0OpMjZ0X4ApskZH2+BtnRv9UxGMJrfQy7R0JspYgtLPwR
         QkyU7+Se2BXLxN+tNBFiC92oVfJFFFEu2+PK9O9F0P2heTtZsarkpbzLLhOIHCXIv+Mm
         WdeX+aiE8zDjzxT4b0kV2Gr1riwEvx0g9376RxaKEEP5L0j4+YBBO6ptePt9NU/AcR9Z
         xEvg==
X-Forwarded-Encrypted: i=1; AFNElJ95hVMsFfax00FxUmM3XIs1MzJDlchdfp+wijoqMffqOAfVgQarTsE2Cj1C06wGYYsyau7KuTxVIb0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMJTjomoCli5Etdlu+RiQIdK9gfCf93fsTkcRNIFoqKrTbukV1
	J1aqebWlRfMoVBVlYvm7QcPdbZPEEdaghqZyvaZZSlw3g17kfs3uUbxMvIkDq8YiG/o=
X-Gm-Gg: Acq92OFEUlBuCBnS0MqpVosv4Z/07FDxSPJWz94xcT6h4YBK4VWc+Q8toeqrokcQYi6
	5D/vpzUPYz007EkgnAtBAgfF+0v0uoMtZs6IvmIEOt3Ci4Bg+SnQM8ZK2vG16I6ZaUtH4UxUjMs
	BFLaK5dyMv2/ndblx8PKxa9l765/NUMQEBztFTuuC0eM9JFo+fiXZHpMKIxtpLPNynwHvnRSx1N
	2AUylbdDOnJawQZhLpD1+Mvyg+95Fmx6akdGxxxftiEKNsAK4yu4BjN6PuornG7x8NTJvhsN0vo
	Byl5ej5MYVof2v0M815NTL2Ox8y8mR176uGwBY0Ju4H/Ww17kU4IdYKBIaXi5PSkmY7fT3ok/HL
	z3jLoe3T82RWsk56cM8xdcma0UsmM1rNRf0G8FVchKPiQfmiqgb0UtI2mqnOuok4h82k42XgcLa
	aXJQ6/0W/uES6PS3Y3nCLUR2SCbkLbe5ammGxFjqKefJrN0BZ2R6IhzceziFndWg==
X-Received: by 2002:ac8:5dd1:0:b0:50f:6415:1eb4 with SMTP id d75a77b69052e-5173a97fdd5mr181349891cf.49.1780370240533;
        Mon, 01 Jun 2026 20:17:20 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51741b29745sm71219081cf.8.2026.06.01.20.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 20:17:20 -0700 (PDT)
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
Subject: [PATCH v5 01/13] liveupdate: change file_set->count type to u64 for type safety
Date: Tue,  2 Jun 2026 03:17:05 +0000
Message-ID: <20260602031717.197696-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260602031717.197696-1-pasha.tatashin@soleen.com>
References: <20260602031717.197696-1-pasha.tatashin@soleen.com>
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

