Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597CC25B093
	for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 10:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778666858; cv=none; b=iMQT7qMpCxbtttVmISB5zMTDNuXcpxilZt+Rhh0L5fDwoM42/OvuWg9zwa/ep7IKTPOnn6kn5r7vrBA+oZlqt1eWbmmcULDu8G5K45X8Gve/lDtRh52VWD6lK78KF8D2rUb5MWdP+5zcTaYufnDSztAt/S0QNrkxqS5yoSeOZOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778666858; c=relaxed/simple;
	bh=7FYcAtqCkDRuAhNT0ZuaWJ+ehmXvvIPTDlt5vl6NT94=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=S5vw1xCJX659N0K1ooLAr/yVqd5in4mhweocxCUDAmiSLghRaalAB1VLmiFYQggSnSknlBG5S2ZwBQI0l26fbVjykdhSG6pEqcaIdFNONu/VoXbwn5akBnk/CP0Y61nWsTFSl0pPZ7wO7VQkVZs/InK2l719qQ5KMI8sj5q8Gpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/5VuoIz; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/5VuoIz"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-44ad87a57f6so682565f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 03:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778666855; x=1779271655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6OYzOoDs9BRlHknaQugKra02gfDHzOa/1dG9/aK3BrY=;
        b=Y/5VuoIzBOChQkIdEa3t2Yu6PeA3zbbHRo0nuSfAX00Rk0O5NktRP/aS4fxo4VEaYQ
         w8xnICzcYzritheKkMk2q9fM273InHFVPRRFKVLWqDLz6WzO6byCtIcV3+acqjq1wdaA
         XmbmmniojP88Fp16lXcTgYYvNxF71FmfPn/Lruf/HvqvW39I0hcSMqVdVstfARTA1eLH
         QQmsBs/xeEf0u8FtOZD5Cl2mDPNTfV87p1oaI7roIJaecw9hXnUkntcFICPJU1upbfC/
         SgKcNBJTNWOOegN66t40yXo4Rxzr/SAiMciVv6V2ORLMnLY770elqK3B0lICL5c2B8oA
         RADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778666855; x=1779271655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6OYzOoDs9BRlHknaQugKra02gfDHzOa/1dG9/aK3BrY=;
        b=LU7a8g1v3Vm/HkMxB1VqoOySc5Jp0u1EGlnxH8yadWT7dwuqiBI+48bo2QMfpRMoH1
         TVVAGUomb7KY9n0l8n7/+RkEUbkRgeuDnrsYopG6rSlUT1gJylOwCiKm1VP86oDr6C7b
         cTj+wWplrarlluSAoSr4d62qFZjYUBQv6JSvwbZB09q1ByAp3HY6ZIWl5FimCBxBwa17
         YWwa8jZPA5DIjPpGWppVwXPzQeYzRh7LfuAcBvKGpWJupqL/mM8pFNPxaJa9rYeSWre1
         yY/23zHq36qIiaZytzyPilcBbzisGp8CusnzRjy3MJEe4aJvawD9OAr8+vzsU/wCPXFJ
         h2wA==
X-Forwarded-Encrypted: i=1; AFNElJ/w+t4W0ji1KSfuo4HUttxeFqrWnG4pr1IbnWL2xJhZ63UiCKmh2DRrtEblCq0IgoVkVCfPWl2qkm0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMHhzt61ClhDsCjKGkk4IV3VvCyTuPUhiHQZL5eE9/+oWhROKl
	7zXQUjE+w4Yk1HK4s5u+YReb+rHyPvTGs57AOQ/wElAPOHfTeuDCVPsj
X-Gm-Gg: Acq92OEvChwXMag2u4iv24Y7im6NXSRrEAV8eDiDquyuPhXL+IOY3WY/A2bcES0dEGg
	t1g1L2AhgUfI+RplUQNOV+byVVsUiKzycLUWo97NEY230mMp/4DOu1XszUwAVtHtk5JZqIjd1BG
	juQVjLZ7G2tr1Nf5vSFKjRBtW0Xbm3zRrcB0AJ5/XAAeQWNb3TjV7F1TRQKUOA+PnioM7hn8zEh
	42yv701H6l1W6FxdMIHh64snUWKnGlhhHqFD0bf3LxxECRKPvRYQVUYBKCzopwwO+XGDsBoZoX6
	T6RJmN9+wAOqot6b9uYgBIeWYihRsDqQypiSqd/TABIMOWnnBItE6Wej8moxoikwnCId6EobnC1
	lGk+MkSvss8fgYiu47NYv0nzkbDqH2IfBvum8tjMs79b1+UEwHdYffGAL2KnKfyksKVPHu5Eunn
	Z6drIWgqR7pO/eSYyg8cEwrQsTPfip0nW40W03Yfsb34cMXpmzdwPxpQ0=
X-Received: by 2002:a05:600c:3042:b0:48f:d410:605e with SMTP id 5b1f17b1804b1-48fd4106119mr1140055e9.7.1778666854778;
        Wed, 13 May 2026 03:07:34 -0700 (PDT)
Received: from localhost.localdomain ([82.215.118.79])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm40978655f8f.12.2026.05.13.03.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:07:34 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: corbet@lwn.net
Cc: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	skhan@linuxfoundation.org,
	gregkh@linuxfoundation.org,
	hcazarim@yahoo.com,
	linux-doc@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sozdayvek@gmail.com
Subject: [PATCH] Documentation: iio: fix typo in triggered-buffers example
Date: Wed, 13 May 2026 15:06:57 +0500
Message-Id: <20260513100657.8498-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function call example in triggered-buffers.rst uses "polfunc"
(single 'l') while the function is defined as "pollfunc" (double
'l') on line 24 and referenced as "pollfunc" further down on
line 56. Fix the misspelling so the example is consistent.

Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
---
 Documentation/driver-api/iio/triggered-buffers.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/iio/triggered-buffers.rst b/Documentation/driver-api/iio/triggered-buffers.rst
index 417555dbb..23b82357e 100644
--- a/Documentation/driver-api/iio/triggered-buffers.rst
+++ b/Documentation/driver-api/iio/triggered-buffers.rst
@@ -43,7 +43,7 @@ A typical triggered buffer setup looks like this::
     }
 
     /* setup triggered buffer, usually in probe function */
-    iio_triggered_buffer_setup(indio_dev, sensor_iio_polfunc,
+    iio_triggered_buffer_setup(indio_dev, sensor_iio_pollfunc,
                                sensor_trigger_handler,
                                sensor_buffer_setup_ops);
 
-- 
2.43.0

