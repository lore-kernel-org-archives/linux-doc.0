Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C3B3D88E5
	for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 12:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773231401; cv=none; b=aZuMPANql7InkCGVCHVW0HVLkqlfx4spBDuUckc6FNtjlA+2/ocoLBuZP0OccRlwDKh2gOd21FodvRFL2SGB6APBZmzyATyr8j2NpesM5BQJOZ2THJ2Zxo+uCSDtGYqltNp3DlOKxRnKQD394uSgPbwbIhC6dO4VF6KPuR6PK88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773231401; c=relaxed/simple;
	bh=vIIr03THJBYTb/DG4le386ANTxRBzJD/TkuNIFzBbbA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k9derJqGg2nrj36O7HRfDUTEXfVvgZqrvccT0B7JjWe1ivul/f3uAyMbJJPNtp0Uns2YmAFn7uFc5iHi1m+CJz0bq4+FGop1CW/e8E35eIOsWWpWshGvOTYm2/DSr19+NWZOU43paHx9eMq6R2QJ6E/Wnm9T92l3rRrsnGB1xjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YSf4PrMr; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YSf4PrMr"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-829a9c03780so4927789b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 05:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773231398; x=1773836198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w8b3+dFQJmOFN0qdzKY9BzCR9rFLTY9mbUUY2CWBUCc=;
        b=YSf4PrMrUQEGHgSTYa+Dlj/T8fA4Dran15+CON0mWkPYZvh5OgsQChoIw+ypvIAtzS
         4st7YIy5/k8/TRdCwIOeg838gJIbIt/el1Z8AkNpFl9R7fLR6ud0idZMCu7k7UNR1Q5S
         BK3IpBnz+m20KovtuMI3MInvbi9EU2BOCJ0OvYYc8ChWGxNay2x6fH+TZGyr5oCsm3m2
         KTJ0J8x9YpfFREw2qpR1bfIIO0e2yVqiU5O/BKUM1OhD7dyn1ZTbokLHgPFf16kXJXHK
         v9/ZwtPpkzZFLRN0dKxLSmGxNJS9Ztp6fr+oT2Sw9ZYst40V/+wnZj7rQqzfuJSe9Lua
         hf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773231398; x=1773836198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8b3+dFQJmOFN0qdzKY9BzCR9rFLTY9mbUUY2CWBUCc=;
        b=TQXMq55kA8ARjhs6bh8oU+ijv3RFwJ7RNmqKqsMiUBgnJSQ8Y+pauhe7HzA5G9p/Fv
         5TL2EOxJJLCp3U78WpBF8yrnnXKb3WGahXYt7fnfNbR7rKoLkYP97T/a2UrSgNoQ69vd
         jhAVuly4KBB4GBvAxhE9LaaOT8atfheNFmalijUtr8pKAOBFg70rEn64Kno2e0tIBUHh
         x4MHEGrO7zeZkcgiphvt9uEMdr5MGNUfJWK/Fv/15Es6j2sAbP0vfr4klhhRlRIbutGM
         S1WLFSiTYKN0AkrmJUe6V2PVzRfrTbNPVfJlYSbwVc/2Q1rG7PbTEGekEr5Z1axy0bRj
         IWcg==
X-Forwarded-Encrypted: i=1; AJvYcCVn5qWI/h/LFfiJ7edsczsxE76Ogft1NpU5UXVpbeaTusWdENSZ3Pkixq05O/nq1BYJtYWl88VVoa8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0k3xd9vaQjM4TTyy4awHdfv3qkslPMWoN9OZkNpIHIraR+RSm
	o/tXRqX1LwibpMpDqMT2q6WM2SZxhq8brvbkO2xliSLE7kR6cBmGeyhFpnhVbA==
X-Gm-Gg: ATEYQzzGApJe32BRoVa2gjeF9WABvQTpkElUf4eq2fALMHMC2mFWcRrnYd2QIS9g7lP
	OsD4s42lgeUcratO0RLVo/OWT3AwqPZHCdX5aMRqwPxZmaD3K/uc+ZJKDmB/Nbob0wzJ7/rT1gv
	/7NTmDxevytaMdTNunAJnpZ3KPCI53Ngbjk+iUjwCZbKAZCxeuCU+RC6nNM7Ci0RP2empg1EPIw
	RAwP47JgWZGON2zV4N4vP0WD6JYZPSV4lQJMJcblChgP8xucltVo2M1z04BEVmZVHTLUl2CwJkv
	Qr0bMruSw0dUDM1mUhWBXKadFkPSMLovJ+8I0RIDnZI5w3/pn8WGN+qhLP7oGcdb0HzDrVbb9Ap
	AyujZxva8JPwx5SdKJQT9d5QjR5aeVMhaYC1qu2xb4vcOYEANyZJCOH3ojFKqxOEcCsm6507cUp
	JNjPK2jRE9CW3wS076UX4t7Vof9FYgvQZ0BFIC
X-Received: by 2002:a05:6a00:3e11:b0:829:883c:1d53 with SMTP id d2e1a72fcca58-829f7089e1amr2181760b3a.31.1773231397977;
        Wed, 11 Mar 2026 05:16:37 -0700 (PDT)
Received: from fedora ([2409:40e5:1170:3c82:c36b:4f46:fd0b:d91e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6eecc6asm2286294b3a.42.2026.03.11.05.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 05:16:31 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH] docs: watchdog: explain watchdog API options
Date: Wed, 11 Mar 2026 17:46:01 +0530
Message-ID: <20260311121602.139967-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace FIXME comment with proper documentation for
WDIOS_DISABLECARD, WDIOS_ENABLECARD, and WDIOS_TEMPPANIC
options.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 Documentation/watchdog/watchdog-api.rst | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/watchdog/watchdog-api.rst b/Documentation/watchdog/watchdog-api.rst
index 78e228c272cf..984f7362d5fb 100644
--- a/Documentation/watchdog/watchdog-api.rst
+++ b/Documentation/watchdog/watchdog-api.rst
@@ -268,4 +268,13 @@ The following options are available:
 	WDIOS_TEMPPANIC		Kernel panic on temperature trip
 	=================	================================
 
-[FIXME -- better explanations]
+The WDIOS_DISABLECARD option allows you to stop the watchdog timer via
+software. Note that this will only work if the "nowayout" module parameter
+(or CONFIG_WATCHDOG_NOWAYOUT) is not set.
+
+The WDIOS_ENABLECARD option turns on the watchdog timer.
+
+The WDIOS_TEMPPANIC option is used by some drivers (like the pcwd driver)
+to trigger a system halt (typically a kernel panic or power off) when the
+temperature trip point is reached. This ensures that the system is halted
+immediately in case of an overheat condition.
-- 
2.53.0

