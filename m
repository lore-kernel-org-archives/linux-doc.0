Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C69035AC17
	for <linux-doc@vger.kernel.org>; Wed,  6 May 2026 22:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778108386; cv=none; b=qDIetJlRZ4T2234gD0MmvORvcNWzFtobJg5vzs9rE0C65uH9p4nEgS20JijpBHH4uZYoEde1ZUDfuOyC6mwRh7vrsmqaNZuA/h6t58ehJX/tFe5AyM8SZuprbJ24QGwizFLZXFfNPc6IHuYBUg1SZXrQH5zCpa3rzKp/R1IL0Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778108386; c=relaxed/simple;
	bh=P3AZvMdepfiMXPrEFWxcpKko0mxqF7SpSZHSwvRiPho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VqgbojYKF+CUz1X+pKI9pwjVVfYLWNnczwzLZEL/q8w9VkU+YgORXCyw9+YC81mrRMlqco7qwTiKoBTBXVJn8DU9Qb+t56lhTmPpHYe7RgXHtoDk42q006nrYSeB34Qqyr8gvUKw+AUoddblZsQYHHTAxgvu/3q57jAhfcBC/4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XRMGlpy4; arc=none smtp.client-ip=209.85.222.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XRMGlpy4"
Received: by mail-qk1-f195.google.com with SMTP id af79cd13be357-8d6d5e45c43so26095385a.3
        for <linux-doc@vger.kernel.org>; Wed, 06 May 2026 15:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778108384; x=1778713184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NNSbb1DA2Nd54arYFzCTAu05b8qEnVGy5kklrdtYQDo=;
        b=XRMGlpy46C2pjrIzikGYzwjgJBPJotY+hLw2udHdU2WQwQislJuL/YZ3x10GwepdGy
         MdiMxJp129dV6Kdqa5Eib/61DZgGI5HdA1j2RCBJKnuRHp9r5M72XV+ST7BOFLWbgl49
         mnZ7wE59ry3I4QAoKZ1Yw2hiwfxjQPBCQ3/SkYfyQ17ooIZ5CioYNlJDggsP9AdilS5q
         iC54pQZjHiSp5IVgaBvZrqrP1Bv7PRJ6E3e2dp5CPciiwTBFzRZq/17h9iWVoAEScBUF
         sCrABgWQL7NczHlxw4oSv7D29wjDWgBtKwlSmlGlgnEaMOfOdOTgWj88Yiokxyegq3e+
         pYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778108384; x=1778713184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NNSbb1DA2Nd54arYFzCTAu05b8qEnVGy5kklrdtYQDo=;
        b=CxusouKK9MJwLio9Eh77tc/CyQhB91Rh2s8/G0xv4ZDakj4zglEpIR4BquFGGwz+bS
         qdVgi4pl1eBJ+ln3GrWAenWDYz07C7i6S4XHyDKQONetUE8kXj0x6nLHgIegNNBz5w43
         FELtPWSe9AQ+jp6yAAHOl7xn+/DasRzkMdmC1LuEEOkivpc6ncbxFCC7+HYSnsGT+ORG
         TIWPPcg2fTE2Fi8KhvGTlkzkcJOtmSM7JE6GRfUs/k8EjSxNNC/HM9RkB+HO2oJsx5F3
         i9grYnqpk5jBnVDi1+fmYNJTMpHUeymEZHsgSTOJ5LkRtW42UsYpvIi1C4zhZfLgbe9b
         4uww==
X-Forwarded-Encrypted: i=1; AFNElJ/8cnFHBA2uFO0bBKK7YPJGI8fgApZOAWn7RKOwKsqXdw/frCiW/XQ33/JUHh5EgdrTAKjC3+4IGs4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAbTpjL914veZzKdPVRtUX+66MibF3Nl6Pqmc00WQOHMfvOBWm
	auYzloEhv3IMV+uQHfp7swVwTnxO/gezHJl/kfyWIqPlXGPHI9phlrCS
X-Gm-Gg: AeBDietByFWKZWmxiSMFPEavgudIj/355kXLOmiDWnXlDJ6CxpzU4B3knm3hJK1dKXZ
	LewuI7EC3HVeGu/UF/jYIZlIxYGoIa+xYHXsEJl2SjukyKr2JbF0HKxNoFjrONBqPd6TTfV7MYw
	a1ImTT6stqhXpEEUwLCZj+ODYj1KkaPFCEJtiEi8/bYkjvNh+jIkxv1huWa3s+7VTWJbIKvfpf6
	pM0y81bXRrD9N/Dd2rZ7kgNYcBXhbNQICVBm1rfRbLtaHYCoq5uQkSKgYoILX55bc/jF/4TbKK0
	zCKyUkRjTAfPXo5xEpaPFWBcJhOVW6msT5vG6bScjo4XkiurRrNfN2ZYXvF45x1GXsBCFpY5ySg
	o7x7kHOIZpL8jhbuVrthG0+gWN3vcCJSFw6ged3ODGJO9rDRA/z8hKqv3AON0JcZH2s4zUg28qT
	diujjqRQ/Y/w180GNwFH2GUqnMPvBmNGgwFXjMQDi5iYdkeym2wCw9DbiULg==
X-Received: by 2002:a05:620a:4624:b0:8cd:92c5:b3e7 with SMTP id af79cd13be357-904d4a61a19mr831781185a.18.1778108384066;
        Wed, 06 May 2026 15:59:44 -0700 (PDT)
Received: from fedora.lab-gw-1.osiris.cyber.nyu.edu ([216.165.113.4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-904f810e354sm327668685a.45.2026.05.06.15.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 15:59:42 -0700 (PDT)
From: Mayank Gite <drapl0n.kernel@gmail.com>
To: Paul Moore <paul@paul-moore.com>
Cc: Mayank Gite <drapl0n.kernel@gmail.com>,
	Serge Hallyn <sergeh@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-security-module@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: fix typo and formattting in security/credentials.rst
Date: Wed,  6 May 2026 18:59:24 -0400
Message-ID: <20260506225925.271163-1-drapl0n.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Fixes a typo in "Keys and keyrings" section. Replaces "keying" with
  "keyring".
- Updates formatting of keyring types.

Signed-off-by: Mayank Gite <drapl0n.kernel@gmail.com>
---
 Documentation/security/credentials.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/security/credentials.rst b/Documentation/security/credentials.rst
index d0191c8b8060..4996838491b1 100644
--- a/Documentation/security/credentials.rst
+++ b/Documentation/security/credentials.rst
@@ -189,9 +189,9 @@ The Linux kernel supports the following types of credentials:
      be searched for the desired key.  Each process may subscribe to a number
      of keyrings:
 
-	Per-thread keying
-	Per-process keyring
-	Per-session keyring
+	- Per-thread keyring
+	- Per-process keyring
+	- Per-session keyring
 
      When a process accesses a key, if not already present, it will normally be
      cached on one of these keyrings for future accesses to find.
-- 
2.53.0
