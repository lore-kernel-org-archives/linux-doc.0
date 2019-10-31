Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0E8987D910
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 Oct 2019 17:58:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729127AbfJaR6j (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 31 Oct 2019 13:58:39 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34011 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726602AbfJaR6j (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 Oct 2019 13:58:39 -0400
Received: by mail-pg1-f193.google.com with SMTP id e4so4542098pgs.1
        for <linux-doc@vger.kernel.org>; Thu, 31 Oct 2019 10:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NdEpwlKLBgKBcXE2fFCtVpGdvVkjrw2sI0goqWCkBdA=;
        b=S1s4ZBDp6uqMHkVpEGnCdWM8Si7bOQukbUsBYHkmhp42sGnfVQUfBqIhbUrZv8/1Bd
         GIPNkDZRN8H2f1dZKKmqB+rzvOwpXGJHC6nQUEkRHPJhGdUa+yfME+7PZSa/gx0aK1Eh
         6TMgI+npdwcCV9RXyX4JrFetgRz9/Uvo5mEm9iVdvha5adtZ7/glQTzdaKySToFqwHIR
         8a1+U2w54ZDu/BPtiMtKgc9QqjqG4DMO35Fj/jWk0i8TUZNTQVH0lxHpxNxc1k2Ednu6
         vqZ9GN9sz3a0gPxRdzFq7uSrrPWpb/dxLWlVNhuFCXaDCVaYvp2hhFpXyxCpd/rD+8nE
         /8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NdEpwlKLBgKBcXE2fFCtVpGdvVkjrw2sI0goqWCkBdA=;
        b=Akg5jb7z1UjzE6jZZX/ImWjugwR5MU+1VTuHMUAsltzmJtLEhRRrewbakVijr4f2gC
         OaLTnfecSjmUgA+/prZvE3AmoVeifBlW1sD6EbC584k7r+pBE2hdTFTTYzg75RQWYQRo
         AKNSzA3QX0qRgnJpFCrZ10s/1NoSFgIrVbhQZyQ+kZ06JsLWgwQSR1/ZeF8JrdRNwIyE
         y/w/PuUD6x9pJuVGo5Jlm3eeCKsTfLuNZ1ST7uN/Eplalul60nMObt78t3Pt53kIctTm
         ADM9k73K28L0qY7Yair8OzHHfpjFaGx+L+89jPGBKqVcgn+1xGllBZA39YBKFPYC7QMe
         Zgbg==
X-Gm-Message-State: APjAAAUsBsVj0NGl7v1g8u/IUv9dSA2B5hLtfFP/+OK0yO5MzP7YRs5u
        1Hqh6sQdn5w/InugjsoiXcB85g==
X-Google-Smtp-Source: APXvYqwd3FlgdzgAYcA2WWKMKif4l8T22wIogkRw7QM8/8o0Cj9nXkWHvBlseKOwuTl7PoNVsM3lhQ==
X-Received: by 2002:a17:90a:9306:: with SMTP id p6mr9028719pjo.68.1572544718745;
        Thu, 31 Oct 2019 10:58:38 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id c6sm4382210pfj.59.2019.10.31.10.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2019 10:58:38 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     corbet@lwn.net
Cc:     mike.leach@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-doc@vger.kernel.org
Subject: [PATCH 3/4] coresight: docs: Create common sub-directory for coresight trace.
Date:   Thu, 31 Oct 2019 11:58:33 -0600
Message-Id: <20191031175834.17548-4-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191031175834.17548-1-mathieu.poirier@linaro.org>
References: <20191031175834.17548-1-mathieu.poirier@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Mike Leach <mike.leach@linaro.org>

There are two files in the Documentation/trace directory relating to
coresight, with more to follow, so create a Documentation/trace/coresight
directory and move existing files there. Fixup index to reference
new location.

Update MAINTAINERS to reference this sub-directory rather than the
individual files.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 .../trace/{ => coresight}/coresight-cpu-debug.rst        | 0
 Documentation/trace/{ => coresight}/coresight.rst        | 2 +-
 Documentation/trace/coresight/index.rst                  | 9 +++++++++
 Documentation/trace/index.rst                            | 3 +--
 MAINTAINERS                                              | 3 +--
 5 files changed, 12 insertions(+), 5 deletions(-)
 rename Documentation/trace/{ => coresight}/coresight-cpu-debug.rst (100%)
 rename Documentation/trace/{ => coresight}/coresight.rst (99%)
 create mode 100644 Documentation/trace/coresight/index.rst

diff --git a/Documentation/trace/coresight-cpu-debug.rst b/Documentation/trace/coresight/coresight-cpu-debug.rst
similarity index 100%
rename from Documentation/trace/coresight-cpu-debug.rst
rename to Documentation/trace/coresight/coresight-cpu-debug.rst
diff --git a/Documentation/trace/coresight.rst b/Documentation/trace/coresight/coresight.rst
similarity index 99%
rename from Documentation/trace/coresight.rst
rename to Documentation/trace/coresight/coresight.rst
index 72f4b7ef1bad..a566719f8e7e 100644
--- a/Documentation/trace/coresight.rst
+++ b/Documentation/trace/coresight/coresight.rst
@@ -489,7 +489,7 @@ interface provided for that purpose by the generic STM API::
     crw-------    1 root     root       10,  61 Jan  3 18:11 /dev/stm0
     root@genericarmv8:~#
 
-Details on how to use the generic STM API can be found here [#second]_.
+Details on how to use the generic STM API can be found here:- :doc:`../stm` [#second]_.
 
 .. [#first] Documentation/ABI/testing/sysfs-bus-coresight-devices-stm
 
diff --git a/Documentation/trace/coresight/index.rst b/Documentation/trace/coresight/index.rst
new file mode 100644
index 000000000000..8d31b155a87c
--- /dev/null
+++ b/Documentation/trace/coresight/index.rst
@@ -0,0 +1,9 @@
+==============================
+CoreSight - ARM Hardware Trace
+==============================
+
+.. toctree::
+   :maxdepth: 2
+   :glob:
+
+   *
diff --git a/Documentation/trace/index.rst b/Documentation/trace/index.rst
index b7891cb1ab4d..04acd277c5f6 100644
--- a/Documentation/trace/index.rst
+++ b/Documentation/trace/index.rst
@@ -23,5 +23,4 @@ Linux Tracing Technologies
    intel_th
    stm
    sys-t
-   coresight
-   coresight-cpu-debug
+   coresight/index
diff --git a/MAINTAINERS b/MAINTAINERS
index 296de2b51c83..f903160b507c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1608,8 +1608,7 @@ R:	Suzuki K Poulose <suzuki.poulose@arm.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	drivers/hwtracing/coresight/*
-F:	Documentation/trace/coresight.rst
-F:	Documentation/trace/coresight-cpu-debug.rst
+F:	Documentation/trace/coresight/*
 F:	Documentation/devicetree/bindings/arm/coresight.txt
 F:	Documentation/devicetree/bindings/arm/coresight-cpu-debug.txt
 F:	Documentation/ABI/testing/sysfs-bus-coresight-devices-*
-- 
2.17.1

