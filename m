Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B1E21B918
	for <linux-doc@vger.kernel.org>; Fri, 23 May 2025 03:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747969517; cv=none; b=HwVrGwcLMyoz3KJsi18SLAqFh1/VebzVlAkZQmFjJq01bfeafLwgak2MHUSfLkV+6Pora4Oc3Te6WNhc3JTTQ/wN4q/rK9JwpBkUhsMxYKUPdQNmeASfQqDV7o50p3Xs4E3IsYoxLkZWUbC4+1QkEZ9AyRvl10ULLR/4UOHFuYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747969517; c=relaxed/simple;
	bh=F7Uq3seryCbc5Lw57u/UXLiRcKFRSbbnVpWbymcEhrg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dv+t9uaVn/efQkQvT+srXuMgDpyN6/3VLPVVYsSk+9VRb0HcHqtS5JQy76LXi7X84ycNHi8wSbBZ2qyW6eOHyKC3UEOtsi8AtYZzpJXW4P0jrfK6oa8Oc3UXj/yFy+riUJpGZpZW4DyC80oBNdqbfphHASg8pMaG1iN5NZQLVM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WF0pHRdy; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WF0pHRdy"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-742c9563fd9so4805948b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 22 May 2025 20:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747969514; x=1748574314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uelfRSsFq+tqMiLAZTwf2OAtk8loxGT4GgltGKUOwEc=;
        b=WF0pHRdyixN3F+HFYUh16Tf3VGC3+a2m/28N2uPuJg0FF8sG3Dw1g8wz6WVJfh8jyv
         u5e1l0/R5s6B0KYT8n6HdRyzhqLvUKNBG7a8BNyyMxc9fZalZ/QkhPq/+j3OZbj5184+
         kCLdNJ8ACX55PPG27SlGj/rHr/DyUB8PlR+1XkGC2v771kfIJls9m/AvFiLT8Pn7mI59
         byyM77qvy3t9py8mrtUDHZoVhrx1cxQtP4+c2Og/tEx2806O2ZpXJ8RLN16WILFQVZKq
         wbYVrKgEiCCX5Mnqj/eGhI1iBe+q1VINBQWO0xfN4Jxiknspcdc78DIfhyXd8pxdeqZP
         yOsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747969514; x=1748574314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uelfRSsFq+tqMiLAZTwf2OAtk8loxGT4GgltGKUOwEc=;
        b=TRd5a0D9wvXuML/fZqF1Zld9tVp4KTEoCvJumFlhqDndGNXdfOomRCa1jH5wmTj2oY
         P7IHMt0XvEUdbaHqj9i5quD/6L7vrWI1twzLmeWiS0qiy0m5CqdOqe8R1NCYazxvDQTT
         g82FgvZ7wM9f6AVBjIzOcayd2QCbf1M9rcSFw76rddQ4kI9K1i7L9iPnI2i/kNwdGsuA
         JEXau6fZjymA2jVxFIoXvdQ/KzYmNlKt86diWDGOuGSQRV7wsT3Ed0CMkB80jO0YbU+w
         qqcSnvfDPkt+fM7WZcMId20A6ologkCvpzwc0uJ45QdzrS0QeZAR+6vfqyfsR5pFYd+X
         1NSA==
X-Gm-Message-State: AOJu0YwLM/xRk4/KYiVxtb7BtV6Ck16jTnbRbYSpe2PyoOE7PtfdVIc6
	oES6673k3Sz+yqVrfxXeKEWKbkhW2Zh22gDoCTGqz1IIDMtp6yocrH0kr50l7w==
X-Gm-Gg: ASbGncveNj4C8rM5Fp2UTK9F3fguzZh94xIOPumo8MZUbLAGor1xkqBuBaXrlTzpxNa
	peo2aCvqEpmu+b+Q9cu/y/K1k82HgDLnDNsATmY3mR1lu+Tpgdi4nC1/zb11aLpy6QU+Lq32BRY
	7BBGv6zKoxjTreJcJx0XCi0uGuvWNTlD0I0xsEq3dDWhQpy/piWnf+4+NGrougsQPlke7lwf91O
	F5IE81rvwrYg+YoR0HwQYG//3CdoVnMNUE8SSyY9xsObWtcw+Um83+3j/khx0/KugGIDM1NLhXX
	6uRzPO3N1lqOAXkfS0/owKjZDmLNCdfJ/9vqBKNjm8TOZG0KCXqXeOC7YJ5xJKjtwUGmTMq2+Ua
	+WE9z9ruJtcarMTG18zrUrXRsCygAwz93oEGXzBah5nuACsxkqA==
X-Google-Smtp-Source: AGHT+IHGuHa4KCHQjk+bT+4PstxRviSws/R3+5P7ciPeZYbDfRovrYbNVxVGEAzUWe7VP0zSGux8IQ==
X-Received: by 2002:a05:6a00:3492:b0:736:34a2:8a20 with SMTP id d2e1a72fcca58-742acd72500mr38561552b3a.21.1747969514529;
        Thu, 22 May 2025 20:05:14 -0700 (PDT)
Received: from ipravd-Nitro-AN515-55.hsd1.ca.comcast.net ([2601:646:a000:5fc0:75e5:bdae:8966:66b6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96defa1sm12285919b3a.12.2025.05.22.20.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 20:05:14 -0700 (PDT)
From: Ivan Pravdin <ipravdin.official@gmail.com>
To: skhan@linuxfoundation.org
Cc: linux-doc@vger.kernel.org,
	Ivan Pravdin <ipravdin.official@gmail.com>
Subject: [PATCH] Documentation: netlink - Fix documentation typo
Date: Thu, 22 May 2025 23:05:07 -0400
Message-ID: <20250523030507.128241-1-ipravdin.official@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typo handul -> handful

Signed-off-by: Ivan Pravdin <ipravdin.official@gmail.com>
---
 Documentation/userspace-api/netlink/intro-specs.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/netlink/intro-specs.rst b/Documentation/userspace-api/netlink/intro-specs.rst
index a4435ae4628d..5cff2641295c 100644
--- a/Documentation/userspace-api/netlink/intro-specs.rst
+++ b/Documentation/userspace-api/netlink/intro-specs.rst
@@ -16,7 +16,7 @@ and can use a YAML specification to issue Netlink requests
 to the kernel. Only Generic Netlink is supported.
 
 The tool is located at ``tools/net/ynl/pyynl/cli.py``. It accepts
-a handul of arguments, the most important ones are:
+a handful of arguments, the most important ones are:
 
  - ``--spec`` - point to the spec file
  - ``--do $name`` / ``--dump $name`` - issue request ``$name``
-- 
2.45.2

