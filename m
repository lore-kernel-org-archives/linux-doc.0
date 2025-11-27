Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94F733554E
	for <linux-doc@vger.kernel.org>; Thu, 27 Nov 2025 15:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764256575; cv=none; b=QK07l/0ozYNKi+MINv95awFw0fLxyg2zTT2uGwejCwtCpVeGHqgCMRw6pCq9UmDcNIIVWkX22HZh0Wf2rWmAotBCfXabUtKOaoFHf74IR021+uxKSzVr24ZYDXz1OmDPvV1JV2kKnqDQtfViUwa+uSTud9XTYbNoul2F3yVdeCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764256575; c=relaxed/simple;
	bh=WwMLobnu+D0efGsATUA1Gw89i4CUGPUY5A4C7NZzBs4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FvKJHOG9x1QwBy9PSlGbZs7H8QBVw7FhUd9dLF5kfppYKLAAAaKMa84bxi9U9JOZzdZB+IAqhUzgnPc0g5esv19Aqd9q52aN0laf263LVEU6oyQ/VJWcfzNKtjjI36LvCFDQndy6+qAb3XKRI/P5LeXZezNBeQuxKOgoPDjrwV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S+Qb/E96; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S+Qb/E96"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2953e415b27so10841345ad.2
        for <linux-doc@vger.kernel.org>; Thu, 27 Nov 2025 07:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764256571; x=1764861371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wiV6R1vlmXrHgZfzQSWNBuKjhfxpu4gsWfPp8c9V5+4=;
        b=S+Qb/E96RUGwTiXOKPv+JVk4LtO0oZNNbax9UqzNGOQ/l0OaCH08U55IIbwl0DgfSy
         hpwAxibRQpMYEVU1TeU/uMhqL9HoFfdcpERnvhN9lCtIn2YIayUxPlloK7nORKmdtHYJ
         bWkJee1MXc8O2T33Kw6AhrlnPuoGXky94Vg+rGYX0zyGg631B95mpMuF4Nx6wgai/6Z4
         EwA/urk6sSs2JJpc1ypADKLLmve90VGJJBDCbdJuD9X4rtRCYY45d19N/WUflNVmz3xG
         HD7nTpE19wOmbcgKUkFzojhANw+GI2oFPcMt7PLFokVIKTJhzxU6Gf9RnMID42o7Wt/H
         JCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764256571; x=1764861371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wiV6R1vlmXrHgZfzQSWNBuKjhfxpu4gsWfPp8c9V5+4=;
        b=cfJSMqVzq4Ixcqya+QvFJSxFT10hWuWCH4pMyF3ZTVsbyCpGrM5vD4xUaCtcU5pI9/
         +c3wgvHW4w1DVeYs+bp+qB1gIktr1m4A6j9qqCu6EeF7xp/2vdZY1PcuB7tP3ApY19kv
         D6PhqcTvfj44nUpMFgemhnmPlQ6Gxt6GH1aprex9CN7KE4UurkVJBSlECi+DVKG98F1c
         0UH89dXLhEhJ3j9xDd9Z6lVJY9e7SOrVPqWkEai6iOKJBYQ5C8IZMbWntYzxEWybpUre
         2zQ7jVVBf224g0LNlHtfoOVOV3gbOjDVCroT6B7lA94+UC/mn4bfuXXZ+aTcFQ0fe/Q6
         wxbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDzqedotuLMyNQD9vH4uRTPS00MAICHH59DwHMh1C3BbmWbTNmtQOu3cCcTn1S8IKj4t2CoIS+Oh0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSb1w10yUj3Im2kkkR1+t5VJ0IVqKR2FNQp3ZdQC+pJafeh3d3
	q2G2DTLhRGPXpJsSlfVA3fyWz040gr0PG172NLXgPHimyU4nK7Y7/6n4
X-Gm-Gg: ASbGncu5tq7M+v2KmCTCFnjpE7ijB3lj+5SFhumL9j5Q3FBhhmGVVj0aWSReRf4Ly18
	fN4alR7HivBUsp2otWf6uadL9SyfZlJLvruG5W/OLpNaABqy+FOUCVCuJ8koC6nPO4Due5Rzqv/
	yFGg3CvZlm/4rbIDLk3Qn8R2QabFPeVdq5mpC4lOFtmYGOPW5qxyQPSnEHlLKLZufTIjyyceIWq
	i/QjA7HxsiqehqtkeaO4L1bPFxqjD5NCCJLusUdMTudaVDNyPqyhMbd8A5N9pl01hji6OmRofYE
	zu4UCZmWlhCX4KOP2ll7t77s8sdKPfZgFIObcx5VC1rKf77bDKQEiYXyBtCOVPw7sRgZ7Iuwcnj
	mVnPkV4yKKUbc0+21VA3shvJUdfm765ebUqV+I+AevUPXkQ9adHdx5QeaAVA2xL5OpYpNizdWEr
	UPE71krDsDA1rx6mAvThIr4uoAJL4HkFFcmOT2GItF+TFHiBduY3F9s07iTZ6q8hFhCF0=
X-Google-Smtp-Source: AGHT+IFd1tsj8i1fuFllq8M+Us0CAnfM9u3urHFsNyMVndTLSc4t9XxvGPy0JyQPnwq9EIFp2b7Ksw==
X-Received: by 2002:a05:7022:e01:b0:119:e56b:c74f with SMTP id a92af1059eb24-11cb3ed2996mr8778050c88.20.1764256571336;
        Thu, 27 Nov 2025 07:16:11 -0800 (PST)
Received: from bliptop (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcb067088sm5099656c88.10.2025.11.27.07.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 07:16:10 -0800 (PST)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Len Brown <lenb@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mario Limonciello <superm1@kernel.org>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v4 0/3] Add max-power platform profile
Date: Thu, 27 Nov 2025 07:16:02 -0800
Message-ID: <20251127151605.1018026-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a new "max-power" platform profile mode and uses it for
the lenovo-wmi-gamezone driver. It also adds the Lenovo Legion Go 2 to
the extreme mode quirks table.

On some Lenovo Legion devices there is a thermal mode called extreme
that corresponds to setting ppt/spl vlaues to the maximum achievable by
the cooling solution. This correlates strongly with an overall power draw
that exceeds the DC power draw capability of the internal battery. This
mode being mapped to performance when extreme mode is detected as
supported, with the actual performance mode being set to
balanced-performance, has led to some misinformation being promulgated
that performance is always a bad setting in Linux for these devices.
There is also some confusion that the mode labeled performance in
userspace, which corresponds to a red LED in Windows, shows as purple
when set using the hardware extreme mode.

I'll also note that as the hard TDP limits are refreshed when on AC or DC
by the ACPI notifier of lenovo-wmi-other method driver, no special handling
of the battery is needed for safety limiting extreme mode.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>

---
v4:
 - prevent  platform_profile_cycle() from selecting max_power.
v3: https://lore.kernel.org/platform-driver-x86/20251113212639.459896-1-derekjohn.clark@gmail.com/
 - Rename the vendor specific "extreme" to a vendor agnositic "max-power"
   to better allign with the "low-power" platform profile.
v2: https://lore.kernel.org/platform-driver-x86/20251106212121.447030-1-derekjohn.clark@gmail.com/
 - Drop patch 3/3, keep extreme mode quirks table
 - Add Legion Go 2 to quirks table
 - Fix nits from Mario
v1: https://lore.kernel.org/platform-driver-x86/20251026081240.997038-1-derekjohn.clark@gmail.com/


Derek J. Clark (3):
  acpi: platform_profile - Add max-power profile option
  platform/x86: lenovo-wmi-gamezone Use max-power rather than
    balanced-performance
  platform/x86: wmi-gamezone: Add Legion Go 2 Quirks

 .../ABI/testing/sysfs-class-platform-profile  |  2 ++
 .../wmi/devices/lenovo-wmi-gamezone.rst       | 31 ++++++++--------
 drivers/acpi/platform_profile.c               |  7 ++--
 drivers/platform/x86/lenovo/wmi-gamezone.c    | 35 +++++++++++--------
 include/linux/platform_profile.h              |  1 +
 5 files changed, 44 insertions(+), 32 deletions(-)

-- 
2.51.2

