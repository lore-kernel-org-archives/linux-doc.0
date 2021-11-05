Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B92FC43217
	for <linux-doc@archiver.kernel.org>; Fri,  5 Nov 2021 15:51:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E54CC6008E
	for <linux-doc@archiver.kernel.org>; Fri,  5 Nov 2021 15:51:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233790AbhKEPxo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 5 Nov 2021 11:53:44 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:55886
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233712AbhKEPxb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 Nov 2021 11:53:31 -0400
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id CE9164002D
        for <linux-doc@vger.kernel.org>; Fri,  5 Nov 2021 15:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636127450;
        bh=0bEssfmXxHPGUprNSso7Mjq6wm8EF4TYvKsU8/02BBE=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=SOZuh1jgruWyhKpzphF4MfDp205NeFT1DMV+YGxF2o/S9etbRrImfXNt5guybkFyH
         4AlK3s2JOtOOf+efGDSRBcw12wAWvzdUQCr4eYrKZ91f0A8NYddClRMwISpanPH9JP
         QYZU6XGymXTDUtZwys835HDoSMyqrXrSLTRgdAmCrOOAwfXr5MlVhMlfA1/UHzI1Ux
         MDutFTSLvX1CMJBAQNTFTcy1dq/2SUAdOj9ewsvp46QdRi7QEjZwbTyF5OuQp2n/QP
         rriJNj5/WVrysKjrVOoYl4wHdkhp7mwnKSiaJhvQ5ylzbv6JoHZMRahRFVuqJ7Q/fa
         Twmj4VXhAB4qw==
Received: by mail-wm1-f71.google.com with SMTP id n16-20020a05600c3b9000b003331973fdbbso377245wms.0
        for <linux-doc@vger.kernel.org>; Fri, 05 Nov 2021 08:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0bEssfmXxHPGUprNSso7Mjq6wm8EF4TYvKsU8/02BBE=;
        b=uYalalLlDZFg7zAF+92UHLEsPEhJityEWeaKdMY+lbjtdwQHJay0cgBFjm7tNoOFLr
         ZQvV4hc0CoXl9sDqFrAegtM7Dx5JqK1BSUIfLtLZro50hUZpjhd3/WH4RF8DNha+gNDq
         9UQOv9mpxeduIZU6BC2JUf3care53sblzR5t7cyYFqg0RWqE60z5VQg4LPBetHxb0FBZ
         oHLxsQQpjxeUK8dnoKyg4YxlgTF89w6yFJl2xaNMOWSVuXUa7z2HdgPIYc2NUlces3ze
         48YIsgvYDVjIkLBMDhWZa40+teS5aVOUQioJJ19w7Xlq6WQDaN0f34bn1wq+22mGf68P
         Y4dg==
X-Gm-Message-State: AOAM533r5Wh9fz81p4l5i/JDZwW1VlxgmDl7Xb/tnQ00sClkVfBddtep
        CxhqCN5auqF9SKufZIby1byY5DzA1vfVCYH14hq1ozVmkpaYdEh5gzmCHSBs06Yp4FOFN/UMicH
        5SHL2MqdUEuDzWwUIkDkt0STXCNu64m3ls6fy9w==
X-Received: by 2002:a5d:468f:: with SMTP id u15mr60369035wrq.171.1636127449750;
        Fri, 05 Nov 2021 08:50:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyP30QeivC6b36TFL+IkuxX7YAofe7sXVJxsbORnG4EhnoSVTTf2FUxAHUW+sOGX9Deb4eenw==
X-Received: by 2002:a5d:468f:: with SMTP id u15mr60368997wrq.171.1636127449594;
        Fri, 05 Nov 2021 08:50:49 -0700 (PDT)
Received: from localhost.localdomain (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr. [2.7.60.249])
        by smtp.gmail.com with ESMTPSA id h27sm13219037wmc.43.2021.11.05.08.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 08:50:49 -0700 (PDT)
From:   Alexandre Ghiti <alexandre.ghiti@canonical.com>
To:     Steve French <sfrench@samba.org>, Jonathan Corbet <corbet@lwn.net>,
        David Howells <dhowells@redhat.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Lee Jones <lee.jones@linaro.org>,
        Jeff Layton <jlayton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Ronnie Sahlberg <lsahlber@redhat.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Kalle Valo <kvalo@codeaurora.org>, linux-cifs@vger.kernel.org,
        samba-technical@lists.samba.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
        linux-power@fi.rohmeurope.com
Cc:     Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH 7/7] arch: Remove leftovers from prism54 wireless driver
Date:   Fri,  5 Nov 2021 16:43:34 +0100
Message-Id: <20211105154334.1841927-8-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211105154334.1841927-1-alexandre.ghiti@canonical.com>
References: <20211105154334.1841927-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This driver was removed so remove all references to it.

Fixes: d249ff28b1d8 ("intersil: remove obsolete prism54 wireless driver")
Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 arch/mips/configs/ip27_defconfig        | 1 -
 arch/mips/configs/malta_defconfig       | 1 -
 arch/mips/configs/malta_kvm_defconfig   | 1 -
 arch/mips/configs/maltaup_xpa_defconfig | 1 -
 arch/powerpc/configs/pmac32_defconfig   | 1 -
 5 files changed, 5 deletions(-)

diff --git a/arch/mips/configs/ip27_defconfig b/arch/mips/configs/ip27_defconfig
index 638d7cf5ef01..821630ac1be7 100644
--- a/arch/mips/configs/ip27_defconfig
+++ b/arch/mips/configs/ip27_defconfig
@@ -223,7 +223,6 @@ CONFIG_TMD_HERMES=m
 CONFIG_NORTEL_HERMES=m
 CONFIG_P54_COMMON=m
 CONFIG_P54_PCI=m
-CONFIG_PRISM54=m
 CONFIG_LIBERTAS=m
 CONFIG_LIBERTAS_THINFIRM=m
 CONFIG_MWL8K=m
diff --git a/arch/mips/configs/malta_defconfig b/arch/mips/configs/malta_defconfig
index 9cb2cf2595e0..3321bb576944 100644
--- a/arch/mips/configs/malta_defconfig
+++ b/arch/mips/configs/malta_defconfig
@@ -302,7 +302,6 @@ CONFIG_HOSTAP_FIRMWARE=y
 CONFIG_HOSTAP_FIRMWARE_NVRAM=y
 CONFIG_HOSTAP_PLX=m
 CONFIG_HOSTAP_PCI=m
-CONFIG_PRISM54=m
 CONFIG_LIBERTAS=m
 CONFIG_INPUT_MOUSEDEV=y
 CONFIG_MOUSE_PS2_ELANTECH=y
diff --git a/arch/mips/configs/malta_kvm_defconfig b/arch/mips/configs/malta_kvm_defconfig
index 5924e48fd3ec..009b30372226 100644
--- a/arch/mips/configs/malta_kvm_defconfig
+++ b/arch/mips/configs/malta_kvm_defconfig
@@ -310,7 +310,6 @@ CONFIG_HOSTAP_FIRMWARE=y
 CONFIG_HOSTAP_FIRMWARE_NVRAM=y
 CONFIG_HOSTAP_PLX=m
 CONFIG_HOSTAP_PCI=m
-CONFIG_PRISM54=m
 CONFIG_LIBERTAS=m
 CONFIG_INPUT_MOUSEDEV=y
 CONFIG_SERIAL_8250=y
diff --git a/arch/mips/configs/maltaup_xpa_defconfig b/arch/mips/configs/maltaup_xpa_defconfig
index c0d3156ef640..e214e136101c 100644
--- a/arch/mips/configs/maltaup_xpa_defconfig
+++ b/arch/mips/configs/maltaup_xpa_defconfig
@@ -309,7 +309,6 @@ CONFIG_HOSTAP_FIRMWARE=y
 CONFIG_HOSTAP_FIRMWARE_NVRAM=y
 CONFIG_HOSTAP_PLX=m
 CONFIG_HOSTAP_PCI=m
-CONFIG_PRISM54=m
 CONFIG_LIBERTAS=m
 CONFIG_INPUT_MOUSEDEV=y
 CONFIG_MOUSE_PS2_ELANTECH=y
diff --git a/arch/powerpc/configs/pmac32_defconfig b/arch/powerpc/configs/pmac32_defconfig
index 7aefac5afab0..13885ec563d1 100644
--- a/arch/powerpc/configs/pmac32_defconfig
+++ b/arch/powerpc/configs/pmac32_defconfig
@@ -169,7 +169,6 @@ CONFIG_USB_USBNET=m
 CONFIG_B43=m
 CONFIG_B43LEGACY=m
 CONFIG_P54_COMMON=m
-CONFIG_PRISM54=m
 CONFIG_INPUT_EVDEV=y
 # CONFIG_KEYBOARD_ATKBD is not set
 # CONFIG_MOUSE_PS2 is not set
-- 
2.32.0

