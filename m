Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B250A7D90D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 28 Oct 2019 17:34:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729755AbfJ1Rej (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 28 Oct 2019 13:34:39 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45005 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729246AbfJ1Rej (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Oct 2019 13:34:39 -0400
Received: by mail-wr1-f68.google.com with SMTP id z11so10768790wro.11
        for <linux-doc@vger.kernel.org>; Mon, 28 Oct 2019 10:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=v9GEYwUiBW+L+lk1Ll0nCRIM3yrtEBZnNM1K9ZrWkdQ=;
        b=qcMCGu6DF0B3wePXP90toGqIgAKLW+CnEkghw5xSWQfJGfmNlbEZJK0PO5BC/cRy2f
         X/TwcnTNYhkakkpEe5D7PUI4V1Kw8XAaGSeuzhL1G0VvYkNV2lP7rWgDSQQHyoujdzXt
         wdfrm7g2jtleviu2U8NrRyjkeosUtpLRhvJ7NYzXRBBZrzOqBtZjq9H4lSrFJ0hqCeqo
         0YgafMyuuHiDurAUOVeRfdyyh5cwGppAGDnXnbuUDPDnUEExP9n+mhZK4BkxNwBQdj0j
         frw8Ae4+y6FB+7y+YgQ54NTGH9LR6AwoVHffkYrq7t20QjpyRdYNdGgZhp9oWSGLEpW8
         COPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=v9GEYwUiBW+L+lk1Ll0nCRIM3yrtEBZnNM1K9ZrWkdQ=;
        b=JIUAhNfICJ5E2AHc2cyWTuxo6anh145tkphqeiefZQAbw6u5LsKob17x9GCmUQv4kZ
         mb0DfE5Szb1nEW+UMhZg2ZptZg0+s2NBGC50s4BRdwiF9qdwamLKYd7ltMlQLk1j5Mh6
         vm9wg/HROiToL4HxHAFrMVsUVQr+xeDT+YBZOOKGZgvV+CwZjkJkn4OobxEJARrEKMg+
         pPbotl2XGy9Z68KFz2k9os7OYzF/XDeHVpf4RkDNk7WUGzd9LN0Mfa83Mn67KsIVZ2OT
         ZVOBTZ46mnnviThvJT/hf/CI329vSARisPkiRzrIUtW+HrMDtvyvNVOk3D9Dkvr7qF+1
         OjUw==
X-Gm-Message-State: APjAAAW6Yrj5FVpeNHOOO9M7ndfJOSJw7T9MSkwJQJ9fGw0z2oem8lSx
        SaShanxJi3+z2IXBsm/nf5jwCD4OHbM=
X-Google-Smtp-Source: APXvYqwT4xmdwNXjjGfUrHMiiVm44xvHEM7ewaFfToPaslCNGykF0jr30f+MGRyEoqtTTbT5W1WwsA==
X-Received: by 2002:adf:b602:: with SMTP id f2mr2425468wre.49.1572283774795;
        Mon, 28 Oct 2019 10:29:34 -0700 (PDT)
Received: from linaro.org ([2a00:23c5:6815:3901:a072:1d10:8dba:cbb])
        by smtp.gmail.com with ESMTPSA id r19sm14273295wrr.47.2019.10.28.10.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 10:29:34 -0700 (PDT)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-doc@vger.kernel.org, corbet@lwn.net
Cc:     mathieu.poirier@linaro.org, linux-arm-kernel@lists.infradead.org,
        coresight@lists.linaro.org, Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v4 3/4] coresight: docs: Create common sub-directory for coresight trace.
Date:   Mon, 28 Oct 2019 17:29:18 +0000
Message-Id: <20191028172919.19662-4-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191028172919.19662-1-mike.leach@linaro.org>
References: <20191028172919.19662-1-mike.leach@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There are two files in the Documentation/trace directory relating to
coresight, with more to follow, so create a Documentation/trace/coresight
directory and move existing files there. Fixup index to reference
new location.

Update MAINTAINERS to reference this sub-directory rather than the
individual files.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
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

