Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994E64EB38
	for <linux-doc@vger.kernel.org>; Tue, 12 Aug 2025 21:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755032657; cv=none; b=IIxyAA+JgyT6x0ZLwS63ur+5/QHbeuXXRY+chl7LwgnWO4BS5Lo+6r9aJDmKd7tLn5NCMdgl/RRHUzK9gYCMeMOeh1KotA/In/Gz8ZVzZQsFullCPwxADWYD8DxheGZtVhuY+rpR9SzLlAzg6Ue0BQ8Ev8ArJgGRK+rc7wcHIFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755032657; c=relaxed/simple;
	bh=TFD0N36x9nUil9ORJg6xcGUfZhK8W8K3MjjfYGGc7Nc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qDRMIp+9qvQDWVNq6iTcS6urSsDkcTDTTBWwo8H5XHkZbuXo5Xo2EOdwsymAFDaTt1VxbsR+qBG3/QtGbFe28fp/xIayCNdu/xRXrPoVUL9Zoalzl+djZBUcKaFgsAL393yOsf6LtRbqcPCde/+hiO9/Fxv5iMp+xLY955bZst8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P3B2x4V4; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P3B2x4V4"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-24306318aeeso7945145ad.1
        for <linux-doc@vger.kernel.org>; Tue, 12 Aug 2025 14:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755032654; x=1755637454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGUsQ/sj7ZoEg3RcWInIAFXjfXgYxi+8KFeXZWWzawk=;
        b=P3B2x4V4HpvvoEm3Gv5u9EsA50+hVgSaNiiosAgowNtrISY4Z92jx7aCyGLgjG/ckW
         95gczM+jAVkJoxQDeBdLFJMnEH8ogqV6Q8QzbkQRKSQNf4nERaGxuGC1h7HB77kmgAJ7
         +timJ5aHmdU34/qpNBkmCQ1BWbXMy2KLGgxEf3l/rg7B+6Zxala9HZv6Ilsr1Y3q+J5R
         b7qKKlHJt88F5z/QCZan8b2LT5bNC3pKgKfiG4Bu/CMbCOayv3etI3ejlLlX9z4+HcGw
         u8a43aFfJKmNNsRgu0+fd4nDvwbPzCJo7/7nwsYdDYjodDq1FPjd3myEMb2BPukkfV66
         66Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755032654; x=1755637454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IGUsQ/sj7ZoEg3RcWInIAFXjfXgYxi+8KFeXZWWzawk=;
        b=jd5ZXu88cmEYUtzcJCC0TAwfUnSPzt0rk9xt4DXEgg4CtKqdJU4Gz/GyTzGM7TRwIx
         TNttUxgGaH3O36TGS2JNA9RIo6cNJKKiUP1BnfnLqb05Gg5oFxPgaAchmqCp2MjD2Djy
         ol15HDr9ISsuenSM7Qeq48G6x6xSoG3oQcabafmfqJALXvomZZ8SwAtYkUR/kXdwpeOv
         JZ8u0KIFof17T2MMDM7ppZrIgle5M6NJxonAvYetBIYqtFLpfvfMCgHPR4Qgj3qhinWN
         wVDBSVsTq1X99jh4vrllDUq4NJS49M1Kwr9zGKDIn2PYP+cjY08/RMJMggTPy5N7w63S
         Dhzg==
X-Gm-Message-State: AOJu0YzG26t9gme0PCd/I5QTjRomTEao2Mhbe8ngrDCfH7u1XMWJHS/x
	5JBWpGzoxgQaIrQBcJoh7FHzltpMvr5enMTmCP18PU+/YIP3e5VUlS2H+BJ7GBHsIjM=
X-Gm-Gg: ASbGncvo5EimraUCTivvjocnGrYkOygn5NbFGlS1NFmTh8t9ROx5KJzRXBE616jHrw7
	lTQkSJpUi3tndwMAJASKs+SbuOhA5wKc9haDsccRvyHiMLx5CxrFtydvj5p/KS6m7UIZ9/V5X7x
	S7bJZAf5Uamh5zEJMZ2sca2rIqSlAkbe+GjPPKPX1MQceW0tkNxlrNgguR3cBjbjyN3LSDpo4WN
	PIiAL6efo17a62vYcoxo11rWg9vVaVfNfAr0+urxAVV6BzmBFfT0/DLfLXs043hVjW9aN6NZ369
	xEFlhwEYgPQlx41eeYTzauHTc1hkjWKCowj0n11h9CJuVxT4fIDGkWeXEbGCiMvIelF9ULJCQ9+
	SzroTPMIpJo7ezTkCfGUYH7fdfCI1aXQP7fnCNi4fLA==
X-Google-Smtp-Source: AGHT+IG6xBgpMhcO5IV+Rc2zkIZj9anD7gmBVY5NkvqSTvXC62aZX0FDejwxN5Ju47vnKWKhngM9ZA==
X-Received: by 2002:a17:903:986:b0:235:f298:cbbd with SMTP id d9443c01a7336-2430d0fcdd6mr9843065ad.21.1755032653911;
        Tue, 12 Aug 2025 14:04:13 -0700 (PDT)
Received: from soham-laptop.. ([103.182.158.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8aaf855sm307852285ad.168.2025.08.12.14.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 14:04:13 -0700 (PDT)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	corbet@lwn.net,
	Soham Metha <sohammetha01@gmail.com>,
	Matthias Maennich <maennich@google.com>
Subject: [PATCH v2 9/9] docs: symbol-namespaces: fixed spelling mistake in documentation
Date: Wed, 13 Aug 2025 02:34:00 +0530
Message-Id: <20250812210400.74370-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812201523.69221-1-sohammetha01@gmail.com>
References: <20250812201523.69221-1-sohammetha01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

found/fixed the following typo

- whoes -> whose

in `Documentation/core-api/symbol-namespaces.rst`

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
 Documentation/core-api/symbol-namespaces.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/symbol-namespaces.rst b/Documentation/core-api/symbol-namespaces.rst
index 32fc73dc5529..18278dc6ca2a 100644
--- a/Documentation/core-api/symbol-namespaces.rst
+++ b/Documentation/core-api/symbol-namespaces.rst
@@ -89,7 +89,7 @@ For example::
 
   EXPORT_SYMBOL_GPL_FOR_MODULES(preempt_notifier_inc, "kvm,kvm-*")
 
-will limit usage of this symbol to modules whoes name matches the given
+will limit usage of this symbol to modules whose name matches the given
 patterns.
 
 How to use Symbols exported in Namespaces
-- 
2.34.1

