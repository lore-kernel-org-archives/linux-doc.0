Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5593E7E3B8
	for <lwn-linux-doc@archive.lwn.net>; Mon,  6 Aug 2018 22:30:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387735AbeHGAkx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 6 Aug 2018 20:40:53 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40224 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387632AbeHGAkw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Aug 2018 20:40:52 -0400
Received: by mail-lf1-f65.google.com with SMTP id y200-v6so10196781lfd.7;
        Mon, 06 Aug 2018 15:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4e/NwWX8gPdhcOi4ymtYKpIzD8tGLix7YzF3NFcH+jE=;
        b=VSk24Lf11fISUKBVBalTBrkygdyEiRw+2NBUCIf7HMFRpwZbhciE7EQse8VY8vAjmS
         JLJ2wZr7G+u30e0OlVgwZKVGYeHTHgnCPxYsuzl+tdcCZR4zj9zU/o4ndDnyr8PpN+E8
         4KBvTZa3raeWY87i32JIiXzbyLYJTzgwSr1NsyCSuDIhxsgLjetfdxVuiK1Ij7xTOR3Q
         FzNKFaMgy6UteO25l/wkolUXbcDypWSnKLPjrLmv9lp30taqmNXt4V+X2mMPeDhq0OCC
         voBnXuZZeqt8pfgSN6BXAKm+iVXZNKmJw1dbj3UNoTculPG3y8i/zfRXLHK6u7Le8rQt
         VEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4e/NwWX8gPdhcOi4ymtYKpIzD8tGLix7YzF3NFcH+jE=;
        b=HG1/Fv8/C+TMVZga99PO5O/vw0eIpyEJYUH20IrSS8D5W4dIXpt5kaxABScxx6cSJa
         Cy1fRa47AmXWvPkKWewjGHhfK+a7xGC1EUaS3aNx3EvW3FlRDAKWe37IasmaqjLfGc3s
         K3q1DAQLm+7bzAm5tsX82qw7UyQNQCWQu8v9F99cv2GqLDnxOwfFxmgDpQeq/AruEeVJ
         mbC2yjwaP6W5PeKuUSvPWSC0Y8LyiyrNPdsM0f6E6OCIPYj1YSlW2ELug0MK/2zlNJF5
         xOfxHU+LUvN0asee4ema1Jp9M2P7ap0SYDT7Zs0kgwdG99FhRgHBl8bOOmlK1ttiXv3O
         tyoA==
X-Gm-Message-State: AOUpUlHDkdgXj4/m88SkP0ESL9cp9Rl3+eeTV8WbtXNKix57vjyMshU4
        RzUGl+Nz9IHTZiCg9gGf+/k=
X-Google-Smtp-Source: AAOMgpddBt3OviQvsIPmqSEfWASOM2oWUiaQyCmIbh57aYMBUm8SYN9CxOmsoM9b9ESTsH3Foa+b3Q==
X-Received: by 2002:a19:c3c7:: with SMTP id t190-v6mr11873113lff.108.1533594578952;
        Mon, 06 Aug 2018 15:29:38 -0700 (PDT)
Received: from z50.lan (93-181-165-181.internetia.net.pl. [93.181.165.181])
        by smtp.gmail.com with ESMTPSA id o4-v6sm2438561ljc.67.2018.08.06.15.29.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Aug 2018 15:29:38 -0700 (PDT)
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
Subject: [RFC PATCH v2 08/12] mtd: rawnand: ams-delta: Simplify pointer resolution on read/write
Date:   Tue,  7 Aug 2018 00:29:14 +0200
Message-Id: <20180806222918.12644-9-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20180806222918.12644-1-jmkrzyszt@gmail.com>
References: <20180718235710.18242-1-jmkrzyszt@gmail.com>
 <20180806222918.12644-1-jmkrzyszt@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Simplify data read/write sub-functions by changing their APIs so they
accept driver private structure pointer instead of mtd_info.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/mtd/nand/raw/ams-delta.c | 40 ++++++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
index d02c48c013e8..30c461138195 100644
--- a/drivers/mtd/nand/raw/ams-delta.c
+++ b/drivers/mtd/nand/raw/ams-delta.c
@@ -76,10 +76,8 @@ static void ams_delta_write_commit(struct ams_delta_nand *priv)
 	gpiod_set_value(priv->gpiod_nwe, 1);
 }
 
-static void ams_delta_write_next_byte(struct mtd_info *mtd, u_char byte)
+static void ams_delta_write_next_byte(struct ams_delta_nand *priv, u_char byte)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
-	struct ams_delta_nand *priv = nand_get_controller_data(this);
 	struct gpio_descs *data_gpiods = priv->data_gpiods;
 	unsigned long bits = byte;
 	int i, value_array[data_gpiods->ndescs];
@@ -93,10 +91,8 @@ static void ams_delta_write_next_byte(struct mtd_info *mtd, u_char byte)
 	ams_delta_write_commit(priv);
 }
 
-static void ams_delta_write_byte(struct mtd_info *mtd, u_char byte)
+static void ams_delta_write_first_byte(struct ams_delta_nand *priv, u_char byte)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
-	struct ams_delta_nand *priv = nand_get_controller_data(this);
 	struct gpio_descs *data_gpiods = priv->data_gpiods;
 	unsigned long bits = byte;
 	int i;
@@ -108,10 +104,8 @@ static void ams_delta_write_byte(struct mtd_info *mtd, u_char byte)
 	ams_delta_write_commit(priv);
 }
 
-static u_char ams_delta_read_next_byte(struct mtd_info *mtd)
+static u_char ams_delta_read_next_byte(struct ams_delta_nand *priv)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
-	struct ams_delta_nand *priv = nand_get_controller_data(this);
 	struct gpio_descs *data_gpiods = priv->data_gpiods;
 	unsigned long bits = 0;
 	int i, value_array[data_gpiods->ndescs];
@@ -131,38 +125,48 @@ static u_char ams_delta_read_next_byte(struct mtd_info *mtd)
 	return bits;
 }
 
-static u_char ams_delta_read_byte(struct mtd_info *mtd)
+static u_char ams_delta_read_first_byte(struct ams_delta_nand *priv)
 {
-	struct nand_chip *this = mtd_to_nand(mtd);
-	struct ams_delta_nand *priv = nand_get_controller_data(this);
 	struct gpio_descs *data_gpiods = priv->data_gpiods;
 	int i;
 
 	for (i = 0; i < data_gpiods->ndescs; i++)
 		gpiod_direction_input(data_gpiods->desc[i]);
 
-	return ams_delta_read_next_byte(mtd);
+	return ams_delta_read_next_byte(priv);
+}
+
+static u_char ams_delta_read_byte(struct mtd_info *mtd)
+{
+	struct nand_chip *this = mtd_to_nand(mtd);
+	struct ams_delta_nand *priv = nand_get_controller_data(this);
+
+	return ams_delta_read_first_byte(priv);
 }
 
 static void ams_delta_write_buf(struct mtd_info *mtd, const u_char *buf,
 				int len)
 {
+	struct nand_chip *this = mtd_to_nand(mtd);
+	struct ams_delta_nand *priv = nand_get_controller_data(this);
 	int i;
 
 	if (len > 0)
-		ams_delta_write_byte(mtd, buf[0]);
+		ams_delta_write_first_byte(priv, buf[0]);
 	for (i = 1; i < len; i++)
-		ams_delta_write_next_byte(mtd, buf[i]);
+		ams_delta_write_next_byte(priv, buf[i]);
 }
 
 static void ams_delta_read_buf(struct mtd_info *mtd, u_char *buf, int len)
 {
+	struct nand_chip *this = mtd_to_nand(mtd);
+	struct ams_delta_nand *priv = nand_get_controller_data(this);
 	int i;
 
 	if (len > 0)
-		buf[0] = ams_delta_read_byte(mtd);
+		buf[0] = ams_delta_read_first_byte(priv);
 	for (i = 1; i < len; i++)
-		buf[i] = ams_delta_read_next_byte(mtd);
+		buf[i] = ams_delta_read_next_byte(priv);
 }
 
 /*
@@ -186,7 +190,7 @@ static void ams_delta_hwcontrol(struct mtd_info *mtd, int cmd,
 	}
 
 	if (cmd != NAND_CMD_NONE)
-		ams_delta_write_byte(mtd, cmd);
+		ams_delta_write_first_byte(priv, cmd);
 }
 
 static int ams_delta_nand_ready(struct mtd_info *mtd)
-- 
2.16.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
