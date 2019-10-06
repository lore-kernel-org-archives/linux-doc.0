Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EFCE77D92A
	for <lwn-linux-doc@archive.lwn.net>; Sun,  6 Oct 2019 05:40:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbfJFFjk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 6 Oct 2019 01:39:40 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:37502 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726078AbfJFFjk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 6 Oct 2019 01:39:40 -0400
Received: by mail-pl1-f194.google.com with SMTP id u20so5168047plq.4
        for <linux-doc@vger.kernel.org>; Sat, 05 Oct 2019 22:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CRFi4rfGVxo/22nPvuuu86rpUTMyTPBuv+pN3ClhaRA=;
        b=oVl5LU49d89LqIDZeOa9aYk0vwmjcd/sZs05Bv/MkQ2z7kCcMMD7wR3CrikSxuG07M
         PYdoWglIcyD6VOXZMp8QOhPv/4QDpAz5xbQj3UePlyw8f36K0Fam2vFDHI4xsO4W8TSY
         vPJtEd0iEnyBsY6knGqEPjZsqcoQPmyhHLY+IgfxkViA/RLe6JKUqMw5qaNmLBbQ21yj
         wJ0EIxr7ij2yQbw7K72WlF5s5RlsFLOYY+/PEFzh53N4v/Z9tOMVtJ+IfdMxZtyTw4z3
         o9RWSsjlNK5AhvsN8rQY0MNeblgvq4atWji2anPe1F12TUuIpeIsa+uJX4VJjjXs05uJ
         WXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CRFi4rfGVxo/22nPvuuu86rpUTMyTPBuv+pN3ClhaRA=;
        b=qBwHYLUjaQabWoHlYj6eYfvcJkynncLXqe/GaQS5lsGPp6XR/Erg+cmZtlNfT9xQbE
         aW0OWjDFT0sSbidoXkIRh22slUxU0OHZ6D6Q2pDKYAqIoe8A3NdPK5S2HxOymYJI2tqJ
         Qa0szFDZ1LT3oCFMkU/LAiV0jOsrw6B9Sfe718UP4qN69ahoyh2NJcRvAwlvwprvJBUj
         6qZxqwh6EnrjEEvVr/HJLRouScQRC5UXImtrRsE6+16IW6Wa0l5qu8MmSMJ0A5HxlPOt
         vnjqZwPN30+A4apr+L0WoUvKwF6BPbcTmGd/KrPZXDUYcnKXC1e2v6eHuq2tTwpUePl1
         8rMg==
X-Gm-Message-State: APjAAAWvog8UzYWfrSOuFp9+Elzqo44KaHsVl2tk9wXJ8yk0z7KqNche
        upTrAtDGCnKZVHjTs1zDP1R6Z3ij9xFLVg==
X-Google-Smtp-Source: APXvYqySY6t5rz3QEK4U7cpA6VIPiaiWwSW6FZVB45BlCnEniS3t1SoUBNk7RCscBZ+4i6EgqgCKvQ==
X-Received: by 2002:a17:902:bc46:: with SMTP id t6mr23561392plz.307.1570340378268;
        Sat, 05 Oct 2019 22:39:38 -0700 (PDT)
Received: from debian-brgl.local (50-255-47-209-static.hfc.comcastbusiness.net. [50.255.47.209])
        by smtp.gmail.com with ESMTPSA id q30sm10019320pja.18.2019.10.05.22.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2019 22:39:37 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 1/8] Documentation: devres: add missing entry for devm_platform_ioremap_resource()
Date:   Sun,  6 Oct 2019 07:39:09 +0200
Message-Id: <20191006053916.8849-2-brgl@bgdev.pl>
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

devm_platform_ioremap_resource() should be documented in devres.rst.
Add the missing entry.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 Documentation/driver-api/driver-model/devres.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index a100bef54952..8e3087662daf 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -316,6 +316,7 @@ IOMAP
   devm_ioremap_nocache()
   devm_ioremap_wc()
   devm_ioremap_resource() : checks resource, requests memory region, ioremaps
+  devm_platform_ioremap_resource() : calls devm_ioremap_resource() for platform device
   devm_iounmap()
   pcim_iomap()
   pcim_iomap_regions()	: do request_region() and iomap() on multiple BARs
-- 
2.23.0

