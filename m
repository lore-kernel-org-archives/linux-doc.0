Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A7F097DE7E
	for <lwn-linux-doc@archive.lwn.net>; Fri, 14 Sep 2018 14:41:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728046AbeINTzm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 14 Sep 2018 15:55:42 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50733 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728497AbeINTzl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Sep 2018 15:55:41 -0400
Received: by mail-wm1-f68.google.com with SMTP id s12-v6so2194139wmc.0
        for <linux-doc@vger.kernel.org>; Fri, 14 Sep 2018 07:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bgOE1ULQMMWfipJCdPWyqE18ogCrSsaTmNT0nDozskM=;
        b=12rmIQnLSxRah0jIWPCrqBXtImBz27dSY2L4zYm5ugr4x5upENwWdL3Gelv24P5g31
         l36nGiI5drvS+i/I/dduUf6TodQGCHEkulXpgAM8xZIamMa/ONYbD3pD3kzBqPU2Koen
         N5HhIDUYZ4A7/IUSbUlhS83mYNQrwPmMmVjmaIByUUkLVfChMxXrWqzakwsY/HEjbCTS
         MtJMO7iLTcJVqMirmk0014rQkuIZy45jqsePfXVQSrNeS3zKikAn5GB2GgcNmoQWcTBN
         Tr41hMP6cv3Gv8szV8e5ThnoqS56de9gzuEtuKoMpeKudvpHLrs5baJYi+kFp3y8XFt6
         6yGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bgOE1ULQMMWfipJCdPWyqE18ogCrSsaTmNT0nDozskM=;
        b=STvViFh4m5La0e7bcD1GqzRRbnDZyTHyagLcKOadlm9XWENiJPZOLZ9PQPnnRjCNM5
         flvJOPciPjmlfodHMmIP2Obxb5mTkYgspcaM20gbTKmnFGzlRU4eErPq/DJLdevnukO/
         QS2OaDx5vPrxWwpjFUqAZKzZIIcyLW/7STI9PtFYyhtYgD/+rgBAqxu1G0NxTmzVDk1L
         bQoYU6gAmvknBElAPs8FhM5621uarYJ5kMzONSID/8N2lO0wNc5aHqgBzmN7J7LMZ8sy
         4uJCLJmEylsbYGILsqerSToBFCYT8NLXUysaAM/8LVKdXCGMKvw1/2kb1X1Dw+ZmrVeH
         rL2g==
X-Gm-Message-State: APzg51ACL52sKXbOZd0ZiVNQjE6S5Re6qZbmDwcD/qwYADzTeYxlZPaC
        Qr5GkyZhAWf0nNwaVu78EuITtA==
X-Google-Smtp-Source: ANB0Vdbyoboif8kkoL6w59OXgc7YVNKwxX/pjoAcaVxxVv0ojGqrw1afeisPi8dn/KHkkG7fKUzQOQ==
X-Received: by 2002:a1c:c5cc:: with SMTP id v195-v6mr2662105wmf.29.1536936051682;
        Fri, 14 Sep 2018 07:40:51 -0700 (PDT)
Received: from brgl-bgdev.home ([2a01:cb1d:af:5b00:e837:b8d5:48c1:571b])
        by smtp.gmail.com with ESMTPSA id v46-v6sm10313526wrc.63.2018.09.14.07.40.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Sep 2018 07:40:51 -0700 (PDT)
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
Subject: [PATCH v4 21/22] nvmem: fix commenting style
Date:   Fri, 14 Sep 2018 16:40:10 +0200
Message-Id: <20180914144011.27614-22-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180914144011.27614-1-brgl@bgdev.pl>
References: <20180914144011.27614-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Remove a redundant '*/' as pointed out by checkpatch.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index ff21402fbd7d..e44a1860a2b3 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -1374,7 +1374,7 @@ EXPORT_SYMBOL_GPL(nvmem_device_cell_read);
  * @buf: buffer to be written to cell.
  *
  * Return: length of bytes written or negative error code on failure.
- * */
+ */
 int nvmem_device_cell_write(struct nvmem_device *nvmem,
 			    struct nvmem_cell_info *info, void *buf)
 {
@@ -1430,7 +1430,7 @@ EXPORT_SYMBOL_GPL(nvmem_device_read);
  * @buf: buffer to be written.
  *
  * Return: length of bytes written or negative error code on failure.
- * */
+ */
 int nvmem_device_write(struct nvmem_device *nvmem,
 		       unsigned int offset,
 		       size_t bytes, void *buf)
-- 
2.18.0

