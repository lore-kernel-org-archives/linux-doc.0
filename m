Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4F83F7DE79
	for <lwn-linux-doc@archive.lwn.net>; Wed, 12 Sep 2018 07:52:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728197AbeILMzj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 12 Sep 2018 08:55:39 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:33462 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728054AbeILMzi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Sep 2018 08:55:38 -0400
Received: by mail-wm0-f68.google.com with SMTP id r1-v6so9730292wmh.0
        for <linux-doc@vger.kernel.org>; Wed, 12 Sep 2018 00:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OFySLdUXLR62cbw4pNAPVJeRRRSSn5qAUSTbLxQWiuk=;
        b=DHyL/RiF5XgjsiKnEBzBYmh2kn/efYixJ5aUB8NNVONZRhbwU/th1otz6h4cEMpmmw
         NRLLPbqVe4ZzVTQcH+MdXt8yqUjErDQDxCuINucnYGZOb3+h8776OcezvuJtqWlzp7Fq
         Xse/g5vHWi8CcRK6V9p/VszR2ZK5TA9+mGsV5MiQRG2UugKLjGTD8sZjPqpODeOe3437
         5oCoyyfNEEDqUE0jjGc7YxkMnQCPDrXcXO0Fn0/cr8zu1zDSWm1QyaLiV20mB4tzYUnV
         dgwz3EFwdE3Qpgp4icQprp3DtFr2SYpoK9EDrpDkEKgzbgJd+SOQpQG+tXantDd9ukul
         /wzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OFySLdUXLR62cbw4pNAPVJeRRRSSn5qAUSTbLxQWiuk=;
        b=r/B2Su2Nb6sPabfPrNPNv07juOAtpVbFvwiIH/Mc7I6PITQIL1JaFqL/LQgt8QRyrD
         sCzHs34v0meWCODtE3jS1FkxeamXeoJHqXLbN6otWPYeTTRHhvG10draIvhMuryp+pf5
         GqrUexoMM/Z65Q4q+XEfF+baEOGnjAIAvLMt9Ls8boTimukgvxDgEk2ZrkpLOxj9Td6q
         PFNFB7cFOY06wLbcTJZo17IHhqBQ8UPNrVmEu3nvR8ej41HfDQT3dH2fpHjGiciEVjXs
         CuW7xrNZ0qwEKVhsQJ3mfvCKH/c6eHD261nHxm9lqFi2Yi1L1R0FSTi2ZUOBy5l+14o/
         Vrew==
X-Gm-Message-State: APzg51A90zliLeC6UySNfwKNfEDWb1GxdEG38qZ9oZp82xz4/aLSoHma
        st+zykB9G6/nZ4NF2IMV6k6QhQ==
X-Google-Smtp-Source: ANB0VdZMuP8hdw6W5jip+1KH/V4Aqq14DjXxtevrsObaZHBLqEVYB8iFK3vpO5IsY9t3EQCDpsURMg==
X-Received: by 2002:a1c:c3:: with SMTP id 186-v6mr753953wma.126.1536738739034;
        Wed, 12 Sep 2018 00:52:19 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id l7-v6sm169341wrt.67.2018.09.12.00.52.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Sep 2018 00:52:18 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        "David S . Miller" <davem@davemloft.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>, Sekhar Nori <nsekhar@ti.com>,
        Kevin Hilman <khilman@kernel.org>,
        David Lechner <david@lechnology.com>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>, Alban Bedel <albeu@free.fr>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 21/21] nvmem: use octal permissions instead of constants
Date:   Wed, 12 Sep 2018 09:51:29 +0200
Message-Id: <20180912075129.25185-22-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180912075129.25185-1-brgl@bgdev.pl>
References: <20180912075129.25185-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Checkpatch emits a warning when using symbolic permissions. Use octal
permissions instead.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index bc14ffd87ca3..e174b282cc1f 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -154,7 +154,7 @@ static ssize_t bin_attr_nvmem_write(struct file *filp, struct kobject *kobj,
 static struct bin_attribute bin_attr_rw_nvmem = {
 	.attr	= {
 		.name	= "nvmem",
-		.mode	= S_IWUSR | S_IRUGO,
+		.mode	= 0644,
 	},
 	.read	= bin_attr_nvmem_read,
 	.write	= bin_attr_nvmem_write,
@@ -178,7 +178,7 @@ static const struct attribute_group *nvmem_rw_dev_groups[] = {
 static struct bin_attribute bin_attr_ro_nvmem = {
 	.attr	= {
 		.name	= "nvmem",
-		.mode	= S_IRUGO,
+		.mode	= 0444,
 	},
 	.read	= bin_attr_nvmem_read,
 };
@@ -201,7 +201,7 @@ static const struct attribute_group *nvmem_ro_dev_groups[] = {
 static struct bin_attribute bin_attr_rw_root_nvmem = {
 	.attr	= {
 		.name	= "nvmem",
-		.mode	= S_IWUSR | S_IRUSR,
+		.mode	= 0600,
 	},
 	.read	= bin_attr_nvmem_read,
 	.write	= bin_attr_nvmem_write,
@@ -225,7 +225,7 @@ static const struct attribute_group *nvmem_rw_root_dev_groups[] = {
 static struct bin_attribute bin_attr_ro_root_nvmem = {
 	.attr	= {
 		.name	= "nvmem",
-		.mode	= S_IRUSR,
+		.mode	= 0400,
 	},
 	.read	= bin_attr_nvmem_read,
 };
-- 
2.18.0

