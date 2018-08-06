Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3FB4C7E3B8
	for <lwn-linux-doc@archive.lwn.net>; Mon,  6 Aug 2018 22:30:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387515AbeHGAkl (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 6 Aug 2018 20:40:41 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36514 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387477AbeHGAkl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Aug 2018 20:40:41 -0400
Received: by mail-lj1-f194.google.com with SMTP id u7-v6so11861174lji.3;
        Mon, 06 Aug 2018 15:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Y+2LyEwByW4zxwwsLlaC1XUGA47kDs2qqVs9Rm/IVKw=;
        b=VVRKU1FkDhRKCs/bp0gKnclYBzSXh+B6bnxWekrUKOTBVYmu0IRVRSNbSk39oBMtbX
         chWoCByBdLQ6EH+iBbMrgv4mdt28IbSSr4Xbprbu1/rT5k7GkpZI27jYQ1NcFEF5jHPw
         FlbKG+QOKca8kHcPqPtbLf7z+oxH766qCjcYF2H0mA/IBM270yEM2SXoicAVOr4+NV4A
         +Ht2oWIzrwitqQXgSCoZD1Zk5iY6TEAb0pWVLC4FkD0YJrvb49NXo/eMl2dSCL/1hMVI
         QI9B1X3A4X8WH1PIlrBqt2oCZjaV3rQsPbJWAPtoGjnoIJvBewGXctM9xz8tRyETC4h8
         nuJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Y+2LyEwByW4zxwwsLlaC1XUGA47kDs2qqVs9Rm/IVKw=;
        b=Bf98teYr8yXQHf+JNj5jlF6Yk0gieExwvrKrkZR7eH+4S0OcPeIwx79XItdMvmyXP4
         cjOvYgegHlYY4UQ4yL21xeERcieC2E5Fk+ajQEHJdyf3A8GA9wezeRaB8RZLnUpECD5i
         04WQ2QqZLwzFXllnh5KDTB6243LJRXo5ZXN4Iyl6uW3bZLAOtjac45BV4fOqCysFVIv3
         y7MM+6COa2cXp3yFWccyfFQA2VACj3eS8FGmiATfbFTQ7u80oAg8FUmM9Fr9GwX0TFrC
         /R/KFuAYp+oL88roW2G29z04ghkyPW9vr0TnDmD4lVsyc9Qd8J0aYXmOW5PDoWTcdVKU
         5/hA==
X-Gm-Message-State: AOUpUlGZJ+lcmSx6jzMF4HntGsQJkzJrm0xotHicI5aQm8CuJmGYbdTV
        crVCY8X8r3qsQ/U56I2tuxs=
X-Google-Smtp-Source: AAOMgpdFORBMvg9yWcrZM5IFEvZ3StNHD23q85ghgy1e+ZYuXriIDAmi9G3G2iV7WMKXEf0JQaoMIw==
X-Received: by 2002:a2e:63c5:: with SMTP id s66-v6mr14441401lje.23.1533594568957;
        Mon, 06 Aug 2018 15:29:28 -0700 (PDT)
Received: from z50.lan (93-181-165-181.internetia.net.pl. [93.181.165.181])
        by smtp.gmail.com with ESMTPSA id o4-v6sm2438561ljc.67.2018.08.06.15.29.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Aug 2018 15:29:28 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Boris Brezillon <boris.brezillon@bootlin.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        David Woodhouse <dwmw2@infradead.org>,
        Brian Norris <computersforpeace@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [RFC PATCH v2 01/12] mtd: rawnand: ams-delta: Assign mtd->dev.parent, not mtd->owner
Date:   Tue,  7 Aug 2018 00:29:07 +0200
Message-Id: <20180806222918.12644-2-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20180806222918.12644-1-jmkrzyszt@gmail.com>
References: <20180718235710.18242-1-jmkrzyszt@gmail.com>
 <20180806222918.12644-1-jmkrzyszt@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix missing mtd->dev.parent assignment and drop useless mtd->owner.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/mtd/nand/raw/ams-delta.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index 2a8872ebd14a..af313c620264 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -162,7 +162,7 @@ static int ams_delta_init(struct platform_device *pdev)
 	}
 
 	ams_delta_mtd = nand_to_mtd(this);
-	ams_delta_mtd->owner = THIS_MODULE;
+	ams_delta_mtd->dev.parent = &pdev->dev;
 
 	/*
 	 * Don't try to request the memory region from here,
-- 
2.16.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
