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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B880C433E0
	for <linux-doc@archiver.kernel.org>; Sat,  6 Feb 2021 02:57:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 52CC764F95
	for <linux-doc@archiver.kernel.org>; Sat,  6 Feb 2021 02:57:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231451AbhBFCzD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 5 Feb 2021 21:55:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231739AbhBFCs2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 Feb 2021 21:48:28 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D8F5C08EBAC
        for <linux-doc@vger.kernel.org>; Fri,  5 Feb 2021 14:27:10 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id v7so8685639ybl.15
        for <linux-doc@vger.kernel.org>; Fri, 05 Feb 2021 14:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=0bK1cCqgN588qufpQS/jjMkFLqvM+XaA6lencJh5Esw=;
        b=pd0J5a0Gj6OJSYp7XH9+FNQHPBJdLZKzDSYwPK5u1ibnaAHv+7CWag8ijunOE9TunY
         rfH4kJBJkTaXTV9oJb29EtaGVzAhamAsrUpD9WxBP9zdpVN+VSy75zOwQ8X3ZfAdhLMe
         mDKrHkXJdOvKIScsXP0LwxtmU+0Z8CAngf3uWgzTxFHgVYCjuL8rAz4Vsox/6LUAxzW5
         MRcdF+4usBPhWiIaGf4NAtDC1+btGYzFBfT9G0+ShzhkBywErl48rl5a4pOA+2aiWGVY
         8M7h6tRlVXuW8kVZ+qFMkd2OawDjkeFzk26X1oEdg4TO44R/lohfBKQybn9mqBUar5JT
         uqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=0bK1cCqgN588qufpQS/jjMkFLqvM+XaA6lencJh5Esw=;
        b=id9JQ1Kv72XdvNFlAgEK6xogGBP55t9e+bl+ZgoskPRoOFzupY9OIDFi0A8EHiy0UB
         GA1cR373D0ht1B1YbbOy3a3qGdA4R54ikWgfChpH/cAn6xgPTRtORgMlRMlIOzX867r4
         a38mhkYy/G1Lqej+oMhssidhSqIyJf76vddz92VJAPZRUS2In1XxFiLVPy7ukjbP9z8E
         DRu14TJAkZR6Ve1V+6/n9yeVGtwI7VDRlTpWE8NyQJ2yefRRYd5+YGRNf4cA6C3lG1js
         H1MxtF+/p0boe+6wRd4RDmRMU02+L39WfuNiNk/iUUnE6QFIQufhUQVnqdQVl8R2Ooit
         1KcA==
X-Gm-Message-State: AOAM533sBpv+yQXaQqLI0vjHSM0RRM9Xyt5eUn/mnAtYV2OuHiS2VfN5
        IGu6yxPDNP0XmcJIje3/3wNGqgJ8isfCXoU=
X-Google-Smtp-Source: ABdhPJw99YDc8d0ycmQvA2pScnXjqnl/G4/xLF7whBdxq6B/zNO/ve0DpZDnU/PkkiSIcO/DWD8tNvRuJW0clJs=
Sender: "saravanak via sendgmr" <saravanak@saravanak.san.corp.google.com>
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:6d36:b798:55d7:f5c5])
 (user=saravanak job=sendgmr) by 2002:a25:743:: with SMTP id
 64mr8649867ybh.333.1612564029679; Fri, 05 Feb 2021 14:27:09 -0800 (PST)
Date:   Fri,  5 Feb 2021 14:26:44 -0800
In-Reply-To: <20210205222644.2357303-1-saravanak@google.com>
Message-Id: <20210205222644.2357303-9-saravanak@google.com>
Mime-Version: 1.0
References: <20210205222644.2357303-1-saravanak@google.com>
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
Subject: [PATCH v4 8/8] clk: Mark fwnodes when their clock provider is added/removed
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
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Saravana Kannan <saravanak@google.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-acpi@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This allows fw_devlink to recognize clock provider drivers that don't
use the device-driver model to initialize the device. fw_devlink will
use this information to make sure consumers of such clock providers
aren't indefinitely blocked from probing, waiting for the power domain
device to appear and bind to a driver.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/clk/clk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 8c1d04db990d..27ff90eacb1f 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -4555,6 +4555,8 @@ int of_clk_add_provider(struct device_node *np,
 	if (ret < 0)
 		of_clk_del_provider(np);
 
+	fwnode_dev_initialized(&np->fwnode, true);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(of_clk_add_provider);
@@ -4672,6 +4674,7 @@ void of_clk_del_provider(struct device_node *np)
 	list_for_each_entry(cp, &of_clk_providers, link) {
 		if (cp->node == np) {
 			list_del(&cp->link);
+			fwnode_dev_initialized(&np->fwnode, false);
 			of_node_put(cp->node);
 			kfree(cp);
 			break;
-- 
2.30.0.478.g8a0d178c01-goog

