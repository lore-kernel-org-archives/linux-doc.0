Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIMWL_WL_MED autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1D5F67DE7B
	for <lwn-linux-doc@archive.lwn.net>; Fri, 10 Aug 2018 08:09:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728233AbeHJKeo (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 10 Aug 2018 06:34:44 -0400
Received: from mail-wm0-f48.google.com ([74.125.82.48]:34000 "EHLO
        mail-wm0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728192AbeHJKen (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Aug 2018 06:34:43 -0400
Received: by mail-wm0-f48.google.com with SMTP id l2-v6so776209wme.1
        for <linux-doc@vger.kernel.org>; Fri, 10 Aug 2018 01:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Vbd/0hAQ6eCPDyxiTiuvrAkBoIff8s2ba/U1T9sJXTg=;
        b=WXTaSryWR9CEYrjcNIo3UE5DtLYVKzLIWsj+6TZ2+rPbEG/Yh5qafUI1htgP0u5l5M
         8CL9+bQBZT1ilBuuK+swWtl13ZX4Z6gOJz9Elduk/Q2SDVrS7IhQBp7/qAbPVaprWw+E
         qnuyZVLHRlSl96tEGph9PAvUv/tYPBsSe8xFsVLr6PiQDRIKDNYLRYtfBnqVqVeeBLUu
         WZe6k76TwxoChB83iOgCkPg2lJ7w951xHcPU3lAk1ccOIQFMZ+MZBVRN7Xl6MPbrJdFL
         FA9BLxZp8nf/vLEhYrrgY2IHv2KlkYuCMkEkC0SQ2T5n26mkbWlELxvvu5MDON2LDCZP
         Hxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Vbd/0hAQ6eCPDyxiTiuvrAkBoIff8s2ba/U1T9sJXTg=;
        b=OjKiwV2bS2murMszAunX0+avOmmuBn18mkFV13L/rDQ6Wt8xnOiQqCW3sCSVoilTb/
         eu0gZVD8Ee5JuMHvQAKTj97ncdIOWlaHp2/q/MOFfOcNOQvJHulrTSI3oi1KVKk+0dO3
         aKEWxQZA+d2OQEBlgmhPdwtnu34w0arAsBtDXkDmzaVlVkmCCuMMfTfB+anGXdf7omDx
         JrodEGsPsBmmi09IO3moTITHxIgpCeLwoDO31qX4NewEVqJBjw5i2+YkoJcv9tZb7F4h
         PtCjbHUmwW0l7w1KlBkQ/ftCj8Jd530Qs0JmrtD8xpcwm4QlpMVx3cOPG3WPcFW+FCeg
         I+Hg==
X-Gm-Message-State: AOUpUlGXspOaxAV/qVH5jITvgzkGmwTFcLc4YJ2hOK3lfQKE3m0rW8/a
        fMGnRx5FZbl7spD0Off93+Tlow==
X-Google-Smtp-Source: AA+uWPwevt7H+4psNa6nNW0sB6RMqRzZSdo/PB1RqE6sIHuds28NM2mVCOs48EMlZ/vnaPtG0JWFww==
X-Received: by 2002:a1c:8b0d:: with SMTP id n13-v6mr730206wmd.46.1533888357383;
        Fri, 10 Aug 2018 01:05:57 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id h7-v6sm9546405wrs.8.2018.08.10.01.05.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Aug 2018 01:05:56 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>, Sekhar Nori <nsekhar@ti.com>,
        Kevin Hilman <khilman@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Brian Norris <computersforpeace@gmail.com>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Richard Weinberger <richard@nod.at>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        "David S . Miller" <davem@davemloft.net>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Naren <naren.kernel@gmail.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Lukas Wunner <lukas@wunner.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>,
        Sven Van Asbroeck <svendev@arcx.com>,
        Paolo Abeni <pabeni@redhat.com>, Alban Bedel <albeu@free.fr>,
        Rob Herring <robh@kernel.org>,
        David Lechner <david@lechnology.com>,
        Andrew Lunn <andrew@lunn.ch>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 13/29] ARM: davinci: da850-evm: remove unnecessary include
Date:   Fri, 10 Aug 2018 10:05:10 +0200
Message-Id: <20180810080526.27207-14-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180810080526.27207-1-brgl@bgdev.pl>
References: <20180810080526.27207-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The include file for at24_platform_data is not needed in this file.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm/mach-davinci/board-da850-evm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-davinci/board-da850-evm.c b/arch/arm/mach-davinci/board-da850-evm.c
index 5a634a04ec69..521a26b5c20d 100644
--- a/arch/arm/mach-davinci/board-da850-evm.c
+++ b/arch/arm/mach-davinci/board-da850-evm.c
@@ -20,7 +20,6 @@
 #include <linux/kernel.h>
 #include <linux/leds.h>
 #include <linux/i2c.h>
-#include <linux/platform_data/at24.h>
 #include <linux/platform_data/pca953x.h>
 #include <linux/input.h>
 #include <linux/input/tps6507x-ts.h>
-- 
2.18.0

