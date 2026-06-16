Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCDE43CEC2
	for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 12:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781611613; cv=none; b=OTX3/++DC/KJ8/3wVEJ4DxOacxaSkJezJgsEyH8RxoFQ2qaKE824GX+VPXY5pqd8QCyTWXOw7FSoYoP3XnULt26EWfYllf9Vx0kI0Dh04UxFa6IPVly0MpUVEt6OX1caus7wbV6+kOTHT10SLHDaWVjvJ0KvJmXfDqEaOOLCki0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781611613; c=relaxed/simple;
	bh=RBmWZiXvrAnD4CurwrIzEoSHSzqh+JYfS7flif9HQRA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XhM3Vc/CoN4GbOPKeiWhAyby2hORhoD4+40MLqSRklxQhfJL8UHBs7wJ9l2gdCgCkJmxgz4XGQ1O7gdXkfjuzeN8iRFL5kfrkLSi41hjPSlK/dWNJRowAIIWvmupBoSaUzNg3Y7IDhvEH0mFKTQAw0WPOiYB6CUZvodsgdh2YkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cWK0+NoU; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cWK0+NoU"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490b3637b90so34469345e9.3
        for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 05:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781611610; x=1782216410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CwB7aQGaWawnEZmE+FIZyeSVxfmoZLdsIpADLzVSdq0=;
        b=cWK0+NoUa6WtYK9t6AMVZoDYRUnmbQerqiGX13PSQVkkAw8rI8HrtZ7MARnOBM8Cvk
         Y8zQCODn4/L6BAJeyYHZzugOkMB+dqRnYWidCB3eFA/otL07ABwf2Gang5ehRjU5ux8h
         xAr7OSQk6LS1m7XbhilyWRf6diUE7TgmimtqOdpGqWMmfM8T7vwoZYN1/DJJ1TkAjzvY
         Piz+tSb5HDmkMsSdOJf+XAp8NXjRszNFItGMy2+zN5iSqwjSXaT6mbxdFZ0TR+6u0dod
         8E5hiZ7Q4wpvjFo9l20bycrSglEL73VlVhhmHBZvm1qfCQkbaAQMHoQ5E58pYremctVd
         eQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781611610; x=1782216410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CwB7aQGaWawnEZmE+FIZyeSVxfmoZLdsIpADLzVSdq0=;
        b=mxjRWiCKR/fUTZlbTk1sPT3wWQCIBmRqf1CQagy4YaMq08ESZt1xNYmHcDpnUT+zj6
         lPVtNNrxKq2uh602uuQCHFLMQcyEb4gIC0WZJ5wCit8N9Nl+YyP1pavyo+hPbHdAU5h+
         kVoWaRAEqYZVRAeIPxwcHzLJWbGenydcOkG6LSlgqevnvwpmRDOiktLyZP/otlAhCt//
         gtOMIn7voi6D7ZjGJkPt5X0hcIIHU99bLDc58P69IZ7glJXtMjcQ/ELALn1fkNk6Em8q
         tP3AqzPWB39anQMmfPjEXXJL4kucWGAMZvS1awcnDLO/NiW+NUIa3TkFUX6jqa1FauEZ
         Ww7A==
X-Forwarded-Encrypted: i=1; AFNElJ923pGavrK4hJ/zBQ1viXGdYvAMtr2F7i2yBirSh46eiOs8dS3D+F6+D0/q5Govf26wJ48TDy1Z5EM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEcfLbrtmAlQly9QTtzk6EIadHqJWjlHkgOYguqvo7rFvvwLgj
	kNsBlP+92JHAJ5+gFJqOpdPTbXa5W0zCt9PtMrY3v+hgEPz7nrWHoJwm
X-Gm-Gg: Acq92OHUCWs/GyQur4Qui+4CN/mYxLf5WWtMXjum8rPlWBs2hJBXH5mE9rjNeunllhn
	Duje8gZ3bQGrIwOCJKS7Wcwz2i48SVsUMwr4/quyeq2RYWzqHVAyTcW3qJIK77CFSDn2i5BOKIQ
	os/4mHLtFmJ0bHUgv6qfisIDC9HOxnd0kie5BvedArukalO3pQL8+0Cic7+VV40K7C5Wf55NiF2
	g0JbBLrD5cXrV7BdcjUcJH5GID9vDE2llfIB7iIzatJZ5XvlqUKFGfpT73f+MU3VcUpH3WbiNAc
	n2TLr5mqq+Opku/n/iChqrJm2+u+oEdRsb4KhNIKWyYPd0jSsMXKrkfH2N6/gihdspb8BErxJnJ
	VAgam0lisCbV/yKjw2vtFzl8fYowIRuxPaJTtUA8G71icNShLEuNCCw7w8OG2qDifkomIoG8QUl
	uew9TXVjPxO0tS7epYAPjOblj9sGksM5+h0jtiFzmh8Q==
X-Received: by 2002:a05:600c:3650:b0:490:d354:bd0a with SMTP id 5b1f17b1804b1-49220143bd1mr140581765e9.31.1781611610225;
        Tue, 16 Jun 2026 05:06:50 -0700 (PDT)
Received: from xz (bba-92-96-19-210.alshamil.net.ae. [92.96.19.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea4a128csm425401165e9.0.2026.06.16.05.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 05:06:49 -0700 (PDT)
From: Ximing Zhang <xzhangjr@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ximing Zhang <xzhangjr@gmail.com>
Subject: [PATCH] hwmon: coretemp: Fix documentation wording
Date: Tue, 16 Jun 2026 16:06:43 +0400
Message-ID: <20260616120643.29079-1-xzhangjr@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix two minor wording issues in the coretemp documentation.

Signed-off-by: Ximing Zhang <xzhangjr@gmail.com>
---
 Documentation/hwmon/coretemp.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/coretemp.rst b/Documentation/hwmon/coretemp.rst
index f63b21f24d42..5ce125b0be2e 100644
--- a/Documentation/hwmon/coretemp.rst
+++ b/Documentation/hwmon/coretemp.rst
@@ -44,9 +44,9 @@ Temperature known as TjMax is the maximum junction temperature of processor,
 which depends on the CPU model. See table below. At this temperature, protection
 mechanism will perform actions to forcibly cool down the processor. Alarm
 may be raised, if the temperature grows enough (more than TjMax) to trigger
-the Out-Of-Spec bit. Following table summarizes the exported sysfs files:
+the Out-Of-Spec bit. The Following table summarizes the exported sysfs files:
 
-All Sysfs entries are named with their core_id (represented here by 'X').
+All sysfs entries are named with their core_id (represented here by 'X').
 
 ================= ========================================================
 tempX_input	  Core temperature (in millidegrees Celsius).
-- 
2.54.0

