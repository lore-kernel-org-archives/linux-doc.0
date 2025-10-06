Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B530C1BC3F
	for <linux-doc@vger.kernel.org>; Mon,  6 Oct 2025 00:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759710044; cv=none; b=Eqqzfz188feT07+xemxeDJ8/F704V2agzRViEixa1vpvjnuICFm0vfXBaNjbqHWcsjmt0llxNRvj0qT5pQTu3J1Y+rwO2Rn4ya8RbnCtc9Pn2l+mx1PGVvAAtDuh3icKMHAQDGBHnptKEVgbB/MHyVS41gYwBFKppTYBjWkUzqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759710044; c=relaxed/simple;
	bh=55VcI99BefU1ClGWEt6w2p1Wq4Ig0V9YUg0p6uKAx48=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=t77yqBF/9e1cxl6UdtxnNkR9DzNax6uCztMzYooEISzd30QVecSh9UnUKRA8qaaCu2YIVdl0Y3WsxBrP9q4YoaXtpnMGt6KKNqCLacng++r/CFzzjjsrdmbIjJKgIgR/fbXLgoeU51agNAUgWx97+BPszcVj6nE0ElvOGHDYyf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XqJAvEUT; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XqJAvEUT"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-42f6e0bdcf7so6576395ab.0
        for <linux-doc@vger.kernel.org>; Sun, 05 Oct 2025 17:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759710042; x=1760314842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fu5Ah+MFhPdDtEFol8Eh9/iXvYEpCqqSBweQNTT6OA8=;
        b=XqJAvEUT/g5Sr67gEw/FxjNODGytThoqANKDNfqaZGfaf08/97xocFsR4xogzPbnwy
         Fsa/xlGIdD43EBHp+mJB//+4yeD/kqUrMY16+2kKKsAFvDagSfiNLbEE6NaPdEHdJP2k
         isGloBru7Fx49DwuYZ/1pWAhV16HvmvaLU4v+F8UWZnRYomh1bk37lBi2xmAgl6x6bP0
         9u+iIq6ZhW/fusSqymF9PFAZkCv97mYzUuhPlbdpc28eakijncnhI7pc+USMHvot2E0V
         UCD6eGL+Bpf/ybiVfxP2RS+JGr2ZUdhtbbwGvWIrtr1hV7S1w8VDHURY7/k7jCd6QtZC
         e0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759710042; x=1760314842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fu5Ah+MFhPdDtEFol8Eh9/iXvYEpCqqSBweQNTT6OA8=;
        b=QBJmzLl23EUYIsCmjPqd5fU6kpUxc7pqzxhXHIEzfacWg1QRnwy4DsYY6XX2gkpT8a
         cmcURKj7+7eoC6qXyKMFPhRb6ZrDpCjOybJGN0Ap6Ue6t/HQ8zdR4C1c98cDt3LB8n0Q
         FfzYXiQi/bOTjFavGssAqmhLd9pDGPK8VhQr8TwYXL31kz87wtjIb5DRuSp1E6imyN4D
         CV7AolkEpo6RUk+pyppqhDovx8/6vDumt1192/dbiWjF0bqbpkE5cALQ2PQQUnpRka3w
         79j8FPuaIEaa7cuq1sQau1lrpFHvuUBQkZ+N2nkUWyHOwVmPunGDH/QQYReHIcq692JN
         ffew==
X-Forwarded-Encrypted: i=1; AJvYcCXM2uMtpy4TFayL1JeJI/5o0TGzi3qdKLK0U/a2kMJeWsogU0b5fPZgsFbODNQo7yHlXKK3/H42eME=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh965zmgkcTuYkRKPCjAUO7DhRX0Af+QiS8S5hRyBt4ptWSCOC
	cy2pyJQ1mRcBRVcwXeciIgSaP7bBIXUM1WQbOcmxgVOSvfO2IBG+LW1H
X-Gm-Gg: ASbGncu+f6e/ewA/9xDo5lP5puvrgWmqNbt/j10dbhMahe6wSQ8n78dV7j0O0ea1l7s
	8gO1o5W8hjRQO6m/5VaROV3OBa70F701LmdvmRVQV7bwtsWDf+OlanzaI3vq/PU9qivqFZnoj58
	lG10xvVGBLl9EhvRQgI+MAQYj/zcdi8BjwjBo6L7XjCG6u6Xxw8cWR7TFKSSN87Qo0anohtwOb2
	UuBUn8MI7Do5ZnaIPf1LKZ/dB9QoYeOzwanrrHyzPvJWttRUTRc/NYOKosxbgtQzYm1qZV+xcxC
	qHTIvBmd7keRmA7+uw+EhyDefkv/9qpKs9DQsU5DT6/nsgtPySaKxxq3I/LO8knCAJwrFA9JzNL
	iRnHjc/NkcDB4djhGeX+EgB/EKEDd3w9warKHma/5w9pOXB8s3E1wkQjOviY6DgEuw21HIrENy3
	W2N5LLDXv/
X-Google-Smtp-Source: AGHT+IGff2l9ufL4NeNqwyVNjvL8Pud5v87IH+281X9l0kkYxr5cs/X7Utey6E9qDPWIEsvuhOgHvA==
X-Received: by 2002:a05:6e02:12e7:b0:426:3ab1:74b9 with SMTP id e9e14a558f8ab-42e7ad9b00amr173366855ab.25.1759710041692;
        Sun, 05 Oct 2025 17:20:41 -0700 (PDT)
Received: from gabes-framework.lan ([2607:fb91:3c85:4c0f:1139:4ccc:af91:f49b])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-57b5e9eba46sm4325943173.15.2025.10.05.17.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 17:20:41 -0700 (PDT)
From: Gabriel Whigham <gabewhigham@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Gabriel Whigham <gabewhigham@gmail.com>
Subject: [PATCH] =?UTF-8?q?docs:=20hwmon:=20fix=20typo=20in=20sg2042-mcu.r?= =?UTF-8?q?st=20Fix=20a=20spelling=20mistake:=20"supprts"=20=E2=86=92=20"s?= =?UTF-8?q?upports".?=
Date: Sun,  5 Oct 2025 19:18:08 -0500
Message-ID: <20251006001808.16962-1-gabewhigham@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Gabriel Whigham <gabewhigham@gmail.com>
---
 Documentation/hwmon/sg2042-mcu.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/sg2042-mcu.rst b/Documentation/hwmon/sg2042-mcu.rst
index 077e79841..431ed832d 100644
--- a/Documentation/hwmon/sg2042-mcu.rst
+++ b/Documentation/hwmon/sg2042-mcu.rst
@@ -18,7 +18,7 @@ Authors:
 Description
 -----------
 
-This driver supprts hardware monitoring for onboard MCU with
+This driver supports hardware monitoring for onboard MCU with
 i2c interface.
 
 Usage Notes
-- 
2.43.0

