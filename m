Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AA7A67E6B2
	for <lwn-linux-doc@archive.lwn.net>; Mon, 16 Apr 2018 19:35:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752934AbeDPTfj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 16 Apr 2018 15:35:39 -0400
Received: from mail-pl0-f66.google.com ([209.85.160.66]:42562 "EHLO
        mail-pl0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753437AbeDPTfe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 Apr 2018 15:35:34 -0400
Received: by mail-pl0-f66.google.com with SMTP id t20-v6so10593548ply.9
        for <linux-doc@vger.kernel.org>; Mon, 16 Apr 2018 12:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mwxs/3GSnnpGv40NGEimJRnXh8ZyV7w1diNPqpQj8MM=;
        b=XaNCUzOzrU77Li4mek0j4Om9plooqIzFi3zD64/maHQ3yl1gdB9vs3Mvyyjpv+8nbT
         +2pN2iMR2RJEDj1trgZ1wHSPMBgo1unEj3ze1a5XwLd/4vGzWujXgY71vIPiwLvuU4Pt
         /toINP3YYW64XlGlq6JCaWr0ivzRe94i9kidc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mwxs/3GSnnpGv40NGEimJRnXh8ZyV7w1diNPqpQj8MM=;
        b=YRYszefU5j1GxiTWxnZIAPXw0SfyxtxY8hiTEzQ6vH/LZR9HmBLq5VGa5PQtSQInhL
         oHEZFXF0DwKpf7ur3houPDkJ2rxqLDe3Dsmd5p9czXNJ0uWN9ig4Mr6qTscdKUq+9DZv
         0aqLc8o8FkBUl8IBdvUnW++uARJ71bMwv7YigmlIgK7081mNpHvc8s8VAQHUZdb2Oi/S
         TEQwQ59GRXZs+jkJ9eH+v5IrW507VrIfn0Ljbzmzd9rhZoqdY6ctIvsJZDZgBBpK7r1N
         YQ4K33tVaVLCOlmPftjLrGzhjiJgxjMTNu9cRcETz9vB8hfFH08kt0apM/gJYFyWmGsw
         lkUA==
X-Gm-Message-State: ALQs6tBRuRKVPSyG/moeQ/f0wZjDAtXCUHMajWQCtRZypb4o98zBZ+fL
        0qId4srTyw3Zk/VfRXea0nd4RQ==
X-Google-Smtp-Source: AIpwx49RAGKkKUzlTNPVffA2aGYSA1zlS6aknUOCG5l11I1UWkXQmAQsCTzABjJcaTPYKLkeRZWvTw==
X-Received: by 2002:a17:902:5992:: with SMTP id p18-v6mr16951630pli.49.1523907334184;
        Mon, 16 Apr 2018 12:35:34 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id b78sm7038785pfj.6.2018.04.16.12.35.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 16 Apr 2018 12:35:33 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ben.Gainey@arm.com
Subject: [PATCH 3/3] coresight: Grouping all perf tools oriented section together
Date:   Mon, 16 Apr 2018 13:35:27 -0600
Message-Id: <1523907327-20979-4-git-send-email-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523907327-20979-1-git-send-email-mathieu.poirier@linaro.org>
References: <1523907327-20979-1-git-send-email-mathieu.poirier@linaro.org>
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
index 8caae8050a60..32c5b159e8fc 100644
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
