Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0FCB27D918
	for <lwn-linux-doc@archive.lwn.net>; Tue, 22 Oct 2019 08:44:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388366AbfJVIoA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 22 Oct 2019 04:44:00 -0400
Received: from mail-wm1-f47.google.com ([209.85.128.47]:50784 "EHLO
        mail-wm1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388042AbfJVIn1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Oct 2019 04:43:27 -0400
Received: by mail-wm1-f47.google.com with SMTP id q13so6131143wmj.0
        for <linux-doc@vger.kernel.org>; Tue, 22 Oct 2019 01:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A4wzsYdI/UBS/hDiEwuJ9S9NtfpinD6pNSX/pGZnoi0=;
        b=Msg6F/GxlqK4EM7T+PrzjdhF/JFDQ4NXZ1hU5I/y5yZ/4dJFfBBnblwHelqpqcUYOd
         PFBHVXpVlIk3IWP5+/fsBS4wkO7+b/nxCT0E6ltu1iy3MJi/G79dZ8YkP0Ny2nWzC1Tp
         Qb4VIkmH878+v2cOTA3Swa1fepWES/rHu9kBiBcREYPwPwvkkp7dNFXKsWeaW6X3MR0k
         Dlr5CrZZL5jCYnIT3kV+8O+ZCycLlH6RnxhihfZ0qTf8MRRm1kxBeVzi9JmdAc5DYGum
         cMW+IwnfT6kUt3FIKQsRgp1nuGUccEmIgcpaW7VKKq4s4uP5B+YHi3DHFQiqewmRENNR
         oAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A4wzsYdI/UBS/hDiEwuJ9S9NtfpinD6pNSX/pGZnoi0=;
        b=iAbXv9SmyiPn7ycW6uAAfEWp1y+f+OKuafjSppWDm8m1XhrWJLZVgOt7aGZeWCgAEU
         lDco3evD2orAF0wKchDLcMqFmsP954y3CBg1Fs5dcBk6ntoatJRKfRfPOCwe+vtNfEPH
         xizxU4KEu2g8F2AiQlurwOiKy6+JwCWbTmk4Z7sYDlCMUPIf0dSNiyY50LGV2/1dnfvC
         V+kMJ142NXAZFghn/fY41vxkYlPPdb/ia1JMNLo1C5kDpQAyCLi1vK3QLVqwEjETcjNR
         YKPhtF2MmNYVUqDvYCGu3vsOUWjsLrIBMWWmpwaIlm9LnIM07R+2y67G20oBOyP0p3Xr
         CtUQ==
X-Gm-Message-State: APjAAAXMGv/YlRgxfUb8Jz7nHpWlmf0Y4R0cEMwzkSrtoQWNfVh4n86s
        gZK0DSv/bQ8ZwbzAP0/xOgxY6w==
X-Google-Smtp-Source: APXvYqz1TkesZOhWeSBN/HwWQwxqaB7FjLPheJGtDtKbbjD4OSgqbrYOeUQBZVOE7iQrQzDyw6Xf4g==
X-Received: by 2002:a1c:2c88:: with SMTP id s130mr2007920wms.66.1571733804304;
        Tue, 22 Oct 2019 01:43:24 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id q25sm477231wra.3.2019.10.22.01.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 01:43:23 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [RESEND PATCH v3 1/8] Documentation: devres: add missing entry for devm_platform_ioremap_resource()
Date:   Tue, 22 Oct 2019 10:43:11 +0200
Message-Id: <20191022084318.22256-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191022084318.22256-1-brgl@bgdev.pl>
References: <20191022084318.22256-1-brgl@bgdev.pl>
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
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
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

