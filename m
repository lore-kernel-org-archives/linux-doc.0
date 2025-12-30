Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B483A21ABC1
	for <linux-doc@vger.kernel.org>; Tue, 30 Dec 2025 19:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767121340; cv=none; b=d0nP8eg9kTDPG2Wa9/tKF8ubs2FLeQfGz1ZWO8UMjKKHfcFZ2s2ou9JemD5GxjM/H4diudf1tF4KjoaCbeBUPQliV2wzZ8fMrzChiE39/wgv69GkonUdW+ZZ4ttuu7QOE2CGj2A/BdKuiWDERoAcCGPElrd/xIsTLQzh61NvQMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767121340; c=relaxed/simple;
	bh=QhpHYPLAQYGiPyQTnWj+O/rmP1vX5AFk5AGfbMq90SI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DHzT8/GPA0nD9xA8/weP4ToLkutmHsHBKUUhO9JCvH3+ABKhpCfprA9TUq1alJdQpgciH1+5iyV/KvpNf1fEAbi7Q3axsnX8r5QTNdSBFTXfkTS5rQjvmyXj4l9ut68xpbYYFpLbEDPAE1ei85T3VGUBYMRKh21B696xfsefQGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLmbvr9F; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLmbvr9F"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-29f1bc40b35so176424515ad.2
        for <linux-doc@vger.kernel.org>; Tue, 30 Dec 2025 11:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767121338; x=1767726138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7aq15LiLdzEIAY2OOsJIjgvETUFlN0ySZTk06DpCf00=;
        b=YLmbvr9FUrH2EhFqUCLdKlfTCa0JZBlZrV7Lm8YT6voqnPtRjkYH1VoMIiDypkFsVi
         UVnbB8/+tk34K/Bv10GNlttUDcZGYmtleg1LCGO1C4FJY11i7CTAkZe0fKHdgyPB9Wvv
         tcfUu5la8op2SlChT6bX+7ATF6JwJ2W+mumC9VcXU8JQkjCcwPue1CwXYR1GZCuettbb
         R8goI9AiZywBLp4wGQ7TnT6xLX40ynfYVLQ4a8Dh89gkONG751JmvLQ62EESPGPefV3Q
         CExXYgI1GdIJNtOjOeHdSTZzczPhfkd9GsHcSHvwFEGeWZ+zFrodASpt/BmAgxTrzL7E
         o4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767121338; x=1767726138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7aq15LiLdzEIAY2OOsJIjgvETUFlN0ySZTk06DpCf00=;
        b=VhCCzwIumn0/5JY2yF3Hf6fPi/a6RW6F9zCEPFMHpmqWq1uT9ZyX9W2xxm4A9EYQz/
         pBLi58jbqFloIIiz3PgmJ3SOh5+WOQUODoh118BozVQNe0ziyZnhi6MSAnOtZ18YLB/4
         qlUGm4wEJYTZ5sUYKIIyj9MalKJyvgujYuHI/2XkEmwfcf2O2IGFetsN+2k0UWdofukK
         a5MlkfoN1LRIaiFtqBsHCi5LwIYnCJBThu1mV4n+vJjmMEko0+jeX9RsBir8voEftkit
         K1z1whpPxU50+qZ4DPQuFjtB7QSvOdWwetbx3+OqkVo37dSrKnXc+K68DPVZL/U3av5+
         doOw==
X-Forwarded-Encrypted: i=1; AJvYcCUcydad+Qq99qPsRLQIpeCWiSiuIdQCLXOdbKElioeIhmUMkaTje0G1lcfxOakhTGHxVbtKXa1wDns=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxqTnEkykU9zIbhX0k2tVEU/LNozWAU6o9/TkCxrTS+BUHLDHl
	RF0Pp4wsYnChIAofBqfiHM5LVU7dpt15hjWRcBkxtaeIgTq4Kl/Mka/S
X-Gm-Gg: AY/fxX4D/L5Yy7lNMDp41/sGvSRuNmXnVtNgMPZkecWl9cgW66L3QJI6abZKQb5MjRw
	/OWWbrHP8QtGcMyCoJRviu4Tp8e1bUK1tG74/osa0ttTOGVxG9QL/g2zAKdvaM6FcBD34DOg7qc
	saKKKiDu9hAJY5+DMohCjXhcD0Rj5V9ea1Tl8EyABtQ7hN/+iGvs4+9wAYSQOix18e3QIdYvlZt
	GYDr6SbHMps3crbFMKRRRIq/38W9Xv4ht/oX8HzilENTiiRx1EFYxP9oojAr+36I9LEQCIRZRqn
	j/Iq72JXWvCrvHqx2iGXadZDxUDAZ6VCveoptPfYaFTyUbW26OO12Tr5xel1hKmFnugpV/3jy0e
	9Jxn+nQePQTb7De0yceWkojqpz21GEIOKa+lie8LKoKF8egUdXkhq2rfTS7hKYa4AwCbyaXdPC0
	y2/qjRverf7ty+/PcD2vMm9U4Z4Cy/yJVffZ+g3CEDuOOe
X-Google-Smtp-Source: AGHT+IE9GGeR28+yzIQZ8Dja1yBv27CMqcSW9axK6qxKyB0fhHlSQMzODAXDlk6uPzJ17REGfY1ALg==
X-Received: by 2002:a17:902:e747:b0:2a0:b02b:2114 with SMTP id d9443c01a7336-2a2f220697cmr335921845ad.11.1767121337722;
        Tue, 30 Dec 2025 11:02:17 -0800 (PST)
Received: from Lingbou.localdomain ([113.225.51.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c8d10esm302147655ad.42.2025.12.30.11.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 11:02:17 -0800 (PST)
From: Xingqiu Xu <hilbertanjou83@gmail.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: dzm91@hust.edu.cn,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xingqiu Xu <hilbertanjou83@gmail.com>
Subject: [PATCH v2 0/7] docs/zh_CN: Add timers subsystem translation
Date: Wed, 31 Dec 2025 03:02:05 +0800
Message-Id: <cover.1767118457.git.hilbertanjou83@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series translates the complete timers subsystem
documentation into Chinese, including:

- timers/index.rst: Main index with file structure
- timers/timekeeping.rst: Clock sources and events
- timers/hpet.rst: High Precision Event Timer driver
- timers/hrtimers.rst: High-resolution timer subsystem
- timers/highres.rst: High-resolution timers design notes
- timers/no_hz.rst: Reducing scheduling-clock ticks
- timers/delay_sleep_functions.rst: Delay and sleep mechanisms

Also updates subsystem-apis.rst to include timers/index.

All translations are based on the latest English documentation.

Changes in v2:
- Remove trailing blank lines at EOF in all translation files
  as pointed out by Dongliang Mu

Xingqiu Xu (7):
  docs/zh_CN: Add timers directory Chinese translation
  docs/zh_CN: Translate timers/timekeeping.rst
  docs/zh_CN: Translate timers/hpet.rst
  docs/zh_CN: Translate timers/hrtimers.rst
  docs/zh_CN: Translate timers/highres.rst
  docs/zh_CN: Translate timers/no_hz.rst
  docs/zh_CN: Translate timers delay_sleep_functions

 .../translations/zh_CN/subsystem-apis.rst     |   5 +-
 .../zh_CN/timers/delay_sleep_functions.rst    | 135 +++++++
 .../translations/zh_CN/timers/highres.rst     | 270 ++++++++++++++
 .../translations/zh_CN/timers/hpet.rst        |  43 +++
 .../translations/zh_CN/timers/hrtimers.rst    | 187 ++++++++++
 .../translations/zh_CN/timers/index.rst       |  30 ++
 .../translations/zh_CN/timers/no_hz.rst       | 337 ++++++++++++++++++
 .../translations/zh_CN/timers/timekeeping.rst | 202 +++++++++++
 8 files changed, 1205 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/timers/delay_sleep_functions.rst
 create mode 100644 Documentation/translations/zh_CN/timers/highres.rst
 create mode 100644 Documentation/translations/zh_CN/timers/hpet.rst
 create mode 100644 Documentation/translations/zh_CN/timers/hrtimers.rst
 create mode 100644 Documentation/translations/zh_CN/timers/index.rst
 create mode 100644 Documentation/translations/zh_CN/timers/no_hz.rst
 create mode 100644 Documentation/translations/zh_CN/timers/timekeeping.rst

-- 
2.34.1

