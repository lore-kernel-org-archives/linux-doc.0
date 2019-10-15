Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D658C7DE7B
	for <lwn-linux-doc@archive.lwn.net>; Tue, 15 Oct 2019 21:21:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727343AbfJOVVD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 15 Oct 2019 17:21:03 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41627 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729526AbfJOVVC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Oct 2019 17:21:02 -0400
Received: by mail-wr1-f65.google.com with SMTP id p4so9663524wrm.8
        for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2019 14:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Dq3rU4Lby8dKxd9LSbXA1tMIoZsiALr+ULF/WaB9EEo=;
        b=rOJJ11N59/RJiU4wFpp62lXcXEbgZ4axYNakFv179BHGhRWL9GNXKVbTPkyVAZC/6/
         AwBR8OJMJtUpuSOfjvNecgf7gBV4onK7sh/y43H9+iW893VPTFPm3r2XGCrR7M39QhyE
         afo7BVhydlM6Ygqbcs1Dq7rnBGKP5f7kJ4h6WYuQVCJzfatTd3kaifGttBqPjeuyrdiA
         5R2BbbH+emp7gkSRh0KNAQzoEGABFnrh+vqPtnGYTvsbqzrXEXdY2GCZGXLpCEvnjc4z
         LK1pp/30BafCCoCjSDCZYmB3ksOb4sjySOr8VkGGsUt7T2rmvG8Suzl1ByFrDhbpH6GZ
         T37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Dq3rU4Lby8dKxd9LSbXA1tMIoZsiALr+ULF/WaB9EEo=;
        b=uSVMm5i3CjUlPSZ/W8PWN7I8Lb3Qyx9tDYCQw/cW16+qeX3pIymPWL9g3yW4zfzS+y
         zxsRdC3XBqjVa/wR9VkU1ZqErw9vSkvElRcqcN6S7xkSRVbUVIMczM0UlHfEvoA8aTAy
         Th0uiMzKX5Qf/aWf8+0WhONE9w2g0HniXTOYlz8RgkzlY86INMDsXdza6S8Vl0T4jUxj
         u7neLJm0N/yVrVtvaya8BYY7hSnnAjwGsaiDRnwsjaLBj6jwEFkfEfInWYyTlTJalN0V
         3ep3EFOSVgv5ro5UHO+T8VY8+LEV310jrls17Ig9xVAVFcryTpET2GbtgLxDdcwISWiY
         OvxA==
X-Gm-Message-State: APjAAAW4BWtpjHpGENJCmpPqIYdKxLLQxJfuSooM8A+lQOaNjLpgBbYv
        7R8iBoVcqo8g1Fba/W+sRMRQFA==
X-Google-Smtp-Source: APXvYqxLphcf7uqpOFSJsUgKXrjRXhyaHe51oiz20Gcv9OdCzKx3ZseZi3quOnQtgeq+bBSGnyv1rg==
X-Received: by 2002:a5d:6942:: with SMTP id r2mr30992500wrw.363.1571174461023;
        Tue, 15 Oct 2019 14:21:01 -0700 (PDT)
Received: from linaro.org ([2a00:23c5:6815:3901:39d2:21a2:678a:9501])
        by smtp.gmail.com with ESMTPSA id g185sm517649wme.10.2019.10.15.14.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 14:21:00 -0700 (PDT)
From:   Mike Leach <mike.leach@linaro.org>
To:     mike.leach@linaro.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Cc:     mathieu.poirier@linaro.org, corbet@lwn.net,
        gregkh@linuxfoundation.org, suzuki.poulose@arm.com
Subject: [PATCH v3 10/11] coresight: docs: Create common sub-directory for coresight trace.
Date:   Tue, 15 Oct 2019 22:20:03 +0100
Message-Id: <20191015212004.24748-11-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191015212004.24748-1-mike.leach@linaro.org>
References: <20191015212004.24748-1-mike.leach@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There are two files in the Documentation/trace directory relating to
coresight, with more to follow, so create a Documentation/trace/coresight
directory and move existing files there. Update MAINTAINERS to reference
this sub-directory rather than the individual files.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 Documentation/trace/{ => coresight}/coresight-cpu-debug.rst | 0
 Documentation/trace/{ => coresight}/coresight.rst           | 2 +-
 Documentation/trace/{ => coresight}/stm.rst                 | 0
 MAINTAINERS                                                 | 3 +--
 4 files changed, 2 insertions(+), 3 deletions(-)
 rename Documentation/trace/{ => coresight}/coresight-cpu-debug.rst (100%)
 rename Documentation/trace/{ => coresight}/coresight.rst (99%)
 rename Documentation/trace/{ => coresight}/stm.rst (100%)

diff --git a/Documentation/trace/coresight-cpu-debug.rst b/Documentation/trace/coresight/coresight-cpu-debug.rst
similarity index 100%
rename from Documentation/trace/coresight-cpu-debug.rst
rename to Documentation/trace/coresight/coresight-cpu-debug.rst
diff --git a/Documentation/trace/coresight.rst b/Documentation/trace/coresight/coresight.rst
similarity index 99%
rename from Documentation/trace/coresight.rst
rename to Documentation/trace/coresight/coresight.rst
index 72f4b7ef1bad..835e8aa0bf8c 100644
--- a/Documentation/trace/coresight.rst
+++ b/Documentation/trace/coresight/coresight.rst
@@ -493,6 +493,6 @@ Details on how to use the generic STM API can be found here [#second]_.
 
 .. [#first] Documentation/ABI/testing/sysfs-bus-coresight-devices-stm
 
-.. [#second] Documentation/trace/stm.rst
+.. [#second] Documentation/trace/coresight/stm.rst
 
 .. [#third] https://github.com/Linaro/perf-opencsd
diff --git a/Documentation/trace/stm.rst b/Documentation/trace/coresight/stm.rst
similarity index 100%
rename from Documentation/trace/stm.rst
rename to Documentation/trace/coresight/stm.rst
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

