Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794672032D
	for <linux-doc@vger.kernel.org>; Sat, 18 Apr 2026 21:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776546543; cv=none; b=tHnEcgnV3drbuGFi/HvAfZxdwvbozzcbZSYmGDsX2vlV8w1AtAyUwtT0DNk5QFAcyC83rVTS4B0RFNU64kSiU13oiuYC0QFtKO0/uPyj79IdXvIPYK5gugWwg1zDXcQh4BI95p56RXQwYcY+haUSFTM/VDIbuCqbgyPQ2ROlq3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776546543; c=relaxed/simple;
	bh=KKcmkeUM4z+EcMuy0Yw8cx3ZbSSAkBr89XldtPJwLiU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=W7eQ4x8VYZ9IgbhDiIzi28CHT/1MQ3BqyCInEvQ0Alloq0pNMebl3RDT9vR8m2I7xiGhw7V9cVq+HUD8oi+94u5uaKFXm+L+VvD76V6H92nuoRGJgLqt0IEqu2j9BvoRjcipDtCM1I+32d7QdcD6965POfBBd6Cjiwby9mJ6UOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PxLZfweq; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PxLZfweq"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8e8c0c2d2bcso150987985a.1
        for <linux-doc@vger.kernel.org>; Sat, 18 Apr 2026 14:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776546541; x=1777151341; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RWsCREaaQXHmkT2rQHbpRYta5YCd5PFt0VNHNR6AeEo=;
        b=PxLZfweqq6dZu8nwRdIrXLvY41Kz7g0f4Jtzb8YBWfoCH+87orEJuUqBcW6KE/S5WO
         syVAEAhxCEL5EOdnpyJIvY7s+MBhTZ26HzWPyKFtYdBAC7VfP/badbxyq74wqcYUvjW6
         s3P0SKAUnQOMBlC48k7WIgfHf0K0RPV8qbSlFKCCGRQfk0Q4Y/F6XwCvGBZsbShlCwW/
         I36zn+0moAJEGmnCNCz0YvZ7ARagNfsEms8DQ/AlWye431Qb/H/uEqfrmrUyiHfnFGiN
         NNq/KGtodovPwx0BvHzwYRh3Kumi1SmNyrooHCG+lcR+BseYIAiEkvfbYl46ZcqP6G04
         euEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776546541; x=1777151341;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RWsCREaaQXHmkT2rQHbpRYta5YCd5PFt0VNHNR6AeEo=;
        b=SCCzHnUOJ7nAA4q2bO0hxvtRWQl94iNrOary6Q/QBPTjHbx4jPHgE7zTKSAA86P3Y5
         J4DETH9Mx+dpDo16CnW5OjLxzMPnFuGRlbPA6J4qdxfFk+HwRPpGsm3yQN5/ltDuz5VC
         W6W7YuikQTMdVt8KZ6Rlq377sqZKUtd3pB+Mk8yamKdt9Rqg6JujUE4uitE96hE/R2rl
         1rfxB7Z6Dtefp78fGtuUviB6yLN68XDHa40hpG82Gkj+2MOjRiQen8G7RLImniVCiOzF
         39r4EpdBplCLRpJ+/nkydNaoQyK07CVkJux3wJ6H4smMD92Rq1VdTfqdnz+Pqysj03dg
         9RNg==
X-Gm-Message-State: AOJu0YzLVrxzE83FkbAR04Mfl7jURU4rH2a/+0LJEq0NADPDItgKdEd3
	6FjRnGMmzD4YwGeiBUi5ODt9GFwSz27a9VmU6dSN80VkJ6kaA6bdPW1j2E1qcsp8
X-Gm-Gg: AeBDietQ1hb0PY9ZXW6bV06PBDJT2IiDZ+8qmIs7QxwjgtX+o3yOlw/rkOhu9TEYjNP
	NCtNYP69cRZzsB1Ue1GnVhY7XJaet+aimfY/9y9p3W2iTNC5Ca6UZ4S/uqFtJHuPAU8akWBund/
	QslM3sEYsUKHzNvNNmFMT2w2xZ8db8iqd+Dq1PAToSpx32vTcLPVzaI8cJ9ZOObOCnxsili8kZN
	zwf3poxZVFweAArMLW2Q4g2SP2wmutymPJOflrXeIGiY/J3v6SU2+Kd0BuqiEECcpjC9fXb1D/7
	F4YO/wTWpzqbueZth1Ou/F44zdNebT0vUZu/CA8rmzkMLOs4TuKIVhv7KbgFtqhFoRZU5eHKFRp
	+Kyhk132ZtUse5pvnAdukv8Lh+HiOzd6xC45+hBS0C57RhyOv4OOEfD4zfx12mtcg140xiDhL6E
	s5l8gRd5ifQnH94W3dznDiDJ+lz20loyX0ofn7cywhwBEHQQ==
X-Received: by 2002:a05:620a:4086:b0:8cf:df8b:1e51 with SMTP id af79cd13be357-8e7916b1d26mr1081316885a.28.1776546540876;
        Sat, 18 Apr 2026 14:09:00 -0700 (PDT)
Received: from inky.localdomain ([2607:fb91:4c8b:380b::5f0a])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d8edb789sm454851985a.31.2026.04.18.14.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 14:09:00 -0700 (PDT)
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Sat, 18 Apr 2026 17:08:49 -0400
Subject: [PATCH] Documentation/binfmt-misc.rst: Specify aux vector for "O"
 flag description
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260418-binfmt_misc_doc_update-v1-1-c2e9601ab868@gmail.com>
X-B4-Tracking: v=1; b=H4sIAODy42kC/x3MSwqAMAwA0atI1hZU/F9FpNQkahZWaasI4t0tL
 t9i5gHPTthDnzzg+BIvu43I0wRwNXZhJRQNRVbUWZm3ahI7b0Fv4lHTjvo8yARWtSEiROrKpoI
 YH45nuf/xML7vB3TRgFloAAAA
X-Change-ID: 20260418-binfmt_misc_doc_update-6adddccd9475
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776546539; l=1815;
 i=thecharlesjenkins@gmail.com; s=2026030; h=from:subject:message-id;
 bh=KKcmkeUM4z+EcMuy0Yw8cx3ZbSSAkBr89XldtPJwLiU=;
 b=zyJK4ZfrkTxgQec+F55cwfQj0VNFTl5OtIIkEkLyMTixglWlA0VNImSbagI/CJSeJAcOBFWmM
 ZduS/nCwAe6DcVKn8kUGyISYLARK6isqB8WUg8ifHrYfUGZeZFx/7qF
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=vpF2USrG+aB6CTbSt34rzJKsAVe/l+GAXo1IomCMETk=

Instead of replacing the file path in the argument vector, the file
descriptor is passed as AT_EXECFD in the auxilary vector. This appears
to have been the case at least since the git port, update the
documentation to reflect this.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 Documentation/admin-guide/binfmt-misc.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/binfmt-misc.rst b/Documentation/admin-guide/binfmt-misc.rst
index 59cd902e3549..c0a34fbf8022 100644
--- a/Documentation/admin-guide/binfmt-misc.rst
+++ b/Documentation/admin-guide/binfmt-misc.rst
@@ -68,10 +68,10 @@ Here is what the fields mean:
 	    Legacy behavior of binfmt_misc is to pass the full path
             of the binary to the interpreter as an argument. When this flag is
             included, binfmt_misc will open the file for reading and pass its
-            descriptor as an argument, instead of the full path, thus allowing
-            the interpreter to execute non-readable binaries. This feature
-            should be used with care - the interpreter has to be trusted not to
-            emit the contents of the non-readable binary.
+            descriptor into the auxilary vector with the key "AT_EXECFD", thus
+            allowing the interpreter to execute non-readable binaries. This
+            feature should be used with care - the interpreter has to be trusted
+            not to emit the contents of the non-readable binary.
       ``C`` - credentials
             Currently, the behavior of binfmt_misc is to calculate
             the credentials and security token of the new process according to

---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: ${change-id}

- Charlie

