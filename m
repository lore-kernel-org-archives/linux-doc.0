Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2F830C143
	for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2026 03:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785296515; cv=none; b=mQDuMDCwiCISUTpXtQdC6IR5Gf8/tvpzWFNB5kJS8QCjoeOWOaczKtsGcSUiyWXddeRdL/0x+qWE9GJsMQnp709FTNIxkCpqgKDf7mTS3zNsjjcVLz2wRcr+0Att3jSG4/8T5brFgOAJF8+CKl2Ltk+j5h2ULVygj4xwFd2PEPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785296515; c=relaxed/simple;
	bh=UFgwWFaUDHNfS7pe9YQMo1osWM7ZIU7JHCt0yYbjg5s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xo4SLUf3WVX1fS0VbuchCLykfGxOJG1Z2wDqRC0bHI8iI9Q0d57YfW6rCF7fNjRkL8isKQZ1vbMcRzKxMO9a7EMHjgUj83r2AtJf4p1Y+05n08yVxfOBovP+oUJ8QKneASGJokQ3NECwt1G74L3TqokhrpSbUjIWY1z4/R1yThw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sOB6dlpY; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sOB6dlpY"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84a2c90e383so1343336b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 20:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785296513; x=1785901313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ystWRSu0XGzWLVNCp/qZNWLqhKRo+gG6ngoi7HTHAw=;
        b=sOB6dlpYxepWznoCYsY0Fw5FVENKSKH06NfBwvPC2TSZ70IVVk4t3v2seG4eMfIsoa
         G0jkOyLe0fpMxnVOOuQOzEIIS39nvfUDJC3pYx/JlZIM5HKslKkOe3iuyoq8WW5tyWaw
         vio0ItD/BPXFJ8tLmFUcJ8BXVYDxJrPmBqXgpqOnPRwiH/GDFHmdK8WpXueKXahXCHxX
         byXovm6jyarcGaU/ELs3r0hHZEskjGMWMozmnkKOHyduoT8z5NZZns1rk+BvO2cvIvNH
         WbA5eTo4UQCX6J2mJeJSvpUN+VxoKSFOqp3WyPKXFCrV5ge/9Szgy/vbbYYVLyPbqXpl
         IrYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785296513; x=1785901313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ystWRSu0XGzWLVNCp/qZNWLqhKRo+gG6ngoi7HTHAw=;
        b=Eg1WdKDXMvn/7Ez+J6hGl8cYZQmXf+KAeY1cCq1bU1kZgRUNOTU9OTJaGVQ6vXx9SG
         itBrCpmI3vT/QsdAt9iWyh6ILDwGYve9HP5wQj+O4kL+S762nPOS+Wz6muYwVj5Jwduq
         fsvdS5YzIYwiWyMYAJCMaCyzsw8HHaCWM07FBdbL2qxQTLPvIrsA0kwsFwSjCaulXqNO
         iy00iv1wQRDoLdUl8axUuGtBKIU70xarhiNBpBN6KvETdaEzuinv6x77+hKlzCMKeYpr
         HOC+g6wBjcuRkbGuldruEQLqJZg0x9bIZm3X5eycxpYww0hX26FqSYVrOyy5+gzDsGTS
         DwSA==
X-Forwarded-Encrypted: i=1; AHgh+Rov2F2Gu8N9UPZTGzGiDvsS3tYUgNK+FMNwOl9G/yWi9Rr/LHikPTBJQhhTI1dkcggM8Gw1sedY4c0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuatNtV4jQ1QOMqBB2HoyrXE+KIxFKNNXDvCdFS/r3Y47PeCms
	vjeC21PLz5fNMDkmoRUODAysSBmL0AxhDwSCM08b3LPM2U47eyb9DYFDXWV0v0BY0A==
X-Gm-Gg: AR+sD13mobaNv6ZXFT2Va3rs5MqSeaDqslks+vm1gMlwszxmyGJ1Wxl5RdNU0HL/BZb
	QoQwXBkTBT7Y6qzfj4MMb+lp0SMSjtBQB8z/tKjecr18JKnDQZmTPiAm1RCmTUd0r73G6yo6TL3
	+TytIY/NOVPd6ZpgOKR8eEj0YMTsiaKGvoGapp8rkGQ6DVLNEh6j4B0wBuKBoMYHqdjMBXIrF7q
	bFDblrMiuEoIoiMb8R83t97aX0A/sy+er3cQy1tUoNJMwHpuofoWTWCueFBry43EEw71dbSqrZ0
	gOT3nTyZGv7Yb4+X6Me//Qah0OF6hwfF+p9om3e4rwpN5o/jdU7NtgNlXSGrye0HbtUv5z1ZHoz
	2WplNEjazilqb/aiMDtfehw2UCthMSwhkys1jjAF03aMWAjGxLoAkiQBLHpPsbvZ0cST8ie3l6C
	y4mi0xWTwLaA5K71QMo0CcUsxO2pHLtZKu00nhs7bl44yj92UmrKwvPYEpV26FC2k=
X-Received: by 2002:a05:6a20:6a2a:b0:3b3:ccd0:cf62 with SMTP id adf61e73a8af0-3c8e492ab44mr714378637.36.1785296513350;
        Tue, 28 Jul 2026 20:41:53 -0700 (PDT)
Received: from localhost ([2405:201:8018:1843:35b9:9f48:c0dc:e32b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504cc9dffsm4502149eec.14.2026.07.28.20.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 20:41:52 -0700 (PDT)
From: Ayananta Paul <ayanantapaul@gmail.com>
To: kuba@kernel.org,
	donald.hunter@gmail.com
Cc: davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Ayananta Paul <ayanantapaul@gmail.com>
Subject: [PATCH] Documentation: netlink: fix spelling in tcp_metrics.yaml
Date: Wed, 29 Jul 2026 09:11:47 +0530
Message-ID: <20260729034147.6970-1-ayanantapaul@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the spelling of "reordering" which was incorrectly
written as "reodering" on lines 113 and 115.

Issues identified using `codespell -D - -S "*.bin,*.o,*.a,*.so,*.ko,*.gz,*.png,*.jpg" Documentation/`

Signed-off-by: Ayananta Paul <ayanantapaul@gmail.com>
---
 Documentation/netlink/specs/tcp_metrics.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/netlink/specs/tcp_metrics.yaml b/Documentation/netlink/specs/tcp_metrics.yaml
index 13144aeed31a..dddf92bedc4d 100644
--- a/Documentation/netlink/specs/tcp_metrics.yaml
+++ b/Documentation/netlink/specs/tcp_metrics.yaml
@@ -110,9 +110,9 @@ attribute-sets:
         type: u32
         doc: Congestion Window.
       -
-        name: reodering
+        name: reordering
         type: u32
-        doc: Reodering metric.
+        doc: Reordering metric.
       -
         name: rtt-us
         type: u32
-- 
2.53.0

