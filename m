Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9F539FCD7
	for <linux-doc@vger.kernel.org>; Sun, 12 Jul 2026 10:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783851660; cv=none; b=NiNZCOQwX1Zv4X+FCPpG+x7F3kq2DyjSjMGHNcz7TKRbRSQRFphFVMfOV0vkRtsEmdyLeI1YZYC0XRGQzs3+3oA2abGc6tRhGzmzKHccRGLTfkJDlp0zwGswqq6TEuIPzVd4DP6noUt5fU7cb+KhtL457T5s01lO31Ql9m+r4pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783851660; c=relaxed/simple;
	bh=utDuo2WNw3hePhQreU1zjsPiOgUN3XHnEKmrepDTN04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=isBnoUTJM4C6Mb/8+otDDTmUWlrab9JBMUWJlOlqmGsxr/bymNUbzyUqAqWqsbzfVlxAjClJDiBmdXpcVUh1d8aol8muHgHkshl4q/ijvuIBfVbgV+lcJPYNEv72SIVrla1ioyzxQosvN0319/GjP4BjB2IS7Kmi9l8PgFUtETw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=kB89kTW4; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="kB89kTW4"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-470174001a0so1299978f8f.0
        for <linux-doc@vger.kernel.org>; Sun, 12 Jul 2026 03:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1783851658; x=1784456458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A7KLFAdTdSyp3t1Mmt+Mvc6gEqh9A7/9JU0e4I8/G4k=;
        b=kB89kTW4oQsUJXdUWg9Z9827qR3MwH43ZF0FvlD1fjZzB9vgVfVDDMQiqyp2oDjU9D
         xdgU9qIKFD/ZDxk5xfgVponJYDO/5M5EaM969MF30ZcBJDBeb0jAoH4iyrno2Yg2fis0
         93wakmUNpXlUxGVgJesjqF9Fc9XNv87rbCI+YV/AQ+n7uECsurmdHEgmB7sDL0g0//cW
         VuiLgX6dCamLwjXZPtxMn86284Wn6nCLzPFzNUKHQ0kh4UJGydyYqxl8moW1ALTbboUg
         YPvuB7XP051qvXKuHSlUdtim9ymUIdL8dZ82HGblu9el5UpKal4k6b4qoEKlNQg4P3vO
         rSzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783851658; x=1784456458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A7KLFAdTdSyp3t1Mmt+Mvc6gEqh9A7/9JU0e4I8/G4k=;
        b=cH6QchWw56N43USOFxZq4EwRu5tnopiqO+tfxwk5LQ8bMds7vsbZQY390bFPZlGiWO
         U1omLNK84uQuCfclAlu97XKdP7ltK0mdURrzYJXdj+HiG6AqCeuIi5ZGqmYd8H8Tj/IE
         T0tzDYxEYpwbANBlzVee943N8a2snpp8TzYWfcIOE18D4WARHKaJ+kuB7FimCYNP4VVv
         IRGIazmhsSuuRApTNP6+JFsuV7pXFjDL0myqVUne82zE3RGZkDqNRqOVVHHtCx8++Ybw
         giPb257AR30RfsMuHM484mau3Rr7bex8LhvVBkg5foo85OLHadpi1FxXGeffjEZDlOrm
         QPmA==
X-Forwarded-Encrypted: i=1; AHgh+Roj8bKax4JDfIPObUs1lW/rRLnoYKrJ4bsfC1NcEqavw4moEgALeu/Rud2dKkYMdk2FivKcI+SVRl0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXY/r8FafUZ+hjsmoruY6w5KUbER5n/LzYwY0tmjjPq3IKU/yJ
	CMIYykCRohteFk+9iYPWf63dA6eiHS1w8CofAZohDIUAh4VH/WFg8uNVH2i6j0Ytl6Q=
X-Gm-Gg: AfdE7ck6XVdOz4FLnePThxGnKNf1XyovoDmVb5C+CfBWxsYJg4cP676Ee6Qz5UjtBdA
	v4aebxnlpcmpObttjfsky7NJhvrs1AQI0dRsPhdP4hjQo/DmeCkqFFvOUmQwumsT4NI+/98bo4j
	lsMSim2ubK0d/e7dfw69DLPmAu60hgBZCHZK4BBxJrCtCwg6fzVauVKkxZe+KNr16Qyp0q04Irw
	BtLsGVKu1mz4a+OKyiu1SkljPZqtV1pyaf0LqhdQWHcFvRlUBu7z13Z9fWiBXjkzNHX87Rlm/HQ
	SqNpqEcOHuRfbt0rYF1mVlRuEjC8rtc1QJBmOmHE4sy9ck4byLXn6fVj0z9KRFBfix8KPeB5lOJ
	qCZFGYS9v/LOpcL0ISuGpb7vKIhnMx94taVwdbZtApOPiYDpcy/s3OgLLSCWlHAhO0y5TBd68N8
	KEhqTiO7iEFbU5VTMJhNuv+4Sxv/8TfeLU4PlPLPJ437gDlou9hPYdshv2Pw7ZX30PUrxdCG1W9
	buweNJL/4FX68JxsBdKGHobMAd0Bz0tcXMzf2Q=
X-Received: by 2002:a05:6000:2011:b0:470:2fb1:3dca with SMTP id ffacd0b85a97d-47f2dcd7487mr5749573f8f.30.1783851657812;
        Sun, 12 Jul 2026 03:20:57 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c5:7815:1301:f27:e3a8:2334:314d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ad21sm75005672f8f.20.2026.07.12.03.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 03:20:57 -0700 (PDT)
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Sun, 12 Jul 2026 11:20:37 +0100
Subject: [PATCH v3 6/6] Documentation/kernel-parameters: add/update
 printk_delay/boot_delay
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-printkcleanup-v3-6-574547b8f71b@thegoodpenguin.co.uk>
References: <20260712-printkcleanup-v3-0-574547b8f71b@thegoodpenguin.co.uk>
In-Reply-To: <20260712-printkcleanup-v3-0-574547b8f71b@thegoodpenguin.co.uk>
To: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
 linux-rt-devel@lists.linux.dev, 
 Andrew Murray <amurray@thegoodpenguin.co.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783851647; l=2383;
 i=amurray@thegoodpenguin.co.uk; s=20250914; h=from:subject:message-id;
 bh=utDuo2WNw3hePhQreU1zjsPiOgUN3XHnEKmrepDTN04=;
 b=d2X0BHuJ1CQWytJ0SAMIIKCGulICkuSxHkoRz5VTU3oDIwlYsespo8YnKmxdQHRuNbprslaM8
 uR4zOBiuOBHAxYnf8z9WGG4RYEgwLfDBxKehgKZ57nyiym/LudtIjxS
X-Developer-Key: i=amurray@thegoodpenguin.co.uk; a=ed25519;
 pk=0SU0Q8S/uEiCdbXbXS+PvJGUCaBG1nDszD+HPU3Js0Q=

boot_delay has been deprecated in favour of an extended printk_delay,
let's update kernel-parameters to reflect the addition of printk_delay
and the deprecation of boot_delay.

Reviewed-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
---
 Documentation/admin-guide/kernel-parameters.txt | 31 +++++++++++++++++++++----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 2884103b93bca7b76cd3a93946276074cf62d0a1..1118feda87b1b04543b1da0bd52c090b1fddaeac 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -650,11 +650,19 @@ Kernel parameters
 			See Documentation/block/cmdline-partition.rst
 
 	boot_delay=	[KNL,EARLY]
-			Milliseconds to delay each printk during boot.
-			Only works if GENERIC_CALIBRATE_DELAY is enabled,
-			and you may also have to specify "lpj=".  Boot_delay
-			values larger than 10 seconds (10000) are assumed
-			erroneous and ignored.
+			Milliseconds to delay each printk during and post boot.
+			Boot time delays only work if GENERIC_CALIBRATE_DELAY
+			is enabled.
+
+			Once booted the delay can be removed or adjusted via
+			the printk_delay sysctl.
+
+			Please note that you may also have to specify "lpj=".
+			Boot_delay values larger than 10 seconds (10000) are
+			assumed erroneous and ignored.
+
+			This will soon be deprecated, please use printk_delay
+			instead.
 			Format: integer
 
 	bootconfig	[KNL,EARLY]
@@ -5468,6 +5476,19 @@ Kernel parameters
 	printk.time=	Show timing data prefixed to each printk message line
 			Format: <bool>  (1/Y/y=enable, 0/N/n=disable)
 
+	printk_delay=	[KNL,EARLY]
+			Milliseconds to delay each printk during and post boot.
+			Boot time delays only work if GENERIC_CALIBRATE_DELAY
+			is enabled.
+
+			Once booted the delay can be removed or adjusted via
+			the printk_delay sysctl.
+
+			Please note that you may also have to specify "lpj=".
+			printk_delay values larger than 10 seconds (10000) are
+			assumed erroneous and ignored.
+			Format: integer
+
 	proc_mem.force_override= [KNL]
 			Format: {always | ptrace | never}
 			Traditionally /proc/pid/mem allows memory permissions to be

-- 
2.34.1

