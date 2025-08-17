Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE4F3176FD
	for <linux-doc@vger.kernel.org>; Sun, 17 Aug 2025 12:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755433399; cv=none; b=PU+Jx5PbOhHsum74WsP75FD7kTiMkB67OtM4Y7Myq0z29fMGhT3zJHsh9AdRFnvYdY3qJma5S+rcnMYYgrQ00M6zfY9qqGai4xp+dRUDSvfRr8CVl9WPBdDlXNVTR4qctGt11YfcFmdkWWt0lY5lpbVZBtyfXWSZ/t8qqHHj20c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755433399; c=relaxed/simple;
	bh=bqpDX2SDIXlhN8MQzUWC/WnbQ5jomjq1f2mPkABk8uE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MRyA393aLdZwb06lQH//Gu3Xn1OG5i2SlySBReZ8IAO4WFhnmArg24JEyopcqMb7jJPp08mRSf3o7KKgPGs/ESpVUwZIohGJ0qqjLBR6zx01uRmt4k/JZ45Fyum6xgJU6aC5exse9g4I6l24wIdxUEdbtv0xVslPjlZDuiNTW+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gkquklF/; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gkquklF/"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-afcb78ead12so473215566b.1
        for <linux-doc@vger.kernel.org>; Sun, 17 Aug 2025 05:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755433394; x=1756038194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A9bqoVd/VfswjfZfr61OSOYvd5RkFmqjwWdwSuEWLXo=;
        b=gkquklF/qvWeI+JCuzJd3tpzjGKf5OettcO8gw1s+DEjKkwH30CGjcR7AWivZvu/3y
         6yeqNKav3DT978p3fhyoLsN3dJk+JRkUKE+VcHebuIf1OUzu954Wya1Ars+uMwcuHT/0
         tWFLvBggrmyRHJJZU3juFzrqLtH+GV2Mt6IH0fREh5na4KnbyxsfYbekQq9LRap/2Dq9
         DJRVzc1yXuNH9LqgS3mtgV5kc/O7bd0DUPgTmBsQ0dP+iLQ5Db/VPbNEUymJRhbk+XEk
         d9PmQSbECrNIX6I3zT8G5gVhXYq1SnHmxlQ0Tk3TsHZWdm+SX3mXXxfwGrecRIgjLBAD
         tW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755433394; x=1756038194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A9bqoVd/VfswjfZfr61OSOYvd5RkFmqjwWdwSuEWLXo=;
        b=BxJ0Jj/xRhw2apB+hpOUxuv4CnTMZHkAdGXQ0rzWhcw/X9EfbJbhta7ujbYUGSJGHq
         qbod7I/xDlWPA72d+LlYOJmub6RMVlWR8CYkWaDmRlEbQnHNPJVWMpsVyqu2fDK1/u4i
         E8POCoiKb/2g0odoj7QaZZKT8F/JkI0iJ2MaNkCdwklQlTzAx691D3iNq/xmTCvJDZ0Z
         +rsVLVHpM3B6PRQiJLihHe0wsq8o9jYmzvkXIPl8/C89go0OVjbOKfAWW1JeXSEyuHs+
         4QaeRceg+gX3dJ5Pp4g527Du0wG3MdgRTV7QDZ81m/6xMiSrje6n4B7O01eJBcIUDBM2
         ywKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYHGgnxjvjlz0MlpILzrGG6LOePS63E9dDRt0sEKwtOX/+SSKo+6Zy6QyKvr52+bZk7F/yBvMqPIc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfRqjJBaMReJIvqBNQYYWrzoV1kgbmN6cpatR/r73/0b/ZbH0w
	tvcbJhikRI5tY9IgBIFLfic8/LlKeu6/DizPVkml/hda9QUXgwEU2dRB
X-Gm-Gg: ASbGncvMB7Eb7ZrXAX3kNcUR0ahNwurDo5qoBc5V1Lh/XYRO9xuToEHXWzelZFdpPF+
	xK7144H4RmCKkREeq3Mg//AD0T3unP6oMGsdJuE3TI0Z53ry6SbUubBeHudX/S5MgmliS6VsYdh
	V4lSL/cSoxIvgD3cU8MbM08vfHwahzCk9aTWisKZhCm+72Z9CACv1mW+lRTbPyOCvgoBky1R2SO
	zYwo1FlQ7TP0zGxm8dWfwQx/dkd7rhx3xrKpLX6+cYgnokEFlzl1JkpAZ5+Qft/Ms80EIT4PNQC
	ISyEBep7Wi2rbbCL/CuMyAxcPgwFge1Hh9ApaAUMjxWyTRUqzMc6T7SS9obrKgzyZPkIorXTBF3
	wwh0aVY4OuK/CrV2q4wK0pXVfJIMKoU91JzT86AR5cx1riNKJwU7KxujTOpRB6Skj
X-Google-Smtp-Source: AGHT+IGbEeZYPHdWNdRKQvQcCOq8JRSYOHJUXF0T4G5ZyUGyNyAgyyoRMM5PwK2yUKfUYNv8RRcMPQ==
X-Received: by 2002:a17:907:a089:b0:af3:9676:e9ec with SMTP id a640c23a62f3a-afcdc288ec1mr713209066b.39.1755433393805;
        Sun, 17 Aug 2025 05:23:13 -0700 (PDT)
Received: from localhost.localdomain (host194.safe-lock.net. [195.20.212.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdd04e0c5sm586073566b.117.2025.08.17.05.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 05:23:13 -0700 (PDT)
From: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	rdunlap@infradead.org,
	Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
Subject: [PATCH] kernel-parameters.rst: fix document warnings
Date: Sun, 17 Aug 2025 14:22:44 +0200
Message-Id: <20250817122244.26590-1-kubik.bartlomiej@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

found/fix two warnings in kernel-parameters.rst.

-> WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
-> WARNING: Possible repeated word: 'that'

command: 
./scripts/checkpatch.pl --strict -f Documentation/admin-guide/kernel-parameters.rst


Signed-off-by: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.rst b/Documentation/admin-guide/kernel-parameters.rst
index 39d0e7ff0965..445248787e77 100644
--- a/Documentation/admin-guide/kernel-parameters.rst
+++ b/Documentation/admin-guide/kernel-parameters.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 .. _kernelparameters:
 
 The kernel's command-line parameters
@@ -213,7 +215,7 @@ need or coordination with <Documentation/arch/x86/boot.rst>.
 There are also arch-specific kernel-parameters not documented here.
 
 Note that ALL kernel parameters listed below are CASE SENSITIVE, and that
-a trailing = on the name of any parameter states that that parameter will
+a trailing = on the name of any parameter states that parameter will
 be entered as an environment variable, whereas its absence indicates that
 it will appear as a kernel argument readable via /proc/cmdline by programs
 running once the system is up.
-- 
2.39.5

