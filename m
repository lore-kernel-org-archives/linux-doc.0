Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543211DF988
	for <linux-doc@vger.kernel.org>; Thu, 24 Apr 2025 18:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745520999; cv=none; b=RvxSa32VrOosJ9ESCLfqpKQDfgh+k5aXTmhdjqXGHPq1E/n8gV9i4gCemX1P0XutYplfTz6e887wzcMRlIm0E0hVGf3gXgoDMp9AG8t4VFokEJGZSP0fOdjZ0eekv02a7GxSjV30ar8p/Vjb0Hrs8iVUTNiW9VSOMpmHxxy8p3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745520999; c=relaxed/simple;
	bh=Yo5alRrPhQU5pJBib36LH6bRGxiKhNPCm0/eMQiUjcY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TAgcj+nZjnh4XI/SZEzXyowl6/LNAYSvTtHGTy5Z8OYVrTGV6adCnhQytUcnALB8xnca2gSnXqcGGT82pQkypbGYNP7bfI4YEBSfcZbBUyRyqE1KI1OEiZt0j5SFbWvgNFi8Jb5j6gKEpoYotL6JcQK4vlzmADqubiTxxUIJHn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eEqFhY+P; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eEqFhY+P"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfe574976so10380575e9.1
        for <linux-doc@vger.kernel.org>; Thu, 24 Apr 2025 11:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745520996; x=1746125796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fiu/2FE9dWrwhI4SeHPweTytMCtrq9ZOIrGLhRO/2OE=;
        b=eEqFhY+PJg9J/JDNqGJ+iQtxdjm7+Bj15OgLUam0d8Fyzj0EQpe1ebPpizq8AKHdjc
         G9/OryCOeTnEYHteB504k8XAxb9jvHtsv7B6deWDT71GMrREsFWqxx6KGnf12b7xW/MW
         iiEjbULaziwTQ9EyM59QG7WL981r0qgnL/66wyFfRzRa0roFIsyq1X0YHy+wXMIyL/4e
         +W36Ed0iDAf2UEkq0MN5VpM/37N099UqshWx+/CPHCwFUWR6eqhm9Ser+9b5iPP9QqJf
         VxpFNNWyiq6OdZpgNo8N0GCM9GyK5CXPpnu7C59VLb5+u0VnGxFNiB+RzcD/Sn9Zz9H3
         qCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745520996; x=1746125796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fiu/2FE9dWrwhI4SeHPweTytMCtrq9ZOIrGLhRO/2OE=;
        b=j/b0xURYclokglXOFmY3MvbPMLIEHFbkFla3kYj15MW9Rt2Losew+cl6sSTyFXh/UM
         z/buS239htmIQSUQ2N+9mTK8ijtHZVOFq//KQ2D6c1+CC1gjEt/JvzhjwHJJbkDTb23Q
         4W/g6Q2IhhqkuX68NVcMf4OOF0vmEuYd4Vl63JAaWhVMxlrd1A/2PAFVs6+Z2yEHMwmh
         AndS+HQxwYpC8uODUyDUCWlO/u3Q/25PBsWcR0JS5P6YmVP8O+EbeOBdCWxxLpLP6Hx3
         sg29PTnk+qrfHixKH7s0M0bw70ge6vsz4Q7h4O8VuU/oFRgXN3+CSayE/2S4xohkblVC
         4Xkw==
X-Gm-Message-State: AOJu0YwPu5PLY6oPRj9GZUVmgKwhUx+VLMRdWiuNnb0xsqMDM7XS6Viz
	lbaRfkobczAWsZIGva/4Az0cw57NhWvlg/vFq7MA6CVP7omw6AHrsPm1MC7/85c=
X-Gm-Gg: ASbGncsxDBQeQ7JOSwowJlTXaA2shZewOjxIxcmO5YAku6jh00Zl6+G1kDcKnPnAsQh
	MQHGPgbXidcabd++rULlAvFZGUSIayV8oHNJyZFvrMDwJ5Z8cUNAKrv1QaDRkhzMMR6bGc67Ybs
	fJ2aoqlgowr9FmVQFvWW1waSPFKEnS82xqL2PPvP6y2/SIuTJxJiZzeVaIngaP5xrwX03P9cD7d
	/ZurWFXb4GwJRANuvWn9yfeHEOD+zAR3/4tSUuHGvYr68l8xdYOJGac4eIUyTEM0JA2YunUcJ3k
	XtUGaQqAnzRZIhWZWfkgMxjiPiOFZKs2uw0m1U+cT79BeT1W1e7/m1LoqKK9vnK0yLDZbB8=
X-Google-Smtp-Source: AGHT+IF9SZZFvrFGQxmi+kxTcgl5ByEoncXy6zMos59KJNyNWooqaikZVYMchc5WKs5zR3PXmGy7Pg==
X-Received: by 2002:a05:600c:c85:b0:43d:ed:ad07 with SMTP id 5b1f17b1804b1-4409bd8d03bmr34891585e9.29.1745520996103;
        Thu, 24 Apr 2025 11:56:36 -0700 (PDT)
Received: from localhost.localdomain ([188.64.206.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2dfc2fsm30404195e9.33.2025.04.24.11.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 11:56:35 -0700 (PDT)
From: Alexander Shatalin <sashatalin03@gmail.com>
To: linux-doc@vger.kernel.org
Cc: Alexander Shatalin <sashatalin03@gmail.com>
Subject: [PATCH] docs: fix plural form of 'firmware' in top-level index.rst
Date: Thu, 24 Apr 2025 18:55:24 +0000
Message-ID: <20250424185524.17152-1-sashatalin03@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Shatalin <sashatalin03@gmail.com>
---
 Documentation/index.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/index.rst b/Documentation/index.rst
index f9f525f4c0dd..c0cf79a87c3a 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -84,7 +84,7 @@ which are kept separately from the kernel's own documentation.
 Firmware-related documentation
 ==============================
 The following holds information on the kernel's expectations regarding the
-platform firmwares.
+platform firmware.
 
 .. toctree::
    :maxdepth: 1
-- 
2.43.0

