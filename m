Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D47640FD9A
	for <linux-doc@vger.kernel.org>; Fri,  8 May 2026 16:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778258289; cv=none; b=sa5n9P+X5mVssmdMfAOg3vkkiDImIEAHeD4WdQ1HFgKtp0dzUhRGw+lNS7Qy3lfWjJnm4dGHJNzzdP3ky2hW9FcxlWhKlkbv7XaEwU7D6tmlLwLdYroTwLjYClmEDnN8tbOMkBIrCfqfKX9GmrfqLQ7jfOzKHNJecw/7w6ig91A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778258289; c=relaxed/simple;
	bh=wNU0Th5XFAiJ7y6G8CDjt/dAtEYXDL6KcaolFhQPjEU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ONvvYJea8wEuNBWh7MHNCkf1yCbPwNf7Jxr5MxFHbQE1UBwPxPWDE6L+3MP4MvFP1T9JIy2uT8BeewsFj9RfcycxRP09xtKcs40lgLVGS70QMjamkfL0CudDShA5+frbOg4RvVym5s8C2o9PmypgxfC6e73cp4MTxYLBUqDcR34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r9PM+uEP; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r9PM+uEP"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso32157185e9.1
        for <linux-doc@vger.kernel.org>; Fri, 08 May 2026 09:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778258287; x=1778863087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WT56FP1Bt4LcxLxZsWkK8+jNPLJAOL9nE1Hwe4/BncM=;
        b=r9PM+uEP1VTIerMwcLlTxQTqfFiZsRbwjH47TYsZJUVlNKXLHDDOZfmrrQ58M9syDh
         ohtYUYUFMSCp6IJTO/NnElsvRuLWgo+P8mXLtarBTBPhLf8ehx0B7brv2EvYQE242AG+
         vho9obhSXoyp9WFVuZ34GH5P2c6e9gGxMIzdiI3kOnL5hxhiOa51ai+N06tbP2tVVxo7
         T1sms07yGafuNEj/qprrLSq/g9TGQszn7K2jrjlTxB0YzBQQTXt17DxvgS0wpaXgaA2q
         JMd1Rv813g39HnXgD9aK5XYVDM1rmayk0CfDp8IgpFdKmMKJx7vLPy4tB6NRAzYsZq/b
         V1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778258287; x=1778863087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WT56FP1Bt4LcxLxZsWkK8+jNPLJAOL9nE1Hwe4/BncM=;
        b=audnjz0GaQlIRbb8dvDhyreYmna3v4VKSOYlg7ByiusngsKp/6BmCVRwCSj5LQNMMP
         1FqXbevGe5AVlCl0gKUaEdWTq1+Gq0ePX4wUf0qIeAhgeGBmNVk05MwPfQBvd6amWY+A
         US3AgMGWEKYCL8XSe2tqa2rj8LtWamR0WA1+Wh5MA6Jrm/6ahDWjChGhyKAJKXiGes1s
         1U0o4xGMK0H/u1gniW4HJqBuphHli1p56RtN7W1JT/wHswDjGkDnGoaiF/2Ksi6qusNJ
         GvEqg6I6cynRcWjLcTG22yx7F0RZasmmAufU2UV7IwPWnol3Be5lCNlvHJv/8dwozh08
         /2tQ==
X-Forwarded-Encrypted: i=1; AFNElJ9HmBcwWp6k1iDRP2up6IorrpfqyYMbtWmn0ljek1lhYPjbnb5ivuFDMB34nHXKR4XtyEHAyeiVTqM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg6vPtOncCG0z1/lgeSkMrlWGsLZpJOGZHJLfBxFHuiimfGaNg
	nQ+kDgxropd6VWbll7mbPEgH9x/h981u0oDLWudSk/D+mz7L6opmmIp+
X-Gm-Gg: AeBDiesEmL8dPQLXJmgvHRQP3SkPMrTYCxw80cbpZsemxtOzBGaxJwfOG44tZB+hhLQ
	aCQvyZGQ+eoYYB94sBbBsYk+h5dS6kRLvC6N9GAB/OMc7G1ZY1zsT10QKQ4OBYHd7obZ64cel5R
	s024N6FCwhfopDmXJG5FzwHgKeD+I0hPBu8dDH1ZWQlj+LtPR7mo6XV3u1sJ/NKp7+PpspW8ilW
	T2xTXRdUfDR3jj5SSccY/fcaeE6ibsOShg+XxI1iIw+tWkY55Hk1BXyfyfrmZlXHIR/6a/FxyIE
	i+w+UEpiEdA2GX7NfNla2UUQ3VVyKECemec2nJu5koISgWmj/0Sc1seLinxNW4BA/saV/dA+ikC
	CLOEpBkquTwej4b1mIo4najhYv/RgjpC2CaB8GDt5UcE+QQ16VPDFgOtrnPSIeRvH45VqjKbcZ/
	zMZ3gRHGHpxYS7xzAvdbIcBX1KaZKMG2xiiAHAL7ml92Qdg3e4Eb4XZdTwKtV1Xsx5T1g=
X-Received: by 2002:a05:600c:3b8f:b0:48a:79d8:a8d6 with SMTP id 5b1f17b1804b1-48e642deefamr69130145e9.7.1778258286363;
        Fri, 08 May 2026 09:38:06 -0700 (PDT)
Received: from arey-arch ([2a02:1210:7298:ec00:73f0:d2e7:188c:1f61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6dd32afasm6901045e9.5.2026.05.08.09.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 09:38:06 -0700 (PDT)
From: Adrien Reynard <reynard.adrien.08@gmail.com>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	kasan-dev@googlegroups.com (open list:KASAN),
	workflows@vger.kernel.org (open list:DOCUMENTATION PROCESS),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	netdev@vger.kernel.org (open list:NETWORKING [GENERAL]),
	linux-um@lists.infradead.org (open list:USER-MODE LINUX (UML))
Cc: Adrien Reynard <reynard.adrien.08@gmail.com>
Subject: [PATCH 4/5] docs: fix repeated prepositions across documentation
Date: Fri,  8 May 2026 18:38:03 +0200
Message-ID: <20260508163804.16267-1-reynard.adrien.08@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Adrien Reynard <reynard.adrien.08@gmail.com>
---
 Documentation/dev-tools/kasan.rst                   | 2 +-
 Documentation/networking/switchdev.rst              | 2 +-
 Documentation/virt/uml/user_mode_linux_howto_v2.rst | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
index 4968b2aa60c8..3a8bd40ad905 100644
--- a/Documentation/dev-tools/kasan.rst
+++ b/Documentation/dev-tools/kasan.rst
@@ -392,7 +392,7 @@ reserved to tag freed memory regions.
 If the hardware does not support MTE (pre ARMv8.5), Hardware Tag-Based KASAN
 will not be enabled. In this case, all KASAN boot parameters are ignored.
 
-Note that enabling CONFIG_KASAN_HW_TAGS always results in in-kernel TBI being
+Note that enabling CONFIG_KASAN_HW_TAGS always results in-kernel TBI being
 enabled. Even when ``kasan.mode=off`` is provided or when the hardware does not
 support MTE (but supports TBI).
 
diff --git a/Documentation/networking/switchdev.rst b/Documentation/networking/switchdev.rst
index 2966b7122f05..948bce44ca9b 100644
--- a/Documentation/networking/switchdev.rst
+++ b/Documentation/networking/switchdev.rst
@@ -162,7 +162,7 @@ The switchdev driver can know a particular port's position in the topology by
 monitoring NETDEV_CHANGEUPPER notifications.  For example, a port moved into a
 bond will see its upper master change.  If that bond is moved into a bridge,
 the bond's upper master will change.  And so on.  The driver will track such
-movements to know what position a port is in in the overall topology by
+movements to know what position a port is in the overall topology by
 registering for netdevice events and acting on NETDEV_CHANGEUPPER.
 
 L2 Forwarding Offload
diff --git a/Documentation/virt/uml/user_mode_linux_howto_v2.rst b/Documentation/virt/uml/user_mode_linux_howto_v2.rst
index c37e8e594d12..7b08738c30aa 100644
--- a/Documentation/virt/uml/user_mode_linux_howto_v2.rst
+++ b/Documentation/virt/uml/user_mode_linux_howto_v2.rst
@@ -1092,7 +1092,7 @@ be formatted as plain text.
 
 Developing always goes hand in hand with debugging. First of all,
 you can always run UML under gdb and there will be a whole section
-later on on how to do that. That, however, is not the only way to
+later on how to do that. That, however, is not the only way to
 debug a Linux kernel. Quite often adding tracing statements and/or
 using UML specific approaches such as ptracing the UML kernel process
 are significantly more informative.
-- 
2.54.0

