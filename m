Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2A7D77E6B0
	for <lwn-linux-doc@archive.lwn.net>; Tue, 17 Apr 2018 16:31:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754367AbeDQQav (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 17 Apr 2018 12:30:51 -0400
Received: from mail-pl0-f66.google.com ([209.85.160.66]:43584 "EHLO
        mail-pl0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755359AbeDQQIO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Apr 2018 12:08:14 -0400
Received: by mail-pl0-f66.google.com with SMTP id a39-v6so12231567pla.10
        for <linux-doc@vger.kernel.org>; Tue, 17 Apr 2018 09:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NdpJ7gm4XaA4BpLhWls5YswaFM5nZTNzYmH8k31uBng=;
        b=kWgAsvli9/RhT4SkwGzZZLxrUxhJDgs18nd2lxqBYk1hXQYflyc57niehvCmPZCJG7
         Z7J14BVO8Jh9xTasyNd6Ljj8nlPG5CuoP/GoEGmOk0gMtMbIyWPP24Ad9UDTWjnjzE8d
         PPBn5CeSSHitvM28nUKffcQSCGCu+C6xO3Ub8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NdpJ7gm4XaA4BpLhWls5YswaFM5nZTNzYmH8k31uBng=;
        b=oDNUQkez+fkCEjVJVoRtM50ltFk+1FWIaT611phw2L2qV+jaEmZuHhH/h/mMtPGgpq
         QbLZbCJMgh+ZXG37OlOBqxf9MA5rZlZQUrPmx1td3G7+xlxvWnSUabdMgVxZ4UKwYZaf
         i+WRR6GEYTi6QPrUgTDGjTSYHLuNdnR4X2ArsMrSPNFTk6kyE4O8c83Jfpu8wFuYod9s
         3KUu7Zav08TIRZeZtEqLauWUYYhowX3IJA6qHayDw/6K3GJ4sBiEOf/8ISIBrL08rbhu
         PS5up4eCvCiPtTqWWP8d3llryyXqrXvH+9M0U2JWREWT69LX8BBsCaVtGIu4xkrNGuLJ
         JbtA==
X-Gm-Message-State: ALQs6tDMbfWPuNurlqDZSRUM1vJlaPVgIdQ/Y9d0OKtB/xoYy4zNqvDV
        M1TrldJwt0xFf58ZWNi6sq3L3kF1Hgs=
X-Google-Smtp-Source: AIpwx4+6Flv1CFMIbQ9BZTOaUF0JDnUSrkG45EzrFmHDwn9BsFVRLdRD0V5FbRE4dZJgT1Dm+AuInQ==
X-Received: by 2002:a17:902:290a:: with SMTP id g10-v6mr1726602plb.155.1523981294268;
        Tue, 17 Apr 2018 09:08:14 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id r81sm34829878pfj.79.2018.04.17.09.08.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 09:08:13 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        rdunlap@infradead.org, Ben.Gainey@arm.com
Subject: [PATCH v2 3/3] coresight: Grouping all perf tools oriented section together
Date:   Tue, 17 Apr 2018 10:08:07 -0600
Message-Id: <1523981287-15370-4-git-send-email-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523981287-15370-1-git-send-email-mathieu.poirier@linaro.org>
References: <1523981287-15370-1-git-send-email-mathieu.poirier@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch groups together section pertaining to the perf tools.  That way
everything is at the same place rather than spread out.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 Documentation/trace/coresight.txt | 72 +++++++++++++++++++--------------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/Documentation/trace/coresight.txt b/Documentation/trace/coresight.txt
index ab0d0f2d5cec..1d74ad0202b6 100644
--- a/Documentation/trace/coresight.txt
+++ b/Documentation/trace/coresight.txt
@@ -345,42 +345,7 @@ More information on the above and other example on how to use Coresight with
 the perf tools can be found in the "HOWTO.md" file of the openCSD gitHub
 repository [3].
 
-How to use the STM module
--------------------------
-
-Using the System Trace Macrocell module is the same as the tracers - the only
-difference is that clients are driving the trace capture rather
-than the program flow through the code.
-
-As with any other CoreSight component, specifics about the STM tracer can be
-found in sysfs with more information on each entry being found in [1]:
-
-root@genericarmv8:~# ls /sys/bus/coresight/devices/20100000.stm
-enable_source   hwevent_select  port_enable     subsystem       uevent
-hwevent_enable  mgmt            port_select     traceid
-root@genericarmv8:~#
-
-Like any other source a sink needs to be identified and the STM enabled before
-being used:
-
-root@genericarmv8:~# echo 1 > /sys/bus/coresight/devices/20010000.etf/enable_sink
-root@genericarmv8:~# echo 1 > /sys/bus/coresight/devices/20100000.stm/enable_source
-
-From there user space applications can request and use channels using the devfs
-interface provided for that purpose by the generic STM API:
-
-root@genericarmv8:~# ls -l /dev/20100000.stm
-crw-------    1 root     root       10,  61 Jan  3 18:11 /dev/20100000.stm
-root@genericarmv8:~#
-
-Details on how to use the generic STM API can be found here [2].
-
-[1]. Documentation/ABI/testing/sysfs-bus-coresight-devices-stm
-[2]. Documentation/trace/stm.txt
-
-
-Using perf tools
-----------------
+2.1) AutoFDO analysis using the perf tools:
 
 perf can be used to record and analyze trace of programs.
 
@@ -428,3 +393,38 @@ sort example is from the AutoFDO tutorial (https://gcc.gnu.org/wiki/AutoFDO/Tuto
 	$ taskset -c 2 ./sort_autofdo
 	Bubble sorting array of 30000 elements
 	5806 ms
+
+
+How to use the STM module
+-------------------------
+
+Using the System Trace Macrocell module is the same as the tracers - the only
+difference is that clients are driving the trace capture rather
+than the program flow through the code.
+
+As with any other CoreSight component, specifics about the STM tracer can be
+found in sysfs with more information on each entry being found in [1]:
+
+root@genericarmv8:~# ls /sys/bus/coresight/devices/20100000.stm
+enable_source   hwevent_select  port_enable     subsystem       uevent
+hwevent_enable  mgmt            port_select     traceid
+root@genericarmv8:~#
+
+Like any other source a sink needs to be identified and the STM enabled before
+being used:
+
+root@genericarmv8:~# echo 1 > /sys/bus/coresight/devices/20010000.etf/enable_sink
+root@genericarmv8:~# echo 1 > /sys/bus/coresight/devices/20100000.stm/enable_source
+
+From there user space applications can request and use channels using the devfs
+interface provided for that purpose by the generic STM API:
+
+root@genericarmv8:~# ls -l /dev/20100000.stm
+crw-------    1 root     root       10,  61 Jan  3 18:11 /dev/20100000.stm
+root@genericarmv8:~#
+
+Details on how to use the generic STM API can be found here [2].
+
+[1]. Documentation/ABI/testing/sysfs-bus-coresight-devices-stm
+[2]. Documentation/trace/stm.txt
+[3]. https://github.com/Linaro/perf-opencsd
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
