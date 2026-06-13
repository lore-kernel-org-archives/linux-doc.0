Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721CF2DA74A
	for <linux-doc@vger.kernel.org>; Sat, 13 Jun 2026 18:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781375865; cv=none; b=VnZFcQIkqc/PGizG8WJfFZyJ8wPOXe4GOKYMWqVbB5fZDCUniSJ3/litM+RQ4ltfrMGKMTBgdoVLTesmlhV859pJ5sSLUXNAnSF8LYslZ1YxybauP4A291tBmE0Y2QBQeuComGFLzoenkjen3q9dB5vKIoGTnkkj7s18qztnQ1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781375865; c=relaxed/simple;
	bh=qTai96ZoHayohP6mYKKR+28/CC+juYgbBdGpfukulxA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dKllB4N1cvoXN3IVDi0xRgumRS/IRCu4bOGjC8u8f33GZZqjf84ecE2osKb6v5Zqk6uo6ENgLehfMw2/EB2nkZGHF/OsPDjDOaKSvCYZSmMicwNGebP6yXmYGUppmd0cUQJcqoK0+XsFZdPRDlIiQU7POWE9RP/MoRvIBbNcoAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NlgGVqH4; arc=none smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NlgGVqH4"
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-3078e0dcd67so2315631eec.0
        for <linux-doc@vger.kernel.org>; Sat, 13 Jun 2026 11:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781375864; x=1781980664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tu1ljkBfCCSxbfTaYmM5mnOXsXZHLSlPDD337qA7Kzo=;
        b=NlgGVqH4dv/oxUzrTu1HTP3iVvwoU0xhgKFVaK/larz/xxWDeADBaRIXjfB/UH8sHc
         8XSAkQ1E2nroKNcsABl7RRHmNosO5QJSWEavfGDRTLqSK/r9seSp0Gw6f81yvQeBmFzf
         twz6oBVWuzGZb1We+WGQsBg/SSpeTMZUB5YBMrqkb8vilRjGmNr2WwEgJFNZCURzppQk
         pKnSUvk/9uRBU7vLSH8CZzs1UuMScTAlT6WdEfM4dhO//NN3vgzednu+Nup6ixZwrCnn
         7ePXmWbOd9uxZILTzcgzqSU2bim16kJcsYJ6pYc1TOKOVVCzlcdYDtjGq9/6v19Q2eP1
         6AXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781375864; x=1781980664;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tu1ljkBfCCSxbfTaYmM5mnOXsXZHLSlPDD337qA7Kzo=;
        b=Ces8xe2Bn1FFT8sOuIPQNKigkfkq5TTDXL345HFQRE1f75veX2ivtnjXjwJ2LlOrC0
         ccJHQm/wHogU/B40j9goryKvIViuTzHlOvG+y9VwwfPUPF+c+JMHAzgFo20UBcevIMBY
         wyqmZ8XMv+5w3G01R2q7hZDYIADy69GHb9bSW5mZxHJYs/CPI61eHT0Wv7xCmTjEGcNM
         h8yPeNi+j50AsAPX38Q4ZSH0zw4c72JXIxm8L8Nh1LrqgldYQ1AAQ2m4D02zt1ki0KRC
         mMmCFBL6AnQtPJXVLFAnNy0e1pEId//H5Y/NNrGULay6rmp3efIeX880srLAWB75tb02
         9qbQ==
X-Forwarded-Encrypted: i=1; AFNElJ9f2Tt/O+P8YX5+5Uz8UbqFnR3M2BGeXrbTm7lPr0J7LUk0t0mkFSEkmBZTQ/kA2spoYlOaZLvvRg8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWgVKiP1XT1/YM08FccOhON8YdWlPIPOjN0CrlKCAq5JqB3tjF
	nWIFDM74Mj3AbepbUj9a4WXF1R0y/Dx/CK19J/RJPjujaV4YYn1Js6CnvKKlz543
X-Gm-Gg: Acq92OGQ3UsTbZ1z2znfCr2/pVjezIrpTZSkN1IIvJ6l863uCPkQZM0rO4yptkiJw3O
	hXCkPkWiLpg1kjFvktoJeWphW5qzSjLShuMWyxnDgK/WorMIdjnK9022muOEkmGfaw1lR477GMx
	CEnnxp06X55SE2Qd3bmbG6qQS6nbhI8Yb06c9R4i5OezhcmTAMbwp5uic4WupG4HOKs6SydcpAN
	lNxXomak6jnqGo1dsPvxXFhwAQG9CRDV75TrBJnGXjglqJtKXFf7TGSpmluP7WEM1GwWu2B1+yQ
	2ZecTW+57ryYQ3aPYro+QMdb+L5xSy/yIxbqZWRL8iiU6gY+FE6LNXhL+ea5TR2rswl7w2VJkkt
	bq1o4GyfIE3R/fs5B2iuFEtfO1kcnKDJXj1k8Wl54vSaBvrkVVywdX4Mz1rwRKOouRwKVEWjFAn
	vE6U3CsyBGs/lD0P2G/S5jXmvfJFiZ/C7nwM859ntY/8l3hhwLI147X+c4nPwN1+jNWrAwy+DI5
	xhI4JMy+Xnrkkfd0nkjcbCbjjoGUnZgvdsK+fuQ9fRLJ9UGr3UWF1Lbk784joNgWYzjV2q8nTTY
	U2WYX1HABB8spVva5P1Ht2vIrb2h
X-Received: by 2002:a05:7301:169a:b0:304:cc9c:35ae with SMTP id 5a478bee46e88-3093532e192mr2386820eec.4.1781375863437;
        Sat, 13 Jun 2026 11:37:43 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e48c3dcsm8785013eec.1.2026.06.13.11.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 11:37:43 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: Dongliang Mu <dzm91@hust.edu.cn>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	linux-doc@vger.kernel.org
Cc: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2] docs/zh_CN: fix CONFIG_CONPAT typo for CONFIG_COMPAT
Date: Sat, 13 Jun 2026 11:37:34 -0700
Message-ID: <20260613183737.11434-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Simplified Chinese translation of security/self-protection.rst
contains a typo CONFIG_CONPAT for CONFIG_COMPAT. Fix it.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
Changes in v2: remove unnecessary information from commit message

 Documentation/translations/zh_CN/security/self-protection.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/security/self-protection.rst b/Documentation/translations/zh_CN/security/self-protection.rst
index 93de9cee5c1a..ad96bb4a4995 100644
--- a/Documentation/translations/zh_CN/security/self-protection.rst
+++ b/Documentation/translations/zh_CN/security/self-protection.rst
@@ -97,7 +97,7 @@ ARCH_OPTIONAL_KERNEL_RWX时的默认设置。
 --------------------
 
 对于64位系统，一种消除许多系统调用最简单的方法是构建时不启用
-CONFIG_CONPAT。然而，这种情况通常不可行。
+CONFIG_COMPAT。然而，这种情况通常不可行。
 
 “seccomp”系统为用户空间提供了一种可选功能，提供了一种减少可供
 运行中进程使用内核入口点数量的方法。这限制了可以访问内核代码
-- 
2.43.0

