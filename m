Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76097C77B73
	for <linux-doc@archiver.kernel.org>; Mon,  1 May 2023 15:02:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232372AbjEAPCD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 May 2023 11:02:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232249AbjEAPCC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 May 2023 11:02:02 -0400
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE459109;
        Mon,  1 May 2023 08:02:00 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3063433fa66so52613f8f.3;
        Mon, 01 May 2023 08:02:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682953319; x=1685545319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0bzRuzupDZbNo5pnSdpKGGKbE//IS+zCF9197CXAuYU=;
        b=IhczvEBl6qxzzUsXqsgGJ9+pUwb4LUj4F/ZRhQo5oRUHAf3t3Rd7/zPlR/nMxAuS5P
         P0DGklDo5M8+hc7Wf/svgVoy/TuBf9lP1cfgKICd2UAYyXWb9bIS2Ol2USj7bvqJtHuw
         6p9R0+eM7uCG6IHRxI/Dvxlvg/VSS8GjeZdExxv4mpx/q/wg/Z/Lpg975LDfSawQ16YG
         lt/exVopg0ruAMUMkhNbIo/60UUELDQgYI7RPlK/Km1KlAdSnyRS3+kXrxcnO1c8gyhg
         RrkzDlmq7l2VlbL95ksGtJPa3TyDMNyuMEBDW0NumcZxyjvby9sumtCHhHea3LU3mopS
         HwEA==
X-Gm-Message-State: AC+VfDzEl66EV+EwZ9DP2m1j5stmTVzdrvINGQ4GMnCHkwkaoz2MZuwV
        sAzxH/1TWLDQonXawzo3g8lf/RM0nczp2A==
X-Google-Smtp-Source: ACHHUZ5s4p7kyRRBpk0y/o3oOdW5pHRnd9vyxo7PPBy/C78YN0IvOSdaucxyAvgLxKYnFJmCvoYgBA==
X-Received: by 2002:adf:cc90:0:b0:2f6:ece3:76a with SMTP id p16-20020adfcc90000000b002f6ece3076amr10234863wrj.8.1682953319086;
        Mon, 01 May 2023 08:01:59 -0700 (PDT)
Received: from costa-tp.bos2.lab ([2a00:a040:1a3:c11b:3ae6:1732:e587:a81f])
        by smtp.gmail.com with ESMTPSA id b2-20020adff902000000b00304aba2cfcbsm12117046wrr.7.2023.05.01.08.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 08:01:58 -0700 (PDT)
From:   Costa Shulyupin <costa.shul@redhat.com>
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     Costa Shulyupin <costa.shul@redhat.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] docs: consolidate human interface subsystems
Date:   Mon,  1 May 2023 18:01:11 +0300
Message-Id: <20230501150111.274666-1-costa.shul@redhat.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

to make the page more organized as requested

Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
---
 Documentation/subsystem-apis.rst | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/Documentation/subsystem-apis.rst b/Documentation/subsystem-apis.rst
index b51f38527e14..287799ee2419 100644
--- a/Documentation/subsystem-apis.rst
+++ b/Documentation/subsystem-apis.rst
@@ -10,6 +10,18 @@ is taken directly from the kernel source, with supplemental material added
 as needed (or at least as we managed to add it — probably *not* all that is
 needed).
 
+Human interaces
+---------------
+
+.. toctree::
+   :maxdepth: 1
+
+   input/index
+   hid/index
+   sound/index
+   gpu/index
+   fb/index
+
 **Fixme**: much more organizational work is needed here.
 
 .. toctree::
@@ -22,9 +34,7 @@ needed).
    block/index
    cdrom/index
    cpu-freq/index
-   fb/index
    fpga/index
-   hid/index
    i2c/index
    iio/index
    isdn/index
@@ -40,12 +50,9 @@ needed).
    w1/index
    watchdog/index
    virt/index
-   input/index
    hwmon/index
-   gpu/index
    accel/index
    security/index
-   sound/index
    crypto/index
    filesystems/index
    mm/index
-- 
2.40.0

