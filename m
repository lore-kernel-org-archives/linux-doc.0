Received: from sxb1plsmtpa01-14.prod.sxb1.secureserver.net (sxb1plsmtpa01-14.prod.sxb1.secureserver.net [188.121.53.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FA6385
	for <linux-doc@vger.kernel.org>; Fri, 26 Jan 2024 00:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.121.53.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706230132; cv=none; b=hny1ob8h5Bi+EWii7C4xXdIwlNsH4k/YuzXrDFl+muu+0wt7csoLRbKseSSuSWnR37UzNH5ntZOk60A6/Xpqq9SV+4EZiqNahPuL87mo9fmqNa8Veh7l/9fQMoiKIdIR82JwzYdp7/mE+FxwDz9+IDwWagXmvFoLPit5x1f9V60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706230132; c=relaxed/simple;
	bh=F2HJbgjirVbhLcwiqeR03vorAqaTcHebG+Uxw8cBNjE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=LN9oSq3kHFGF/EJ91SvJwbvGGq8X4upm9l6jN+knVmRynz9BTXlmN5RkggokVrVb8kmX7QwlUpu5uXr/OWa5+QFQjoJkS4GLM9ODzAGD1IaIFMwJBFb176kjP2EI8487Pt8NTc6nt1AyD7GHYP8oM9St+KSVgTr1sQgbFfuMPlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exordes.com; spf=pass smtp.mailfrom=exordes.com; arc=none smtp.client-ip=188.121.53.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=exordes.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=exordes.com
Received: from exordes.com ([87.92.236.132])
	by :SMTPAUTH: with ESMTPSA
	id T5yZritph5uinT5ycrVQb9; Thu, 25 Jan 2024 13:05:32 -0700
X-CMAE-Analysis: v=2.4 cv=TYY1tgQh c=1 sm=1 tr=0 ts=65b2bf0d
 a=2E+36ROA4JFpaWoRYG/7Xg==:117 a=2E+36ROA4JFpaWoRYG/7Xg==:17
 a=IkcTkHD0fZMA:10 a=eCYXQZmkAAAA:8 a=mT5m1EEDzZR6rqIwKw8A:9 a=QEXdDO2ut3YA:10
 a=77AlN4CNbnqoG63BkLSu:22
X-SECURESERVER-ACCT: dai.lu@exordes.com
From: Lu Dai <dai.lu@exordes.com>
To: skhan@linuxfoundation.org,
	alexs@kernel.org,
	siyanteng@loongson.cn
Cc: Lu Dai <dai.lu@exordes.com>,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs/zh_CN: accurate translation of "function"
Date: Thu, 25 Jan 2024 20:05:50 +0000
Message-Id: <20240125200549.7192-1-dai.lu@exordes.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfElYJFaEicn/f9J4EpBki4w2FFVax88XB+A18h5CahzH+ZT7siMquTpkQLaQXv9/mfcCBc8i6HLY7Ikl+K3nO3iqSDtsVRARY21Za226bdoP8Tj81LK5
 Mp1drQAe0W/bOYHYuqQT9P7kaBtObON4dfg7eL/qdhTq7AYcNYhYuBh9TtVAD9eo2G/eH7cdTA7p5tNLD+Ug2rc43VhbNoNZhg18Uu13YrykvTEP/J3Mn182
 dWfxN/wTwGtFJSRUwYh25jitSoFr9LH27lfazAALpU9wIcylWJimGObxNFWyrLB3Z1t5qz8EbhCDwB7t1b1EV7baKHB+81X6kwp6CTX4VDI=

Choose an accurate translation based on the context.

Signed-off-by: Lu Dai <dai.lu@exordes.com>
---
 .../translations/zh_CN/userspace-api/accelerators/ocxl.rst    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/translations/zh_CN/userspace-api/accelerators/ocxl.rst b/Documentation/translations/zh_CN/userspace-api/accelerators/ocxl.rst
index 845b932bf935..aefad87e9099 100644
--- a/Documentation/translations/zh_CN/userspace-api/accelerators/ocxl.rst
+++ b/Documentation/translations/zh_CN/userspace-api/accelerators/ocxl.rst
@@ -53,7 +53,7 @@ OpenCAPI定义了一个在物理链路层上实现的数据链路层（TL）和
 
   Processor：处理器
   Memory：内存
-  Accelerated Function Unit：加速函数单元
+  Accelerated Function Unit：加速功能单元
 
 
 
@@ -97,7 +97,7 @@ OpenCAPI拥有AFU向主机进程发送中断的可能性。它通过定义在传
 ========
 
 驱动为每个在物理设备上发现的AFU创建一个字符设备。一个物理设备可能拥有多个
-函数，一个函数可以拥有多个AFU。不过编写这篇文档之时，只对导出一个AFU的设备
+功能，一个功能可以拥有多个AFU。不过编写这篇文档之时，只对导出一个AFU的设备
 测试过。
 
 字符设备可以在 /dev/ocxl/ 中被找到，其命名为：
-- 
2.34.1

