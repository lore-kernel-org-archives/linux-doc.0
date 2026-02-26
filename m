Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48EA376BEB
	for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 12:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772107301; cv=none; b=t+Mak+Fg6MopVJpcJBkKLPO7yG53pOyOyjtlQu9UavLgB8a6rXQvBfH6HBsDtY11rkO4FXIKdN5cPegoJpzjV5Q5oWylsJ5EdjWI2nKasdIZPDXsVKuMo5qISzRJOTJX+8W2qMnFen4ZuuLWdOi5W2WumPnwGy4ZauFka7JqxaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772107301; c=relaxed/simple;
	bh=lOTP8FrIov2e7dVb3Y4WcNaEhXGCUgtsnDIXoBJkj7c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dWtBIK/A1M4fxr+PZFL+4nQpBElqG7vBk5F1UB+0WN1bjgyW3eYWHmoEYA2IQ5/SBu4KNF8Zt0qKxJzeCbDKPnEUJheC62i2NpEXFlc7D0sRhad21C310Lrr1ANHkyhwzTTfAsj3rGk/F1kYv8Cr+B/C8oB+8N4h1U2x3DVJ+wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kS6mbL8+; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kS6mbL8+"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-823c56765fdso448936b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 04:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772107298; x=1772712098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UALYHyuZ44VYdeN2S/piXTnAWo+5FUX4ABQmcZPPMjQ=;
        b=kS6mbL8+BEGBzlcJhg97JUEAF6e+ZUBfG7HkisGXl8+grFymdtZiZvWgddgbAo64uN
         P8ocNjlGS8diIQKiPdllDBmsIAM5inwJgK07RlHmab1u6UZYUK3m+fGL5Pi6wZeH4U6Q
         jfupX+dyjNiE0WMoYSMcbTJvsahgqpWsYJpuXU+gmujl4c9JaCL5XiASRL/PS6kMpwaC
         cl1//OBqmYbZYbAf0uzrvw/melV5hyUJgD+hkYG4XcGm10K7+K+9sn0AkraNmzIAFi66
         FmkA/9Sgsopktu8bjJwzh59EoEc7Q44MFfuSLJOryCafQZefxJ0V607ChaeaZc5seoCx
         EDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772107298; x=1772712098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UALYHyuZ44VYdeN2S/piXTnAWo+5FUX4ABQmcZPPMjQ=;
        b=e9wpOLJKHO3iH6UupKQjR8jrYYfm9Wprn0WHtlrgl/sNL4zxVMH//uVHkaGDLZ378I
         LlUpKDqQP3a+FQuEDyjL5Gy0FeKsZ001zlWQF+G5U2tTQaa0jfQCBEAfPh3L9Dx2+IJo
         8p/O6AT1lXxSIZLHS2ZJ+GAwSrx9OQAjOBrSrxDk8laF4TFyX9jxt7/ORyKnXu4YAIiC
         IdLN1czfjM5V3g8OocokP1UVr7k3jPVPlALBrnzkvA2QvD6rMnaAivCB3/Geir9Kzx0D
         oz4HI+jU2PCq7/AEgbhL18j1bvmk54sHEQoPNyGAddB9EgN8keM+ZRZkZI3aoabZbZhg
         jE8Q==
X-Gm-Message-State: AOJu0Ywq9u2ULxgHc1ZfFon8SWliZjPx7/hOW2MjnJJM7Xef49N9nA4a
	R6L6mpbq/CPOzADtPjSKKLvcWrnWyNeQplyVBfM81Bh9ICvapRK8AztsCnCCZkNfzJk=
X-Gm-Gg: ATEYQzwKaO4YEGVXLRkxSE9AvSyJyQZUV+QrKC9E5SNqCyqiKivJnSetOUK2bPd2aHE
	4Uf8y2/aQQMeOLj6OtSeGIySdxAwHo+uR40vV0/6t0S5kNmGicltM80EBoqpmZl19YbbbHbtXih
	K8/XKb59XRAt1P9+/Z7U0onXzOUJXcUzADpewR+5NrnTgtYk/UKMP/eZ56A1noagGyZCejO5dJ2
	2HUQGCaHoklri1ktgFmdEIFitRXG9T6kokn9BX42VSR9WgZS3tbeQ1Z5E1HQojfh5UcejKHEi9n
	J2jNvE9oQ9iQ3NgW959GsOC2Z9h4zqHPdPSeoCunF4LLkH6ETr53GKcWiC6pQngASP5EF6uuOLg
	2lR3aQd3fSNYAzeNQLCHaJtbpyTybJQlH9INus44oPHiAIGD5niOP7k52sGdFIUAZFG/mVB8FSo
	eSRGKkrgHDs1/AhXiDmzMgj7td6laG9a0=
X-Received: by 2002:a05:6a21:9e0f:b0:35e:11ff:45c1 with SMTP id adf61e73a8af0-395b47b1b96mr1949321637.18.1772107297531;
        Thu, 26 Feb 2026 04:01:37 -0800 (PST)
Received: from localhost ([103.251.247.23])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa5ea0dcsm1738183a12.3.2026.02.26.04.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 04:01:37 -0800 (PST)
From: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
To: linux-doc@vger.kernel.org
Cc: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
Subject: [PATCH] Documentation: process: backporting: fix missing subject
Date: Thu, 26 Feb 2026 18:01:29 +0600
Message-ID: <20260226120129.18610-1-islamarifulshoikat@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing "it" in the sentence:
"even though it could have been changed by other patches."

This is a grammatical error in the Error handling section.

Signed-off-by: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
---
 Documentation/process/backporting.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/backporting.rst b/Documentation/process/backporting.rst
index c42779fbcd33..0de9eacd46a7 100644
--- a/Documentation/process/backporting.rst
+++ b/Documentation/process/backporting.rst
@@ -432,7 +432,7 @@ The same goes for added ``return``, ``break``, and ``continue``
 statements.
 
 Error handling is typically located at the bottom of the function, so it
-may not be part of the conflict even though could have been changed by
+may not be part of the conflict even though it could have been changed by
 other patches.
 
 A good way to ensure that you review the error paths is to always use
-- 
2.43.0

