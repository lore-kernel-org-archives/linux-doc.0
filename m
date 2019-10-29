Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E9B9E7D90D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 29 Oct 2019 13:45:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388734AbfJ2NpG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 Oct 2019 09:45:06 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42602 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726858AbfJ2NpG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Oct 2019 09:45:06 -0400
Received: by mail-wr1-f65.google.com with SMTP id a15so1434660wrf.9
        for <linux-doc@vger.kernel.org>; Tue, 29 Oct 2019 06:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P+0Oc6GOerGyuNk9WtLzpm6YaQk20+jlAknGcgRo+Ro=;
        b=lXWxJNCuvWAv/1+m4B/j9Qb70i5KMTdiMgHW/kVI5lg0tkU76gUcfRx9N2CpnJjtwK
         ydit8g6vbrwaNnnikCuV4JMd+yH3U867Rf5+rH6RCZpswrMD3/7jojMQwx1ZCoUhHwOC
         abA6T+hnWmDCQjumKZB1vLYtaE2li2gv9bzQoI0RG45cz/CFIv6BhfDR7eifwONL75tZ
         ca0MFjxI3mHHOuXJE9wS5abouCqlfHW2zI2Ig8LJ/g8iKQm/IVsF+TnKZ/isa3/3R7Nf
         O/4E3gm+AzTpB4YXMZLBJz0wAsX+l4OsSAtVNC//DldF8UKa81TkYcT4f7a4ud6MWwpR
         BJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P+0Oc6GOerGyuNk9WtLzpm6YaQk20+jlAknGcgRo+Ro=;
        b=l27LToFj9bVo2SPS1ZLeptP0B1+0mkHnYrMNqdMuB3tecrLdXMYfJwopeTIHWGsssu
         O9s0Amfx4NMZyEGu9iV1/kjqOR3KGRjgF9kC0gtvugtqMRd0PmCk9fTax1l6CS01H3su
         vU0HiOl5Ibpw0nWbOC0sxZ+/7744A450hbfx8IvsDv5q/1tZhgHwygBjplpYHKCJrUyR
         Kbke+Tc0OM41j+rBToin57w/3gjB5nSPFoC3OigTUdkb9sgB4Srr1KnBV0wmfQY+H1Od
         ojapWh871DgRuCRh2lfSLPslIWbTcsDYNcjOdfsTP0XtddYzPFKr9FU00jjAAa7ZCrcn
         HwbA==
X-Gm-Message-State: APjAAAXNHOvjkLFNVdRCzMa4kbmbrETmQICQw3IBs7MXwLGqiXM8zT9b
        RLvP75fgGOhdxgwhEKQyMe/dfwRWO5Y=
X-Google-Smtp-Source: APXvYqyKBIpmS5k50uusqyNRbKX40wK6+FZC+DUpWQC6FWFDo2c0pFTxkr9KsCtAha+a78/sIhmmSA==
X-Received: by 2002:a5d:66c6:: with SMTP id k6mr19642124wrw.152.1572356703781;
        Tue, 29 Oct 2019 06:45:03 -0700 (PDT)
Received: from localhost.localdomain ([91.217.168.176])
        by smtp.gmail.com with ESMTPSA id j22sm19971400wrd.41.2019.10.29.06.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 06:45:03 -0700 (PDT)
From:   hector.oron@gmail.com
To:     linux-doc@vger.kernel.org
Cc:     corbet@lwn.net,
        =?UTF-8?q?H=C3=A9ctor=20Or=C3=B3n=20Mart=C3=ADnez?= 
        <hector.oron@gmail.com>
Subject: [PATCH] doc: fix warnings for unused files in toctree
Date:   Tue, 29 Oct 2019 14:44:45 +0100
Message-Id: <20191029134445.28323-1-hector.oron@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Héctor Orón Martínez <hector.oron@gmail.com>

There are a bunch of warnings for missing files in the toctree,
and there are files that have been removed.

The following change fix those warnings.

Signed-off-by: Héctor Orón Martínez <hector.oron@gmail.com>
---
 Documentation/admin-guide/device-mapper/index.rst | 1 +
 Documentation/admin-guide/perf/index.rst          | 1 +
 Documentation/gpu/i915.rst                        | 9 ---------
 Documentation/misc-devices/index.rst              | 1 -
 Documentation/usb/index.rst                       | 2 --
 Documentation/usb/text_files.rst                  | 6 ------
 6 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/Documentation/admin-guide/device-mapper/index.rst b/Documentation/admin-guide/device-mapper/index.rst
index 4872fb6d2952..2545e4eaf6e5 100644
--- a/Documentation/admin-guide/device-mapper/index.rst
+++ b/Documentation/admin-guide/device-mapper/index.rst
@@ -20,6 +20,7 @@ Device Mapper
     dm-service-time
     dm-uevent
     dm-zoned
+    dm-clone
     era
     kcopyd
     linear
diff --git a/Documentation/admin-guide/perf/index.rst b/Documentation/admin-guide/perf/index.rst
index 47c99f40cc16..0795994865e0 100644
--- a/Documentation/admin-guide/perf/index.rst
+++ b/Documentation/admin-guide/perf/index.rst
@@ -15,3 +15,4 @@ Performance monitor support
    xgene-pmu
    arm_dsu_pmu
    thunderx2-pmu
+   imx-ddr
diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
index 3415255ad3dc..7d1f65612856 100644
--- a/Documentation/gpu/i915.rst
+++ b/Documentation/gpu/i915.rst
@@ -358,15 +358,6 @@ Batchbuffer Parsing
 .. kernel-doc:: drivers/gpu/drm/i915/i915_cmd_parser.c
    :internal:
 
-Batchbuffer Pools
------------------
-
-.. kernel-doc:: drivers/gpu/drm/i915/i915_gem_batch_pool.c
-   :doc: batch pool
-
-.. kernel-doc:: drivers/gpu/drm/i915/i915_gem_batch_pool.c
-   :internal:
-
 User Batchbuffer Execution
 --------------------------
 
diff --git a/Documentation/misc-devices/index.rst b/Documentation/misc-devices/index.rst
index f11c5daeada5..a57f92dfe49a 100644
--- a/Documentation/misc-devices/index.rst
+++ b/Documentation/misc-devices/index.rst
@@ -20,4 +20,3 @@ fit into other categories.
    isl29003
    lis3lv02d
    max6875
-   xilinx_sdfec
diff --git a/Documentation/usb/index.rst b/Documentation/usb/index.rst
index e55386a4abfb..36b6ebd9a9d9 100644
--- a/Documentation/usb/index.rst
+++ b/Documentation/usb/index.rst
@@ -22,11 +22,9 @@ USB support
     misc_usbsevseg
     mtouchusb
     ohci
-    rio
     usbip_protocol
     usbmon
     usb-serial
-    wusb-design-overview
 
     usb-help
     text_files
diff --git a/Documentation/usb/text_files.rst b/Documentation/usb/text_files.rst
index 6a8d3fcf64b6..1c18c05c3920 100644
--- a/Documentation/usb/text_files.rst
+++ b/Documentation/usb/text_files.rst
@@ -16,12 +16,6 @@ USB devfs drop permissions source
 .. literalinclude:: usbdevfs-drop-permissions.c
     :language: c
 
-WUSB command line script to manipulate auth credentials
--------------------------------------------------------
-
-.. literalinclude:: wusb-cbaf
-   :language: shell
-
 Credits
 -------
 
-- 
2.20.1

