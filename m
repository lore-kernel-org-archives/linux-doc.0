Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AD05C433E6
	for <linux-doc@archiver.kernel.org>; Sat,  6 Feb 2021 03:05:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 215F564F95
	for <linux-doc@archiver.kernel.org>; Sat,  6 Feb 2021 03:05:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232001AbhBFDFG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 5 Feb 2021 22:05:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231731AbhBFCxB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 Feb 2021 21:53:01 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B639DC0698E1
        for <linux-doc@vger.kernel.org>; Fri,  5 Feb 2021 14:26:54 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id w4so8772751ybc.7
        for <linux-doc@vger.kernel.org>; Fri, 05 Feb 2021 14:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=j8xLJ/gRsabqXmVqApH6UU1AJY7QICocc5XvPOoh2CA=;
        b=E5sFvJO7MoqTQ5HU1iZRDkvKf3YEJnMxgLBzB4Bdzzu+OwTihKotepF9+vecFbKNIx
         RMScWAE2zE8rfvaCnxQasMRx1b2r+VjvXf9v4q+HNHmXZS+zJmKBYlJ1jOnNKPkYLUUx
         +9C9RV4z0aszLyrKr2OQQUAT3XhAqGUElzBIGIsskZIGV69KYaqaW83ucTaO/doqcRq5
         aA1hFJJYjJVvodQlIzs4Yf6qBGi+RWhj71EWMUCnJT+YB8Jg9U54RCqfkCTP8s/4Q2lH
         nfjbItiLvc4Ce0s3du8UwLa5Sd+7cG0N/EYOX2N9Kz9ci0pHOQ3JMNDAeaGfizIIj8Tt
         OyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=j8xLJ/gRsabqXmVqApH6UU1AJY7QICocc5XvPOoh2CA=;
        b=OWP/yGRfsMfJoFNfAW4joMQoAxaoiTg0n2XWS9PJwS17VhWeMnyYtEU51sUp/segW0
         YigAvYMfgphVJYaQlw+4rV6+c2zDOa9gCTS/ynwVqCw8gdfXJw77mLxJw14BplHjdxX6
         a0n2mOWdeDu/SD9taq5A3nDuO+xbEA0DD0Em7oxuHjoa0+rjE8daFy8dHxPkFfn7CbTB
         L+GfNOnKlt6XakbPLA3BmbdY4CQnWN9b0qLSTOEl+9mb0Qm0yjJrD12CoMPxeODNSycK
         4O7XSebAQL+4jVq7L1KHO58Qe5MYYiGC0u7u3x0o49E8rGQuLBW1aibj16EyaZy3EL9v
         0Jzg==
X-Gm-Message-State: AOAM531hC5gQMe61/Fo2AgqKolpc6/hGmgrIpUZt36Q26iylFI2jNDUY
        oXjU9fKsiMN7kop6B0yksbBcruPwCnr2dvo=
X-Google-Smtp-Source: ABdhPJwaxJzPZ4XSeGkT3P5EprKNXkjzOOR8qEj+Bd02rhMYgGuOOcL7rRwb/dvXftOqDNpM24CwbGcGHu5s6VY=
Sender: "saravanak via sendgmr" <saravanak@saravanak.san.corp.google.com>
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:6d36:b798:55d7:f5c5])
 (user=saravanak job=sendgmr) by 2002:a25:d648:: with SMTP id
 n69mr8876885ybg.462.1612564014028; Fri, 05 Feb 2021 14:26:54 -0800 (PST)
Date:   Fri,  5 Feb 2021 14:26:38 -0800
In-Reply-To: <20210205222644.2357303-1-saravanak@google.com>
Message-Id: <20210205222644.2357303-3-saravanak@google.com>
Mime-Version: 1.0
References: <20210205222644.2357303-1-saravanak@google.com>
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
Subject: [PATCH v4 2/8] of: property: Don't add links to absent suppliers
From:   Saravana Kannan <saravanak@google.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Len Brown <len.brown@intel.com>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@ucw.cz>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Saravana Kannan <saravanak@google.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

If driver core marks a firmware node as not a device, don't add fwnode
links where it's a supplier.

Fixes: e590474768f1 ("driver core: Set fw_devlink=on by default")
Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/of/property.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 6287c6d60bb7..53d163c8d39b 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1103,7 +1103,9 @@ static int of_link_to_phandle(struct device_node *con_np,
 	 * created for them.
 	 */
 	sup_dev = get_dev_from_fwnode(&sup_np->fwnode);
-	if (!sup_dev && of_node_check_flag(sup_np, OF_POPULATED)) {
+	if (!sup_dev &&
+	    (of_node_check_flag(sup_np, OF_POPULATED) ||
+	     sup_np->fwnode.flags & FWNODE_FLAG_NOT_DEVICE)) {
 		pr_debug("Not linking %pOFP to %pOFP - No struct device\n",
 			 con_np, sup_np);
 		of_node_put(sup_np);
-- 
2.30.0.478.g8a0d178c01-goog

