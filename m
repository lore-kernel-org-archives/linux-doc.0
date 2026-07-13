Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B88230FC03
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 15:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955203; cv=none; b=tYjspPsceOiPA/3i/4P0GTZ2lhhZgTlz7Qv8vs7GSA9JR+z++oDdeASpaIw64NDqKvc5eesJrWpZPCF9pjMUQVsXGA2GHQIWaeVGVNyglacy9/6PpltO3os2RXNrm/OQ7ecRjO9flDMJ8Ce9wkgcXXzPk0/AjwLbC3LzLusEujM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955203; c=relaxed/simple;
	bh=fKdRgGaEQ1DKjn+OgbOLKOAaVAQH9jINRbPsH9LIGzM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J6tS5BINdqbaTcEc+yee0OoVEtw2EDuNYDXMWzspFz7JW4FqNcKmWdmprj4Ou+TV3I+A3vnXtJrDmZ45hl+F6KKp9oDHpYBfql0EcJH/8lLI47+cb3DRHkLT6ao/q/780V+blm0kexwjjHfzT97JMc+OMG22ebhNl5I/4WNKMxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQSprUib; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQSprUib"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84874b52eabso4318489b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 08:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783955202; x=1784560002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U5TcpUNZnrt4SbuBdue6MfVxkNhuI2q7ex84bolmGuw=;
        b=LQSprUibVAVKDSBwNSDzAxrAQfuDf9eVimsIL7sKxt/Ao4wxqf4OrchUxpln7BGodb
         NpGMbVRFzqBjlpjPuOupoCuKNucqetba6JJG42B5uisVQjxxp5e1HPNtoQoviwrfH2wM
         QaMyydIJZ07rz4kWhdoSoJYTm58WeFt0BtXRS/qudgm/vEEq/DJO0QX0M5HSuVXeGnbY
         7MvXroyAi7XeJmk/Maey6qH4dwFjUrvWha1MxfCTwdybAhUMlnYgVkhC556fiaT9Lq1b
         HRlPkAt/V6r7D8UdDRL5MryZPMNjyC9hR9ka8t/gm6DZJOWs5+jvSPxp6sIxe2hKMKth
         W/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783955202; x=1784560002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U5TcpUNZnrt4SbuBdue6MfVxkNhuI2q7ex84bolmGuw=;
        b=cM9dJk8AKMB85v04uROSAPz8KGXzgo4H5FdDpm72qHKmegwWU/31mv77fQI8UfSlsl
         gXUiPkPlXeMk+O9mwKtW5frh3wX7gCvN2+AidGjmCr7j6b5Prfla0ZuDQKNBYQLCghtn
         4DxLBiTLgQNOcZZhev1J2B7qBFpNEF93NkA4gaJz05QXwCgI6ceEqifuUVbSsOaD1jxC
         NJwMWee/ZUkiPkjVCcQWBTdH3QJNeY/TOlkBcU31aJnhi7rExSm0f5NSPTs4uG6d2moT
         eVqcE6ysIo869eeFZu5DWw6Aqj59Dwji94EPP/FFZvv32ki6cPWOGtqnlR+BHlpVGE9i
         66Ig==
X-Forwarded-Encrypted: i=1; AHgh+RqWw1TPqW8hEnUlu8Q97rg1YNzUg9GoDw0wzif4hhdjlxEk/CwCt8zrkF8vBC8JND5H4O9In7HSfbU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe9ORWF0L/Ac67wtEYCvPTLqlMq7JvaREhWIoUaa239/r5i4UK
	yVcycFbJqhDQ8zqh8Vq35oe/XiyLDhD93Dhddeb4kto48xjkqZhxvbOX
X-Gm-Gg: AfdE7clG1Jud88EQjNz6m9aoOx4NXq9n3y3sUcDBrFH1k8vbPjdUAXVLyorh6x1q04z
	CSKT/EzRUU3yByeTVAAiJTgX7B38FUsTo8RX/xAC4z6/5/+Ai+G0wK9L7Lu1fJHOgaAsV5/G0sS
	vgkDPVxJUQAZ3OTZwWaps5q49wXt50/YY68KUDle8b1ytK8/Zc2MYKIq8B5W86xrPe7krFSyZ7X
	5QEBg5i2wXxCgtdYr33kxtwPmI2B4DkTRbmUwE00/fJWHKqRtmmBjCd4oPc2DwqPbwYrgUW9tvT
	w51pH4t2/Ll8rWllQ/yY4ZDy+dGuSWhd0uWCFZy53TCHWPsVI/5mFYzOgStgiWpsDey6UjBbj9k
	GhpVtduZN7fC5B9bQROOryP9Fc+PR/IUJNYIlJMKsO/Mv5lN5AlGZ8E5Eek1Xyw+w7sWYIprsAT
	rxPX29nCcHXNNkC1eASX6aQMb6f/j4sD9TqYWVY9MWWRSdtO3qd3JiAKYfhGgUj+w=
X-Received: by 2002:a05:6300:48:b0:3b4:7e2d:a3bc with SMTP id adf61e73a8af0-3c10fb5ffb2mr10496496637.0.1783955201727;
        Mon, 13 Jul 2026 08:06:41 -0700 (PDT)
Received: from utsav-Legion-5-Pro-16IAH7H.comp.nus.edu.sg ([2401:4900:8821:fbe9:7119:6066:921e:7077])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b9a67c217sm13578502c88.8.2026.07.13.08.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:06:41 -0700 (PDT)
From: Utsav Shankar <utsaveshan0206@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Utsav Shankar <utsaveshan0206@gmail.com>
Subject: [PATCH] Documentation: usb: remove dead link to external USB programming guide
Date: Mon, 13 Jul 2026 23:05:44 +0800
Message-ID: <20260713150544.20962-1-utsaveshan0206@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "Programming Guide for Linux USB Device Drivers" was last hosted
at lmu.web.psi.ch and is no longer reachable. The original source
(TUM, cs.tum.edu) is also defunct. Remove the dead reference rather
than link to a third-party archive of a 20+ year old, outdated guide.

Signed-off-by: Utsav Shankar <utsaveshan0206@gmail.com>
---
 Documentation/driver-api/usb/writing_usb_driver.rst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/driver-api/usb/writing_usb_driver.rst b/Documentation/driver-api/usb/writing_usb_driver.rst
index 95c4f5d14..6f024e164 100644
--- a/Documentation/driver-api/usb/writing_usb_driver.rst
+++ b/Documentation/driver-api/usb/writing_usb_driver.rst
@@ -322,7 +322,4 @@ http://linux-hotplug.sourceforge.net/
 linux-usb Mailing List Archives:
 https://lore.kernel.org/linux-usb/
 
-Programming Guide for Linux USB Device Drivers:
-https://lmu.web.psi.ch/docu/manuals/software_manuals/linux_sl/usb_linux_programming_guide.pdf
-
 USB Home Page: https://www.usb.org
-- 
2.54.0

