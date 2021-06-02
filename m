Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD1AC4708F
	for <linux-doc@archiver.kernel.org>; Wed,  2 Jun 2021 20:30:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C5E1613DE
	for <linux-doc@archiver.kernel.org>; Wed,  2 Jun 2021 20:30:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbhFBUcR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 2 Jun 2021 16:32:17 -0400
Received: from mail-pg1-f174.google.com ([209.85.215.174]:42598 "EHLO
        mail-pg1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbhFBUcQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Jun 2021 16:32:16 -0400
Received: by mail-pg1-f174.google.com with SMTP id t8so3221882pgb.9
        for <linux-doc@vger.kernel.org>; Wed, 02 Jun 2021 13:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MD+isL8cNVT/yF1S1l/22CEEX+JBBjfdFhs5HrJbFZ0=;
        b=MFN/v6HAtmbiBcr/rW9sBIkkjZbiudr1DhMvzrLq1O3AAnYMn02NQr+HwsvapcGEZX
         CPjt9kjtmYpyWkdPiKYURP5yTbv+wmC1WETW/uTaTgKT5cQEkRthljpjgQeylXoCA2qZ
         n963YCHB30oxbOj9um4IKM24KUgQ+iStfwknk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MD+isL8cNVT/yF1S1l/22CEEX+JBBjfdFhs5HrJbFZ0=;
        b=kRm+u8zD4EX0rYsAoQxdkRVXCLwVHQnC9BYYu8Bmw2T59/Irirj2HkVM6cT/GZOGf1
         deO12W2nyETMKXtGL8lFQ7ZKh8cXp9NLGt8HgcKvN/YS2BmxQ5/j5AUjd5ze7vdkNGlF
         SjNzFR+A4TCyFqx0Vjiu09ki9zqlenZfefH5QWQi16X+Y1C1vdvQtG0v26MgqrvDCdgG
         4/Cz4mnMYxFOhVX9bxIN79so0LlzQNTYdhQJ0On6Z8CO9hXE+pN/yIiSLz6h3ux3i0tU
         IG2+ju888JIuSKpYTbLxiFMhpBPCJ8wnleaGTBHqgUaIfM4I41CMdhFY9N39xqSZnbsg
         N2hQ==
X-Gm-Message-State: AOAM530/ARZkd/r9+RhLPYVczMiVlxOfaZNCvN5ryvjS/wP8S8rh5I63
        hVkUdOscZL7MNqcebAPlFwYPEw==
X-Google-Smtp-Source: ABdhPJyg1lwfSzxzEISHF+uwm+A+ZRndlFWtVzrGgCDaE4ivIe5hOhAxzRoZmPk9Fxyx/dV5kW2jsg==
X-Received: by 2002:a65:41c8:: with SMTP id b8mr35391636pgq.196.1622665758956;
        Wed, 02 Jun 2021 13:29:18 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c17sm596607pgm.3.2021.06.02.13.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 13:29:18 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Kees Cook <keescook@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxim Krasnyansky <maxk@qti.qualcomm.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH] docs: networking: Replace strncpy() with strscpy()
Date:   Wed,  2 Jun 2021 13:29:14 -0700
Message-Id: <20210602202914.4079123-1-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; g=08a021de6652594e6002a3fa2779560fbfe4687c; i=OtS/j+af/fe4GVQBQBUoq9mDVJJ7GbT1sWYBCoEQ36k=; m=gAU3qSQ85FC8trlGFWM3KtcCVKh49fUAyHP3MClMFZg=; p=x25iameOGPjYX/6T3Mx1eg/f0np3ZbIi5+Bk5dRwABo=
X-Patch-Sig: m=pgp; i=keescook@chromium.org; s=0x0x8972F4DFDC6DC026; b=iQIzBAABCgAdFiEEpcP2jyKd1g9yPm4TiXL039xtwCYFAmC36hkACgkQiXL039xtwCaRMw/7BAD suzqyeGDnSLe/rc/lhfELAz/dIUzadYBlY6Po3Mjhl2SFXMB3ehLUAL/+Pu48v3H0P5TMM1/TuAXs jEg8JUmwkKSKslqWXRGuSDlhd0f/s0d2Zx8eprgIRQArAtCrMwGBgxpcQtCBSGBZUSqSFhtf/AUid FOgAN+2tyXObxmwoFmpp1osEZYqyQUGQY9mhUiTPiaj5F0Ba1Fsm2ajqPaUC0iPeiP7b7YiBbdPbB sgJy53vMebfmFevoJwAulBV+FHI8z5XhGHflTiGB4MDHQkMplQuyXVoCdt2V+NFYPPr3TasjCalLU 3WelN3uzN140SAKe393Xh/uVF/Ktv1nqLKfT83+t2hC4k8bz8jbY1HcqVDh4CuOaXpfrIoLfR2e0G D1C4QKu7gNcfWxA6RFignhiNcjqRRgKK/0eWYFywFvVJEhY0gKUY1NeWWzAFVMlB3WCDnNI3au7Y+ +78VLNn+Ay0hd0UUK6r7io1kIgXvMBZIV0bZfQ833RLsQNYFAc8KznhD/5mkqb3tqEkFY0Da99JVC QEKz9kbcUB6mt5Rn8roJsUoZSqEmilJcZEKk1CkGYuSeZoQXnFni/zVqWBuXE81BgrEo8yjLxW6TQ ppwwDAxmY4lHuBJ90zGnafPLdRWg78AtSfPZwzDW8+TYO1Cmf24NCXnd2fGNDF+A=
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Replace example code's use of strncpy() with strscpy() functions. Using
strncpy() is considered deprecated:
https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 Documentation/input/joydev/joystick-api.rst | 2 +-
 Documentation/networking/packet_mmap.rst    | 2 +-
 Documentation/networking/tuntap.rst         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/input/joydev/joystick-api.rst b/Documentation/input/joydev/joystick-api.rst
index af5934c10c1c..5db6dc6fe1c5 100644
--- a/Documentation/input/joydev/joystick-api.rst
+++ b/Documentation/input/joydev/joystick-api.rst
@@ -263,7 +263,7 @@ possible overrun should the name be too long::
 
 	char name[128];
 	if (ioctl(fd, JSIOCGNAME(sizeof(name)), name) < 0)
-		strncpy(name, "Unknown", sizeof(name));
+		strscpy(name, "Unknown", sizeof(name));
 	printf("Name: %s\n", name);
 
 
diff --git a/Documentation/networking/packet_mmap.rst b/Documentation/networking/packet_mmap.rst
index 500ef60b1b82..c5da1a5d93de 100644
--- a/Documentation/networking/packet_mmap.rst
+++ b/Documentation/networking/packet_mmap.rst
@@ -153,7 +153,7 @@ As capture, each frame contains two parts::
     struct ifreq s_ifr;
     ...
 
-    strncpy (s_ifr.ifr_name, "eth0", sizeof(s_ifr.ifr_name));
+    strscpy_pad (s_ifr.ifr_name, "eth0", sizeof(s_ifr.ifr_name));
 
     /* get interface index of eth0 */
     ioctl(this->socket, SIOCGIFINDEX, &s_ifr);
diff --git a/Documentation/networking/tuntap.rst b/Documentation/networking/tuntap.rst
index a59d1dd6fdcc..4d7087f727be 100644
--- a/Documentation/networking/tuntap.rst
+++ b/Documentation/networking/tuntap.rst
@@ -107,7 +107,7 @@ Note that the character pointer becomes overwritten with the real device name
        */
       ifr.ifr_flags = IFF_TUN;
       if( *dev )
-	 strncpy(ifr.ifr_name, dev, IFNAMSIZ);
+	 strscpy_pad(ifr.ifr_name, dev, IFNAMSIZ);
 
       if( (err = ioctl(fd, TUNSETIFF, (void *) &ifr)) < 0 ){
 	 close(fd);
-- 
2.25.1

