Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966FE37881E
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 09:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772702556; cv=none; b=hrwuhuyvj4aleUsvDDGaY8bAdq88CDMS3rOnO7OZDzPNbYYM7QocMFjqi87c8M6Bbg1NLC17gi4gMVSHMOlDfvFnq4vbnRYvMUq9keWiS9+Gj7NtDr8eNL9qxpavkFqvePs5kYWusGo3ulYlxvHduRX15x5BOruJ3bi5TghTbMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772702556; c=relaxed/simple;
	bh=dYZDEIYcGDDCKCSK5WQGTMeJS/coZs66ym1GE96/J5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u1LCX8DpxeST5HU+wZZd5Bb0mSjShOxYG8Ztd4fQj+inOMGxHF52uB7H/MdjCMGTj748MROWczAWgCcxFnWB7hQ27D9akOxC4+q6fbeLmLHVsR8nc5zK2FHCHAsJCYqKEEbXB0Ve1TP1BK8HQnxzDfoNHsc4S3+2QFj739jpyKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PwemhpW0; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PwemhpW0"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-827390e8a3cso5122418b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 01:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772702553; x=1773307353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2uyvuUTwLbkE6jxPZnMZ5J4m41aIY7BYEiJ0R23tsYQ=;
        b=PwemhpW0R83JAmXmTaWfZ9ywyil7JFxC5A76ERZU66OEWxvNExbE3eIvOtcM0wNyMR
         W08M11fZcPMnqgtccC5cl6Kvw34wwleNIkyJwyP5ir1CNYcCJrd87UZMIYIeaeTYmLlc
         WS56szCdxbE33mzeaOn43NB5XhpkAp3uhF7Zu+bhShvsxNvB8gUzR7XLhP3l1aqdtOuS
         rPaOmn7roLkJ83eFVBUUhIDke7GiHkc3CwKA/vmsLVyb1SkgLFJI2/Pu85VQzPX/c4ad
         7+bKOCb83dq2kwqw6pf2mHPvGTGcLXn9AMC7tqXz/cjn3a1/ru+wopxJ7l+P2fnPU8HH
         dCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772702553; x=1773307353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2uyvuUTwLbkE6jxPZnMZ5J4m41aIY7BYEiJ0R23tsYQ=;
        b=rW9RwnFT0rVFp3lHNDVBmhtQsKcOQ8lfMYcV7CZgPBWexhd/6oWqzO68QKxbYCqST0
         tgyQj4qS21D5kHiby2GXPz9y2C9sRYvcYpk+dYAsq3xFmHbqyYACbuBn7gPwYEDaxkJt
         SDN2kwMMrxA/HW4GdbKfsHqMl2CzJ/GGYWuhyYjFquJ6yfnRPP2G4p9ZTcGc3wQvJozZ
         UrIAXJ4ppJSH7VSWshgW+FzkOHU99AwTXLJl1SCsPHc3WfrKs1D2X+o6VNvK5RvDOJZd
         N9qU3jabJhOwjJavLl65wwVwdAPqY/u6uRzZSXR+QYo6jnmvL7vuxm8yfmNPXNAGGL+M
         UdDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmxuVN8HfSjZhV0Nw461GI9C8y0+hyesVKz5rrZ1Qhks63vndIexoGUJ/P/wPLsBv6qfytyAd/vcY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9bjkZP+gf7oQxQsU1wFQlMJ1uzWFInXDeaMVrNvB1erw5aEq3
	IN2tG2cdOL2XPyGzTkGQs3kgSQbGD8Fr6b5hIi1VMF71F7mr90EsTIo/
X-Gm-Gg: ATEYQzwBmIjy5VAsthE35zIzX4nscre8bdT95IwpNRSXS1y+PrLguFFqlt3SS/tc+Jn
	M5OG46cQ6P6YvxqYafUJ+pCbxzccFpnjpPOuPAFlKA1rVcjyhI4lSDYXxhWsuQN86XxE+auk/+6
	xubs/OhIR9ZneduYsFgkYjg9i7oQIavlJHibBt4xtmLqa6WC6LFdL/k2Vi8xC4zLKaDB8EGkPdl
	u1CFMD6aC5xcjwoz835moVDpWEx5gTQokZrarMg9AJiO2nU+gq7hvZMz/7e3rGkns6lRBebeyzp
	a0ThYrXuwGy5hvM1VKjUF0FiBB1q/LY7MjSzeo0Uo5kYG9uuBab3XaDCZtVo0N3VwfQkmNLEEGP
	SGPo27gOANCwqKzvA0UnURAB0SgS+DGZK/C7qD5eax2e0Du8X0B8ZmmRHo9n4oMjDN9shiOVmFY
	dTr/eLDiNuvPDBQgoQg1agq//eIiv1p5OseGL8CBesxig0hfyoVF4aPnV4CbRN
X-Received: by 2002:a05:6a00:1415:b0:81d:9862:a140 with SMTP id d2e1a72fcca58-829855dde46mr1547767b3a.3.1772702552996;
        Thu, 05 Mar 2026 01:22:32 -0800 (PST)
Received: from ubuntu24-04.. (120-51-71-230.tokyo.ap.gmo-isp.jp. [120.51.71.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739ff34fesm19718200b3a.42.2026.03.05.01.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:22:32 -0800 (PST)
From: sawara04.o@gmail.com
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: Kyoji Ogasawara <sawara04.o@gmail.com>,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH net-next 2/2] net/smc: Add documentation for limit_smc_hs and hs_ctrl
Date: Thu,  5 Mar 2026 18:22:24 +0900
Message-ID: <20260305092226.27379-3-sawara04.o@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305092226.27379-1-sawara04.o@gmail.com>
References: <20260305092226.27379-1-sawara04.o@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kyoji Ogasawara <sawara04.o@gmail.com>

Document missing SMC sysctl parameters limit_smc_hs and hs_ctrl

Signed-off-by: Kyoji Ogasawara <sawara04.o@gmail.com>
---
 Documentation/networking/smc-sysctl.rst | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/networking/smc-sysctl.rst b/Documentation/networking/smc-sysctl.rst
index 17b8314c0e5e..67c2bdc533d7 100644
--- a/Documentation/networking/smc-sysctl.rst
+++ b/Documentation/networking/smc-sysctl.rst
@@ -111,3 +111,27 @@ smcr_max_recv_wr - INTEGER
 	like before having this control.
 
 	Default: 48
+
+limit_smc_hs - INTEGER
+	Whether to limit SMC handshake for newly created sockets.
+
+	When enabled, SMC listen path applies handshake limitation based on
+	handshake worker congestion and queued SMC handshake load.
+
+	Possible values:
+
+	- 0 - Disable handshake limitation
+	- 1 - Enable handshake limitation
+
+	Default: 0 (disable)
+
+hs_ctrl - STRING
+	Select the SMC handshake control profile by name.
+
+	The selected profile controls whether SMC options are advertised
+	during TCP SYN/SYN-ACK handshake.
+
+	Only available when CONFIG_SMC_HS_CTRL_BPF is enabled.
+	Write an empty string to clear the current profile.
+
+	Default: empty string
\ No newline at end of file
-- 
2.43.0

