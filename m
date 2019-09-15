Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,SPOOFED_FREEMAIL autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CDE057D2F0
	for <lwn-linux-doc@archive.lwn.net>; Sun, 15 Sep 2019 05:46:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726271AbfIOFqK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 15 Sep 2019 01:46:10 -0400
Received: from mail-pl1-f176.google.com ([209.85.214.176]:32885 "EHLO
        mail-pl1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726268AbfIOFqK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 15 Sep 2019 01:46:10 -0400
Received: by mail-pl1-f176.google.com with SMTP id t11so15081893plo.0
        for <linux-doc@vger.kernel.org>; Sat, 14 Sep 2019 22:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EygRee14TBSeAhkYa1Vk2dikHg+YpN/7o9iYAAfgue0=;
        b=jXTPgc2xziuIpDhoX5IOIsene3eSvdXmc2nHsDhqC+85vGUnIeBGCkxbbYyAVcnp6A
         xaaFFmAL5Uq3mrp/upflswRoiNySFSVnZBS88wRvRomGYcnrXf1xxSF6WBZPwgMSC1DK
         taBVrsav5k76pfo/2JMmnD6Y71TDTOsVF8Dfg1XgRfzO0ucMj8isR7+7sTcxsjiKn2ov
         iV766VU9/rAVAl2Cqff6tZPR4Fjz/x2N86nIsbzMy3TVA0xETxR+uZmMxRETY3Rbq+5Q
         TVf4mrBMdpJFAlsL0CgbovZacVQhRTLKzNPE+xK2BBlRwH8gZmHrxQXZixl3lPJZjZ/I
         34Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EygRee14TBSeAhkYa1Vk2dikHg+YpN/7o9iYAAfgue0=;
        b=tRPIwIDWz/nIu5nhArxQi4OVt/UsAtrPJ4JvepOOO6fRqMuAwJarLfwn4LmmXiTR9O
         q0ktEtlA1ycdM624YDjqvY1KRW7+orcT5XrCHwxlrywRnt7En1P7tuVQuitnqHQ4qGdr
         zjEmuScky5jUiipwnonile79wQC9QTc+XPjO8cKm6JMQ9JyTMm3myZ12dWYxOcucPNMV
         Nlfsp+jsRKpjtk5tAg0Y2ME+1beADifCYWvQO5hBhv7n0c1z/qQ1Uya0kmUmj/r3RTk5
         N1RSYgmHTv/2YQA2VZTHJT4IS6yuMotbjMfYGBdLpDIPyX2fC9AtFdCKAw6CFI42y6kh
         52MA==
X-Gm-Message-State: APjAAAWkv2mXJ38PB2ehFo8K+MYaE2bWBgfZfUEj7UIfFomc3dEeJeHj
        ljVineQ+n+Dj8D6qPP6joasvtK8/TUxMNw==
X-Google-Smtp-Source: APXvYqxTiJVEiYJzqcJjKVGz3L27kP6UmD/UJUBx+JJy9Ho2PdnQ745Ea0hns4iIx82foky6XkrJrw==
X-Received: by 2002:a17:902:7617:: with SMTP id k23mr34690010pll.314.1568526367818;
        Sat, 14 Sep 2019 22:46:07 -0700 (PDT)
Received: from localhost.localdomain (ip-103-85-37-119.syd.xi.com.au. [103.85.37.119])
        by smtp.gmail.com with ESMTPSA id p1sm30500297pfb.112.2019.09.14.22.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2019 22:46:07 -0700 (PDT)
From:   Adam Zerella <adam.zerella@gmail.com>
Cc:     corbet@lwn.net, Frank.li@nxp.com, linux-doc@vger.kernel.org,
        Adam Zerella <adam.zerella@gmail.com>
Subject: [PATCH] docs: perf: Add imx-ddr to documentation index
Date:   Sun, 15 Sep 2019 15:45:33 +1000
Message-Id: <20190915054533.22008-1-adam.zerella@gmail.com>
X-Mailer: git-send-email 2.21.0
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
 Documentation/admin-guide/perf/imx-ddr.rst | 33 ++++++++++++++--------
 Documentation/admin-guide/perf/index.rst   |  1 +
 2 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/Documentation/admin-guide/perf/imx-ddr.rst b/Documentation/admin-guide/perf/imx-ddr.rst
index 517a205abad6..547f0ab403ca 100644
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
 
@@ -31,8 +33,9 @@ in the driver.
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
@@ -41,12 +44,18 @@ in the driver.
 
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

