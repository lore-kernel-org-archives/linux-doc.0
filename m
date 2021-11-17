Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 950FEC433F5
	for <linux-doc@archiver.kernel.org>; Wed, 17 Nov 2021 16:42:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7566661B98
	for <linux-doc@archiver.kernel.org>; Wed, 17 Nov 2021 16:42:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238826AbhKQQpg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 17 Nov 2021 11:45:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238425AbhKQQpY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Nov 2021 11:45:24 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD5D4C061570
        for <linux-doc@vger.kernel.org>; Wed, 17 Nov 2021 08:42:24 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id t30so5853739wra.10
        for <linux-doc@vger.kernel.org>; Wed, 17 Nov 2021 08:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=64PV7+RmunG/9E6HJilpr5yB386ijMaveNECRjD9Bt4=;
        b=NBBApPC+D/7bBUbkpXsPRnIR3jVuJMSojwsTHNfm248OXdiIrquHFgSbchIeIVyuj2
         sqAnKkl9UqF6Cp06ydEorra1mB0Rqh+ztxOUEoE/QfLL6xOK8TrLdpeoMy4b7sMP1Yb9
         A4QwV7kUt3MHn4QvLA4ZCC9eZ2cRfvKicAsPZMkiCvcxKGEygA/aEELwUN0Xwe7y4oxV
         wJ95UYflnzC4q4UtB85DAdd38Z/H4sUp6Nn9hEP4kkVZRs1/OV4q05cLTMljqBMvhLLA
         cWqiYRAmDK1Q6s9h1F5iU4NJE2q1CCvrmCF+oc4xBZAG17aBWElfvlYuq3UrVjfwi9RW
         EbVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=64PV7+RmunG/9E6HJilpr5yB386ijMaveNECRjD9Bt4=;
        b=lHL+YSQFzccpkHhOnwxOp89MNYxhjMizJXjaA+2movWtIG7ASReOZR4tqCiqsU9NaJ
         GoUl9t9EW8fiZdq5fXLq9s4FGYWVdXjSkjNvuNMkbwPou7WZKClus5pzCmef6fhdsXBq
         GakMxt0hRd41UmV+6YtsfY/Zd82T9nC+M34aJiOIJlym7t1du+3kjt0x7iHcva3guRQU
         GIOLjn46zTWfW0LMuMwqlesvrTHU08uWvx7If2qJpa1wq0QAG29Y5hxc1Ukzdnc10WPs
         gLfWta+Fm0po5DGwDFIQ2Vc4jmcyu6FBTIFhmMhe/LBcrm5ofWWgV9seOyjQHOtKsust
         pUsQ==
X-Gm-Message-State: AOAM530Rq19EhCGZM+2mL1P6Lj4hbCGTaAvhWLpkDhhGwrIfCayLZUy9
        p+ejHGctatMA1fxNOV8iARVb1pIJQzjAcg==
X-Google-Smtp-Source: ABdhPJwQVAg3eSgs5RxaR7L0f0tmCPjmddzv6zTwwuyd92yi4xpdiOx2LY41pFVDQrTQvFxgcWyiSw==
X-Received: by 2002:a05:6000:252:: with SMTP id m18mr21687309wrz.117.1637167343500;
        Wed, 17 Nov 2021 08:42:23 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6809:2201:641f:9468:84e3:6055])
        by smtp.gmail.com with ESMTPSA id y7sm347217wrw.55.2021.11.17.08.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 08:42:23 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        coresight@lists.linaro.org
Cc:     corbet@lwn.net, mathieu.poirier@linaro.org, suzuki.poulose@arm.com,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH] Documentation: coresight: Fix documentation issue
Date:   Wed, 17 Nov 2021 16:42:20 +0000
Message-Id: <20211117164220.14883-1-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix the description of the directories and attributes used
in cs_etm as used by perf.

Drop the references to the 'configurations' sub-directory which
had been removed in an earlier version of the patchset.

Fixes: f71cd93d5ea4 ("Documentation: coresight: Add documentation for CoreSight config")
Reported-by: German Gomex <german.gomez@arm.com>
Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 .../trace/coresight/coresight-config.rst         | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/Documentation/trace/coresight/coresight-config.rst b/Documentation/trace/coresight/coresight-config.rst
index a4e3ef295240..6ed13398ca2c 100644
--- a/Documentation/trace/coresight/coresight-config.rst
+++ b/Documentation/trace/coresight/coresight-config.rst
@@ -211,19 +211,13 @@ also declared in the perf 'cs_etm' event infrastructure so that they can
 be selected when running trace under perf::
 
     $ ls /sys/devices/cs_etm
-    configurations  format  perf_event_mux_interval_ms  sinks  type
-    events  nr_addr_filters  power
+    cpu0  cpu2  events  nr_addr_filters		power  subsystem  uevent
+    cpu1  cpu3  format  perf_event_mux_interval_ms	sinks  type
 
-Key directories here are 'configurations' - which lists the loaded
-configurations, and 'events' - a generic perf directory which allows
-selection on the perf command line.::
+The key directory here is 'events' - a generic perf directory which allows
+selection on the perf command line. As with the sinks entries, this provides
+a hash of the configuration name.
 
-    $ ls configurations/
-    autofdo
-    $ cat configurations/autofdo
-    0xa7c3dddd
-
-As with the sinks entries, this provides a hash of the configuration name.
 The entry in the 'events' directory uses perfs built in syntax generator
 to substitute the syntax for the name when evaluating the command::
 
-- 
2.17.1

