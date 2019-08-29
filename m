Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EBA337D90D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Aug 2019 14:39:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728201AbfH2OjA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Aug 2019 10:39:00 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37621 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727176AbfH2OiG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Aug 2019 10:38:06 -0400
Received: by mail-wm1-f66.google.com with SMTP id d16so4135302wme.2
        for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2019 07:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YoyhpnPzVIVpxofR/lrTNbfXSivH1y110GNbQfwK7Is=;
        b=wUIWeajlm+pwQ3rJwb3AUTeHw2qPBY30XQR9qsbCCIoobDskJK2Vfv+2l3U08O2ZnT
         X1U8ohF9TtCalLsXR4ySqyTQXGN53OOQ+5NQjpGawmSu8uWs+pVWSJX62iV1+bYIehkj
         UBb85qDMTdyAbHz/vf2X76+eWa30vV1DdEfD0HD+egyJfwk8fTwFh/sg4EhVTU+Nqz1q
         wvvY6sjsPcbO97gNc9E/QWCgndsib+bFUyZPqyPVceJ1SzZOao6Ebd5SsAx689xB7ICA
         pVYHmjrZPO6CPwju4kZmoIAty/ZqOS+RUUqOJHerIGK9CCoKudYBWU/km0QcrCUVKkov
         2YTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YoyhpnPzVIVpxofR/lrTNbfXSivH1y110GNbQfwK7Is=;
        b=A2rxwuVsdmGQN8dBdjVnftrbdTIxcWNO3HGMcm58SigrLntcFKR6YYKL9IDEW9VQJs
         iOoD+87v07MiFHu25aFrdza+xBSLi7HwC+2PUOQ4fUqJr2Ji9o3JRfWJ5HGGlw6sfpSF
         u6CSTh+63cq81H7uMtm0KbzbEj4Fc8gTtbhGFSRVYnmy4I394gCkz86xiWgKkN1IFAKG
         n/jPhVSFWYlUaFjMFzxpgEILT8oLwzGlj3BafS/eG90mqIWudPFrpEIM0VzssJgWF50Z
         0RZp7hgi4nIbz2npksDF20ZJiVwU6nORj1h/CY3uQ6gRb5Af8GCat6xvatWFDcStPAvg
         1gyQ==
X-Gm-Message-State: APjAAAX5QgoqMKT2yHE7BJjHnKultJdgu6JhrkcRnsmQo2XwXxUdgrLB
        i46FgkYjMIDQfX498q08tjrZHA==
X-Google-Smtp-Source: APXvYqwwe3iJ7Riyj93TjIaXa7UIdIe3e1SnS40Ec1Rafqt8qLYekD3kspM1ZWU+jsQcDq4k1ZhDTw==
X-Received: by 2002:a1c:a7c9:: with SMTP id q192mr11696984wme.144.1567089484914;
        Thu, 29 Aug 2019 07:38:04 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id g15sm3241925wrp.29.2019.08.29.07.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 07:38:04 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Alban Bedel <albeu@free.fr>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Julia Lawall <Julia.Lawall@lip6.fr>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 1/9] Documentation: devres: add missing entry for devm_platform_ioremap_resource()
Date:   Thu, 29 Aug 2019 16:37:34 +0200
Message-Id: <20190829143742.24726-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829143742.24726-1-brgl@bgdev.pl>
References: <20190829143742.24726-1-brgl@bgdev.pl>
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
2.21.0

