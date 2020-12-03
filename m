Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B525C6369E
	for <linux-doc@archiver.kernel.org>; Thu,  3 Dec 2020 03:10:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 314CB221FB
	for <linux-doc@archiver.kernel.org>; Thu,  3 Dec 2020 03:10:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726160AbgLCDKS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 2 Dec 2020 22:10:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725920AbgLCDKR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Dec 2020 22:10:17 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFEC7C061A4E
        for <linux-doc@vger.kernel.org>; Wed,  2 Dec 2020 19:09:31 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id bj5so354139plb.4
        for <linux-doc@vger.kernel.org>; Wed, 02 Dec 2020 19:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3HPjMiZ7r2vmNOesKbXHx10R/RkIYQVQPBYwT6NlQG0=;
        b=HYvUEoGI49+MPUkaFo90T8oSv8t7B1B2PHAwPzjXWy8nnUV00Ioup69H2B2Vnt4yaG
         EUON+5/nB36QJdMsrhFNnr47nFjhPBpBrrsEtK7Q3Nw6Uenez408SBlRqp5lrChHC4Ot
         n6yjmD0hXKg0UzAfOetXQoVKoJ3Pl/DBY68hY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3HPjMiZ7r2vmNOesKbXHx10R/RkIYQVQPBYwT6NlQG0=;
        b=RQANXPgxqHzf46InDURwy7/fKyMBMSSYOf6eJcR/K12loTbCkcbIUIhepMsADRbIWU
         DaAwXAOaJVjLprRt4q+YZoeRb5rnvaevmDUSPv4RCHGWH/nOjS/e1U3BNVY+zBpm7ZTc
         F1uwlisOtLEt8c9VfPxruQhgXwDRxLZC8b0w7JRQdFufPZ6+B3SfrCgWEuFcNmhAlVmd
         v5ymv1bR4SW0163PE9SS3wizc4q6rEhVvSdlmiqnNNuIlXgbkTK2FQNZuLF26/WOy6W3
         ny3/yG49yqju9oU4IUkNYICK7QyfoBRIKB4mymR5XOSKQGloI0QpOoSfl5aVJdY+Ihml
         gqEA==
X-Gm-Message-State: AOAM531Wl9jv6LmdOAEGeiPbTsSe5xTOf0dPv+oRF8LlP7Kp3cPrQU7l
        kwbgF98HLYaP0o7sfKInHI4H7g==
X-Google-Smtp-Source: ABdhPJzs72jPCb9LAJ1dMuGsiqN51JYGYYwg3t/CRgNmlP43eFWmRBSPNyHjGxY6tO1qMFv17oK6RA==
X-Received: by 2002:a17:90a:9f98:: with SMTP id o24mr1032229pjp.207.1606964971450;
        Wed, 02 Dec 2020 19:09:31 -0800 (PST)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:a28c:fdff:fef0:49dd])
        by smtp.gmail.com with ESMTPSA id 14sm437080pfz.54.2020.12.02.19.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 19:09:30 -0800 (PST)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        heikki.krogerus@linux.intel.com
Cc:     bleung@chromium.org, Prashant Malani <pmalani@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org (open list:DOCUMENTATION),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] usb: typec: Add bus type for plug alt modes
Date:   Wed,  2 Dec 2020 19:08:47 -0800
Message-Id: <20201203030846.51669-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add the Type C bus for plug alternate modes which are being
registered via the Type C connector class. This ensures that udev events
get generated when plug alternate modes are registered (and not just for
partner/port alternate modes), even though the Type C bus doesn't link
plug alternate mode devices to alternate mode drivers.

Update the Type C bus documentation to mention that there
are alternate mode devices for plugs as well.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 Documentation/driver-api/usb/typec_bus.rst | 6 +++---
 drivers/usb/typec/class.c                  | 8 ++++++--
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/Documentation/driver-api/usb/typec_bus.rst b/Documentation/driver-api/usb/typec_bus.rst
index 21c890ae17e5..7874d2f37d9f 100644
--- a/Documentation/driver-api/usb/typec_bus.rst
+++ b/Documentation/driver-api/usb/typec_bus.rst
@@ -15,9 +15,9 @@ modes by using the SVID and the mode number.
 
 :ref:`USB Type-C Connector Class <typec>` provides a device for every alternate
 mode a port supports, and separate device for every alternate mode the partner
-supports. The drivers for the alternate modes are bound to the partner alternate
-mode devices, and the port alternate mode devices must be handled by the port
-drivers.
+or cable plug supports. The drivers for the alternate modes are bound to the
+partner alternate mode devices, and the port alternate mode devices must be
+handled by the port drivers.
 
 When a new partner alternate mode device is registered, it is linked to the
 alternate mode device of the port that the partner is attached to, that has
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 35eec707cb51..74061a699f16 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -478,8 +478,12 @@ typec_register_altmode(struct device *parent,
 	if (!is_port)
 		typec_altmode_set_partner(alt);
 
-	/* The partners are bind to drivers */
-	if (is_typec_partner(parent))
+	/*
+	 * The partners are bind to drivers.
+	 * Also set the bus field for plug alt modes so that the udev event occurs on device
+	 * registration.
+	 */
+	if (is_typec_partner(parent) || is_typec_plug(parent))
 		alt->adev.dev.bus = &typec_bus;
 
 	ret = device_register(&alt->adev.dev);
-- 
2.29.2.454.gaff20da3a2-goog

