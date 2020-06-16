Return-Path: <SRS0=G1XG=75=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 449A0C433E2
	for <linux-doc@archiver.kernel.org>; Tue, 16 Jun 2020 16:40:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 29A1220679
	for <linux-doc@archiver.kernel.org>; Tue, 16 Jun 2020 16:40:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Go2w4WPC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729452AbgFPQkS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 16 Jun 2020 12:40:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729557AbgFPQkR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Jun 2020 12:40:17 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B18DC061573
        for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2020 09:40:16 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id q11so21496972wrp.3
        for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2020 09:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=n2NHRnVJc5C6MADoxTFzUsgSIOdIPkV7GWDKSuh8LYo=;
        b=Go2w4WPCylLmbALMzBQK1S5p5HIA2UF8kUfalYYZuEi+oM8rpfFnsJWEw9REsNwibv
         ZFNa1a1qi5kn/kzvFwXrUl5nN8iZEgAgkj+s0U5Q8dgGy+tn4EOvSVJ2YKOGc8MTkl+G
         FzpUdQO5X9c/zsT5qswdlBlyZsLJMPwd7laysY30SxuisShVk/v8SPNsh+IOVrbmIUIV
         2R58yyZ9S7I7EmiLTwKi+dW72oXk/0DHZtegD+MIs6dYiRQNhFILxcs5DWkqZFS5BL9o
         FQ460OG9NYzDbdQ2Xaog7ylhkTQ12yRTaDK8/zmsMknI6DKKKjZ9M9w6VO9lRl2syIqZ
         Swqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=n2NHRnVJc5C6MADoxTFzUsgSIOdIPkV7GWDKSuh8LYo=;
        b=pBu6YDGmGqk7vvPJbXnt2024tzHSrRSKJknRIQroMG5U/pdJFDM0kL/8n7HoKphfeY
         qRMY9+Pv7Z27n9pooefokfrf+wV/KiqZzH+wRzZ2uNzA3Q/+22Om0myKuVVEaki47IdZ
         LNJ1TJmd3h8zXcWXUaN/8bxJ3v5ApJuiIej5S3SwVr8IRbD7v5BoMgV/BJ7U0Fb8tD83
         7R8Sucz6JLartm833z/aMQMVAMrwtf6F9ah1xDELDTy+49zPej1yCR2dGQTX0Ic57ufI
         br6jMTvm2CE+mp5TUtfc0iwH3pNzJVZre/74A6uarg6BBHEF2qWiQIBUdTEiptZkBQo2
         9VQQ==
X-Gm-Message-State: AOAM533YN+Rc9A6/KfUQaDmRzib2449ZseazFjeAbjZZZffoEGMxzvQ/
        ClSRqGuihUL6zc5BeQJxOixMcw==
X-Google-Smtp-Source: ABdhPJwWreG7Y7CLeVlSpKGbSAIZCOj/MG40rFIWNn8jJLxll8XJOve70JeA1trsCvcLLdg4q03IkA==
X-Received: by 2002:a05:6000:18c:: with SMTP id p12mr4249039wrx.66.1592325614772;
        Tue, 16 Jun 2020 09:40:14 -0700 (PDT)
Received: from linaro.org ([2a00:23c5:6801:1801:dc9e:c297:59e5:dbd9])
        by smtp.gmail.com with ESMTPSA id g82sm4843866wmf.1.2020.06.16.09.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 09:40:13 -0700 (PDT)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        coresight@lists.linaro.org, mathieu.poirier@linaro.org
Cc:     suzuki.poulose@arm.com, corbet@lwn.net,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v5 5/5] documentation: coresight: Update CoreSight document for default sink.
Date:   Tue, 16 Jun 2020 17:40:06 +0100
Message-Id: <20200616164006.15309-6-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616164006.15309-1-mike.leach@linaro.org>
References: <20200616164006.15309-1-mike.leach@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Updates the CoreSight documentation to cover the use of default sinks for
both perf and sysfs operations.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 Documentation/trace/coresight/coresight.rst | 48 +++++++++++++++------
 1 file changed, 34 insertions(+), 14 deletions(-)

diff --git a/Documentation/trace/coresight/coresight.rst b/Documentation/trace/coresight/coresight.rst
index 0b73acb44efa..917d89f74c2e 100644
--- a/Documentation/trace/coresight/coresight.rst
+++ b/Documentation/trace/coresight/coresight.rst
@@ -341,17 +341,18 @@ provide details on using both methods.
 1) Using the sysFS interface:
 
 Before trace collection can start, a coresight sink needs to be identified.
-There is no limit on the amount of sinks (nor sources) that can be enabled at
-any given moment.  As a generic operation, all device pertaining to the sink
-class will have an "active" entry in sysfs::
+There is no limit on the amount of sources and sinks that can be enabled at
+any given moment. However, any source will only trace into a single sink.
+As a generic operation, all device pertaining to the sink class will have an
+"active" entry in sysfs::
 
     root:/sys/bus/coresight/devices# ls
-    replicator  20030000.tpiu    2201c000.ptm  2203c000.etm  2203e000.etm
-    20010000.etb         20040000.funnel  2201d000.ptm  2203d000.etm
-    root:/sys/bus/coresight/devices# ls 20010000.etb
+    replicator0  tpiu0  ptm0  etm2  etm3
+    etb0  funnel0  ptm1  etm4
+    root:/sys/bus/coresight/devices# ls etb0
     enable_sink  status  trigger_cntr
-    root:/sys/bus/coresight/devices# echo 1 > 20010000.etb/enable_sink
-    root:/sys/bus/coresight/devices# cat 20010000.etb/enable_sink
+    root:/sys/bus/coresight/devices# echo 1 > etb0/enable_sink
+    root:/sys/bus/coresight/devices# cat etb0/enable_sink
     1
     root:/sys/bus/coresight/devices#
 
@@ -360,10 +361,10 @@ comparator with "_stext" and "_etext", essentially tracing any instruction
 that falls within that range.  As such "enabling" a source will immediately
 trigger a trace capture::
 
-    root:/sys/bus/coresight/devices# echo 1 > 2201c000.ptm/enable_source
-    root:/sys/bus/coresight/devices# cat 2201c000.ptm/enable_source
+    root:/sys/bus/coresight/devices# echo 1 > ptm0/enable_source
+    root:/sys/bus/coresight/devices# cat ptm0/enable_source
     1
-    root:/sys/bus/coresight/devices# cat 20010000.etb/status
+    root:/sys/bus/coresight/devices# cat etb0/status
     Depth:          0x2000
     Status:         0x1
     RAM read ptr:   0x0
@@ -376,13 +377,22 @@ trigger a trace capture::
 
 Trace collection is stopped the same way::
 
-    root:/sys/bus/coresight/devices# echo 0 > 2201c000.ptm/enable_source
+    root:/sys/bus/coresight/devices# echo 0 > ptm0/enable_source
     root:/sys/bus/coresight/devices#
 
+If no sink is enabled before the source is enabled, then a default sink will
+be selected and enabled automatically. Once the source is disabled, then the
+sink used can be read from <source>/last_sink.::
+
+    root:/sys/bus/coresight/devices# echo 1 > ptm0/enable_source
+    root:/sys/bus/coresight/devices# echo 0 > ptm0/enable_source
+    root:/sys/bus/coresight/devices# cat ptm0/last_sink
+    etb0
+    root:/sys/bus/coresight/devices# echo 0 > etb0/enable_sink
+
 The content of the ETB buffer can be harvested directly from /dev::
 
-    root:/sys/bus/coresight/devices# dd if=/dev/20010000.etb \
-    of=~/cstrace.bin
+    root:/sys/bus/coresight/devices# dd if=/dev/etb0 of=~/cstrace.bin
     64+0 records in
     64+0 records out
     32768 bytes (33 kB) copied, 0.00125258 s, 26.2 MB/s
@@ -490,6 +500,16 @@ The syntax within the forward slashes '/' is important.  The '@' character
 tells the parser that a sink is about to be specified and that this is the sink
 to use for the trace session.
 
+Alternatively, if no sink name is given between the //, then the CoreSight
+system will select a default sink::
+
+	root@linaro-nano:~# perf record -e cs_etm//u --per-thread program
+
+The system selects a sink by searching connection path from the source ETM to
+any sink that is on the path.The system will prefer ETR devices over ETB/ETF,
+and where two of the same type are found, the closest to the ETM, in terms of
+connection links.
+
 More information on the above and other example on how to use Coresight with
 the perf tools can be found in the "HOWTO.md" file of the openCSD gitHub
 repository [#third]_.
-- 
2.17.1

