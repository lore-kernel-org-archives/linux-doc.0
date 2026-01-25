Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967B918E025
	for <linux-doc@vger.kernel.org>; Sun, 25 Jan 2026 16:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769358109; cv=none; b=C635WcWzegX4hR2IJjk5ms/CF/pL3WIGJM+d8qDlCZ+9wuu4RO/CW0fsMdIOoLUz7xjNcfj62lvtPXKSHZxo98Od3iY+OV6G3cOpXmkyK+xzcbRu8v2aLLM4c7XR/yf48JxGQeWmbGvzp4UHq2CJHAkOfXO5ItsiiXLOo+1iEfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769358109; c=relaxed/simple;
	bh=obQvDZorVnhQdKEsyrJSMxSCH0o4Jy+gXZBmk8QLb30=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=WPu2fzKsR4tpBYIe69rZ9acYqzRv2DjznEocVgKGH13w3/KkpBcnK01m4pZZM8vDuUGHF3tspB98fmFjOX2K+JSA7Va2F0Ex1n9SHumrciNFjNXTgBnCL6dhAM88FDNHKXKRZ6lSTTVKcSb4OhFrkReSB5DBYumy603U030+wms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G4q8C4H1; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G4q8C4H1"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-81e8a9d521dso2183191b3a.2
        for <linux-doc@vger.kernel.org>; Sun, 25 Jan 2026 08:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769358108; x=1769962908; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=svQOTrlqjRD0OScRO/xUlvVvTCvnFrzLdgIETK8TZSk=;
        b=G4q8C4H1webzeSgIWeG6KN762QR6h2a156ZUIWti+5HpqgG0iOWblr2ltgwJL7ASQZ
         vU93Mp54wM1msQ7o0hXq0/NbppYrXuHpZjpHfiGf25N4RnjY8ww8TGtMK+xZDCea4T+q
         35DWK19/o6JIzVgJi92aYylfK4wv+ElyD4uvlAoYXgx8ecdebqaELJm4H/7iCc2CgUiD
         HZv/lSuj/ex0D0CY19jzPNiGzAfFB9w5nbKI+vG6i35VtK6wy066Rtal03YUga4XRIzO
         w8ZCHMS5pgnHhJAAN6fMI9GbxJ8bHZfyxsfTckht02q5dHvaWLgWAiGpSxyYl6LunM9O
         uUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769358108; x=1769962908;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=svQOTrlqjRD0OScRO/xUlvVvTCvnFrzLdgIETK8TZSk=;
        b=wKVQAf0Ilq8yIUxt7Cu1VBwcCEnf75HE1vkfSPIEGEnXiXW44W3KCOWj06D/CgYtyc
         n3bZ+Puul6PU2PiVQlUex92qXldupTCVl/RcnWXouEQERof3uKsT6e10/cCTrKP0UTnd
         OIWlpujj5hAnWelQtd2JWeRtbpugqpMBwp03HiOQaAUR47RUBtPPdZQzOG9q+nT7R2RE
         zN6uVQgvLUSWuU4kA1iilKfEfie+1rGffyr3nqj+VhTy64bW6DRHo3Pez2/E/e97fVlp
         65cY0Jq4eMwaUWXoDzX3Ukh9nxyb5UJf+T5PWLk0VEMiRPfzfApk82iuQtUzWgAmep/Y
         qrhg==
X-Forwarded-Encrypted: i=1; AJvYcCWIc3+MZ/uObFSbnE3BkD+2Cwdj5u+ZXnuI7U0ob9xnBf18BK7wXsvqDeJN1Kw7I8LV9Vpuv5U5O9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvJ5ALWw+in672mOKVtQGLAsevCchu938odeCqL/X4lHFelwSx
	XYmZgEjgbTM0yAIU3Lbtv7n4Iq09Swdcr34/oFd5ejYWN3FAoHseXWOS
X-Gm-Gg: AZuq6aKj+SkLCd1b2OdhhF6pbiBVcPuhInkaEKTriioLsDLnHORkAhS5C09WnZTggAy
	64jRxzrGt9dFQZivdC+toTSlXHbzePb2X6BVZk+FHbk8/Ehs60NnD7sQIhPiDdayp7uucSAKbYI
	Wqzy5BzRGIKoDImB/LQQPlpOFvbUfPUYEJR1/MVo96slM8ZWWHvao6m23x8pFvE8xIRlvPCx1u7
	kU+Z7Fij7lytQiwKtKAGYJ6xvm6ICVrT8g91GO1PVJJ7sxGNDPiKQLwv/RKrPqMQ0MYf6ok3iLm
	2c6IDHn6rGrGzRfvZ3v9jfrgd+gpVcXiz4AEZDk+riIr9+x8fU3Iw7tbJOoKxjAn0cgMo+AY1vL
	k/S2vUyJmxqsFQrYLCQCVJ6xOKsh5qw5346+pgM9BMzrLv/hHFQZfTT/Dw3jixbyEOvlIonH4rM
	oeBcaO3VBMfw6DH+PxOuy8PpOIfE9l0QjmU5bNJCFRgwj6FGuzK8XxwtsvVCrU1uRY3s8jVp2tY
	xOZtKBNel8BNyw+lbPuTw==
X-Received: by 2002:a05:6a21:a345:b0:38e:87b7:5f88 with SMTP id adf61e73a8af0-38e9f1458dfmr1479709637.27.1769358107744;
        Sun, 25 Jan 2026 08:21:47 -0800 (PST)
Received: from ?IPV6:2405:201:c005:c1:348e:c3fc:376b:7a6a? ([2405:201:c005:c1:348e:c3fc:376b:7a6a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a43f11csm6520227a12.35.2026.01.25.08.21.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jan 2026 08:21:47 -0800 (PST)
Message-ID: <0bb5ad12-dd5a-4280-bf6e-7d1ddb59dd9e@gmail.com>
Date: Sun, 25 Jan 2026 21:51:43 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: workflows@vger.kernel.org
Cc: gregkh@linuxfoundation.org, corbet@lwn.net, linux-doc@vger.kernel.org
From: John Ashrith <johnashrith6@gmail.com>
Subject: [PATCH v4] docs: clarify CC list guidance wording
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Changes since v3:
- Add proper changelog text
- Move version notes below the --- line
- Send as plain text to avoid mail client mangling

 From 1de01779d580e104bea0148409c3c8c76d204c41 Mon Sep 17 00:00:00 2001
From: John Ashrith <johnashrith6@gmail.com>
Date: Sun, 25 Jan 2026 14:48:28 +0000
Subject: [PATCH] docs: clarify CC list guidance wording

Clarify that recipients should not be removed from the CC list without a
good reason, and that replies should not be sent only to the list address.
This avoids ambiguity in the guidance.

Signed-off-by: John Ashrith <johnashrith6@gmail.com>
---
v4:
- Add changelog text to the commit message
- Ensure patch is sent as text/plain without mail client mangling
- Place version notes below the --- line

  Documentation/process/howto.rst | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/howto.rst 
b/Documentation/process/howto.rst
index 9438e03d6..5a29111d6 100644
--- a/Documentation/process/howto.rst
+++ b/Documentation/process/howto.rst
@@ -403,7 +403,7 @@ interacting with the list (or any list):

  If multiple people respond to your mail, the CC: list of recipients may
  get pretty large. Don't remove anybody from the CC: list without a good
-reason, or don't reply only to the list address. Get used to receiving the
+reason, and don't reply only to the list address. Get used to receiving the
  mail twice, one from the sender and the one from the list, and don't try
  to tune that by adding fancy mail-headers, people will not like it.

--
2.43.0

