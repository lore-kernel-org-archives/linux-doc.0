Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD3A3C433DB
	for <linux-doc@archiver.kernel.org>; Sat,  6 Feb 2021 02:55:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8754964FA7
	for <linux-doc@archiver.kernel.org>; Sat,  6 Feb 2021 02:55:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231543AbhBFCyr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 5 Feb 2021 21:54:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbhBFCb7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 Feb 2021 21:31:59 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B14BC0698D7
        for <linux-doc@vger.kernel.org>; Fri,  5 Feb 2021 14:26:48 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id w4so8772412ybc.7
        for <linux-doc@vger.kernel.org>; Fri, 05 Feb 2021 14:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=KekFTcOSO4wGAzjYFoTwyn8B3aXY0kSnpBZiIzqgZEQ=;
        b=KrQzTpS6DEL/LCcOb464QcY63wZdOZyXEce3rYox0e/nGOQdvy7laJJKstqsB2NyjQ
         jZtp7noJv+D3j5LbRhVy96dSNljsXiOTyrCUGWuv/JSD+bIejeLKNXrqbCgwGBilJi/2
         oEE561HncfQrVH5rGAj5pGzI1tXoAZtO4SAMKijao3R8oTf7rdFdA9z7kIg92gEcYLot
         ttNIT/yBpvW8eS4kR4/f06jsFYlGYoifws72E7669fzKMKYIaENiMi5Hb5K5PIq+F9G8
         IrKDlnWLqO6ClP2GHCwNFAX6wO37RQwoYo0d7cl1yi7luH1HtnqO+4m85WADDz8irR7V
         biTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=KekFTcOSO4wGAzjYFoTwyn8B3aXY0kSnpBZiIzqgZEQ=;
        b=KQHEr0M4tryRsP5FQWlMi6ZJ//jtmU7V/591GkjHnOfQAnZ9v9/QYXxB910bNZ9A+j
         7A8FQx8FORCwI+eI0Qe5UWWE1W9VaovLNmOxoLoy0K2FA2HSNJkbCYb22JcRP/epDSQZ
         //bOwqzLuVYGbzZFnXF6UK5gS5tl7QzHhKJkOzzmsUwdwlkqC1HMLOH8O7/zJRrDC3eB
         3UOmoxiCk7yntfr6zNArxjs0ht6DB1FldoP2bu4xXItTa2BPRluP5h6eZUqNN92hb6Oo
         SCTww89qQIlSUij8qgTM9wDJiruIgHvU2PkrgGE+IPW+s5oM9b3vDR/tRelzS723Fe9d
         G6mw==
X-Gm-Message-State: AOAM531zF8hEgIKLJi7pgKp+TJhLEbsuCAWq+Iu0lYVr5B4vZPIchLRH
        Wf/Ga4h1VEwN4T4G42w8OGeBzR1CUCYqRZE=
X-Google-Smtp-Source: ABdhPJxm8PTm8GV67URDpWm+ruVimL263DiRMvQSkPWTdfF+6ykLYu749Qsb3g8GDsFUzpQF0GFx6o5daJQkNyM=
Sender: "saravanak via sendgmr" <saravanak@saravanak.san.corp.google.com>
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:6d36:b798:55d7:f5c5])
 (user=saravanak job=sendgmr) by 2002:a25:5f02:: with SMTP id
 t2mr9740666ybb.161.1612564007719; Fri, 05 Feb 2021 14:26:47 -0800 (PST)
Date:   Fri,  5 Feb 2021 14:26:36 -0800
Message-Id: <20210205222644.2357303-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
Subject: [PATCH v4 0/8] Make fw_devlink=on more forgiving
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

There are a lot of devices/drivers where they never have a struct device
created for them or the driver initializes the hardware without ever
binding to the struct device.

This series is intended to avoid any boot regressions due to such
devices/drivers when fw_devlink=on and also address the handling of
optional suppliers.

Patch 1 and 2 addresses the issue of firmware nodes that look like
they'll have struct devices created for them, but will never actually
have struct devices added for them. For example, DT nodes with a
compatible property that don't have devices added for them.

Patch 3 and 4 allow for handling optional DT bindings.

Patch 5 sets up a generic API to handle drivers that never bind with
their devices.

Patch 6 through 8 update different frameworks to use the new API.

Thanks,
Saravana

Saravana Kannan (8):
  driver core: fw_devlink: Detect supplier devices that will never be
    added
  of: property: Don't add links to absent suppliers
  driver core: Add fw_devlink.strict kernel param
  of: property: Add fw_devlink support for optional properties
  driver core: fw_devlink: Handle suppliers that don't use driver core
  irqdomain: Mark fwnodes when their irqdomain is added/removed
  PM: domains: Mark fwnodes when their powerdomain is added/removed
  clk: Mark fwnodes when their clock provider is added/removed

 .../admin-guide/kernel-parameters.txt         |  5 ++
 drivers/base/core.c                           | 58 ++++++++++++++++++-
 drivers/base/power/domain.c                   |  2 +
 drivers/clk/clk.c                             |  3 +
 drivers/of/property.c                         | 16 +++--
 include/linux/fwnode.h                        | 20 ++++++-
 kernel/irq/irqdomain.c                        |  2 +
 7 files changed, 98 insertions(+), 8 deletions(-)

-- 
2.30.0.478.g8a0d178c01-goog

