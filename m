Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9641DB125
	for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 23:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766099820; cv=none; b=MJyVhADtiRAXLUiJZO7YrC8G8a85l4LG974Lsc6pNL9wMR1l/pSdLfvvLjZzxPspLS2/fjcAphCUpRblRsml3oamXbdaTNOPN+a2kTkk2IhSkdD2qfAeWZpIxSgqmiHuM+tbZtllwY2Cu06rv4Tn/vrwM4g/yuNP1Yrki9u97IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766099820; c=relaxed/simple;
	bh=J5Q1NVVfA0iJWms8qOBTvjMIMAUouUGbt/kzShoSpDE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=f27/8YK5BlRceWGbIJL4wEmAczvmAEM35MkwV0T2zp7Hqv1cAjbQOV7A2/OQIN3p7QqYeAUsaSkI51RV5+4yOFHlRv03j0INlzCNz81MrCcinZ1mfTYt5OckcmavL+lvI7L73fBJbXvTBYTqL9EFPyd1rkccPuR99MCpKVrFPbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QCPi3+JK; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QCPi3+JK"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a0c09bb78cso8091745ad.0
        for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 15:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766099818; x=1766704618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eMGnbRF5EuWagLgSiOQJqKiOq6nBvcHGQU5/LKlFP6M=;
        b=QCPi3+JKTfV4GQOxSBTvMV9tTYlgOQYbPqWgzpF+MasHFGNPvi7nXHG5ZuM1g3GcmM
         y3kKFzJwhvcT6O9jGvgOlA9ZJeA5XIpmouoppcq8lMYSNbARfDw2a27Gj5PoIkCtxtlk
         MbJwD9/h0dGRpdyyVxTvKgzkPk3c+oOXpnK/9wA6ZgvhdhcSkyGlEF8dxbYYNwpfB3nf
         v0svrg/7I0KMGn0kDZ8+27Ijazqw3T5C6EoevRv1/ueDgLoFGSRCZooFwoLdy24k941P
         owJTJ/jO4UsAoYUHZE0XBoNHfyGJd00D8T31aQT8Z+tFbwbnnzVwzTdOfnX+j0qY1Q+i
         BZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766099818; x=1766704618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMGnbRF5EuWagLgSiOQJqKiOq6nBvcHGQU5/LKlFP6M=;
        b=uHtI83QFYsAZhYpgV0EX3Yko58K7fQxBT3/N0qUqvnh2/zo5bpfWhtLlzzXfHKZmwL
         uEGc4rZAiFig8PkYx0cYl+rfUVK49HwxZdQgdIpfNX+8cpQgUPbIkR8cs8Xrxbe51jmP
         fOZvNf2PcPbmI7gMZKqUBevOAErGjZhfLGOsZPRyNvmdfVi8gA3UxLHrcR3KNPppkkG1
         ToHEG+q884egRAtDFCF1NI6+iZdybqd0EA5G+uqetMqsKmPix8JPgWy29Je9aRHGVhK/
         b2cmw+kMervnA4q/pCThM/T2b57H0NdTlzBTRL1xnqsxyakLLnnh7ybhhi2xF5+XCwfW
         6Yhg==
X-Forwarded-Encrypted: i=1; AJvYcCV1WLKgagevJUffVQOaNLwqo4FWpKDCzlgoZFvwprH+LW1ATTRrS1ZSojLVwufxixvHhQzacoacPIA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmK70hEejS4SuqJy2OTIenOLkXM00w0RY2pTkU8/TSgoM20Mof
	sfHrhvETjf3qt/z9rPXPBz0TPUAz42ypkJE+1ivd8NeksX/J90vcz/7f
X-Gm-Gg: AY/fxX4RHzCdDJFSS2xDK5qwwHy/QzRbpWpV7okkOOi/HmVz2oFYGHy2oGCZ5hrfrrL
	F9qcDOZjQl82CHR+dn/TIseCP6k8JR0k2oU77Uvvfs4g4NdcLUMHNW425wXTlWqECn8q7DsZ/Lw
	Xf52Ew23iKLfG1yFXezov5iwJGWOy8mwx1K09vXsszMV6PO5QyVeKZPT/MvWEW9wTYkFcKXFPgo
	69ZMBWU8noit5GQbAEM3z8THjrZw8YdjQ9xw8JnNfrTl18cPLqUyJ0AYWYWfdsYnYW/bj9cIHHf
	G4m4jfVQshZ5CYEsaCm6z/23EiF3yJWYMC0VMTlBlHC6Z4QFcl5krkCuRPOAkla70xR38TqUOsG
	QTNzGdfY84FgcmWrR5y1NCsQiTj3YncsKI/2Po03NXuQQWQka0S1TwtXe4mhYV1pg8M+uF2byWJ
	TF/4FKxC5Wpz/FHVrmUDHgut6sTg+MPWIOcIXwk+gcOA==
X-Google-Smtp-Source: AGHT+IEV4weDcMDmvPNP6rWQdW5Jgf63ZSAcgHkjM9/Uoq+r28bqVXyq41EmW2rCs3rFIQhrhd+rCg==
X-Received: by 2002:a17:903:17ce:b0:299:daf0:e044 with SMTP id d9443c01a7336-2a2f0d2db36mr11573985ad.18.1766099818170;
        Thu, 18 Dec 2025 15:16:58 -0800 (PST)
Received: from Lingbou.localdomain ([113.225.44.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cb48sm3311955ad.64.2025.12.18.15.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 15:16:57 -0800 (PST)
From: Xingqiu Xu <hilbertanjou83@gmail.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xingqiu Xu <hilbertanjou83@gmail.com>
Subject: [PATCH 0/7] docs/zh_CN: Add timers subsystem translation
Date: Fri, 19 Dec 2025 07:16:42 +0800
Message-Id: <cover.1766099040.git.hilbertanjou83@gmail.com>
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
 .../translations/zh_CN/timers/highres.rst     | 271 ++++++++++++++
 .../translations/zh_CN/timers/hpet.rst        |  44 +++
 .../translations/zh_CN/timers/hrtimers.rst    | 188 ++++++++++
 .../translations/zh_CN/timers/index.rst       |  31 ++
 .../translations/zh_CN/timers/no_hz.rst       | 338 ++++++++++++++++++
 .../translations/zh_CN/timers/timekeeping.rst | 203 +++++++++++
 8 files changed, 1212 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/timers/delay_sleep_functions.rst
 create mode 100644 Documentation/translations/zh_CN/timers/highres.rst
 create mode 100644 Documentation/translations/zh_CN/timers/hpet.rst
 create mode 100644 Documentation/translations/zh_CN/timers/hrtimers.rst
 create mode 100644 Documentation/translations/zh_CN/timers/index.rst
 create mode 100644 Documentation/translations/zh_CN/timers/no_hz.rst
 create mode 100644 Documentation/translations/zh_CN/timers/timekeeping.rst

-- 
2.34.1

