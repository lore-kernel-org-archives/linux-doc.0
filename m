Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BC3360EEA
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 13:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778592742; cv=none; b=VlyNdDsS+mrmEwW4xl+ec03KM8PrBnTTrLfWCZouBeLbe4FAtlNsRBRftsbgR/7AaCGJU1MYbffSJa1xxSEtmqLT0Rx03MJmrV/GkGNzbtYQcLMejAf/Sa4iu00iCMmxr+/R+rqovYOql1HW99eIvOaDBjw/YOxZfqODBVsH/0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778592742; c=relaxed/simple;
	bh=Cgpsbn2DkZpZS3BgaGqMF6WQ8CYCubeafRvaZv0Nr5U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XTzkb1hyc6Fjxm+ItyuPPkYvmXibq3GXqFgUEAEpqFy+dUL8UsxTYsr/IYEknI2cJXhRskBUwE5ctYD9h6ZeiqK0IyAhNPw6QB1bPPtUkm4FKVvfGd18zPT/WZzdcXP89p9QGU5RYoMUsG0AWSDWtEL9XkEjYAKYd+e7ZrYJA3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n9G/dVSK; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n9G/dVSK"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-83d31ac4017so1984886b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 06:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778592741; x=1779197541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+G1CpOAyOxANA+SPh/GOBsJg+6uFI1md7kNT04Z6aes=;
        b=n9G/dVSKQkvqYYaWPYb4ypU0wiuStGS8nWlby5RPv7rBVTJ/5nTsVNR9Bjsaaj5NF8
         bqStEq81p5cz9rINxJPRIB0vWx97P6EL12M/ZHyqEWJZf2fA5K4yHeJ3HrlE7LPACReJ
         eCYYdJgLVq+Hwzlyy8Xx1GZIhsmwuaGyRcgAjwKs8zSOnK82a5AX3asH8k19iKOK0Jn1
         P9JrfFZtuw1hpZA47GXC8ZV84DAoxG5YuhR3M7RaTbZB6iBYJDxBpR6Kc+El5IZuYP6L
         M1l/LaHWOUjU/L0CtKqbOVwyeNG8+1FVx19woZnkU76exMTZ64Dqq7t0+ACv5meZ0HrX
         cq3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778592741; x=1779197541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+G1CpOAyOxANA+SPh/GOBsJg+6uFI1md7kNT04Z6aes=;
        b=baoolJ84jI1bqherwoVBhCcf7i4F6RyUkDi2MvP7McLrDO/fGxmXyY42PLSWhswcWa
         M43PvNu5sNgFzji60mjiB1jdBtKq4oD4ndpEB7GU1XTGMt82ZlbXSuBMPLMSBan0s845
         RMqoIYlJbKUNBbsmu0oM1Uxt3XL0Gi3b6Y+OOKT0Nc+MFauvQ0jdo35zosuJvw/95CQ1
         0yPqXcmBpcASPd7qLrjd9DBxdUvqM3H48WqTjvs05xNXJwUFNzhZxrJnQLa3JZjz40XK
         d1x5ekgeDH0T0agnGmnCfslRkVFqPT3I6q+/MEI+oPQrlKhjradOA7+Jc1uHNKJt5nBP
         8BbA==
X-Forwarded-Encrypted: i=1; AFNElJ/A/Beaqzu/iqkmHqADpuT32YQjDtFYiwNir8owTXvSm6xkfwbYMMtKl1+m4Nzoj0JR9IdC4gwv6c0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhOl5tpXAyHnlNKBIROL5y762taUYOSYJgFm2bwzBCw5jpZ2vu
	AoN157Dp6z/33WXaBOVce1s0415GgLx9GMeDktTnJY1Hk7PSt2QX8QHl
X-Gm-Gg: Acq92OHGgXO7CdlNIx+NfQIm2EDls3aTMkachps+I3iStNhCoJKzNHoEueKe9vcS3CT
	ZGRL1317hFeF4kLUlF05W511RSLxVvreSCpCMxMSApZPnc3dmbCAq0Aof55+LCWA0oaU35+r5gY
	c9dqjjSM2Y1yVIcbgqofUHb3Y4Uu7WH6/X2vbYmcIKXlZ2J+7Md6KIs8+UyxmhKonD9jUNb5xpS
	IrBi8UoS9DeyB5LJubgpsY8otZOiJgWA/iJ6rsYzZdAu0r0876PNWvrOObcLRtLHus01bSGrX66
	+LWHdk90EMehfTgnAWPrPSGJGt0oVP3qH/Zi1SkqQN29vgdX8Dm8IwQI3uxPOhpWLysptFdet6x
	GR5m/10uQYmres6NWLjOJCB9wSaHoTNF3YgtiYQXozntC1HbFsEVoJE44edxe5lnkohIzaT60y/
	JbocATOmp8KHAungjTeeNXRVJgSMrySZPb4QmfVnh1UhQ04OSmafuW6LX9rhtFWw==
X-Received: by 2002:a05:6a00:b48:b0:835:351c:f236 with SMTP id d2e1a72fcca58-83a5d09a78dmr28663707b3a.29.1778592740983;
        Tue, 12 May 2026 06:32:20 -0700 (PDT)
Received: from r912.lan.4v1.in ([182.70.116.80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f38fsm22849934b3a.8.2026.05.12.06.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:32:20 -0700 (PDT)
From: Avinash Duduskar <avinash.duduskar@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	edumazet@google.com,
	horms@kernel.org,
	corbet@lwn.net,
	jiri@resnulli.us,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-doc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] Documentation: networking: devlink: stmmac: fix typo in phc_coarse_adj
Date: Tue, 12 May 2026 19:02:14 +0530
Message-ID: <20260512133214.1773502-1-avinash.duduskar@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"Functionnal" should be "Functional".

Signed-off-by: Avinash Duduskar <avinash.duduskar@gmail.com>
---
 Documentation/networking/devlink/stmmac.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/devlink/stmmac.rst b/Documentation/networking/devlink/stmmac.rst
index 47e3ff10bc08..fbaa81ea782d 100644
--- a/Documentation/networking/devlink/stmmac.rst
+++ b/Documentation/networking/devlink/stmmac.rst
@@ -24,7 +24,7 @@ The ``stmmac`` driver implements the following driver-specific parameters.
      - runtime
      - Enable the Coarse timestamping mode, as defined in the DWMAC TRM.
        A detailed explanation of this timestamping mode can be found in the
-       Socfpga Functionnal Description [1].
+       Socfpga Functional Description [1].
 
        In Coarse mode, the ptp clock is expected to be fed by a high-precision
        clock that is externally adjusted, and the subsecond increment used for
-- 
2.54.0

