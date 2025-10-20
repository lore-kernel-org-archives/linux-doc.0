Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011C4225397
	for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 14:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760972024; cv=none; b=c/U+GrKM6lEBb8ZS1xnPlUJnh+FBkf22Pw3qpoO4lahADX1/B/Qj2WvdlX5UgupLdp4CzhijZSJbyugiXRuIVYbLwOBkljRi33QT/wznWBl43Cc+n3sFbSoLzeJVOnfUD2JO7G8IxFgRpt8e7fbkmEh12yClYp6fPVrhxN+NME4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760972024; c=relaxed/simple;
	bh=Qgmm5n3QgGYHJXMdGtmtk4unsoI55ELPPsP//oF6jlQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fj+KNd5wd04UrBYVozhjYKn2/0mpp94npi7sju5jYsgp9Ye21xISMTA+RiYiupsHHUIAv+EQCyrftx9btS0wbz/QbBkkrLaHUSOCir0OiZ8pQKY5AeOgJnoHGKARRU79W/9AUoLQWzccPKn00RKnHOCzy/SBcXBaBslbjYpn+u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eyopwRDT; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eyopwRDT"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-781206cce18so4533659b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 07:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760972022; x=1761576822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZ/VR7vR62blRBnvkVTsR0wWUxwVHVWxsZkAw6EQ2kA=;
        b=eyopwRDTzsYqa7D6TT4ydJRu6wVtm+4RTQ/6mh8/r3ny496mCrriAkyk8119gLYOJA
         70h2h44snrnT3BA/yajKrCT3Xytaezl/ZPs5fpif4jJAhJCJ73bvOHwgVlsmB+ByxVyV
         +6lVSlh/xyQPmGM3RDWtIfrIt12txH5hKBSk/+LS0G2EkPuXIlHd7ZM7fx5rQhoOmilV
         JwNq8vPPcQXBiGWhI5kUsO5B9oJNsdyN9xntCqHFoYlIkp3BoN1zVrFvYnQiaEtyN2aB
         XHGUy+/3Mjb4ro9j68+SdJK5ebxBROiJs4FDW2mPuXPRrAH9E9prMjSB3ymCKkJomEOy
         0gZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760972022; x=1761576822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qZ/VR7vR62blRBnvkVTsR0wWUxwVHVWxsZkAw6EQ2kA=;
        b=PDUGky/K7u49PmevrEshXam+2tmOf2ialvr2TatIsR0Yd3W/dWDKWw85WwBOqeWvbz
         BXwOxHIpkNm6uEkSyfX5hAtrJyX0FBgUfsEudB3xHZS63a3118obH0h4cVnCNhFAX7oX
         FrDV02DmZa7XXov7PDZP6IlY1jm1TZbzTjZUPPtLQCG7Gg1oDeJsKia6H4/cTaH2kbKm
         sALr6eTm4CebDM7ZmA5Pq9r5xUtTfTL/bOlaGpSTSBzBYwAXtnLnt19tKMniISPYHtOP
         fnvdz2Kmhq/v65PtQNKbXqLzPrsaT+hy0ZnYTgv/psE58y9i04NMX568CQcjjBJeMeQe
         zsFA==
X-Forwarded-Encrypted: i=1; AJvYcCUWP09U+CimBxOPmdJPxF0r3xlmsxc0MCCC7b3SadrbE7zb+Cw2NoUq08qDu+Gyo8Zm+DQwK18muBg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyuio8K9lKKGqQ7am5oz/1mbzjz/vmrSY5g9A+d/EgsQZizkSAQ
	Vch2SZOp+1DHhvl6ejIzGryhFt1FQkckcEOWtQVX94cetQLpSH9XOBXS
X-Gm-Gg: ASbGncv9B9OhJ54dxv5aRD9Nx14VbCtiwfi3uN4/GU6ud14pPG7xt84okrQch3LkBui
	PRV6bBGKSE5ZQL8uWsLA8/6u30VBmXK9e6TKbNam6EBqnG/VF7xd/DqUrcim7rOV5DAYbZ/6pyT
	T8tfifUVvHkv+KgRCgpelCC+EDWyxkdAW1LJlpKXxLQlifLctvdqpRcfWw0Gfkfg6avG/dFTsuS
	A+1mTu3KLmW6ahYaeW76CVKezRG6/8G4qjq/GRvmpktT49ZpkOQGKdtfm5O8wJYTzTjeq9i4QFX
	M87sza+PfTP77G6Dilq/5ahxzdQYxzZOE+Ev/aNsHVTaDvqgsV3IdvJv/jbUcsWhTCPXu2ZESZH
	ilLC9nVbxcPYoyQDHey/RTaVKig3262ECtdM67l1QiHcuyHJvmWyCMkbQbvjbQNE8W0wJd/SWMo
	jFOjXX/7iVxxkiWeQy8OJ1Kqz48V9R
X-Google-Smtp-Source: AGHT+IGTdtRXRVBqo/etSZIrqHnDE2k5yUz+r6mePyKfylMditsns+sMecwWotZWB5+Cv8bZSvNjyQ==
X-Received: by 2002:a05:6a20:549d:b0:32d:a6c0:15bb with SMTP id adf61e73a8af0-334a7a5fed0mr16479924637.31.1760972022096;
        Mon, 20 Oct 2025 07:53:42 -0700 (PDT)
Received: from clint-Latitude-7390.. ([110.226.183.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f159csm8497919b3a.46.2025.10.20.07.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 07:53:41 -0700 (PDT)
From: Clint George <clintbgeorge@gmail.com>
To: rdunlap@infradead.org
Cc: clintbgeorge@gmail.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org
Subject: [PATCH] docs: ktap: Revert incorrect change
Date: Mon, 20 Oct 2025 20:23:34 +0530
Message-Id: <20251020145334.65356-1-clintbgeorge@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ba148c36-8778-425e-8c94-35ebd708fc80@infradead.org>
References: <ba148c36-8778-425e-8c94-35ebd708fc80@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you  Randy for pointing out. I am really sorry that i missed the
incorrect change while creating the Patch. I have reverted the
incorrect change in this version.

Fix couple of grammar and spelling issues such as:
diagnosic -> diagnostic
Cuurently accepted directives -> The currently accepted directives

This patch aims to correct these issues and enhance the existing
documentation.

Signed-off-by: Clint George <clintbgeorge@gmail.com>
---
 Documentation/dev-tools/ktap.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/dev-tools/ktap.rst b/Documentation/dev-tools/ktap.rst
index a9810bed5..faaad92e6 100644
--- a/Documentation/dev-tools/ktap.rst
+++ b/Documentation/dev-tools/ktap.rst
@@ -13,7 +13,7 @@ which don't align with the original TAP specification. Thus, a "Kernel TAP"
 This specification describes the generally accepted format of KTAP as it is
 currently used in the kernel.
 
-KTAP test results describe a series of tests (which may be nested: i.e., test
+KTAP test results describe a series of tests (which may be nested: i.e., tests
 can have subtests), each of which can contain both diagnostic data -- e.g., log
 lines -- and a final result. The test structure and results are
 machine-readable, whereas the diagnostic data is unstructured and is there to
@@ -94,7 +94,7 @@ keyword preceding the diagnostic data. In the event that a parser encounters
 a directive it doesn't support, it should fall back to the "ok" / "not ok"
 result.
 
-Currently accepted directives are:
+The currently accepted directives are:
 
 - "SKIP", which indicates a test was skipped (note the result of the test case
   result line can be either "ok" or "not ok" if the SKIP directive is used)
@@ -237,7 +237,7 @@ Major differences between TAP and KTAP
 ==================================================   =========  ===============
 Feature                                              TAP        KTAP
 ==================================================   =========  ===============
-yaml and json in diagnosic message                   ok         not recommended
+yaml and json in diagnostic message                  ok         not recommended
 TODO directive                                       ok         not recognized
 allows an arbitrary number of tests to be nested     no         yes
 "Unknown lines" are in category of "Anything else"   yes        no
-- 
2.34.1

