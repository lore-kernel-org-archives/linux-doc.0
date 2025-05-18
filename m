Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03211182D7
	for <linux-doc@vger.kernel.org>; Sun, 18 May 2025 14:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747576974; cv=none; b=oobZjxShA36eHXOkPOCeq56cD3QIbv3SsaLCKAlP72uf9b7i3VfOpUBDMU5OR6sgY8CFvKJn5A/a1xpy+wYXcePvFtoTcRprfkkAymohRpn3TpfDwvGZ6PBPuObdcjwLNlkTfH1kVjpnBoHP93xIjEx70a7ptX4u8yHnkOMv/As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747576974; c=relaxed/simple;
	bh=d1HvxwGZsiv8u1F0MMX7hbxvK/sQWlak+mL76ubJS+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SDdfNdWxCNQxBvmH/XL+2Mdzws+XR3UhJ2MfekC5A+CWIgb2TWSVh5oMyRIVQgd5qRP/DYeJ4+xqdJZ/hnPzZU7ggOAyLrB1mgGHN1fsFC62A5gnoy44JXdA0uuXy79JcnjNf6xbDVGlj+9ZC+d0Pyw91DMJo9E9gDm6MX/TbgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZcZ55+E3; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZcZ55+E3"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-74267c68c11so3189901b3a.0
        for <linux-doc@vger.kernel.org>; Sun, 18 May 2025 07:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747576972; x=1748181772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fsy/1/2jfhTrQ8yFSRwPaazrBwxXz9myqjSPmcjdTek=;
        b=ZcZ55+E3denlU1z+tiJ+D4oKGtyTXStJ0RvJe1Id1gwMfKh8i6zlYPeZQBAlzN7nck
         h3eqnq6vZVW/C2NRcQS2U2byZ87f4nOzX06kcH8FnlAzElt4KvgZVXivx9wCt1L5aDIm
         SApH5FbPHyGpHiJc26MBdBNmsa3sBPJ8UupafjHUB5hVpvfNL0T9F+clpTfUdVTvhhYb
         11YVWajuR73P/AlzJ3I3Vbzu/8PQn88qYkCHA3CLQMDXb6ei7yn+M97Ea67ciVCfFwWV
         edDszfe163EAXSIU5/ers+Mu3Aaiw3hknZgGwpF+Yojc2I8CSdRp8zGfxocHxyqQzMBW
         koOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747576972; x=1748181772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fsy/1/2jfhTrQ8yFSRwPaazrBwxXz9myqjSPmcjdTek=;
        b=cbnWB9KELzW2ylDZEHR428Zckje862jFOxeKBO3GU2+okCMMDKF3SHaanqIYxQYQRv
         xGMmvy1FRZjMMoYYWOdOXbrzT3MxfcJrnxCwEMzoFDmvk6HPa26n94dSQ0vPgcmzfVW2
         II25YgGnfUee4+8+Xk1UHaKau1tDPyFWDMVH3i+k8qqWpOmvNqGBMzwP0yKhiathmOCV
         OPvCl/FFmBayciml9RZnGN/W+lQLlMLCMYFw+qwkfNtrDkNIdmOlAhuW/FvWFrga5FVB
         TlEt8+myGsekBgZaAyn86BUM3/pxPYfqgXzEBUv5DG2ccYjmcoAUG51fAYUrTRwyx7ib
         Cnhg==
X-Forwarded-Encrypted: i=1; AJvYcCXn7zx8xsQ4Uz/8LW4KeZTxgpvU7C8lGu8I55s6zuqttMpqSaQlI9KN5KHgAENvPIYcRSOq6gT1Jy0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBpcLCR2udXDdiff/rI/I8lXSlmr/vhvl1aAbq4H/YKQcJtRiw
	qR8Q9mxOLR6+xgfuyDSWfkUUoPtopv9uMBsrBcWZoiDgGRWUGp3SbGXW
X-Gm-Gg: ASbGncsm7xHiwqZZdC6lHq9Ewe1szOgeorm79d8Qwm2N74INUpHAGP3nRwKx0Xwwewx
	FMsXh8zHka0uj2cnerMWOdP8OaWQCQ9Vc9luiv+OBw4DkVhsleEsd6TYRXNxq+eAIiYpW+b/PXp
	BOJRqbuzlmCUDttp8dzcTqzRg5gKB/7Vcu5ELiFZvDK+J0RUJbhZWTrcJuafypHkheNGok50WyC
	ztvChkG8QBtBAr9oXmNuNXPOMbdaO44/xpmAvc628XHgUK26KCXY3OEWs90O7YodfomqyJ0BnyA
	c9n7vPHU+dHUSiCz5UDd1J9DM2XFQ24GJUsLI7cLbH1rtZ8Cn35fFbZG/xMelGQNxzl4pw==
X-Google-Smtp-Source: AGHT+IFWVlgoy86Ca//+WDZja6kxlAwBtvJ14qE1042DmKmudax7KJPnkF29yOYElYTXfa2jhTC0vw==
X-Received: by 2002:a05:6a00:9094:b0:736:57cb:f2b6 with SMTP id d2e1a72fcca58-742acce138dmr12728298b3a.12.1747576970595;
        Sun, 18 May 2025 07:02:50 -0700 (PDT)
Received: from localhost.localdomain ([45.252.73.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a98a4755sm4685230b3a.179.2025.05.18.07.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 07:02:50 -0700 (PDT)
From: Anish Dabhane <anishdabhane71@gmail.com>
To: corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Cc: Anish Dabhane <anishdabhane71@gmail.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH] Fix spelling error for 'parallel'
Date: Sun, 18 May 2025 19:31:03 +0530
Message-ID: <20250518140107.21310-1-anishdabhane71@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anish Dabhane <anishdabhane71@gmail.com>
---
 Documentation/gpu/rfc/i915_scheduler.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/rfc/i915_scheduler.rst b/Documentation/gpu/rfc/i915_scheduler.rst
index c237ebc024cd..2974525f0ac5 100644
--- a/Documentation/gpu/rfc/i915_scheduler.rst
+++ b/Documentation/gpu/rfc/i915_scheduler.rst
@@ -26,7 +26,7 @@ i915 with the DRM scheduler is:
 	  which configures a slot with N contexts
 	* After I915_CONTEXT_ENGINES_EXT_PARALLEL a user can submit N batches to
 	  a slot in a single execbuf IOCTL and the batches run on the GPU in
-	  paralllel
+	  parallel
 	* Initially only for GuC submission but execlists can be supported if
 	  needed
 * Convert the i915 to use the DRM scheduler
-- 
2.49.0

