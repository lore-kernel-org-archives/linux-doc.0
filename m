Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1D2DC38A2D
	for <linux-doc@archiver.kernel.org>; Mon, 24 Oct 2022 11:49:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbiJXLtk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 24 Oct 2022 07:49:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231730AbiJXLsB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 Oct 2022 07:48:01 -0400
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8226130576
        for <linux-doc@vger.kernel.org>; Mon, 24 Oct 2022 04:43:11 -0700 (PDT)
Received: by mail-pf1-f180.google.com with SMTP id b29so4293983pfp.13
        for <linux-doc@vger.kernel.org>; Mon, 24 Oct 2022 04:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzYckbVTu84cFuvQYLHBAleZORC/YQBRLh0kCNSwM7o=;
        b=iBmB5k8OKAjf/Xfxgs/hagECXPJWV1vTEOyWaHgXEXGGuvWdPS3TIcFuqN2vljOt/3
         nNxtvkj18I0SllZUWw1t8qqvPmaaAP/Ih4C/z6eW1oEg/YHBwNE/UBrQc6mXtkTAyvYj
         FRBgnjpPaQlPvG+Y3I8gbe9DDVTlZH0hAaXfoiGfSlX3bhk3XTqmJy1s3Zn6Jxm7ASHo
         5qpBijR2lRjm+mURr8kmnNH7SvMPVVmMWVtI9kd+jgDbk3k+yebqsm9WcqXOGkuW8EHo
         ONz+AiYuv6fxJZh8VBFUV+IvV75FH4hihqZWU8KhCWTYY3SL2W8//2gxAwO5cZ7vPvF7
         RcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FzYckbVTu84cFuvQYLHBAleZORC/YQBRLh0kCNSwM7o=;
        b=Z6w54uPMQ4pUInYl+jRt/CknefihCyeDWBJboMuNIJR7DNVfowufhiATQx/ilC7bWo
         1kY9GsgcMQmXjyskPgbsxGQ/grXki0mznneg4N3zp8sNCyKczcenL0pl/k+ZBFGSc13l
         Lywz/Zyu4WCRsoYp18RNeBRe+a0tA2SWU9uqEJkyidmtHXOjG2ezSO/D0y8xrwuCWv1W
         8rdiL+PApFsUmI9fWPWReMoxOAmKouyGzSVnMAdLDFpq3pi262kXSKW33OrJiBMt3UMc
         8U1uMQnCgHQGv54X30UXTfyH7s29w4SlPgcwgLyvh5TmpcsradboCLmactVYGaMIzX1Z
         2ABA==
X-Gm-Message-State: ACrzQf0waxZA5ZBJ70pvAk8aRGhdJlwsFV8ar3w8d9SlRNCPjDzVvfLV
        LTfA8sfD6a4pFRNTn5xHXEKb3g==
X-Google-Smtp-Source: AMsMyM7eq4O5TcwFPN0I0cjYrONCrFe9kecGGggyXcsgPXfbT+UNin9IKo2yeDqy+SAw/EfdKKa+7Q==
X-Received: by 2002:a63:2a86:0:b0:46a:eaba:f1f3 with SMTP id q128-20020a632a86000000b0046aeabaf1f3mr27591150pgq.79.1666611383075;
        Mon, 24 Oct 2022 04:36:23 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
        by smtp.gmail.com with ESMTPSA id b8-20020a170903228800b001830ed575c3sm19475075plh.117.2022.10.24.04.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 04:36:22 -0700 (PDT)
From:   Akihiko Odaki <akihiko.odaki@daynix.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jonathan Corbet <corbet@lwn.net>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        "Lee, Chun-Yi" <jlee@suse.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Corentin Chary <corentin.chary@gmail.com>,
        Cezary Jackiewicz <cezary.jackiewicz@gmail.com>,
        Matthew Garrett <mjg59@srcf.ucam.org>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Jonathan Woithe <jwoithe@just42.net>,
        Ike Panhc <ike.pan@canonical.com>,
        Daniel Dadap <ddadap@nvidia.com>,
        Kenneth Chan <kenneth.t.chan@gmail.com>,
        Mattia Dongili <malattia@linux.it>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Azael Avalos <coproscefalo@gmail.com>,
        Lee Jones <lee@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Helge Deller <deller@gmx.de>,
        Robert Moore <robert.moore@intel.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        intel-gfx@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org,
        acpi4asus-user@lists.sourceforge.net,
        ibm-acpi-devel@lists.sourceforge.net, linux-fbdev@vger.kernel.org,
        devel@acpica.org, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 05/22] platform/x86: asus-laptop: Use acpi_video_get_backlight_types()
Date:   Mon, 24 Oct 2022 20:34:56 +0900
Message-Id: <20221024113513.5205-6-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221024113513.5205-1-akihiko.odaki@daynix.com>
References: <20221024113513.5205-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

acpi_video_get_backlight_type() is now deprecated.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 drivers/platform/x86/asus-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index 47b2f8bb6fb5..fb7f9e8ca6c4 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -1854,7 +1854,7 @@ static int asus_acpi_add(struct acpi_device *device)
 	if (result)
 		goto fail_platform;
 
-	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
+	if ((acpi_video_get_backlight_types() & ACPI_BACKLIGHT_VENDOR)) {
 		result = asus_backlight_init(asus);
 		if (result)
 			goto fail_backlight;
-- 
2.37.3

