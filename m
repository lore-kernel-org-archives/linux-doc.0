Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0BAFD7D90F
	for <lwn-linux-doc@archive.lwn.net>; Wed,  2 Oct 2019 16:26:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725916AbfJBQZm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 2 Oct 2019 12:25:42 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51612 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727131AbfJBQZm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Oct 2019 12:25:42 -0400
Received: by mail-wm1-f65.google.com with SMTP id 7so7895463wme.1
        for <linux-doc@vger.kernel.org>; Wed, 02 Oct 2019 09:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CRFi4rfGVxo/22nPvuuu86rpUTMyTPBuv+pN3ClhaRA=;
        b=BzZzg2bJ7NBTDqS6TlK6sZp+14BNTwAU5b9IQ8LXsUVrttws1RwGRLhGA65o7rpKT+
         z/7uCkEmsywxKA2xgLrN76TwL+6tE6ZmF7lAc3b494frNcm4VrUlY4SIK+6HKB2qA1/o
         qdL42Em3EAg7qec/Qxiy183vPIyh8gkhYMOhES5GcHnvhDsdUqoEXQEEsljcoWwwF5Ok
         toZRnMgqrmIMETpidWWTwY+QOQ3+y26dAWvxIhNbhuU8lnwHE/TL71TGRaieTiCZOiAn
         6WOSTDUF46pzZ+JCIlPM4cu3bZggZ2UMUNR61umTcDNDyCl9M5kzAvUGg2FQX3FxCiiR
         qlmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CRFi4rfGVxo/22nPvuuu86rpUTMyTPBuv+pN3ClhaRA=;
        b=D0/XhyzwAuEiv1zjS/21SenDGaKrnUPqCTHQJSwvlcFoFN/6j9s9QiRYjZ3PGLEblL
         BknqIFA3ApkrcLXy9WJHOgqbQ81KHjwgRKWklKxh4fpl0CgqSIrnrYFKdM/jnQZzMUO3
         2HSTqFodX78KlB9ATsgKqrMPb0n8f+5tXdUxTXdW3P4UUH8mD7pQouRIi7WOf0DXd4B5
         pZ1drec3jp+r3Ca8I4Wem+EMt71NaTiVDOizhM7yHetYCbyOVJYZ5yfs55e6tUEr92pc
         d0V2qdJ7+q113ZQXS7rujULoweyeNtAPKo68iiGzKuUbyFy73RyBJM5UJKVxwlQe7Age
         ei6A==
X-Gm-Message-State: APjAAAXO8syscsyEfcDO24InS5bjIQ5nA979RCujIjCU0ZHkxNnJir/V
        FWDoZHhzaTc2uVnlK3g6R0y4ew==
X-Google-Smtp-Source: APXvYqz2z7eJu+lmpcal5gG8NewORG7oMMRF1eXCTyrmNkUXsgpQ5bbwR5V9zRM080JcHnfrq1CIKA==
X-Received: by 2002:a1c:608b:: with SMTP id u133mr3596645wmb.27.1570033540142;
        Wed, 02 Oct 2019 09:25:40 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id w9sm3482067wrt.62.2019.10.02.09.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 09:25:39 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 1/5] Documentation: devres: add missing entry for devm_platform_ioremap_resource()
Date:   Wed,  2 Oct 2019 18:25:30 +0200
Message-Id: <20191002162534.3967-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191002162534.3967-1-brgl@bgdev.pl>
References: <20191002162534.3967-1-brgl@bgdev.pl>
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

