Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,SPOOFED_FREEMAIL autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EB45E7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Sun, 15 Sep 2019 08:21:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbfIOIVK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 15 Sep 2019 04:21:10 -0400
Received: from mail-pf1-f169.google.com ([209.85.210.169]:44932 "EHLO
        mail-pf1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725497AbfIOIVK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 15 Sep 2019 04:21:10 -0400
Received: by mail-pf1-f169.google.com with SMTP id q21so20568800pfn.11
        for <linux-doc@vger.kernel.org>; Sun, 15 Sep 2019 01:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=COwhCFSZuyD206So5Np9cxQHBPHyW4DpdMEtN/CcJlA=;
        b=OyqK8tv9sY73hI+IdIC7hq6nA0yNShpDM+Tzh0yz8GnXt/zwU2aaREUAxF3/ylKNIp
         UF+Y7Hw/i9LxNUGXaSzkmimGwWQdFdGlQnaMy+2D4lrYbiLy94MWnwlybzwUKUFxCmkm
         hPuQoE5KpzjL60jU8eZfPsPfFuwzCzjHWaxPgP7HxlYj7Eotgo7oUVTxC+kXzFbteUv5
         Gf08Zaumlj/KckPdG+0mYd/Q1Pil0SK7/F4Kk++hvaO3tgLJnV3rh/W56OQRXJ0tvDK8
         f0eJOlZWPY0kN5VRja3dqHl5AMQGSE5fPM4MPFqp1WPV7loSw2RFQF6e30CTzgOuGFgr
         t6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=COwhCFSZuyD206So5Np9cxQHBPHyW4DpdMEtN/CcJlA=;
        b=J7EU5wTij7Crq2BSsHRYNNkeAcl05//qyezibULg/4sZBtJP46UO1GDoB+AUXAUQOt
         eVUt/tz31PEBts4hTU91BXGeKpLJMdSJeuGe+RiYdyLdSgF6x85UcSM5TdkxqB4Yi4Cs
         Cu39pLa7ms7Jstjr4M7u548DFwqUBzqtM4SDI6L71HTbpZbHO0n+g1eT2ZzYGnBRBiBS
         Y/zqLq4XvENS9Ws7WkGRz/7GuTZaS+unGbaWxvVQdN+tCX1XrOCVB4BHa5XfM02GdjVq
         +TpacEFlehI8b3QaRyffw2AWOBejKgwUC0F/1Wl4OwHmGaVwW4mHWOaxLPbpgzy9dVIl
         wAYQ==
X-Gm-Message-State: APjAAAU3oQTr4I7tNUZKdlBFDVjwa5qGJR/0ngWepjpAYxzI2hNCBC+/
        +2VO8r7vu44FRwhDSLzF14g=
X-Google-Smtp-Source: APXvYqz6EdZVrVKQ5tw7IIpIV/guqhtLo9SFQN8BNNlxqmAIDGi1teGfQ0goJ9HZ3VX7PDRdTWiMhw==
X-Received: by 2002:a17:90a:9201:: with SMTP id m1mr15047735pjo.58.1568535669041;
        Sun, 15 Sep 2019 01:21:09 -0700 (PDT)
Received: from localhost.localdomain (ip-103-85-37-119.syd.xi.com.au. [103.85.37.119])
        by smtp.gmail.com with ESMTPSA id ep10sm7631799pjb.2.2019.09.15.01.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2019 01:21:08 -0700 (PDT)
From:   Adam Zerella <adam.zerella@gmail.com>
Cc:     corbet@lwn.net, Frank.li@nxp.com, linux-doc@vger.kernel.org,
        Adam Zerella <adam.zerella@gmail.com>
Subject: [PATCH v2] docs: perf: Add imx-ddr to documentation index
Date:   Sun, 15 Sep 2019 18:20:10 +1000
Message-Id: <20190915082009.698-1-adam.zerella@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190915054533.22008-1-adam.zerella@gmail.com>
References: <20190915054533.22008-1-adam.zerella@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Sphinx is currently outputting a warning where
the file 'imx-ddr.rst' is not included in the
documentation index. Additionally, the code
highlighting and doc formatting can be slightly
improved.

Signed-off-by: Adam Zerella <adam.zerella@gmail.com>
---

v2: Supress additional indentation warning
---
 Documentation/admin-guide/perf/imx-ddr.rst | 35 ++++++++++++++--------
 Documentation/admin-guide/perf/index.rst   |  1 +
 2 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/Documentation/admin-guide/perf/imx-ddr.rst b/Documentation/admin-guide/perf/imx-ddr.rst
index 517a205abad6..92900b851f5d 100644
--- a/Documentation/admin-guide/perf/imx-ddr.rst
+++ b/Documentation/admin-guide/perf/imx-ddr.rst
@@ -18,7 +18,9 @@ The "format" directory describes format of the config (event ID) and config1
 devices/imx8_ddr0/format/. The "events" directory describes the events types
 hardware supported that can be used with perf tool, see /sys/bus/event_source/
 devices/imx8_ddr0/events/.
-  e.g.::
+
+    .. code-block:: bash
+
         perf stat -a -e imx8_ddr0/cycles/ cmd
         perf stat -a -e imx8_ddr0/read/,imx8_ddr0/write/ cmd
 
@@ -31,22 +33,29 @@ in the driver.
   Filter is defined with two configuration parts:
   --AXI_ID defines AxID matching value.
   --AXI_MASKING defines which bits of AxID are meaningful for the matching.
-        0：corresponding bit is masked.
-        1: corresponding bit is not masked, i.e. used to do the matching.
+
+      - 0: corresponding bit is masked.
+      - 1: corresponding bit is not masked, i.e. used to do the matching.
 
   AXI_ID and AXI_MASKING are mapped on DPCR1 register in performance counter.
   When non-masked bits are matching corresponding AXI_ID bits then counter is
   incremented. Perf counter is incremented if
-          AxID && AXI_MASKING == AXI_ID && AXI_MASKING
+        AxID && AXI_MASKING == AXI_ID && AXI_MASKING
 
   This filter doesn't support filter different AXI ID for axid-read and axid-write
   event at the same time as this filter is shared between counters.
-  e.g.::
-        perf stat -a -e imx8_ddr0/axid-read,axi_mask=0xMMMM,axi_id=0xDDDD/ cmd
-        perf stat -a -e imx8_ddr0/axid-write,axi_mask=0xMMMM,axi_id=0xDDDD/ cmd
-
-  NOTE: axi_mask is inverted in userspace(i.e. set bits are bits to mask), and
-  it will be reverted in driver automatically. so that the user can just specify
-  axi_id to monitor a specific id, rather than having to specify axi_mask.
-  e.g.::
-        perf stat -a -e imx8_ddr0/axid-read,axi_id=0x12/ cmd, which will monitor ARID=0x12
+
+  .. code-block:: bash
+
+      perf stat -a -e imx8_ddr0/axid-read,axi_mask=0xMMMM,axi_id=0xDDDD/ cmd
+      perf stat -a -e imx8_ddr0/axid-write,axi_mask=0xMMMM,axi_id=0xDDDD/ cmd
+
+  .. note::
+
+      axi_mask is inverted in userspace(i.e. set bits are bits to mask), and
+      it will be reverted in driver automatically. so that the user can just specify
+      axi_id to monitor a specific id, rather than having to specify axi_mask.
+
+  .. code-block:: bash
+
+      perf stat -a -e imx8_ddr0/axid-read,axi_id=0x12/ cmd, which will monitor ARID=0x12
diff --git a/Documentation/admin-guide/perf/index.rst b/Documentation/admin-guide/perf/index.rst
index ee4bfd2a740f..47c99f40cc16 100644
--- a/Documentation/admin-guide/perf/index.rst
+++ b/Documentation/admin-guide/perf/index.rst
@@ -8,6 +8,7 @@ Performance monitor support
    :maxdepth: 1
 
    hisi-pmu
+   imx-ddr
    qcom_l2_pmu
    qcom_l3_pmu
    arm-ccn
-- 
2.21.0

