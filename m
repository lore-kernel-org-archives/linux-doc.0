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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC020C433DB
	for <linux-doc@archiver.kernel.org>; Thu,  4 Feb 2021 22:41:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A92864F95
	for <linux-doc@archiver.kernel.org>; Thu,  4 Feb 2021 22:41:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbhBDWk6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Feb 2021 17:40:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230033AbhBDWkr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Feb 2021 17:40:47 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A34FCC061224
        for <linux-doc@vger.kernel.org>; Thu,  4 Feb 2021 14:39:36 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id l197so4787518ybf.17
        for <linux-doc@vger.kernel.org>; Thu, 04 Feb 2021 14:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=0dbkPCei0EVZxiD/xgF8DsX5xGgDmOcId+wNtSYzaY4=;
        b=Fpa96Kq7NFETtqxrJ7hdmqTO6wZkjuxubgRR7/8v7tw0ssWWJXO00+GHBbsCaytH3N
         di/IFDwL3tNHRnlG+ZRfBlrH/Flao5qRyDIv7m8Zj5pbFF7izx3uOMZh6brCNdUyxG4T
         WnRJHR2OwpYnXpY6R/IOM+bgZ29PwcYgwfmAHxBELprTBayUssCjsKTLmN8VT2SLIND6
         FI8XNLLkV5yv3Nq7w6ulX6KqbE0We/Mv6DXgOLku0BkZjGcpGa7tVpZaKBFLzk9NHvcT
         KZC4xDAvCPuBWU3oQqZ9booDuDNuPpJ1SXQWP14XOjQ9f2ctM7X/tifJESiMPNuzcGWs
         NjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=0dbkPCei0EVZxiD/xgF8DsX5xGgDmOcId+wNtSYzaY4=;
        b=m/YF5t5iABWMBO0LXNI1hrt2kkQpKEj/pWAJJcQHR0esPJd9fAS52NQkw4nQiLPOEk
         iUeVQaObmIOTpMj1fMqqxoqeaPVCP2nccBtK3UzFghXY7EsKlXxR6Ge4cy5NwMR+L9ZT
         U78EFjHa5ra8XlkctMXOGyySZGMFFh5yGZx1ufq8BN6MACKSG93m248MynpjxLV44con
         2wuqcGz2SwitWOzCY9qqrL0qCIYoHK/3ItPRAwy6lH1EY03NUZbaCagj4G9dITr/I9yo
         smPBZdXZSIT+EzD3zPpoUOdXTPzU7zezJ4/2B6aY76v1JXZhl5z5zSczVDImT0mclniA
         aU/w==
X-Gm-Message-State: AOAM530IMRu72S5b89oUZ7UIdC6Ce21EOWvQRmRmq6FDNv/Mhwfa90eZ
        A/In043yRCEKrQRDvK47KWnmMvdaNKXH5Jg=
X-Google-Smtp-Source: ABdhPJzFSX+PON0ie+o6EiaxXNdvovbgxp9M0i+ykscDv1cefCl6vtAT+nFkuA4cAkgfz5AnpSUCldUZ6G7XQok=
Sender: "saravanak via sendgmr" <saravanak@saravanak.san.corp.google.com>
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:8475:2f1d:e8b4:f65a])
 (user=saravanak job=sendgmr) by 2002:a25:83d0:: with SMTP id
 v16mr2494628ybm.40.1612478375921; Thu, 04 Feb 2021 14:39:35 -0800 (PST)
Date:   Thu,  4 Feb 2021 14:39:21 -0800
In-Reply-To: <20210204223921.1693487-1-saravanak@google.com>
Message-Id: <20210204223921.1693487-5-saravanak@google.com>
Mime-Version: 1.0
References: <20210204223921.1693487-1-saravanak@google.com>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH v3 4/4] of: property: Add fw_devlink support for optional properties
From:   Saravana Kannan <saravanak@google.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Len Brown <lenb@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc:     Saravana Kannan <saravanak@google.com>, kernel-team@android.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Marc Zyngier <maz@kernel.org>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Martin Kaiser <martin@kaiser.cx>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Not all DT bindings are mandatory bindings. Add support for optional DT
bindings and mark iommus, iommu-map, dmas as optional DT bindings.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/of/property.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 53d163c8d39b..962109082df1 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1235,6 +1235,7 @@ static struct device_node *parse_##fname(struct device_node *np,	     \
 struct supplier_bindings {
 	struct device_node *(*parse_prop)(struct device_node *np,
 					  const char *prop_name, int index);
+	bool optional;
 };
 
 DEFINE_SIMPLE_PROP(clocks, "clocks", "#clock-cells")
@@ -1308,12 +1309,12 @@ static struct device_node *parse_interrupts(struct device_node *np,
 static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_clocks, },
 	{ .parse_prop = parse_interconnects, },
-	{ .parse_prop = parse_iommus, },
-	{ .parse_prop = parse_iommu_maps, },
+	{ .parse_prop = parse_iommus, .optional = true, },
+	{ .parse_prop = parse_iommu_maps, .optional = true, },
 	{ .parse_prop = parse_mboxes, },
 	{ .parse_prop = parse_io_channels, },
 	{ .parse_prop = parse_interrupt_parent, },
-	{ .parse_prop = parse_dmas, },
+	{ .parse_prop = parse_dmas, .optional = true, },
 	{ .parse_prop = parse_power_domains, },
 	{ .parse_prop = parse_hwlocks, },
 	{ .parse_prop = parse_extcon, },
@@ -1368,6 +1369,11 @@ static int of_link_property(struct device_node *con_np, const char *prop_name)
 
 	/* Do not stop at first failed link, link all available suppliers. */
 	while (!matched && s->parse_prop) {
+		if (s->optional && !fw_devlink_is_strict()) {
+			s++;
+			continue;
+		}
+
 		while ((phandle = s->parse_prop(con_np, prop_name, i))) {
 			matched = true;
 			i++;
-- 
2.30.0.365.g02bc693789-goog

