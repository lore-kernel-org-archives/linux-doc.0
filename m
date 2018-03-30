Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C97007E8A1
	for <lwn-linux-doc@archive.lwn.net>; Fri, 30 Mar 2018 03:17:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752946AbeC3DRL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Mar 2018 23:17:11 -0400
Received: from mail-wm0-f66.google.com ([74.125.82.66]:51752 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752731AbeC3DP5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Mar 2018 23:15:57 -0400
Received: by mail-wm0-f66.google.com with SMTP id v21so13788432wmc.1
        for <linux-doc@vger.kernel.org>; Thu, 29 Mar 2018 20:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MqNmyguGfYhu4/E+EGeRniZSAKHdV2m4kZR7MbrMg1Y=;
        b=jBkzzMQBz6gwW/Wu4VOObgFowCII/WUztxZxrgbZMLTOxqJMN1U37UAVFjiy8fNJqX
         yGKZSNgh2YWsjhHD1/52imESc5pY1P7ik5DSM2dEdQicVWx4HH/UQvtF3Hz3zPRSctZC
         O8FHr1E4P0Z7jP1+ct6A7QxnrRK2waQVmdsNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MqNmyguGfYhu4/E+EGeRniZSAKHdV2m4kZR7MbrMg1Y=;
        b=CMq75dj6iXfVpSSwgfZxFvsNv/T2xfopp3tDMrvJLKhmEf0r/wLCwWTaPbs9ehDinv
         AR/1IU7F+ezCgxvXhTeExRyapgPxzau99SsXn/nJX+gMoz5LNgOjNiBc0QR7RhJQadqd
         bcwDrTUPhZbFoH1vLX6TjJIVGKSfZnhye3fl5gKdarKMhqwpImsFOBAiTPzxo4omoPY4
         XcjuxSCLcPCVmFO4mI5ED4h3nJZ943DA98a2f1u+5iD/1cr1dlc08SgFKWcVQm6kbXW9
         lnv3COdXnQyPmDW/ysc0pGwS1VCO1+7SYxkvMGdj5jQ5OoW/5/KFF9Vuwy6TzkfIdWsE
         33Ow==
X-Gm-Message-State: AElRT7HWq1ayuRS8PihXq7xxl6PAE/v69RtBgwCPKj8OP2ZqzFbnbuCT
        Gzh4+LtLy4XXVT4H7hOIN7bk7g==
X-Google-Smtp-Source: AIpwx4+RC2b78jDb5hc0N6RgrpOrIvU+X3ug1g3bbKSRcqdH0spgsJWspsCWlVCEXN8sdAmwsuJmlg==
X-Received: by 10.28.202.25 with SMTP id a25mr939986wmg.45.1522379756161;
        Thu, 29 Mar 2018 20:15:56 -0700 (PDT)
Received: from localhost.localdomain (li622-172.members.linode.com. [212.71.249.172])
        by smtp.gmail.com with ESMTPSA id z9sm12798903wrz.4.2018.03.29.20.15.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 29 Mar 2018 20:15:55 -0700 (PDT)
From:   Leo Yan <leo.yan@linaro.org>
To:     Jonathan Corbet <corbet@lwn.net>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        Kim Phillips <kim.phillips@arm.com>,
        Mike Leach <mike.leach@linaro.org>
Cc:     Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v4 2/6] doc: Add documentation for Coresight panic kdump
Date:   Fri, 30 Mar 2018 11:15:20 +0800
Message-Id: <1522379724-30648-3-git-send-email-leo.yan@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1522379724-30648-1-git-send-email-leo.yan@linaro.org>
References: <1522379724-30648-1-git-send-email-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add detailed documentation for Coresight panic kdump, which contains
the idea for why need Coresight panic kdump and introduce the
implementation of Coresight panic kdump framework; the last section is
to explain what's usage.

Credits to Mathieu Poirier for many suggestions since the first version
patch reviewing.  The suggestions include using an array to manage dump
related info, this makes code scalable for more CPUs; the Coresight
kdump driver and integration kdump flow with other Coresight devices
also have many ideas from Mathieu.

Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 .../trace/coresight/coresight-panic-kdump.txt      | 130 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 131 insertions(+)
 create mode 100644 Documentation/trace/coresight/coresight-panic-kdump.txt

diff --git a/Documentation/trace/coresight/coresight-panic-kdump.txt b/Documentation/trace/coresight/coresight-panic-kdump.txt
new file mode 100644
index 0000000..c02e520
--- /dev/null
+++ b/Documentation/trace/coresight/coresight-panic-kdump.txt
@@ -0,0 +1,130 @@
+		Coresight Panic Kdump
+		=====================
+
+   Author:   Leo Yan <leo.yan@linaro.org>
+   Date:     March 29th, 2018
+
+Introduction
+------------
+
+Coresight has different sinks for trace data, the trace data is quite useful
+for postmortem debugging.  Embedded Trace Buffer (ETB) is one type sink which
+provides on-chip storage of trace data, usually uses SRAM as the buffer with
+several KBs size; if the SoC designs to support 'Local ETF' (ARM DDI 0461B,
+chapter 1.2.7), every CPU has one local ETB buffer so the per CPU trace data
+can avoid being overwritten by each other.  Trace Memory Controller (TMC) is
+another kind sink designed as a successor to the CoreSight ETB to capture trace
+into DRAM.
+
+After Linux kernel panic has occurred, the trace data keeps the last execution
+flow before issues happen.  We could consider the trace data is quite useful for
+postmortem debugging, especially when we can save trace data into DRAM and rely on
+kdump to preserve them into vmcore file; at the end, we can retrieve trace data
+from vmcore file and "offline" to analyze the execution flow.
+
+
+Implementation
+--------------
+
+Coresight panic kdump is a simple framework to support Coresight dump
+functionality when panic happens, it maintains an array for the dump, every array
+item is dedicated to one specific CPU by using CPU number as an index.  For
+'offline' recovery and analysis Coresight tracing data, except should to recovery
+tracing data for sinks, we also need to know CPU tracer configurations; for this
+purpose, the array item is a structure which combines source and sink device
+handlers, the device handler points to Coresight device structure which contains
+dump info: dump buffer base address and buffer size.  Below diagram is to
+present data structures relationship:
+
+  array: coresight_kdump_nodes
+  +------+------+----------------------+
+  | CPU0 | CPU1 |   ...                |
+  +------+------+----------------------+
+     |
+     V
+  coresight_kdump_node              coresight_device
+  +-------------------+             +-------------------+
+  |    source_csdev   | ----------> |    kdump_buf      |
+  +-------------------+      /      +-------------------+
+  |    sink_csdev     | ----'       |    kdump_buf_sz   |
+  +-------------------+             +-------------------+
+
+Every CPU has its own tracer, we need save tracer registers for tracer ID and
+configuration related information as metadata, the metadata is used by tracing
+decoder.  But the tracer has the different configuration at the different phase,
+below diagram explains tracer configurations for different time points: at the
+system boot phase, the tracer is disabled so its registers have not been set;
+after tracer has been enabled or when panic happens, tracer registers have been
+configured, but we need to consider if there has CPU is locked up at panic phase
+then this dead CPU has no chance to handle inter-processor interrupt for panic
+dump; thus we choose tracer enabling phase to save tracer metadata.  Coresight
+panic kdump provides API coresight_kdump_source() as helper function for
+recording tracer metadata.
+
+                     Boot         Enabling     Panic
+
+  Timeline:  ------->|----------->|----------->|----------->
+
+  Tracer:            Disabled     Configured   Configured
+  Sink:              Disabled     Enabled      Enabled with tracing data
+                                    |            |
+                                    |            `--> Tracing data dump
+                                    |
+                                    `--> Tracer metadata dump
+
+After enabling Coresight sink device, function coresight_kdump_sink() is used to
+set sink device handler for related CPU; sink device handler points to Coresight
+device structure, furthermore we can retrieve its ops structure and panic
+callback 'panic_cb' in the ops structure. Coresight panic notifier takes panic CPU
+tracing data with high priority to firstly invoke panic CPU sink callback function,
+then the notifier iterates dump array and invoke callback functions one by one
+for other CPUs.  If one sink device is shared among CPUs, the sink panic
+callback is invoked for the first traversed CPU node and other sequential CPUs
+are skipped.
+
+
+Usage
+-----
+
+Build Linux kernel with enabling 'CONFIG_CORESIGHT_PANIC_KDUMP' configuration.
+
+After system booting up, we need firstly prepare dump-capture kernel, this can
+refer doc [1] chapter 'Load the Dump-capture Kernel' for detailed steps.  Then
+we need enable the Coresight tracer, this can use either perf framework method
+or sysFS interface, please refer doc [2] chapter 'How to use the tracer modules'
+for detailed steps.
+
+When kernel panic happens, the panic kdump records trace data and launches
+dump-capture kernel, we can utilize the dump-capture kernel to save kernel dump
+file, this can refer doc [1] chapter 'Write Out the Dump File'.
+
+After get kernel dump file, we can use 'crash' tool + csdump.so extension to
+extract trace data and generate 'perf.data' file:
+
+  ./crash vmcore vmlinux
+  crash> extend csdump.so
+  crash> csdump output_dir
+
+  We can see in the 'output_dir' there will generate out three files:
+  output_dir/
+  ├── cstrace.bin       -> trace raw data
+  ├── metadata.bin      -> meta data
+  └── perf.data         -> 'perf' format compatible file
+
+Finally use 'perf' tool for offline analysis:
+
+  ./perf script -v -F cpu,event,ip,sym,symoff -i perf.data -k vmlinux --kallsyms /proc/kallsyms
+  [001]         instructions:  ffff000008559ad0 pl011_console_write+0x90
+  [001]         instructions:  ffff000008559230 pl011_read+0x0
+  [001]         instructions:  ffff00000855924c pl011_read+0x1c
+  [001]         instructions:  ffff000008559ae0 pl011_console_write+0xa0
+  [001]         instructions:  ffff000008559ad0 pl011_console_write+0x90
+  [001]         instructions:  ffff000008559230 pl011_read+0x0
+  [001]         instructions:  ffff00000855924c pl011_read+0x1c
+  [001]         instructions:  ffff000008559ae0 pl011_console_write+0xa0
+  [001]         instructions:  ffff000008559ad0 pl011_console_write+0x90
+  [001]         instructions:  ffff000008559230 pl011_read+0x0
+  [001]         instructions:  ffff00000855924c pl011_read+0x1c
+
+[1] Documentation/kdump/kdump.txt
+[2] Documentation/trace/coresight/coresight.txt
diff --git a/MAINTAINERS b/MAINTAINERS
index 7ee1fdc..cc1243b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1333,6 +1333,7 @@ S:	Maintained
 F:	drivers/hwtracing/coresight/*
 F:	Documentation/trace/coresight/coresight.txt
 F:	Documentation/trace/coresight/coresight-cpu-debug.txt
+F:	Documentation/trace/coresight/coresight-panic-kdump.txt
 F:	Documentation/devicetree/bindings/arm/coresight.txt
 F:	Documentation/devicetree/bindings/arm/coresight-cpu-debug.txt
 F:	Documentation/ABI/testing/sysfs-bus-coresight-devices-*
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
