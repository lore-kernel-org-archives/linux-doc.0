Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436963E5A25
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 16:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778947855; cv=none; b=sFUK03eqVsuOWFi+7Jg4Wj65bELTFm3h4GnENxiRII6hjkf/CafVbTHkYIWwLr+kxxKZ0hw3oEnrf1mQ5tbbMzdSZpbu654QDwhH1GhgCj1CB9euo5kHtv3BVeXtUP8YeGTUize95AAeMeuIf6ccbyMvzGO2uinDPndru0DNv+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778947855; c=relaxed/simple;
	bh=Yecx+BTtAbiNUWINlUY77HFix2PSh5bmZlkraJA5IkI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CHDpcEdupwj3IrRH2kFHZmAZ5RmvqmUFkNkSRm72eq9KQfkoe74w2TRbxgB+vwSyETdcgopzVD1ZPyCXsqU3P/VzyV5IQ6RqO3sYLKkB11A8CIISrs5fIwX9OaO3AIV6k5l8z4NFaYojQlnQ2fx81s+Y+jTWTEOyhMh90eEheUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tBd1zBCf; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tBd1zBCf"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2babfd18435so3761375ad.1
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 09:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778947854; x=1779552654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=whYzxfm5ps4K2a8SUZCAvYuUvFnuFuh28riHObBjpH0=;
        b=tBd1zBCfRV4dEzWoZEM0eXNrBwy49T8RLfj87AOZrVml0YlxCWqLppjELetNw6P6m3
         58bGhZalPiqHugB7iUxweKd+1UvZja7Z+h72njcc4OI+slGsWrI5aYc1KV9b0JjX2S0w
         Kj2SXZMmC5nwvtYmyeojCLhLrbXpQARvPEzkaPhCLmHYSEHq/1sj4WHSX0fQdccaUQFO
         OwNwGP0SI6mpldvacIpsnZucPlbm+1nXKXEoxET5gWku97+GG/40np7wuyPvhcZW9wF6
         FusEH04oHTYQ0LXlsTXXIHt/PznRlBTyO2RUC4HkC0kEuGxpZHVxFb1fhH3LW9qCrDVw
         INcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778947854; x=1779552654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whYzxfm5ps4K2a8SUZCAvYuUvFnuFuh28riHObBjpH0=;
        b=EXqd3mhlz+BGuMlDJwsvsqLYg0FeYL8quXgafmr9eIWmCpJazSfmpB24fta2HXsTyf
         r/YzIXxsn/F7WMKtAzhJmSBqjoHm5ByTASiBtg3OKCfGmbIRO76MrvkAJ+lSnv+RhsIX
         EdsotxHLi9bSgsYcb6G9S1pc4lj+q8wyUnb4fBRMfV9BQccZJlfnBgvKCE1YuEpHHaMy
         kDXThg1oKWZc0DWw0SPtGBUJhdxNlNqXjraL7NQM5Zrj+fL8Jpa01p5+4zQm6eHUFb6o
         V5nY7yofTnVNDaco8LGHjvt/4HVN4fr3JvNlkVBhXNnMEf3Zj7HxNsiwaXnbYgl+BMOm
         nRhA==
X-Forwarded-Encrypted: i=1; AFNElJ+GrTVEAjQcnxB2Z+dhNpT+O7vZy87WNELsUB8NqQQ6fNA/MoZGkPYJYAAzUwMe3AuUbAFc9EOofe0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsHdz+i7pnj2C2I+U1rCFp5e5rC2hh+yzuiYCH7n1ZeSDKBcEC
	IncUT5TWsGZa0JiRwLTcsctlU55cQAh0sTuENWbdLXGL9InkT/Lr912C
X-Gm-Gg: Acq92OHeUQXdv7sVotJ/QXABPZJwlBqV16jgfIPpf6fYktv9jbczsJknJJIQT66bk0e
	o6gdIHQyRvPOzcwxOqnFHfxY4gSdxeRsl/saaOmyyZqrrPz4yxaC3jj+nwgO/uhDgUv/xk7gHWZ
	1kmRhPeQa4awGpAhMjQDube5u8ZU2HAlUzz3izlYPynFK1qRqRa7nX0cOdgf6iU/h0xKgAUYyIb
	/WrnXttlL9jRguR5H2F4ldKls6tM+rUIhdb+cNucSFq9TsxtrUjxZBCFpn/324V6lz6eKCVNzIF
	PSnU/Zlg2eLKyd9Nkn+43viLl5gYxMSmZ03fh8mCRk5tD22Lz5/saDQPqPwd/4bGR8fcoSSGB4+
	nvO0vBIHkCbXwViM7QOv6NhgsGeHgPu/ahDUkORSCRcLwnJ8PUkVJY2I6CtSz8ikV0LgR9LetWF
	49fOW65wcjcmCFWCW9wGe6L8xk0AWDGZ3FHAzNHAEvF2k/JhUyjiBy/2wiBMeWjL3qO+dqSl9qF
	VVw26CzDwFrrmxOL8pfFYXYADWSJTN/ls0rYTBxZYCVAccgAGg2myxs2kMMbdE=
X-Received: by 2002:a17:903:1b25:b0:2b2:5515:661c with SMTP id d9443c01a7336-2bd7e8ca3d7mr118739585ad.31.1778947853613;
        Sat, 16 May 2026 09:10:53 -0700 (PDT)
Received: from ERIC039ERIC.localdomain (1-170-184-71.dynamic-ip.hinet.net. [1.170.184.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0f94c6sm97752565ad.56.2026.05.16.09.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 09:10:53 -0700 (PDT)
From: Chen-Shi-Hong <eric039eric@gmail.com>
To: linux@roeck-us.net
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Shi-Hong <eric039eric@gmail.com>
Subject: [PATCH] Documentation: hwmon: lm75: document sysfs interface
Date: Sun, 17 May 2026 00:10:35 +0800
Message-ID: <20260516161037.1486-1-eric039eric@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the sysfs attributes supported by the lm75 driver.

The driver exposes temp1_input, temp1_max, temp1_max_hyst, and the
standard update_interval attribute. Some chips also expose temp1_alarm.

Add a sysfs-Interface section to Documentation/hwmon/lm75.rst to
describe the supported attributes and clarify that temp1_alarm and the
write permissions of update_interval depend on the chip.

Signed-off-by: Chen-Shi-Hong <eric039eric@gmail.com>
---
 Documentation/hwmon/lm75.rst | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/hwmon/lm75.rst b/Documentation/hwmon/lm75.rst
index 4269da04508e..cbf737948c1d 100644
--- a/Documentation/hwmon/lm75.rst
+++ b/Documentation/hwmon/lm75.rst
@@ -181,3 +181,21 @@ is supported by this driver, other specific enhancements are not.
 
 The LM77 is not supported, contrary to what we pretended for a long time.
 Both chips are simply not compatible, value encoding differs.
+
+sysfs-Interface
+---------------
+
+================ ============================================
+temp1_input      temperature input
+temp1_max        maximum temperature
+temp1_max_hyst   maximum temperature hysteresis
+================ ============================================
+
+If supported by the chip, the following attribute is also available:
+
+================ ============================================
+temp1_alarm      temperature alarm
+================ ============================================
+
+The standard update_interval attribute is also supported. Its write
+permissions depend on the chip.
-- 
2.53.0

