Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C12288C30
	for <linux-doc@vger.kernel.org>; Sat,  4 Apr 2026 01:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775266886; cv=none; b=d201ZL1N9jkCYwxrMveHZkO2Yt+8Mymzs918KfHlDenjtiLJVYo8Keo+dE6/ipSRxjvI2ndEa1g6xIP4B5ndV4aroiboXPMCDaRKxIY+OA+AxA5fkAU44vAm7BWzBgJnW4NLhYlqvUxl88UTpK1cF8ke4iD1qei1Xs/6Y32XlPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775266886; c=relaxed/simple;
	bh=oalOf6m7JMtDy2yNWJiFY9lNhdyMecV2HOjYO9Uh1k0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eb9Iva/O6Yrh8znUVrMreSfiM7kzwdOEzwL6Mw6XdicWIL+l8UURbOEGNWh1i1ALXAKZb5fvDn9E84kf9kdKGUNszFI/5V8EuHgKqJ0GvNjaiCBHr4gSkqnh61SixKacM1WhtxBY9ZczkP1SHftsGVEbkEOs9tmCJhBRgpdhQss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1oK5PwR; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1oK5PwR"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82cd70febc7so1837821b3a.2
        for <linux-doc@vger.kernel.org>; Fri, 03 Apr 2026 18:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775266884; x=1775871684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MRkD5HsTDuX9PjT7ol/nE07Q6AgNl5nhM+2WKO7vrJM=;
        b=L1oK5PwRX2ckY7qdEbDushXIIg4cwKSMfcf0yR41tiOzI60MUl+TKgfWyyK4z9N0HS
         k+XQgieUuv/2Wha6XM1QBEyj0vdAPmeHEYGapKpMwnKryns8oD/OiuCPizF6idyyHKyq
         pKQKZEqdswjlpeS4IX2RaMZraUiUO220tQTUxmeiQfwD2CyNkcjxun9EJj6TUAcJDXmb
         yqf27erOLbA7TrF/PFcRWgc/PBIhcqvOcPWhLRnpexWee081xkMnobpcpJpv7XUiJdYa
         /6D/OfrOeNvOcscEmAtV/32PO6KbkezwtLzQLd+FZ4AErew/En6fA3do+G9tToJp4vza
         AXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775266884; x=1775871684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRkD5HsTDuX9PjT7ol/nE07Q6AgNl5nhM+2WKO7vrJM=;
        b=s5o6ORXwlgcTKGcWF4LJ5nRzueZ7lkX0p67ZoRe8UiTXhfZjza4I3gx8HRpioS7pyU
         yAB3m8Flu1CnINbN6H1bHbN9DLpf1Qd5A+7CFNtPEz76O3DIR4oQx3Q03RWSLEELKAsT
         OSLYwmUxHximAZMUCK7subMTuaB4wIdJLm3WV6w/Ymx1uWHMai2Y8tWgfb7AaAGAOlea
         NcL3glFRmyxsFT4wh/llceQ0VAgqPsSfvo5YVOkJ0BwhruczTXZqLkeyKQ0krJvTUDMy
         FqT0451SLl0v39VSB3UnaecUmN9TMIoDNdYaezMXzgKK11MJLhZfyZXJzJ72GYKecPaG
         s8HA==
X-Forwarded-Encrypted: i=1; AJvYcCViI2QqloP4R3OOlZMKQlEq6pyP5AQguLqwROnAErDzrq8oX9MlhewthBWHL+qqTnZ7rQm4Tty/xlQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfPeNOpdTik69Pa9EmLBwAfsFbH29t8erJWH5rlAI7SF5PEgXK
	kxjRdSeVbB0PiBq8nwCQ7v2ed2LcypRXvN1CFvkR1LDzR9yguO7U6X4o
X-Gm-Gg: AeBDiesBqvVK5nnDCPF7HD3sun8ggMzp3ymbk9ErlG6QiKfajYL9UGmlTGlmWyxEQmt
	F6gqxMBACtEhi7UvdJ0yRP81sFl4667PTV+Yk56rRkILFenVVSOQ5rVGkpkxXZWq8tl8MMuBW2W
	n9NPDHwm3vqaJ9CvSQWaxAJ1hZ4nJJDOKcb2pP3J2TmawgTsfB7YseqKSCX3BlN2o3TOMnRfCSY
	cVo+OPYgAbVW+Y8xcmWj1KJlo4etOnmjtFPx/fKUHZIWLcxlWX9aNb4dQ2+J8Cnf5d4oj2PJUyF
	wsT6H1SKt0Su6GTAyeAGeCBaOeFRnN0Tq5fmGVOY6818TsX+fnQVEkvl+C5uVjs2OG46dhzKjEU
	PR0ymcdD72u94Hn0MSFQcSkKAs4+uUoORn62WIttUMIxETpLJfKL9QQbIZZrueMcxlD5qayFSZw
	X/DDJYiP52yBem85bnYh/h/iJl6ehTrjLxTcgDXf6ldcaN5zYowwsrYGUbCEmErwqvYonnZSDYB
	7UynB8YuPLoUNf/fMmjaS8=
X-Received: by 2002:a05:6a00:4b56:b0:82c:9c90:54cf with SMTP id d2e1a72fcca58-82d0dba133dmr4891804b3a.43.1775266883642;
        Fri, 03 Apr 2026 18:41:23 -0700 (PDT)
Received: from adeel-linux.ad.umanitoba.ca (nat-243-cc-130-179-243-228.umanitoba.ca. [130.179.243.228])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c6fdd7sm7025639b3a.48.2026.04.03.18.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 18:41:23 -0700 (PDT)
From: Adeel Zahid <adeel.m.zahid@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adeel Zahid <adeel.m.zahid@gmail.com>
Subject: [PATCH] docs: usb: document USBDEVFS_BULK return value
Date: Fri,  3 Apr 2026 20:41:18 -0500
Message-ID: <20260404014118.15678-1-adeel.m.zahid@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the FIXME in the usbfs bulk I/O documentation with the
current behavior.

Document that USBDEVFS_BULK returns the completed URB actual_length
on success, which may be smaller than the requested len. Also clarify
that for IN endpoints only the returned number of bytes is copied into
the userspace buffer, so a smaller return value indicates a short
read.

Signed-off-by: Adeel Zahid <adeel.m.zahid@gmail.com>
---
 Documentation/driver-api/usb/usb.rst | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/Documentation/driver-api/usb/usb.rst b/Documentation/driver-api/usb/usb.rst
index 7f2f41e80c1c..6b6a759c1f62 100644
--- a/Documentation/driver-api/usb/usb.rst
+++ b/Documentation/driver-api/usb/usb.rst
@@ -535,9 +535,19 @@ USBDEVFS_BULK
     The ``ep`` value identifies a bulk endpoint number (1 to 15, as
     identified in an endpoint descriptor), masked with USB_DIR_IN when
     referring to an endpoint which sends data to the host from the
-    device. The length of the data buffer is identified by ``len``; Recent
-    kernels support requests up to about 128KBytes. *FIXME say how read
-    length is returned, and how short reads are handled.*.
+    device. The length of the data buffer is identified by ``len``. Recent
+    kernels support requests up to about 128 KBytes.
+
+    On success, the ioctl returns the completed URB's ``actual_length``
+    value, that is, the number of bytes actually transferred for the
+    request. This may be less than the value requested in ``len``.
+
+    For an IN endpoint, the return value tells userspace how many bytes were
+    read and copied into ``data``. If the return value is smaller than
+    ``len``, the read completed as a short read, and only the returned
+    number of bytes is valid in the buffer.
+
+    Failures return a negative errno value.
 
 USBDEVFS_CLEAR_HALT
     Clears endpoint halt (stall) and resets the endpoint toggle. This is
-- 
2.43.0

