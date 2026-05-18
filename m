Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C116A29D291
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 18:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779128889; cv=none; b=uG9Zac0ODzs0ye3m7OKaXE0E3/PyGrgu5WP+rg8gUBqzgHNkfRrzQBIWcl9jiE15QY/wIcrWu4tnyMXFTHb924Ini6w+9BB2ut4we0Gff7HV/vQP6wu7KoGkVfstm19FxzLMaZZ5XGpN0aCevz2L0U47OJJbSwOUFXO3jd3JHpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779128889; c=relaxed/simple;
	bh=Ah9T/D7TaKx90qMGMFHvGj88FNtjPUUx01fez6F8Ylk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ocQpV7S/cPVSnWhzTe0ydh19r4S5uHyzZTGL6yb5LR7B31aw5k1oGm9JMFMtl9G8QOgZIM8VGdBOT6aJ0MEbN55g57cQth86M2BD3COE9DPfZQPUqj2n0/o2gPwfW140z8Ld6xLm6ABPM5ZCkW7MK6RIZQA5bQNhtOt3eILlPJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cKB2TQ2O; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cKB2TQ2O"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3664df32e91so2754334a91.3
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 11:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779128887; x=1779733687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JB4aW/MA1IgHT/TNDmbGBxtQNVtFxmmb6HgdJVp+WjQ=;
        b=cKB2TQ2O+VTbKylCcSN1G75VhmughYVliM8BQHCCjJXalOIWgpNopQ7os85xL+Nd/5
         csAgMmzOqigUjp4x/ALvi0sxwB0x3nvg7yUMDaLk9+CFR1w3rPQkOz13LUQOuQnCnCYs
         zuSQqnHfixmfw7obK6sxqTt/Z/HUuibjeRvmwlG39HY5JlxhVOnZUcAfKZXzCqNx9URv
         7+5bQ5SPJ1NdQS8JPrL1rZsDqpg/KGWCIJDhE0OdUDfo6spnLrjVRuikb1doHhKW1fdy
         rHa9qN45vpRD36ehW6GwHMmpBiRMMWLS9eC6M9++MpRK4GA0OyWb+blDa7OExsOdXkRx
         gHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779128887; x=1779733687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JB4aW/MA1IgHT/TNDmbGBxtQNVtFxmmb6HgdJVp+WjQ=;
        b=ARHCdIwdaNtBLd1jDl0oJKl5K9vvAa7oTEc+klpb7wVn+VVaEo6j7v19l35Yr5tctI
         +OWdC/6sDzKsTV+ph+mD/BsLis2LLuMOq5af96RtOgBnrBDAWbengYhzubew/GKFrfxT
         Xkput/QlRQgy8SYxi2saifl/McHM55goCdskfKAtgkzV+TEddHleEWpPdK6flbC2eAzH
         e3b3ccNhpE5JyzPG5Gr7jUpP4bkVzLfZWgt5spY9eBv3wffZrH0vpo4G6q1YSHNsyaq0
         icIwDyVFaZlYFksZkwvIYWgYSD4rXpuVLBWD7NeChlCgZG8yPLEiuG6NmrjMoxghteaV
         VxjQ==
X-Forwarded-Encrypted: i=1; AFNElJ8M4zc7pkB9Pfge/xTvBCOyEKUrbLD49mEXVHbaKJ0VDoEJuVqHdU1d6zNI97/4yZNFZhqxQiKBYUM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyClPb7oVof/NXJYMx90KwoIuU57XHQmukhau6sCdbH65oO7IjP
	iVg65S/wZPErEU6EbvFS0Qd2cjsf/W+qib6iTpqkZH3vSQqOsU2MTr2f
X-Gm-Gg: Acq92OGLzP3Rbx+kYsECxiaZHis3ChGhdbbtVdRNtE9vzICJY2H/rdLNZQuPI5g/YhF
	18Av5RXAZ19wLcOh2ZBUfMrthEc6qDDwDWNjIkUqQw9WaiVL4Luhxbycmtlp+G7CecjZZIHXSjn
	+uqTVg6w57a4I17L7+/QjqdErjYd2VrN58WuaCC6IEWjvu1QKvcinuOYOxX3/ORTrbmilTlxJGi
	tm+Nbx0sZAdcpupfM2GVPK4t2IKiPrmrNdd8VQ36fFQ87wpEZeEhppdgR37Q6P6JGDZUpBjf+Fb
	Dx3gpl9I2S5dqtY6H2hDVC9ksfbLsZm/Fk2lzAz82amyiyb8nYvKLZgZQmYWGqT+HFjeDglhgS/
	D9+YErw0z5FGpjPDvqe1UYq+24EBTtKaO9O6RtmGyTUvtqnk7sBjm21myoCcP34MdjdgQN9p6L7
	DfwAfMV/ag/gI0jMQr3jPAwQAc5Vn7LRr/Hr+P71XlPtrU0w4TRklb1k76dAbP7Qr3FQuYWqmCi
	sWFziVgiu2hz6Ps1eEIYEaVE0xxialoHeirVWSj7xtsMwDZQBqCnb7sh+nHoSSPYhw9TMQl9Q==
X-Received: by 2002:a17:90a:e7c8:b0:366:159a:c228 with SMTP id 98e67ed59e1d1-369518bad8bmr15658986a91.6.1779128887055;
        Mon, 18 May 2026 11:28:07 -0700 (PDT)
Received: from ERIC039ERIC.localdomain (1-170-130-21.dynamic-ip.hinet.net. [1.170.130.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05f9d0sm159320925ad.31.2026.05.18.11.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 11:28:06 -0700 (PDT)
From: Chen-Shi-Hong <eric039eric@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Shi-Hong <eric039eric@gmail.com>
Subject: [PATCH] Documentation: hwmon: ad7314: document sysfs interface
Date: Tue, 19 May 2026 02:27:41 +0800
Message-ID: <20260518182744.1302-1-eric039eric@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the temp1_input sysfs attribute supported by the ad7314
driver.

Signed-off-by: Chen-Shi-Hong <eric039eric@gmail.com>
---
 Documentation/hwmon/ad7314.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/hwmon/ad7314.rst b/Documentation/hwmon/ad7314.rst
index bf389736bcd1..b454e617d48c 100644
--- a/Documentation/hwmon/ad7314.rst
+++ b/Documentation/hwmon/ad7314.rst
@@ -28,6 +28,12 @@ Driver supports the above parts.  The ad7314 has a 10 bit
 sensor with 1lsb = 0.25 degrees centigrade. The adt7301 and
 adt7302 have 14 bit sensors with 1lsb = 0.03125 degrees centigrade.
 
+sysfs-Interface
+---------------
+
+temp1_input
+        temperature input
+
 Notes
 -----
 
-- 
2.53.0

