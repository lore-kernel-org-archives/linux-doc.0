Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48BA370D5E
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 10:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788604081; cv=none; b=szxnv0dJ+MucXJ9ymps9phQqHa+e0Xehm2U0tj4HRv7Ex6/hq1pF29vxWOL/Pyn6gqbGrtpvfg9P2M2wpH5pxZ6g+RKTYltXqGB6orkh321CSJ/41Y18ujLFPG9NKzw+H1JpE72RfHhQXtBSfhazG2mmXeoRqdLpmGAaZvyK0Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788604081; c=relaxed/simple;
	bh=dlbNoACdY1hY0MUhs23rCfrulJIHZ8hgPRq2IfWUGvk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TtuOt9lnFAjxFkY/QSM5ATWSbo/ssN6NZxyJOs5HfElZ1u3EHC5spUBP3ePest92b6nCRJ5BZMMbtvz4ZoJXeVV1/1iXdDXQvo7YuEFRCw3jPAT7dLDL7w430OsOP1drX8ZjfoeqPw6ORwoQ1MEEvzPBDLbXQbfRRlK3UWPHyYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bn1leBqe; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bn1leBqe"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso19332245e9.3
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 03:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788604078; x=1789208878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CyTY0nwwZzUa7fZ3gDJHMuw/Fs6srMMbATIv6rdlJDc=;
        b=Bn1leBqeXohvCpgU4ur7ffOr0QSNdhiNDQhgGFzSK1HqZ+3Zi9cqSeFwlI2lVQfUu5
         2rthddyAZmkmXvtATc2cW8WMg4MMXhrTj2oCcspgYQzuAChCGuXbMj6OKuRLZpdcyZZg
         ThrG9RXB3PvLaRYaGcgYC1hRW+eJd2lWjjUlWBsAiTJvizwA9FAA0BZH8QUIYSolIuXs
         +c6gmG2mEQtED1q11I5K70Wdp3wgl06PiNNVpcRL50UvD4c1DgXlVnbQLowud48mVRkG
         Tto7ZoMqf4JVQOhGGwwtcPnfysrW5MiBd9An2lowmIKuM7x6QYzuPqKJpOfopw1TGETn
         Tq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788604078; x=1789208878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CyTY0nwwZzUa7fZ3gDJHMuw/Fs6srMMbATIv6rdlJDc=;
        b=MLh6RIYA3rdj6Mn1yPyHCtj8wG55hEasoYEqir3TNH1yrvexPraSW+7eiih+mHzejH
         v5TrrBXenxHdyfh9o0+7Cz3kMJrCNanCjnuuRntf3oKNBbAnvdtQtiecAv8vXJHkhVoL
         irivxwyYHeim2zrKD9NpwpbzVgBJ+3pjc6jZKwcUR7nhiS4qdUdANk7Wul77yvyT5ysB
         mTUnxeL+mgxe3XOWDi7GqgBR+baIY2RBn7fNX2E+dzEFfXgTqXrLHwPFgktJ95LYifrp
         ee1NVlRbUd8vYRr3SStNveobuUhjhqv9INgK6AYY4Fi0A60IL2VAYMnbg1qhe4PGSr4k
         9deA==
X-Forwarded-Encrypted: i=1; AKwUvBwKXNan9l6kuVSaHJ9S8liQZM6kzRDp24bWoNdyEJWa+aGuvqhGdh/SFEQTKrYZlKUco6J5jUD2wYM=@vger.kernel.org
X-Gm-Message-State: AFuF++kOQILPBYkjbQoXUHV8H3t66np6U/m3yNFAPj+EuS0mq4WbvxSC
	aUWFqGn/ABXIcsrIpJFzzOne/ivobR6w03URIkEGkMa8lHOV7pOECSZl
X-Gm-Gg: AYBFou0W09QM87d/gdVYOLbZld49lFIAVRIdjvOamN8KvvT4dZxARe4hRxR7fdeP4Zq
	2UOpYbGczm73Xe4cYGcWlRVAqGRFWsc9g0LzxqdeifGWAmesia6DO0ChXKzSCHc4T/IxoSvFzD6
	T7ZXdiXCkYXmScGSNQUNsfTbrU4zsruh6zDOYcIrh2qlDoQfla4EEnT93Xs6s8OXx6Oe9TNNTTI
	Jm875Oi86Nj5SaE8oqqHpUwrJy69fT7Yw28EnmtyFPU8vz2dtKZFGsyqxLXBF3QwMRhuVPDEDdA
	5Z9zRv6jM0SABDvlZqE0kigfqWvZ2jO+LQXmBvtXx2moHNO3Zq5Np24VByvsgnWSlZWvePz8TZI
	DyPn4io75Z5lyKTJmwHoAb9namZ68/t/5uxjofQOs75Fd6A78jp5d+hZyTHGLHMwUnLGIPg5Pic
	plmIM+TNOQ//7aIQafYdlnf7sURLCyHQudwFxP3lluJaHrhrMUbhcyPrX4LgMqYGKL7KRamrNjX
	fthMG2wvA3J9F2nCos3fv5AysWYvCh6RSWnzHoCw6fHe+H8+XB+ek12jseGta4Krb2bo/tAEqYO
	qDr3kLtcDnQkfskZ3quZx8sTYK2gPzjWRX9DfZnb1RLZK0/XXEqluikqlSogllDI3bE=
X-Received: by 2002:a05:600c:4712:b0:499:7a15:fcec with SMTP id 5b1f17b1804b1-49cf8248cd3mr179495365e9.13.1788604077721;
        Sat, 05 Sep 2026 03:27:57 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d00a5b19dsm57698195e9.2.2026.09.05.03.27.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 03:27:57 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH] docs: ioctl-number: Point the 0xEC row at cros_ec_chardev.h
Date: Sat,  5 Sep 2026 12:27:54 +0200
Message-Id: <20260905102754.43160-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 0xEC entry points at drivers/platform/chrome/cros_ec_dev.h, which
commit 5e0115581bbc ("cros_ec: Move cros_ec_dev module to drivers/mfd")
moved; the ioctl numbers now live in
include/linux/platform_data/cros_ec_chardev.h.

Point the row at that file.

Fixes: eda2e30c6684 ("mfd / platform: cros_ec: Miscellaneous character device to talk with the EC")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/userspace-api/ioctl/ioctl-number.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 2fc53093752d..32c0d08e92e4 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -399,7 +399,7 @@ Code  Seq#    Include File                                             Comments
 0xDD  00-3F                                                            ZFCP device driver see drivers/s390/scsi/
                                                                        <mailto:aherrman@de.ibm.com>
 0xE5  00-3F  linux/fuse.h
-0xEC  00-01  drivers/platform/chrome/cros_ec_dev.h                     ChromeOS EC driver
+0xEC  00-01  linux/platform_data/cros_ec_chardev.h                     ChromeOS EC driver
 0xEE  00-09  uapi/linux/pfrut.h                                        Platform Firmware Runtime Update and Telemetry
 0xF3  00-3F  drivers/usb/misc/sisusbvga/sisusb.h                       sisfb (in development)
                                                                        <mailto:thomas@winischhofer.net>
-- 
2.53.0

