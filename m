Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168413939B0
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 19:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788636591; cv=none; b=h1S1XZkkUXeHfEiMe0+lJuC1Z24G/IBs5BZK1nOjGyWUHYpLBxigmEM+DqjZJ/opzOFwNaTe1E/HCtz8GmdMn8+kdq0/C7XnoMRXEZ+X54gILAIY0uEJokTexDrhUOD+sNx6Ia0vJvy0ORSpc8qjZ9tW7sZrSI0rO6NjTXtoLiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788636591; c=relaxed/simple;
	bh=GKGjYrVosAl5c7N4rjHl4rltayCdrMJHLpxI6DNWuZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XrYwwzUHJ2/OjX8SUjIP4OxYdbIX8scG9IdmRW2cyN+1DofvtXSwCWRKLJII+/9710wpk8iV6q83S5PFCRv60aGXfONQBQiCqLLYWdVxNafRBFQKuqX5V++YXdPZOl0fljG46liONGKhIk9+Tjb6UGZqvcguJ47QyRFOU9FkLLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nErSWUL5; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nErSWUL5"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-86c0e4dd49cso26759127b3.3
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 12:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788636586; x=1789241386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PXGXWpOil8xNaQD6Nl3nnrNjZuDIZru4bxQ6/BRDmjk=;
        b=nErSWUL5RzYexI5/qPb3WCueeBXzt7Ojf1646QBj2KerGQ5sSzOQgvEdCoJdqXRptw
         QvYMfeJ75UmCnCCy+UalSBMUibWCFcAQwnUpsEAVO6e1gZjPI3kQ3+Lg35NREhRrMC5j
         LnDXSEVebxND+0qvwiX5NVtUKaHESPjHxZPETxsURVk1e1GhmPk2IJUL7goA3JeAwvmk
         OQLacQhKDSs68N7D6ldgvZY5wFVXE3+rJswXQfmVDboldKf/OwzZIUoWzL/o88ZdpWpP
         Bad5HVs7HQM3p0rRVaP+F88O+9jnnOhq+vwkpPXlJGULwz5KZKu8G8rq39kXsKDqSFAA
         zNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788636586; x=1789241386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PXGXWpOil8xNaQD6Nl3nnrNjZuDIZru4bxQ6/BRDmjk=;
        b=J8yvmvLD+dPI11k3ABgK3tK3qSP++cS8DO9z7oCD+m5VKS9VU5wJMjznfxkC3AixzQ
         IfMOl6CdwMbQTwjZ2HSMBOaWktMa7iETvZxT+TsKaAj3fjwV8QKq6rU8zNI8AE97r+UN
         nPqlGsBM95CtZObFm71O4WZ9j9/36r6nkrnC5OawYRunSeVGR55JF+z/Ej8HSDLKEjKT
         ZnxmSjpQpFN2AbLmegGjBljx2G4U2Icoz9Zi9Q9RRB5FlEQsuCbVG7iG+Z/V7kla+Tbv
         +aVINWcQBUkaHZBZPF1m2YIpXCzmLu/+5GtCraDOLnA7bIGHImvNKUoTjzLFiVthTyT0
         XcnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxipN6bRrRc5kaPcCyQjnhoQIK/D2eHoKon9OliMco4UqxbHS20zpq8rw5pRfQhZjxYtZgCKRs9V7o=@vger.kernel.org
X-Gm-Message-State: AFuF++nqPo/0lpAllOTR9qcvh43d3RXbTIoNKmmxCWIddwv0jk7NTvaP
	2TDGc9VfY66TDGBx3YxzbX3H8Lja5wwuk7AioJNcuH2cLM3beS2Y7NLR
X-Gm-Gg: AYBFou3eTCeXQ1Kqh5/MULK0E03HBhbblgdEx1EEY0hLKgwE5UshISnzoXr4MOMha2w
	vuMdejdHUL8KqEY177TB0zdSbDNv6vVAyA06tdf7szc8pdlRWZgCaeEfDv6ln7cMCrv41UnzPPw
	u0ns+DshzU6cuxA7YTZYqNKX4BpOMyMi2EBSjkjtly1S2L19rKq+JgwddfbZhvMEA0c6ZX/A+TS
	hUKPv7FVRZRg1n9wNo+5LwpCjbVrJBj1oNw2AZGCMftkqRO0io2Vfya5wszKPPO2F30B/D5RP0H
	26r90trKaTv/5y2PdvN4BlzoICpm0j293T08pHcPnW1Qm8HcFtKMJwTejbMMoiiuuFuajRvs3hh
	IPKT6HJS/pBdmTDmyVJP+MmOzi9KjTGj51yZpIyBJq+x1/CfA3FKTqjT9v+kqnkVEVLGY3hZ+aL
	2O4T1KXSR6abP0eifJxNgvwQZ5BYkTnxobb08GPv8DaY8A7FXmencfEyn4BvWE
X-Received: by 2002:a53:a44c:0:b0:66f:c1bc:402b with SMTP id 956f58d0204a3-66fc1bc4611mr1775506d50.88.1788636586262;
        Sat, 05 Sep 2026 12:29:46 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66fb48ee9easm4992362d50.8.2026.09.05.12.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 12:29:45 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 05 Sep 2026 15:29:30 -0400
Subject: [PATCH v2 09/22] alpha: select HAVE_ARCH_COMPILER_H
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-arch-kconfig-options-v2-v2-9-83e8245761a2@gmail.com>
References: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com>
In-Reply-To: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Kees Cook <kees@kernel.org>, 
 Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
 linux-doc@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=987; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=GKGjYrVosAl5c7N4rjHl4rltayCdrMJHLpxI6DNWuZg=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLm5E7uFtls6qke2vrIfPmWN8ZVnWcajaytNTbduO/Kz
 Wen/syr4yMLgxgXw0wxRZa49Yoss9p2LPU5Lf0LZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 BDJ0jOIhcnoMGpnFxaWpRbppBUUOefkliSWZ+XnFevkFqXkF6QV6aZlpJRkZ+UXFqUAj9PJSS0x
 dHd2MDA1MLB0tzJwsHE1NnJ2dDJ3cHB2dXZ2MLM1NDJwtHU1cLc0ZuDgFYK65lsTI8JJzi5huLt
 PNazfce4QPrHLtD++cwra/l0fAt+aF0k/Rl4wMXdftRap1mK/W32vX/3rv54VnPK9+aPpnNxxz+
 Bp+6HInGwA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Alpha already provides asm/compiler.h (wrapping uapi/asm/compiler.h)
which defines architecture-specific compiler intrinsics like
__kernel_cmpbge, __kernel_cttz, __kernel_ctlz, and __kernel_ctpop.

Selecting HAVE_ARCH_COMPILER_H causes linux/compiler_types.h to include
asm/compiler.h, making these definitions available consistently.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Matt Turner <mattst88@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index bed3f1c8d9d2..237ef0c214dd 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -21,6 +21,7 @@ config ALPHA
 	select FORCE_PCI
 	select PCI_DOMAINS if PCI
 	select PCI_SYSCALL if PCI
+	select HAVE_ARCH_COMPILER_H
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_PAGE_SIZE_8KB

-- 
2.54.0

