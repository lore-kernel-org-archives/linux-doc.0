Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7FF647D2F0
	for <lwn-linux-doc@archive.lwn.net>; Sun,  6 Oct 2019 05:40:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726255AbfJFFjn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 6 Oct 2019 01:39:43 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44572 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726246AbfJFFjn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 6 Oct 2019 01:39:43 -0400
Received: by mail-pf1-f196.google.com with SMTP id q21so6395911pfn.11
        for <linux-doc@vger.kernel.org>; Sat, 05 Oct 2019 22:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S1RoqAjzF3G4A46AecyEHP/0DwVF1CG1yV8jnN1Ft9k=;
        b=hyFNBkwR6pg4p2eP93SG+NV9NB6qex5OhttYUFQQ6YYwbqNCH7zkzB5piC0+tBTw48
         F58jCN/ZpyGGindrO/Wc0hhpOxNWsEYHQAz9mj/oIXSdGHZbn4NQaqjSsmOs//W6DBQd
         f+uDQ9TgGa/BNGOArhl170R7Wi/pIINMsXlu773pSyTG3QprqAU8PFA70O8EVEWdD7fP
         hyHe+sLP/XXL+NRZkXXP+ck2ECaN0PxD8kWPDu5jMuWtIh+D7FcvJ4nvp9xmRQO1L65l
         H4k9qxbUB7dTVWG4yk1nRknlTy/l6eW5frqYnukesY4vFAv5UkT54+0LptcnfywUiaIu
         NxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S1RoqAjzF3G4A46AecyEHP/0DwVF1CG1yV8jnN1Ft9k=;
        b=JX8y69pfhghIKptjjgXx7MvSDGpGg8VTP2/vOT5Gp5aV7ftLe8321Toz9KGGgryBm5
         HNjd6swN5INQ4UjHav08Z1i9te01163zHQ41UJiXma3gqp3fvs2A9HypFrcd+odXcWN5
         P1eoLZG+wY6k1l1M5oT5Q7qU8AD32mGwlSov+1Z6MKUsJz62x1g1NHEkgUOo56NaYZeX
         qRubigI4z3tbZk4HVuuF9kRvFq6CTo3wtF4yVyddLRjO7b9GAFfzJ4W6EivAEgJzQnlW
         RseJGAOGmim1zEPaZr1wjEGnayRDC9BT6enkHID4K83wXKSKHey+mz2qcZ4/PEiEe3Nf
         nSdg==
X-Gm-Message-State: APjAAAU1I8uoNt8XxIOUWb8w4oUmNV+IM7N0sA6wPqLTCk4XkgbW6iWf
        y9au/J5IgIbk9spPfeFfbbTJ1Q==
X-Google-Smtp-Source: APXvYqzHcMrU1J/wYWP4lNtuoIic5NFXBS/1cEIovdr3sk+TlnhzhcSpbI9EoYFtfyNFlucLPo5HTg==
X-Received: by 2002:a62:583:: with SMTP id 125mr27004540pff.69.1570340382559;
        Sat, 05 Oct 2019 22:39:42 -0700 (PDT)
Received: from debian-brgl.local (50-255-47-209-static.hfc.comcastbusiness.net. [50.255.47.209])
        by smtp.gmail.com with ESMTPSA id q30sm10019320pja.18.2019.10.05.22.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2019 22:39:42 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 5/8] misc: sram: use devm_platform_ioremap_resource_wc()
Date:   Sun,  6 Oct 2019 07:39:13 +0200
Message-Id: <20191006053916.8849-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191006053916.8849-1-brgl@bgdev.pl>
References: <20191006053916.8849-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use the new devm_platform_ioremap_resource_wc() helper instead of
devm_ioremap_wc() combinded with a call to platform_get_resource().
Also use devm_platform_ioremap_resource() where applicable.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/misc/sram.c | 28 ++++++++--------------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/drivers/misc/sram.c b/drivers/misc/sram.c
index f30448bf3a63..6c1a23cb3e8c 100644
--- a/drivers/misc/sram.c
+++ b/drivers/misc/sram.c
@@ -340,8 +340,6 @@ static const struct of_device_id sram_dt_ids[] = {
 static int sram_probe(struct platform_device *pdev)
 {
 	struct sram_dev *sram;
-	struct resource *res;
-	size_t size;
 	int ret;
 	int (*init_func)(void);
 
@@ -351,25 +349,14 @@ static int sram_probe(struct platform_device *pdev)
 
 	sram->dev = &pdev->dev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(sram->dev, "found no memory resource\n");
-		return -EINVAL;
-	}
-
-	size = resource_size(res);
-
-	if (!devm_request_mem_region(sram->dev, res->start, size, pdev->name)) {
-		dev_err(sram->dev, "could not request region for resource\n");
-		return -EBUSY;
-	}
-
 	if (of_property_read_bool(pdev->dev.of_node, "no-memory-wc"))
-		sram->virt_base = devm_ioremap(sram->dev, res->start, size);
+		sram->virt_base = devm_platform_ioremap_resource(pdev, 0);
 	else
-		sram->virt_base = devm_ioremap_wc(sram->dev, res->start, size);
-	if (!sram->virt_base)
-		return -ENOMEM;
+		sram->virt_base = devm_platform_ioremap_resource_wc(pdev, 0);
+	if (IS_ERR(sram->virt_base)) {
+		dev_err(&pdev->dev, "could not map SRAM registers\n");
+		return PTR_ERR(sram->virt_base);
+	}
 
 	sram->pool = devm_gen_pool_create(sram->dev, ilog2(SRAM_GRANULARITY),
 					  NUMA_NO_NODE, NULL);
@@ -382,7 +369,8 @@ static int sram_probe(struct platform_device *pdev)
 	else
 		clk_prepare_enable(sram->clk);
 
-	ret = sram_reserve_regions(sram, res);
+	ret = sram_reserve_regions(sram,
+			platform_get_resource(pdev, IORESOURCE_MEM, 0));
 	if (ret)
 		goto err_disable_clk;
 
-- 
2.23.0

