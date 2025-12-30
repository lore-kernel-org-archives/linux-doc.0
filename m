Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA0F32C305
	for <linux-doc@vger.kernel.org>; Tue, 30 Dec 2025 19:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767121343; cv=none; b=iLuc30hZ+8bdMr/QjeNDx1b2aCkkULM6zfa26pRtLXFZPQAWEGh2MIpeF3hHMCnLG0pxCxrCje8PXxq79FSeUl5OdfmKMuBRXPOq0GN6gpYrZgCNWo12CRK7uFwqoUiZCuoAE0JuQnX63G+gyPk03VCYrSYwhLeLlK42uCCcpFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767121343; c=relaxed/simple;
	bh=lHmHwd8FLasob0Ljhf3FgBjEmBusagGrFmEBsEA2r3M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OK2lDdKfplWWfNVp18e2Y0jc5Zyx/pbZ91YbVUtkjeUbIHLgYaib4PXb4Pk5YBA6iJcd7pmlaM6noItemxQzx/A6SbKdeDSjgUBp5d67UAziVAXKeq+sPqUzO96TR4MocWCxV3dyXlGBM08/l/MWp2APEprH4xKLaJrXC7pV/5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WJwD2gcW; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WJwD2gcW"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a0d67f1877so131011915ad.2
        for <linux-doc@vger.kernel.org>; Tue, 30 Dec 2025 11:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767121341; x=1767726141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9vzOplXqLA/InT0kNtnBJulD4VZdWWxPZrd2ydUlsM=;
        b=WJwD2gcWaiKIbqs8HMshocEf3wR9bmN334xlTGr03eQC4SSm5xfR4bbTd94M2Hl9TE
         mndXoDlUe7z09a564SbELy3PcZEnoFHSW9rM4T+UQdu/ZtxUFfYG5gKtLe8Sy1kYFEwD
         v73A+twLbji+gwak+v83ZHri5NK4ttH3m0GKSQn81Cc2lySCI/Mh0TnMXXrUPQcXJLYi
         WwXr3UWQowBduIMw588rdHH+SX70JmNR5n/8KHuoxJ1+9n+SohbiiwB11H3Lhg270Tuq
         UZF0dSQXYiLCq6NYYUJrrmP9hjCmKO4aUbEAFu+l5edbvboNbyedCwnBdGy3DP8W0lid
         0dYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767121341; x=1767726141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W9vzOplXqLA/InT0kNtnBJulD4VZdWWxPZrd2ydUlsM=;
        b=xLunh9gG66Vtn6L4ku63WTm5wKtTidGNmNEI06LoEEtRrSfnmM2i6Su7J0LeIGVJ6V
         9lkM/yl5gA1mcTGxrdEyrHWTRZDRqoLub2DnSeIe4LiYvoAT8WQuoDY3yIETf2zjbCBy
         y/I9OdyIU/0+HgAumVW0x3HtFqP776lrJzyfFJYZcrpvH7BRx+d0g220xj0gIMTPsCfj
         47D5c8FY6nBj5bhrdEHkrMK+RQJi4J2M4nBhiHVIXCAwuwMEh5QxendJ+BS0I2xcHEsk
         LqMuEXoZzSPrmn2QZ57xe/goXrR802H50daW4MCoJMExAR5oPgYjRbeUOkrfpN8VACqY
         OJEA==
X-Forwarded-Encrypted: i=1; AJvYcCXhfZKX6w1Ku7ToG1XOXRY5222ZUYDt21T6MZXtOeWR1oH9sbzIT+os4dQFNHBOqW28ph36fgYrLp4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Ik+vtF3G32VbW8zQbA6xm98ZE2VJHwIKTolUANPoshDupw+M
	beMY1B6PAJsW9rkByRyPV5ojMDDnyqbno8DG6/RDbk6PITlogdbmQMmk
X-Gm-Gg: AY/fxX6PXCetZc5pd3T7tR1SKXaRpL2jIoOrQqz9jxphAOiSlwGhH4Uudq+XhHjmx0I
	hy7SCu6F+dhX3AEn0w7L1GKqg1DyR2/6uoewAxWkzylwF09KX2J2VLiCe1rXvhuyr4PsBy4HcY5
	Lo9Eqe4GT3lI0grVWIBoAhLRJ0YtGOke1mMcwqCVCqgmEMzlZaDp8DUic/Fce6HLB19g1ND7nJf
	M/SZYQVuKoJUa/jdXPobyWKBXXY0ykkFJHr6G/v8DO4p0gBP2AsK4tDI5tFcsUbP57AeGSaxw97
	HPD82ZoeLRM4GSEH4h2TLFjomkyv16POyRKRjVbiXge2AOjKw5hD/DcNWkvECAyP6n/clDf1uJd
	AWPPutAjUgP+N4j2BzduT8xW7vM4t/r47Ayzoc/D2ptNKRVY4fBzhKpPwpXlPRbliCf2MGVP1FD
	BvBxJmZcKSrPk4YE5CFnOXPTMgdLQwNvty+pVcC/FZQQxb
X-Google-Smtp-Source: AGHT+IH0cdqyro1Qroq7kkxIlMBA2oFpNUXWXHEyFlquHN/N/1tOO30oOry0AF8Fnt+RZ3uw5OcmVA==
X-Received: by 2002:a17:903:38c7:b0:2a0:c1ca:20f7 with SMTP id d9443c01a7336-2a2f2214973mr315227925ad.15.1767121340518;
        Tue, 30 Dec 2025 11:02:20 -0800 (PST)
Received: from Lingbou.localdomain ([113.225.51.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c8d10esm302147655ad.42.2025.12.30.11.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 11:02:20 -0800 (PST)
From: Xingqiu Xu <hilbertanjou83@gmail.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: dzm91@hust.edu.cn,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xingqiu Xu <hilbertanjou83@gmail.com>
Subject: [PATCH v2 1/7] docs/zh_CN: Add timers directory Chinese translation
Date: Wed, 31 Dec 2025 03:02:06 +0800
Message-Id: <f5e1f24ac6aed222a95bfeeef7df66b753e3b512.1767118457.git.hilbertanjou83@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1767118457.git.hilbertanjou83@gmail.com>
References: <cover.1767118457.git.hilbertanjou83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Translate Documentation/timers/ into Chinese and update subsystem-apis.rst
translation.

Update the translation through commit 1f455f601e20
("timers/Documentation: Cleanup delay/sleep documentation")

Signed-off-by: Xingqiu Xu <hilbertanjou83@gmail.com>
---
 .../translations/zh_CN/subsystem-apis.rst     |  5 +--
 .../translations/zh_CN/timers/index.rst       | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/timers/index.rst

diff --git a/Documentation/translations/zh_CN/subsystem-apis.rst b/Documentation/translations/zh_CN/subsystem-apis.rst
index 830217140fb6..f6445e256ee9 100644
--- a/Documentation/translations/zh_CN/subsystem-apis.rst
+++ b/Documentation/translations/zh_CN/subsystem-apis.rst
@@ -29,10 +29,7 @@
    power/index
    scheduler/index
    locking/index
-
-TODOList:
-
-* timers/index
+   timers/index
 
 人机接口
 --------
diff --git a/Documentation/translations/zh_CN/timers/index.rst b/Documentation/translations/zh_CN/timers/index.rst
new file mode 100644
index 000000000000..8dc5861445f9
--- /dev/null
+++ b/Documentation/translations/zh_CN/timers/index.rst
@@ -0,0 +1,32 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/timers/index.rst
+
+:翻译:
+
+  徐兴球 Xingqiu Xu <hilbertanjou83@gmail.com>
+
+======
+定时器
+======
+
+.. toctree::
+    :maxdepth: 1
+
+TODOList:
+
+* highres
+* hpet
+* hrtimers
+* no_hz
+* timekeeping
+* delay_sleep_functions
+
+.. only::  subproject and html
+
+   索引
+   ====
+
+   * :ref:`genindex`
-- 
2.34.1

