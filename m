Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7953D300D
	for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 12:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773924749; cv=none; b=cq1c4JSqmksYChGz+cTl16sYd5Ajra+ridyFHEqrwpL4cibnC/3AaNJVIcR8sNLE5S5SGBOPdeOQ2E0vMVVzpVZiN6HBT7YhgLCjXyaIQhjR4zwwu3n0kVsb0Yy7Zgg58QCCgFvdrxIfVb59JTBn2IMMpmFz60mQGIo7BqpWCNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773924749; c=relaxed/simple;
	bh=dulCa/xi6i9S6KX93N6kyt7Qxnuo3DdipvPE/ToKbLM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m+kOrj8LDkXR+MuyAl8ixWOJZSPpG8Vr84hkF1Yar4EXNF2jj0S47E71DqZfWFUnGJxSA+1W0iW20aIgoF6WFh7cZiX85Y7fimx7aunmzr7ER+OUaq0VBjUu+n1F3hMMD1Cmd698hcG8ATK2ofS49rRCKf2kQK473iD/tVHNjy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ARjCoPlY; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ARjCoPlY"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2b04e6a989eso6281075ad.3
        for <linux-doc@vger.kernel.org>; Thu, 19 Mar 2026 05:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773924747; x=1774529547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z1fAq2l84SQsisuDFpxNk3m0K309zFTlUC1b3ATSXUw=;
        b=ARjCoPlYhPF3b86XgnojwhO8E92ywRS4h0BFTV4LZpiGgeXzr8zL7dP8wRUylAvOIU
         fh4cKtGKHAvcCJIl7EFEXGs1kwQiCPEJ+O9PgwUpGuDYa9foYEVcze7gQPQLsLBCuze5
         2V8LhD0mkd3IL8ocHLUP+yUAVKLbvUSFkj02hmNXq2DPck9E+UadtKZ057YjfBF3ejf4
         kAgQeJWB6ZcWad6tBSXjwL0wiBgBUFYGn/GkYR3zxW1W+H64VKlCv5ClTSoKE5gWbN7a
         7jWERwrKed70s0tG8x6fsGiec9S+KNdv/wqatRzg/kh9waP9scZrNoO8NbMUIr4gOV7I
         ztrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773924747; x=1774529547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z1fAq2l84SQsisuDFpxNk3m0K309zFTlUC1b3ATSXUw=;
        b=nbmq8a+ALR5piY8PRhtNCIeJFw201HIUFDYH4nJGqmZUsD/zzgvaoFmrkcaLIzthXu
         goiR6770p+/ZKiHSWB0nuwVJcrDG+Z/eYNIzJN0QeNi2KBlyVD5HCDiNg+RLFOaAg8tW
         RlH+AOfTNorb7P2Q5rhfAkA7YR2Hmh/6326wFEAvsdzQGqKXYu5T3PSlLwuy/GdNnxye
         MOLp4n4o7mUvZDcwgC+H7TKpHOy/Pm+QdOdONRSEYEfqgFnvi7NQcoYV6BA8Y+nhqGot
         5fBGTr7wd738PPBDGwXb9X9yIkVQx9OlpKSjpKSHz5Ei0s8/TOtYzoXSlAB7u5uzYeCe
         aV3A==
X-Gm-Message-State: AOJu0Yy4Jb5vFsFSeCypVjTsAAIqrgEzoYdQXt2KRau4RbEvmn49dzGB
	xpOyD6IVL8b4TMgY7vHqmFY6YcicGSKPNz+fVbDL8A0DSyHBx0Egb+gCov1Th9bD
X-Gm-Gg: ATEYQzysLY9UFJSQmwr4kZ6C8W5L1X7algSaZjASLqxulXDqedAI5Pz+hsWQResLSVW
	iIP35D9oHjHU38HabP7FneqjUEgACovVnf44GIUGMn7/cpOhkbwwLdrNS+7faP5/MF3zvLY+LUg
	swk5kFnfibs/l89jXxfjmFzio6B5w+LV4XLKu10WykJhXHH0lMS7zbzPaRTkSRRWs5aC9S0S1ZM
	DcWPKTp97RIZpsdQ/ROmJuP4YsMj3KD/gWBZp+RtEn9vQ3n5920lE+FhJTRtT0ThnPXrQ4SsuxL
	62HPRdkZHy8wDs+BjA09wP0cFS3eQaf03dM0Gq2XzDy9COqxmu0EMu/5oKPcbUf71jXT8GyX2X0
	D1bDXn7o8SXcgs3ZXq5mtODXeY8FlXAdqnwb+4X4gUVMuDBbqa9rX48Xa9IKpDuYwSVHkk6r/BO
	Yf24eNEG33VGTdadNzIDAf7vCrVCu/TpoUMRE=
X-Received: by 2002:a17:902:e84b:b0:2ae:829d:3c33 with SMTP id d9443c01a7336-2b06e2dac48mr73660115ad.8.1773924747254;
        Thu, 19 Mar 2026 05:52:27 -0700 (PDT)
Received: from localhost ([220.247.131.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e603b2asm61078985ad.55.2026.03.19.05.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 05:52:26 -0700 (PDT)
From: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
To: linux-doc@vger.kernel.org
Cc: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
Subject: [PATCH] Documentation: fix typo 'descendent' -> 'descendant' in directory-locking.rst
Date: Thu, 19 Mar 2026 18:52:19 +0600
Message-ID: <20260319125220.2794-1-islamarifulshoikat@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
---
 Documentation/filesystems/directory-locking.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/directory-locking.rst b/Documentation/filesystems/directory-locking.rst
index cb082abe6d20..86de6a56b70c 100644
--- a/Documentation/filesystems/directory-locking.rst
+++ b/Documentation/filesystems/directory-locking.rst
@@ -217,7 +217,7 @@ Which pair could it be?
 
 It can't be the parents - indeed, since D1 is an ancestor of Dn,
 it would be the first parent to be locked.  Therefore at least one of the
-children must be involved and thus neither of them could be a descendent
+children must be involved and thus neither of them could be a descendant
 of another - otherwise the operation would not have progressed past
 locking the parents.
 
-- 
2.43.0

