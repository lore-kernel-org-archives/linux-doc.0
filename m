Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944CE3BC4C5
	for <linux-doc@vger.kernel.org>; Thu, 22 Jan 2026 22:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769122653; cv=none; b=nbu5vtVXGiEzKKOvSMwVkCrV6vIStO56Rf9LcZGjd+YV/c6sFjtTLMTOHsC1YVpciVElK3f2/lJVU92poRDWbJMEhdKmj36Pc0KDuN9PDeeYMpbAYosX8qOFxy1hBZt5b36xN4CUpZ8gHlK+43LUIt03k9XxaXpwk10Y9QN4pJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769122653; c=relaxed/simple;
	bh=AdS0pPIeKqlvi2FCQZposBDiesLZJa7Q7OkoovB3f7M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JXI6Clz5ZV6Y0AuZJFZW+vMkw1xHI6PSqJhwh9L4yHjD3UmVByRA5PmuWHqpmD5L0YVkJ5AQPjbLkSlGFzhMJLfkJIVVJyaNQpHFGmQdiqC8rljyMIKVCu0ztWdf7Sez1Ne6Of7zA19grOZbu5YM9ksYXgoT/uMVNmoSACLZZnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+EjnBhR; arc=none smtp.client-ip=209.85.210.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+EjnBhR"
Received: by mail-ot1-f66.google.com with SMTP id 46e09a7af769-7cfd6f321b5so960111a34.2
        for <linux-doc@vger.kernel.org>; Thu, 22 Jan 2026 14:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769122645; x=1769727445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bJU1eocd9c215PKSFJkz/SPf5yt/fOajjiK68fvi4ic=;
        b=c+EjnBhRXipWZ9o5FYHs7Wwb+c/fnSu7f41nc9+ZD2OP6GcMSm/U4CwicB7ttfip7O
         HxJSWapxCMxRBfS+lyP3SNCtA4Lo5HTZ0dsvLb0HJQN/HKb/JelZmMTd5h8w8YGUKw39
         IjHkphO0Azxw5RLeaUeTa28STuNDSsUQk7mibB9I7nrZxQ1cxcyh06lZfi7MOcU5tI1+
         eDQEzx4nXZ62D82xpj8BOiFgtMV2bbOsJ9wcE8ZD9vAH73Qf3Fr2P/W0NbJg8QdsXEv7
         JRpAPdx/EwWZF55A2UhEOAcW4eQWt+upVEJrnkmY6aFLpUc+tFjRO+M/oKwKvIyvHB1v
         P3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769122645; x=1769727445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bJU1eocd9c215PKSFJkz/SPf5yt/fOajjiK68fvi4ic=;
        b=N+kKOyyDZkegNeXjjMPTruyx3yA6RAw3dcXPK6VQx4Np/FD0hU+GtzIIJS4CotKw6R
         zaOG8Iz4WpstAMK69sgg3+iDhVBrkyGip5foqEwvgoq48Zn0lZkdpO7eAeYVoZXD6GpZ
         fRqAYYhxD8Z8MX6PiGbtqEu1KwJG4gJuYgQ/uFqKL8cFMliuJpicEUfG05XbrYVGmxY1
         Ib9SwsaBwt9pZRgN8GIgChtTD8uaRxLeM4QezP3Zq4+Cdry0azgzkLL7xD+EUx+U5X1r
         qmDyeJBLWZy1PpN48C9ECoZTqw3RGDW8+5VeJRiSx59Z56eW9CiVjhBrDyMuHjJr2xYF
         CPLA==
X-Forwarded-Encrypted: i=1; AJvYcCVmBEGbgO2DqXLX3lKw66zvoHb7+VmIv+tthewiSwK2L6YqafKkTPibymQAutE+vJL5RTi08eCIFBI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHr+wXVwiodA5Wt9c/dmHCW5if5o0eZrOCiJCRUSp1GoRZPh3Q
	D1BCy0o5n102DaB/ZBZSoX6+uzYBwN2tkgFvslCVAjhm8FMNvosDZ9Aq
X-Gm-Gg: AZuq6aK2F1yP3wnbEVT4HQQFbV4SJNKUwtvkTNU27bW6VHCbzVfjsetVR6y970Uy7Jx
	edGecpQrOx8RR1572i5/hh+ft9f0YcA5V/mgAMHZ+wnQ52h2mt68Xpbb7WQhAdCpn9wWOi16+2A
	P9m3r7dvaeUMmXseHLme0XlBuVoAAwHbgsZv82Z54OZ3T0CaoaTagukFjklnIoccb0XyJybHjmJ
	z8UdAakfG1Kw6HHfbwINwyluCPrS43tAp/VMb/7/CqkovHWXNmk/FXtAHmJKTMQP2woufT33tPO
	BQdKSNG7iyjfpkrs1ZSj9FFvAOd5yB/HFkLrAP1vXDhaJjJWa+4WCJJd+fIhS8+9fK1qcuUajvt
	6hfdQZ2tg4GDB8VvUq5cuejxVe9QUDocNAU2I21iBqfSvm4CkqoffZRQSVWYG6/QE5Wr+TXEyFJ
	8o1NYlU/b3oB7vGV0xfA==
X-Received: by 2002:a05:6830:3114:b0:7c7:5d72:567b with SMTP id 46e09a7af769-7d15a62059amr657745a34.23.1769122644856;
        Thu, 22 Jan 2026 14:57:24 -0800 (PST)
Received: from localhost ([2a03:2880:12ff:71::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d15b35e1b8sm467052a34.10.2026.01.22.14.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 14:57:24 -0800 (PST)
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
To: "David S . Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH net-next] Documentation: net: Fix typos in netdevices.rst
Date: Thu, 22 Jan 2026 14:57:23 -0800
Message-ID: <20260122225723.2368698-1-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes two minor typos. Specifically, on -> or and Devices -> Device.

Signed-off-by: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
---
 Documentation/networking/netdevices.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/networking/netdevices.rst b/Documentation/networking/netdevices.rst
index 7ebb6c36482d..35704d115312 100644
--- a/Documentation/networking/netdevices.rst
+++ b/Documentation/networking/netdevices.rst
@@ -80,7 +80,7 @@ unregister_netdev() closes the device and waits for all users to be done
 with it. The memory of struct net_device itself may still be referenced
 by sysfs but all operations on that device will fail.
 
-free_netdev() can be called after unregister_netdev() returns on when
+free_netdev() can be called after unregister_netdev() returns or when
 register_netdev() failed.
 
 Device management under RTNL
@@ -333,7 +333,7 @@ In the future, there will be an option for individual
 drivers to opt out of using ``rtnl_lock`` and instead perform their control
 operations directly under the netdev instance lock.
 
-Devices drivers are encouraged to rely on the instance lock where possible.
+Device drivers are encouraged to rely on the instance lock where possible.
 
 For the (mostly software) drivers that need to interact with the core stack,
 there are two sets of interfaces: ``dev_xxx``/``netdev_xxx`` and ``netif_xxx``
-- 
2.47.3

