Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5213130BB91
	for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 15:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778773288; cv=none; b=K2er6kNEfZxgkuDUToQsCRQSNToA/Ple80j0yVwv3mhWmuQ9fNgUlifov0T/xlTn76GtoiaA88wZaDc7nR5awL+mC9jeoU8YGWH9pbcqBZyIXwoFvLsyHM2WEcVV4iCDGbXCOhHnZfGYPeMNxDkeS3pe2iXgK9JpF3sNQqIn4IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778773288; c=relaxed/simple;
	bh=LqWHZ889FfjSUsJJDSnXMSZ2jEN+n2I+ZNi6tiS8o0k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fs5xicp4S8Q08YK3lHmB+qt829EILMcnf1aJDGOC3HUPb7owahIjnsqqogL+0WeLaDNz0xeBq/Pbko7DOpAp2C4czGEI/TiJwfufUaCjxmLGgkn+SGnDHc5iZIsPqcuUfJcufoj9wKHZdM7zFer8j7LPRT5WyhaSHOfbo/KhhoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sey3l20T; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sey3l20T"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-365eecc5885so8071251a91.0
        for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 08:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778773286; x=1779378086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aGhCi4yyqYpXjwh9zUcoDYb6CxobDy3aAgcw86g1Gxg=;
        b=Sey3l20TjQtCr5hjE4GJMA8p+IlJZHoPPxekbkSEqo2myBv4QSdYwLdlnQeKYBcmwi
         lmqixjwczKgBX/skSsFyw0qngDBEnkvNxsUlnlnQMVY6b88DifDHqPWm99J5z6N+xO2M
         FLaKtmlc/xaxfprkVs1U2EQDpN2zXfMA1Gs3IhJPbiGXdHSgr0VQAcL/+TJgrw9bEYDs
         a8VPwdpLBayhLFKUcJRsPZUwjR8lPcmXJRKSxKKF91J6YVU42/D8YLc1SFjkdfZAGlrv
         djkswI/+OP6RKtyF2NBjt5uoJzWaRA+OKnwM85WEs/Xko1Gw0Kc8NvW3/Rs9pMbiHZve
         NRmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778773286; x=1779378086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGhCi4yyqYpXjwh9zUcoDYb6CxobDy3aAgcw86g1Gxg=;
        b=L9+GWwlS+m7aEhdej4bDCODyXk9sqSufKSdifTF1+mv4fd0VardtqFedM8vrtjgnXH
         5s35kJwG54E8Z96VUhMJZIGXEn13NHryVU6m+6nuhvL5w05QiNw4vnRiLc4qOnaEaNyv
         wIeUcf41TwlRGw6KgU+FbEz137r1oUaeKPvmwShojhCiwFVRwJO1ChvRwjLOmdCrN/74
         g2jsTQwnuCascpBHHJTfRsWNiLOrrHM4Eg5fY5kFchd7ap2be8LURRFwJWFv+ebGJ9LJ
         d6KlFSqR4nI1CCUj3wnhtrW+59Kxas0/7Z7DrckFBv+z03S80H61TgRIi//pAghztKrf
         zo+A==
X-Forwarded-Encrypted: i=1; AFNElJ+szW5pjaag9DRHqfiFCo2YNOcF9o8zlKFJ1w8Ei6EkLJuRICa790t7PYZEx98rWXQZXTTsSNzSyCg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi9HuirpTdMRsFPsrhAOm96ppER9YImGfBQRbzN7zresFHcgsW
	DJpAIyTSm5KrVfc5JYPZt3YSP1DnRbdQtRws3OIBsi36DUQkTggaJoK1llSJ60P2LGk=
X-Gm-Gg: Acq92OFNw9NIHiUo43763HP3Ty+G+9l/8nQdCo5Z8sM2jKR1/p2tPEAfbDZB1v0l7uQ
	eRa9hgxU8FgbWZZmnPCDOFm+iSXWKrrVy7SSoYm3oSnZcyFhDZn2fmZSXB0kNeOR/u2kn4EQ2Ao
	e+K9KQrKkUwEsl2wxpBKDxzi3Cz0A9G8Run8Za2mrbN2czDsDgl474aAGF60GJlB3oh1fxM5pmS
	UUi6aHRG8Tj7QPgnqXZAGodG8WBoNO5RDxT6EH4li+UDt8zjHeCnVRbE27ptZC7lH1dWYzw3zd7
	ikIvHCJZEoueIeDRupPPOVbG8CrlalrP2Zx8k3/ZIJJtBJTmzoj62nMj7iM6mRgSx05agUwzLzU
	qMTdFSZjPayIONjSHxOcPsp7FfG0SdREV0Oiv5XXeEVgcAOmEB1rea5r/Q8lMW2wQN/w6aO5GCP
	qX1us9/mzGD2KRam/IpVkF427a19o/mWhrWvKkymFDbBVXqw/Ar0H1YEfJ5zfLzBJdS0utkM++J
	aF/GMCY76xNL2njDkZTEhGftZXrbN08HzIOpKv4nwJhj5DqTAwh5NNXkxclKHqWkQ==
X-Received: by 2002:a17:90a:a81:b0:369:1dff:6bd5 with SMTP id 98e67ed59e1d1-3691dff76dcmr3620471a91.17.1778773286539;
        Thu, 14 May 2026 08:41:26 -0700 (PDT)
Received: from ERIC039ERIC.localdomain (1-170-163-225.dynamic-ip.hinet.net. [1.170.163.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d23044csm28385315ad.78.2026.05.14.08.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 08:41:26 -0700 (PDT)
From: Chen-Shi-Hong <eric039eric@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Shi-Hong <eric039eric@gmail.com>
Subject: [PATCH] docs: hwmon: sy7636a: fix temperature sysfs attribute name
Date: Thu, 14 May 2026 23:39:13 +0800
Message-ID: <20260514154108.1937-1-eric039eric@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hwmon sysfs naming convention uses
temp[1-*]_input for temperature channels.

Documentation/hwmon/sy7636a-hwmon.rst currently documents
temp0_input, while the driver uses the standard hwmon
temperature channel interface.

Update the documentation to use temp1_input.

Signed-off-by: Chen-Shi-Hong <eric039eric@gmail.com>
---
 Documentation/hwmon/sy7636a-hwmon.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/sy7636a-hwmon.rst b/Documentation/hwmon/sy7636a-hwmon.rst
index 0143ce0e5db7..03d866aba6e8 100644
--- a/Documentation/hwmon/sy7636a-hwmon.rst
+++ b/Documentation/hwmon/sy7636a-hwmon.rst
@@ -22,5 +22,5 @@ The following sensors are supported
 sysfs-Interface
 ---------------
 
-temp0_input
+temp1_input
 	- Temperature of external NTC (milli-degree C)
-- 
2.53.0

