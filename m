Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43E633F8C6
	for <linux-doc@vger.kernel.org>; Tue,  6 Jan 2026 19:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767728849; cv=none; b=dgEzEGfGrucOhWzMN8jqaz+fgUvlr2ItkAbU3DCoGHXloiN+sLVaBISBA8iUO4JO3mc72yMXtma4JdKPXume+cwYhj+Vvhy7xvlmWVIVhF4C0XjOB6IIAMWgqHGzH5eKn1GM6onHhS0NKf1uUIAjT0TJqRtJf/VhsYW2/wleSQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767728849; c=relaxed/simple;
	bh=UQQrstnS/popAc247iN9/Tuod15ycwAwSoyy7ErqX7E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XV3m6SbGTK8D6KFc5/nG1QZEH4JGQSK+wTbBWSnOTu2PdHHfjt4xVGLctBDDvB2zSfrdsYxAKJ9czGEtV4VKh0nBSfsZGF1PdJgCj2s0cSfDMHJbKCZlmv2TmSWzq9j1Yv54tdG1uoM434ZjqmkfNqOAoLtK0faf69Sp20LIIqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bM566+ol; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bM566+ol"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7b80fed1505so1252789b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 06 Jan 2026 11:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767728847; x=1768333647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wrwI6GgysR4kqaa/gy9iw/5u9/NCQplFHWpyvD/l50c=;
        b=bM566+olBjGv9VnyD7cFoJFqwM6blVYslZZsOG3xmLKXcNNT0+lQkFqcDtLXX0elhs
         0oBg+tH8A9+/o/mSFkTgpnxqzlsnpoK0aSzsSJ+LSdSHkL2sFVSQs4oGApS9dnOh0FkW
         z/MzSmcyeKt0/mjRcIhTit1F9qGWRj8B7J/FAcvs9F3N5/bgK8B/ET90wOvi15lud1Ma
         GTMN8snTywl+wbMHRt5fkUydN3DXQnlWRAbYh2qJ2CcwUWpc1oQpgGHEjB2g9kRqhD8e
         QGzfamktOGuvdXyVouSMqA5Yzu4uGc8fAZLr9YCfnn6lClDJxIKiYPrZER52raVjbADY
         1CJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767728847; x=1768333647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrwI6GgysR4kqaa/gy9iw/5u9/NCQplFHWpyvD/l50c=;
        b=sEmdrIVWHw7gcQ99znYQt7ObfEGMoFsZ68+Aj/MIPgkc7PrmkZMaV8gcr/Q5uxjQAm
         xOZYafhHYUbRprVnPqQV3PGpk0vU/3U5xqGmg5VL3Ui0ExakiX2TgzKDZSdl4Ag9MQRQ
         26JfrNTzPiW+K2hbTMiBqbQEl3TX2FojKCeNBN2Cs9O8R2Bm06Gy6YB+S3nVjEHRVSiY
         ALrPfkD3+KDLZRiJTbinWM6+r2j5qtTH4Knt2h61m1hajg2dDWCPTQEcqNGiYn5QnXhU
         ca9WiU/m/loGHY2xHqR+zAcV6xMK7xT4VEVLslESY+A2E7GcQaHl04cyJR2l3maUi48T
         NaEw==
X-Forwarded-Encrypted: i=1; AJvYcCWCHK1lxOTHaKNw6dTZnul+zI9y3gn/xXyRM+VtOMBd12Hzu/hMYpmRnV/84QsCF96ZgTG/VkHCsQE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhthPzuv9C7ItN8Xiw6tAGGehfPZ0YFZaYuJjLcpODuM9IBUq5
	qyIYvZCXgRklOKT001JKEeskQmeNOpVbNtvb0qrOPdwrxGq5rqJzGm5Q
X-Gm-Gg: AY/fxX7ISYaBrsXEVmQGoy0VN3F0ztL13klloUUUP+j96CVQClCxZ+cQ0r/OM2rgEBk
	9YirjZn3kUpJ38SX7Lmi5aEDscNvwJhUCesfWOY24j3PWOHNiyGi30Fhp5opEPA+Xhh1UPdJhFR
	mRxvhuaN4H86IZZYEy9kD1+xxoybYCK38fJFT9xfh+oEygvb58Nj+YAXckDLRFcFLZ6xwWj1UfI
	waHrtM975ud1ztBSV1Di2ZC4+7Gi5wgT+7EQncnmDHn4dxL8+40+OiDBHzPnXCdY4lVjepPe7TX
	FnxZy4b3jTk2VWDPH5EnDWtyKoC+Rx/DDcnPyhZRJR6ojUM5vqRLIzEouYZFIx3YO9xNo3rZr3p
	saazf6eVOS4DwID/gfM1lt1nLN3hpkW1FcW6i2eb+MdI6qC5Vt6Iq6MVYStvrlXm1jiY9BPkWWG
	KRbNpCSHfPlCXcfTNM+fCAefXiIdfISA0IHUrCNWdNhdd1
X-Google-Smtp-Source: AGHT+IEnzOsMSinBVHEXiljPYCbzDjNoN0KNDypKD9ez/mRTPNQa56VzEISzuExPlUU3c78dd96z0w==
X-Received: by 2002:a05:6a20:7fa5:b0:35d:b5a1:a61d with SMTP id adf61e73a8af0-389822ebceamr3611535637.26.1767728847191;
        Tue, 06 Jan 2026 11:47:27 -0800 (PST)
Received: from Lingbou.localdomain ([113.225.51.69])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc8d292fcsm3036722a12.20.2026.01.06.11.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 11:47:26 -0800 (PST)
From: Xingqiu Xu <hilbertanjou83@gmail.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: dzm91@hust.edu.cn,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xingqiu Xu <hilbertanjou83@gmail.com>
Subject: [PATCH v3 0/7] docs/zh_CN: Add timers subsystem translation
Date: Wed,  7 Jan 2026 03:47:13 +0800
Message-Id: <cover.1767725479.git.hilbertanjou83@gmail.com>
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

Changes in v3:
- Replace kernel-doc directives with :c:func: and :c:macro: references
  to avoid duplicate C declaration warnings as pointed out by Dongliang Mu

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
 .../zh_CN/timers/delay_sleep_functions.rst    | 136 +++++++
 .../translations/zh_CN/timers/highres.rst     | 270 ++++++++++++++
 .../translations/zh_CN/timers/hpet.rst        |  43 +++
 .../translations/zh_CN/timers/hrtimers.rst    | 187 ++++++++++
 .../translations/zh_CN/timers/index.rst       |  30 ++
 .../translations/zh_CN/timers/no_hz.rst       | 337 ++++++++++++++++++
 .../translations/zh_CN/timers/timekeeping.rst | 202 +++++++++++
 8 files changed, 1206 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/timers/delay_sleep_functions.rst
 create mode 100644 Documentation/translations/zh_CN/timers/highres.rst
 create mode 100644 Documentation/translations/zh_CN/timers/hpet.rst
 create mode 100644 Documentation/translations/zh_CN/timers/hrtimers.rst
 create mode 100644 Documentation/translations/zh_CN/timers/index.rst
 create mode 100644 Documentation/translations/zh_CN/timers/no_hz.rst
 create mode 100644 Documentation/translations/zh_CN/timers/timekeeping.rst

-- 
2.34.1

