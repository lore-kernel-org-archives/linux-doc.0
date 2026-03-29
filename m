Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0D73803E2
	for <linux-doc@vger.kernel.org>; Sun, 29 Mar 2026 16:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774800644; cv=none; b=Sfv6WVRtjjNyt+tSRAAW/QoLKCsPxCsnMggdAd/J+NKZ4GsgtwLFmcMi0LHiEb9UX6VxjSMn8ty7UhdqXhxiIHRobWwPFhl5DKk5xgJRZBWBegVNLQrMglJ+GHCvSo+EYn5QL3cGOWN8MWmY5hwbbz2b+60NQo4mrEtzAmzz+C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774800644; c=relaxed/simple;
	bh=tLbYrAYU48JKNqnDBs+QZA4JgP4x2BYSR5fHXk3Tglc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CWTOMGfllvdNBJotcQkyYYjavP17Rq6+Wry+ZB6z0+P7ngqWT1PdcekDWLdmQnAY/4z2EHMco6iJqQOYd3C9OGV33thbtXfRISDJdXdvOs4NGEke0s+mbng4tebKm86rB3eNRmLRkrkWiJVjeNytPkZtEtZLmBT65O9O/GfJbtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i4hnbHvG; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i4hnbHvG"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48702d51cd0so43584185e9.2
        for <linux-doc@vger.kernel.org>; Sun, 29 Mar 2026 09:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774800641; x=1775405441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VflfZdxciTOg4YKIWLyjZt5vcJCG67ZijmEFDKFCFrw=;
        b=i4hnbHvG5aJ+M+7b1B5zAbRCOEr3zNkjLjZ+AL8Ot8WFrEnSu1LIijj0yA/va9C+Pq
         Vv8BOZ+G1uDP17qJc6FsXt4AjwnEfwFGQjLKf/XjNfqBAPQAea5tkrhWBpvc36d4fpDw
         2mEVSvoJguLyjCSgicHm0GvALAgt/+BI+54ViZrhdaEzfJsjBSabK35iB0xc/mcf4+It
         tttGpSQjHngbGDuR9Sgag2MKtxzdux3MFThBkx2MlvBhQqZYvpAAWfglbdsfTeS8P7P8
         oeTe/EcgFIKRgP5eP7RAbV1KIGN5mmYE2MAX+6DWdmfYd2EgeUBTTVFq+62GEau5tECg
         Xzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774800641; x=1775405441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VflfZdxciTOg4YKIWLyjZt5vcJCG67ZijmEFDKFCFrw=;
        b=el6sRa16aDG/sX6HQNcv3HzMFYOZryTgjPjF76IFbS++2gkNTckJVf+Pz3/K0ix7it
         B2VI5mcaC2AzEVHpx/7nOp7z3T+D2ZtOlJs7GIm+oOsBCCO5sH8OJyRxtetWAKagyXo8
         pp0ePBxfIoS95X2nMEzFBEjOqqgIrD84HVk2WniLSBCgCp24zy6ji4L/LKrKInkzaFlZ
         LNbafreinpEJJVy5PRRtsXfCxndzlyhLlsWxdoiaDg9sm+++u9EgmjOdsYq+U+TKWXrF
         NxpXIOdxeVfnjbvx210+p/YJtyHSrrvr/2Z/sPOksxkcpFUxyR4UGHt2XXcF99Zj4DAO
         HeMA==
X-Forwarded-Encrypted: i=1; AJvYcCVCTpBDZDdoNdCRsnY3R66TyHz0B5ehJEbQOroD7I6CjBluTwxk6l3MLs+erdbVzujyTUVXL89wvmE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFM/3GCXMhOqPZg2cfHXJO8NG+beZWrV5EgKecW0rsIK57RnWe
	g3XnEQP9BcNvFOw+C+D2VFYvflyY5xchEPva0m9yGMlCU9iY6yfvbFeO
X-Gm-Gg: ATEYQzw/Jk6Yt7knIOFlL/9Au8vKKuAz/L93VeIkdI2at4extjjfKq6w5OiZpHrM2C3
	qK0ajm6v61rfwoU5Hi7oqAuq6hWxnDbu8pjurZCk+BFNQkpN1Lf3NLXsjG2wzjrKFUdSPmOymvl
	oQY4fAhKwF4MSo5JjQUFY3q3mdk8ulMgXaWfDQrdXGsMulPHq2Qt7Jo9ohxTv9FxJq91FOE4/II
	VqmYHHDsEPocXlyaGmqrvjKGKp/M3UWOWH0WNxqUmXteW0cCErxsZ0uZ8xft4tLr53iKJW07bx7
	SS9k83K/bi/2Yu/OdsLwU65L99sczNvL3dQ6aN6LFQ8VAtL8J9WbMnL4aqcUtAuBSSIWqew/mns
	Hj2z9Q03anHCCgaABf0gkgJ1mOinrKKqJwyQr+Oang6yy3nUxoElxQtc8CDiS/kZxrhE13P3Mvo
	9jNtt9tvL2DEosyR55O6/sLhvWcXDLi27tzqnuFnOwFKl9SBCkYpqnQXx0bn5QrlUE3kkkwFerU
	UK4XfnrOpo=
X-Received: by 2002:a05:600c:a44:b0:487:59c:2bad with SMTP id 5b1f17b1804b1-48727efcbffmr149121765e9.24.1774800641218;
        Sun, 29 Mar 2026 09:10:41 -0700 (PDT)
Received: from corblimey.Home ([2a02:c7c:37d6:c100:b925:e5a5:df37:b353])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48725eca5f1sm59902635e9.10.2026.03.29.09.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 09:10:40 -0700 (PDT)
From: Adrian McMenamin <adrianmcmenamin@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Adrian McMenamin <adrianmcmenamin@gmail.com>
Subject: [PATCH] update email address and firmware url for Dreamcast
Date: Sun, 29 Mar 2026 17:04:24 +0100
Message-ID: <20260329160423.200574-2-adrianmcmenamin@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


These patches replace my old email address with my current email
address, should anyone wish to contact me about these devices.
Additionally they update information about where to get the firware for
the Dreamcast sound driver.
Beyond embedding a different string for my email address they don't
change any build outcome and are a low priority for a change: but it
would be helpful to the small, but still active, Dreamcast community to
update this.

Adrian McMenamin

---
 Documentation/fb/pvr2fb.rst           | 2 +-
 drivers/cdrom/gdrom.c                 | 2 +-
 drivers/input/joystick/maplecontrol.c | 2 +-
 drivers/input/keyboard/maple_keyb.c   | 2 +-
 drivers/input/mouse/maplemouse.c      | 2 +-
 sound/sh/aica.c                       | 8 ++++----
 sound/sh/aica.h                       | 2 +-
 7 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/fb/pvr2fb.rst b/Documentation/fb/pvr2fb.rst
index 315ce085a585..6887044044d1 100644
--- a/Documentation/fb/pvr2fb.rst
+++ b/Documentation/fb/pvr2fb.rst
@@ -63,4 +63,4 @@ on any 2.6 series kernel.
 
 Paul Mundt <lethal@linuxdc.org>
 
-Updated by Adrian McMenamin <adrian@mcmen.demon.co.uk>
+Updated by Adrian McMenamin <adrianmcmenamin@gmail.com>
diff --git a/drivers/cdrom/gdrom.c b/drivers/cdrom/gdrom.c
index 4ba4dd06cbf4..cab4c7af2bbd 100644
--- a/drivers/cdrom/gdrom.c
+++ b/drivers/cdrom/gdrom.c
@@ -876,6 +876,6 @@ static void __exit exit_gdrom(void)
 
 module_init(init_gdrom);
 module_exit(exit_gdrom);
-MODULE_AUTHOR("Adrian McMenamin <adrian@mcmen.demon.co.uk>");
+MODULE_AUTHOR("Adrian McMenamin <adrianmcmenamin@gmail.com>");
 MODULE_DESCRIPTION("SEGA Dreamcast GD-ROM Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/input/joystick/maplecontrol.c b/drivers/input/joystick/maplecontrol.c
index 7f36f73844a9..c393aecccbf4 100644
--- a/drivers/input/joystick/maplecontrol.c
+++ b/drivers/input/joystick/maplecontrol.c
@@ -15,7 +15,7 @@
 #include <linux/timer.h>
 #include <linux/maple.h>
 
-MODULE_AUTHOR("Adrian McMenamin <adrian@mcmen.demon.co.uk>");
+MODULE_AUTHOR("Adrian McMenamin <adrianmcmenamin@gmail.com>");
 MODULE_DESCRIPTION("SEGA Dreamcast controller driver");
 MODULE_LICENSE("GPL");
 
diff --git a/drivers/input/keyboard/maple_keyb.c b/drivers/input/keyboard/maple_keyb.c
index 80a5181313e1..7531ff1b2008 100644
--- a/drivers/input/keyboard/maple_keyb.c
+++ b/drivers/input/keyboard/maple_keyb.c
@@ -19,7 +19,7 @@ static DEFINE_MUTEX(maple_keyb_mutex);
 
 #define NR_SCANCODES 256
 
-MODULE_AUTHOR("Adrian McMenamin <adrian@mcmen.demon.co.uk");
+MODULE_AUTHOR("Adrian McMenamin <adrianmcmenamin@gmail.com");
 MODULE_DESCRIPTION("SEGA Dreamcast keyboard driver");
 MODULE_LICENSE("GPL");
 
diff --git a/drivers/input/mouse/maplemouse.c b/drivers/input/mouse/maplemouse.c
index c99f7e234219..93defe596691 100644
--- a/drivers/input/mouse/maplemouse.c
+++ b/drivers/input/mouse/maplemouse.c
@@ -15,7 +15,7 @@
 #include <linux/timer.h>
 #include <linux/maple.h>
 
-MODULE_AUTHOR("Adrian McMenamin <adrian@mcmen.demon.co.uk>");
+MODULE_AUTHOR("Adrian McMenamin <adrianmcmenamin@gmail.com>");
 MODULE_DESCRIPTION("SEGA Dreamcast mouse driver");
 MODULE_LICENSE("GPL");
 
diff --git a/sound/sh/aica.c b/sound/sh/aica.c
index 9438c3a68ee9..ed262e2263d1 100644
--- a/sound/sh/aica.c
+++ b/sound/sh/aica.c
@@ -2,10 +2,10 @@
 /*
 *
 * Copyright Adrian McMenamin 2005, 2006, 2007
-* <adrian@mcmen.demon.co.uk>
+* <adrianmcmenamin@gmail.com>
 * Requires firmware (BSD licenced) available from:
-* http://linuxdc.cvs.sourceforge.net/linuxdc/linux-sh-dc/sound/oss/aica/firmware/
-* or the maintainer
+* https://www.alsa-project.org/files/pub/firmware/
+* (aica_firmware.bin)
 */
 
 #include <linux/init.h>
@@ -29,7 +29,7 @@
 #include <mach/sysasic.h>
 #include "aica.h"
 
-MODULE_AUTHOR("Adrian McMenamin <adrian@mcmen.demon.co.uk>");
+MODULE_AUTHOR("Adrian McMenamin <adrianmcmenamin@gmail.com>");
 MODULE_DESCRIPTION("Dreamcast AICA sound (pcm) driver");
 MODULE_LICENSE("GPL");
 MODULE_FIRMWARE("aica_firmware.bin");
diff --git a/sound/sh/aica.h b/sound/sh/aica.h
index 021b132e088e..75e25dbf58a8 100644
--- a/sound/sh/aica.h
+++ b/sound/sh/aica.h
@@ -3,7 +3,7 @@
  * Header file for ALSA driver for
  * Sega Dreamcast Yamaha AICA sound
  * Copyright Adrian McMenamin
- * <adrian@mcmen.demon.co.uk>
+ * <adrianmcmenamin@gmail.com>
  * 2006
  */
 
-- 
2.43.0

