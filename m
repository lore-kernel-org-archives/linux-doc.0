Return-Path: <SRS0=gWHa=AH=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E317AC433E2
	for <linux-doc@archiver.kernel.org>; Fri, 26 Jun 2020 16:56:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9E63206BE
	for <linux-doc@archiver.kernel.org>; Fri, 26 Jun 2020 16:56:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="ODf1qLrK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728062AbgFZQ4P (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 26 Jun 2020 12:56:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727066AbgFZQzz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Jun 2020 12:55:55 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07B8DC03E97A
        for <linux-doc@vger.kernel.org>; Fri, 26 Jun 2020 09:55:55 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id a6so9259503wmm.0
        for <linux-doc@vger.kernel.org>; Fri, 26 Jun 2020 09:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YrSMqNfBoEk4+fX9YqI78/jZTXRW6ktfo7V3K+aMn3w=;
        b=ODf1qLrK8C75l4csBNa28ShD2JvP1VITfSbkol/mVz4l/Nggp0Bxu6tin/T4einR+F
         1Z809a2zXScu/dFsu3KwXrr8dkzFIoAenoEijF3R7CS3+ypa58d+FALuxPB/SnrY8CFJ
         BFMhNFF6borMmZhhnoZEqjF44Hv/xogMioRbNSvLTA0ICZSgmqDCEczzilXj9D4jVWFK
         ZcliQXe5SKPXTncj2Az/MxXb96+bZyW/olb2g3v3fna5IiBXGSETTuBcHLriV4BRwZW4
         tgmO1Vkfaurtx39hQiuXuX8RxrMFg93pzH9AcwbOkogpSkwHmWpCIOfx1u3mGRk4t/KX
         k5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YrSMqNfBoEk4+fX9YqI78/jZTXRW6ktfo7V3K+aMn3w=;
        b=mZ8byLp3OLLd50Xsj9kuJA2HqXxDRdEj0jCzAly1Lchyl62MFPF//NjyTGWStplXBA
         bnWqidZL+PjXvWst1b8FIDhF9VZWgoOTkja4hOWV37S+d+/gB+SCHfQ6R5hOEuT6U4IG
         tVa8irOAgajjLC6nmaxDDV3wefNVCCO+cb29ppopFcUW0YAZNSEoZrQlg9p0GMatcZFB
         wY4bFxLbreS+GX7tyWIN2Q2dEHyYWcVepB/cfYU3ZromKjLHyDQtflt/HoVYuEryq4TX
         rf4LKTLe62+ljzU8RW5TyGBs0Bp9afeBusZoZ/lGfKB5J46Qxi8mPbaVIRXb3tMo+6JJ
         ZWWw==
X-Gm-Message-State: AOAM532mf1cGhBzizqJlwaDMhK996SysdkU+KbcBX5j2HGAXMWQ0vpHi
        DeidGvIzwIHWAh5j+sbZJkTtfg==
X-Google-Smtp-Source: ABdhPJywW9EslIlEG4xGnIIz/FnNGMv7QXiKTP/zXruJmAodeLhm9p3zq3POFS/SVYW2Jb5B4tPX4A==
X-Received: by 2002:a05:600c:2317:: with SMTP id 23mr4569316wmo.72.1593190553746;
        Fri, 26 Jun 2020 09:55:53 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id x5sm18654706wmg.2.2020.06.26.09.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 09:55:53 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 1/5] devres: remove stray space from devm_kmalloc() definition
Date:   Fri, 26 Jun 2020 18:55:31 +0200
Message-Id: <20200626165535.7662-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200626165535.7662-1-brgl@bgdev.pl>
References: <20200626165535.7662-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use the preferred coding style for functions returning pointers.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/base/devres.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/devres.c b/drivers/base/devres.c
index 0bbb328bd17f..c34327219c34 100644
--- a/drivers/base/devres.c
+++ b/drivers/base/devres.c
@@ -807,7 +807,7 @@ static int devm_kmalloc_match(struct device *dev, void *res, void *data)
  * RETURNS:
  * Pointer to allocated memory on success, NULL on failure.
  */
-void * devm_kmalloc(struct device *dev, size_t size, gfp_t gfp)
+void *devm_kmalloc(struct device *dev, size_t size, gfp_t gfp)
 {
 	struct devres *dr;
 
-- 
2.26.1

