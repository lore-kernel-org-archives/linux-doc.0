Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com [209.85.222.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEFD154BF5
	for <linux-doc@vger.kernel.org>; Mon,  8 Dec 2025 05:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765172921; cv=none; b=rIhDtCjHPq6EY6Ejq4zAFLvQGLoKjmNMxYzWFZ48GJbfsxJ9qsjBbNykTDC1L2B3xVbfdq9AETr1Ur/w1Rg9lCK5JlkYBO/eMwRdmAyqdWcCnLVLDN46xAWRON4Xiz5W1rhYB4Ou8WuTtIk69p57y8yCbMs5Au/X9+xEFIouzzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765172921; c=relaxed/simple;
	bh=QgfrXRJauDZ0HPDABcRfq+VWN3RAolMKyNIWs5dgi6s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SdrmNHmzXiiL3exRLgaYPIM1H0+9tXWwyw3lfRDfAgPrpl+Mh9kAA/HMTkGd9Ts7YbUVtx273U3diFkI7IcjHRlgYoyVnxcPhI2CaFADkZt7ZiaXBPXfCiTJiji0FZd8DhuHscu0xNuIHJADgb/V9H3RAXZyDMc4juH4MR4SgSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pjsrg8NJ; arc=none smtp.client-ip=209.85.222.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pjsrg8NJ"
Received: by mail-ua1-f66.google.com with SMTP id a1e0cc1a2514c-93f0cf4ade3so1213701241.1
        for <linux-doc@vger.kernel.org>; Sun, 07 Dec 2025 21:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765172918; x=1765777718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gShuiqyWNwRaYSpSLEnk6hhes8+iQaZsyAhVZHln7oI=;
        b=Pjsrg8NJeG7/MYf0CsjsGTpErvlGo44nA+Syoc9X+R93pio1S707twx/gy277Y1PL4
         XCbXerKKhuXgrqCmwvZ/lbbMZ/3fKE2S3gww6QxiQZ5+dEYdJIKV9N4064jPUK4ylt+V
         r5pTrGHsnyXU6TerYtiH/45XWml9GY80CULfr/a8eK/+9kzy/ydYolX7SBYTEMB/q+5u
         HsC25//2P63C8IDIpleabaSstZUaWkewjCvU0C4RQtUivbGP6EQZp/WnRikDUnaVIGwu
         lYtJyXrckSaTtToHREgyQHBeSc3wu1URjX+wQbL91mlPj0HDzyO9m0RuC4rvz38qkJXg
         gvjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765172918; x=1765777718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gShuiqyWNwRaYSpSLEnk6hhes8+iQaZsyAhVZHln7oI=;
        b=IQsANBJ0EPrbVB6C7VxeQqWf9uDMMeFL2iX6Yu00RIxWT3bWXAN280TvZxc6KwfXuo
         Xa5JCHcH9wQgeMyyNxInaMIgKfImwbeSqatbul3tuJ19goSiShY+Vy7wA64f4rID+wY7
         ooSlMuGONf2IChyvTwQDgD7r5fNmwpxcY0DsAnc3Ik8XQS33hY70x0jIWGigICouPoXo
         GLjZaLQ/bDjEz3G4PN7nvvy+fA8pJ9zisLeT4Y0Yy590GYvqYjzq2kJH7CuDrBIVYM0G
         Xy0u8/PjvhziOa29sDLT2PLcT4+V00nE6NX15UakVNC2EZXVB5h/enOgthVXnNrwSJb6
         SzQg==
X-Gm-Message-State: AOJu0YykhjDN8pXSN8kLuqX2b2AAzATBxnE0STuQ7lTlerKOe5jc0/3j
	eJJzPtMtheCWYDRXBkofABNBsUBRJAvBnWkcqi7uFsnxzaVs/WjKf0fe
X-Gm-Gg: ASbGnct/JcEG2qMVdIwXDw+y6SsbG+lxXcdvmIEcN7Pc66kdz+RcgJZjlHWwfUI2tbf
	pv1dJ7dNpG0Wlmq56DQAJUORLEbXjnKCRv6aCoEKpYyARcYKAf7lvO89LcaTw/V4nJ3qAONF1AP
	q3mU/gFjWHcgo39Qq/6wLBeFLn68ZbDp71OIxlJ/qC3nnzOV0hfrm6Mrnguf9pU7ozVJKFiFjXo
	oOleHP2ju9D+8nVMPhoa9w7/1d4xFOatmUvyCi/fFRRj1kRqGlBoxVnlDv8z1Ru7LI6OtvrBKsf
	CeIJ1vRRka+yBjzxeqdW1czW9OXeiIqwMsSsJv4KkanwYVxrHIM6CV4fkmPFYxcbDc/PVMfAvMf
	D5FOGHta3GEXSsp96D59uXXLYLC8MGuGq4+RDR/9Z+/tBNhdirWo1flc0GknH98vyCTZhmExuOq
	adEqRRcSuegbdPeNJV2iPv3jxCSD8cNapjCg==
X-Google-Smtp-Source: AGHT+IH7ssu2NxhgTRtxdbHixfwQxiiXLzIFU//4AR9ftQokCC9ZHTKX+b7hCYa3r29jxwX7/OwxRQ==
X-Received: by 2002:a05:6102:3c87:b0:5db:e6fa:f7fe with SMTP id ada2fe7eead31-5e52cbdc14dmr2049195137.24.1765172918438;
        Sun, 07 Dec 2025 21:48:38 -0800 (PST)
Received: from localhost.localdomain ([142.196.103.158])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93eedd092b0sm5275647241.11.2025.12.07.21.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 21:48:37 -0800 (PST)
From: Addison English <addison.englishw@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Addison English <addison.englishw@gmail.com>
Subject: [PATCH] docs: fix typo in clang-format documentation
Date: Mon,  8 Dec 2025 00:46:39 -0500
Message-Id: <20251208054639.8655-1-addison.englishw@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Addison English <addison.englishw@gmail.com>
---
 Documentation/dev-tools/clang-format.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/clang-format.rst b/Documentation/dev-tools/clang-format.rst
index 1d089a847c1b..6c8a0df5a00c 100644
--- a/Documentation/dev-tools/clang-format.rst
+++ b/Documentation/dev-tools/clang-format.rst
@@ -88,7 +88,7 @@ Reformatting blocks of code
 
 By using an integration with your text editor, you can reformat arbitrary
 blocks (selections) of code with a single keystroke. This is specially
-useful when moving code around, for complex code that is deeply intended,
+useful when moving code around, for complex code that is deeply indented,
 for multi-line macros (and aligning their backslashes), etc.
 
 Remember that you can always tweak the changes afterwards in those cases
-- 
2.34.1

