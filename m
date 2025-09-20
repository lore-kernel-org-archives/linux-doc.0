Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585F9238166
	for <linux-doc@vger.kernel.org>; Sat, 20 Sep 2025 19:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758395867; cv=none; b=llZr8P8qBeorTYpOcEi1I/WdhZPtuT9lAkmnXHZ9OTNu2uv3QExwpa3Uciv3LNGiUvfIKwx1Pp0r0CUEvydGuegXi95VmxQQ+m48lcXQPl78khroA2jx5/+96q5tujuEu7QL5qoDZk3lPdboikxdtPwXTW2aQeCueU75n1TZbgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758395867; c=relaxed/simple;
	bh=VXhQ/46RyA4dTSCM/jKNIFCldKvMR/nbIDhjM+NTVTU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iAOzYnXoZ8sKFq5MuKzAtKerd5KyWOGUFsCcz83Cq5kM3Ujujiso+/zhg0mCuGSljqkPsVn+P75DYML8Ju8JULRl1Lh3dkcf9TVmAeWAPafIWGgLokt4a/N2nsR3aT4wAoN9Kpy6srG76SqJ61KLULxxZnAoFtsnNK4J4phedYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XIHssG4g; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XIHssG4g"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-32eb76b9039so3604860a91.1
        for <linux-doc@vger.kernel.org>; Sat, 20 Sep 2025 12:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758395866; x=1759000666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qv+t2rS9vLu7zOpVhzxfMKjww6cCPuDXCk54kDg9LLY=;
        b=XIHssG4gDqW5QuwXOkHJ+7rIs6QZRvtOfDKm01FyYdb2L9ikh7EGSXw9R0UzHit+fA
         7pJTxhRVF4yDJYWbm+HCjvGpoIq2hQNYOIR0qZNicXN1+xNwtdcwvQ6Ibdq+xhHV3Od9
         9s8zApzqzAimASNW43RIEL2BuTQSIxwxypupp3hzBr7HNqWzOZI5Kb+PLzlMHuFI94iz
         4WgHAonD7MuEwmd0ZeFwN3NP8paKyrgSFp9nb6sv8pdAuKDfEwLP+shyPaAYKY0dh8A9
         HMajREvdyIlzZllCq3jHALMobvse5k7wC48DtsmTVvacrYlyqP7KvgdW+MUm7wqUhb2+
         1DzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758395866; x=1759000666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qv+t2rS9vLu7zOpVhzxfMKjww6cCPuDXCk54kDg9LLY=;
        b=xOtBjZEd1GyA6qmUv3iT8lsSwaasmODkk1a8CdSxbfPn/BZMNfLDWE9Bh4+xgfcq1I
         kMY16szNnUl+d3TXW5GEphYGX5pQlr8QMuLo4VAG9snXY6O2E/mGYa525UDlRSJJezC6
         ZrC3P5pq45YRJn4epG9uhnu8C5OX7fevk1rbXNRTmWBMILLwSKYJVGSiYrCGg4ts5psK
         UDOtDpcHKjiWvICm4dAtTLffqbx1g7xJRszfDQcj4AfV98lHGWMqz/pw8N+lmdP5bAOb
         Y/vkPtHnAG1mEzKXbZqyzuXFx2jtKeO/fvmaYuGN82uDyUNQC49ozfdufXEC2sL+uSb3
         bXpg==
X-Forwarded-Encrypted: i=1; AJvYcCVFG+rV2ZraZ2/42tuE4vCOI2mEmdVoErlJFy1iI2kahWdCWBzFYyXfXM8BpMecxWTxMo+g/+j0SBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT9fopJ4kWFMf83yAq5YLY857zfnEG3xzOJ8xKn9/HQJbjYOiP
	pJcUdqCLhOnMvqVmXuMyIC34J/BYfM5KdFL21W/PM20+fWSLt6qF+SbC
X-Gm-Gg: ASbGncsXPXVLRGsEoZazgcuBDCDGj6sEe9XvAQEv2xW6sWUbWHDZBSfbn4QPmtRHREj
	lt8+fPGwQgNLNCoWpoMpZ8FGRaH/q0nLnTs3ycM358zcBsDJ7aXrxZ0CXWim4gGwSuwGV+6WZm4
	j7ACHAgQfNDCK9lAV9dF65o1PJxzhcxH0HhAD+M+c9oBgoH4rHbTCcgvhAGY3KwDWnVgVrhNHDd
	ODXEghz4OmJECkCnLMiSmSWjJUJe/0BYvmToQiGVwEvJu+v24bldbmuYNXXFYBfkD5IMBc/NfX+
	2N9KG25GgWI1Z35Yc8jRrsQHCP5OlpRUYRUakR77nNcWdLiN3ZsuuSOZPmw/F/7Mexv8xIBoYt8
	QeHFXBeB8uYPFy4osnZn0cGBNUkPFfqB6h5U3mKQtQXrvE5SA92w/UcQhHpwbHONDFGt4njr0wi
	yIKQqZi/Mj01sYEMPTeDtJmYlO3wgZ
X-Google-Smtp-Source: AGHT+IEJ7Iamw1ZU0fymOaS1+7kZXHHtOoQORKIvbN+CH9xL1qQlDIAkegTMeAx3Vok154cEG62wTQ==
X-Received: by 2002:a17:90b:4d85:b0:32e:a535:4872 with SMTP id 98e67ed59e1d1-33097fd43c5mr8692434a91.2.1758395865587;
        Sat, 20 Sep 2025 12:17:45 -0700 (PDT)
Received: from yash-Bravo-15-B5DD.local ([14.99.167.142])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33060617ccasm8637158a91.3.2025.09.20.12.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 12:17:45 -0700 (PDT)
From: Yash Suthar <yashsuthar983@gmail.com>
To: corbet@lwn.net
Cc: workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yash Suthar <yashsuthar983@gmail.com>
Subject: [PATCH v2] Documentation/process: submitting-patches: fix typo in "were do"
Date: Sun, 21 Sep 2025 00:38:56 +0530
Message-ID: <20250920190856.7394-1-yashsuthar983@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes a typo in submitting-patches.rst:
"were do" -> "where do"

Signed-off-by: Yash Suthar <yashsuthar983@gmail.com>
---
v2: Resending patch as v1 received no reply. No code changes.

 Documentation/process/submitting-patches.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index cede4e7b29af..fcc08eb93897 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -343,7 +343,7 @@ https://en.wikipedia.org/wiki/Posting_style#Interleaved_style
 As is frequently quoted on the mailing list::
 
   A: http://en.wikipedia.org/wiki/Top_post
-  Q: Were do I find info about this thing called top-posting?
+  Q: Where do I find info about this thing called top-posting?
   A: Because it messes up the order in which people normally read text.
   Q: Why is top-posting such a bad thing?
   A: Top-posting.
-- 
2.43.0

