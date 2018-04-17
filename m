Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B961C7E279
	for <lwn-linux-doc@archive.lwn.net>; Tue, 17 Apr 2018 16:31:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754312AbeDQQbk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 17 Apr 2018 12:31:40 -0400
Received: from mail-pg0-f68.google.com ([74.125.83.68]:38151 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755352AbeDQQIN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Apr 2018 12:08:13 -0400
Received: by mail-pg0-f68.google.com with SMTP id b5so4521205pgv.5
        for <linux-doc@vger.kernel.org>; Tue, 17 Apr 2018 09:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OKf9MgUVXhdnUuqeLsv7yHsmJKwdChk3S4Z4m3i1Djc=;
        b=iRTCeOUvPis4sG2UKnjpMbc0K5d94f9iF8dqVtZ0NXCjSRm8K/sfasXwXF2KA+kcf+
         NnIvPGEzqOElpaLekAT5LtXnzBAP7371ZU1GMZPCOHjozgWgMizCg2NzncLoThdKt2JO
         M7271glOmwkk94ByyU60310Wz7lMoG93/rvxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OKf9MgUVXhdnUuqeLsv7yHsmJKwdChk3S4Z4m3i1Djc=;
        b=Pi7G78HYjGk4NfqV7NVBg8OLewvzxSzN1FZDbE8w+mYKIWnpWUD5uglD7XOdFIlOhZ
         OdmwHrTjMJBuuudq3hBVMWlCVYRLAHbvi6tdYLdDU76gOlzTa9lXg5IMfb80+iS7T7mm
         JrAoqd0l5flSPN6DwIWJMD+E430UmiHgpmB/BVdmRmLk4Whbz8p9NjqQTt7DeKr+/5n4
         /1bG7ssy6+FSlU5DzWcSdPi3mRAOoTl7TDCTKvJYWmcH/e10PpHawHjTpFTND4GRsy7y
         J6OU62OPOY5yw5BEAsGd43HrbgmkCzEXKWWpn5oXEVQaBAZcGi4TctMicRrTbPv7/nG9
         SeWA==
X-Gm-Message-State: ALQs6tDH8U8Bi0OumiuFU2BHSjFb0JrCkCSjS/XgK6ngoeKTYoF6BA+k
        khf7JYYmZhSlxGjYdpLzwTl2FA==
X-Google-Smtp-Source: AIpwx4/Or3xJozt8N+sxXnS0RmkTzchNBr3CbfaVlbS0qTr66UpS0zw0wIA/F5sokZzFoxdDQrvXug==
X-Received: by 10.98.155.12 with SMTP id r12mr2492193pfd.15.1523981292698;
        Tue, 17 Apr 2018 09:08:12 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id r81sm34829878pfj.79.2018.04.17.09.08.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 09:08:11 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        rdunlap@infradead.org, Ben.Gainey@arm.com
Subject: [PATCH v2 2/3] coresight: Add section for integration with the perf tools
Date:   Tue, 17 Apr 2018 10:08:06 -0600
Message-Id: <1523981287-15370-3-git-send-email-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523981287-15370-1-git-send-email-mathieu.poirier@linaro.org>
References: <1523981287-15370-1-git-send-email-mathieu.poirier@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Adding a section that document how to use the Coresight framework and
drivers from the perf tools.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 Documentation/trace/coresight.txt | 52 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)

diff --git a/Documentation/trace/coresight.txt b/Documentation/trace/coresight.txt
index 710c75b6c73f..ab0d0f2d5cec 100644
--- a/Documentation/trace/coresight.txt
+++ b/Documentation/trace/coresight.txt
@@ -187,10 +187,19 @@ that can be performed on them (see "struct coresight_ops").  The
 specific to that component only.  "Implementation defined" customisations are
 expected to be accessed and controlled using those entries.
 
+
 How to use the tracer modules
 -----------------------------
 
-Before trace collection can start, a coresight sink needs to be identify.
+There are two ways to use the Coresight framework: 1) using the perf cmd line
+tools and 2) interacting directly with the Coresight devices using the sysFS
+interface.  Preference is given to the former as using the sysFS interface
+requires a deep understanding of the Coresight HW.  The following sections
+provide details on using both methods.
+
+1) Using the sysFS interface:
+
+Before trace collection can start, a coresight sink needs to be identified.
 There is no limit on the amount of sinks (nor sources) that can be enabled at
 any given moment.  As a generic operation, all device pertaining to the sink
 class will have an "active" entry in sysfs:
@@ -295,6 +304,47 @@ Instruction     13570831        0x8026B584      E28DD00C        false   ADD
 Instruction     0       0x8026B588      E8BD8000        true    LDM      sp!,{pc}
 Timestamp                                       Timestamp: 17107041535
 
+2) Using perf framework:
+
+Coresight tracers are represented using the Perf framework's Performance
+Monitoring Unit (PMU) abstraction.  As such the perf framework takes charge of
+controlling when tracing gets enabled based on when the process of interest is
+scheduled.  When configured in a system, Coresight PMUs will be listed when
+queried by the perf command line tool:
+
+	linaro@linaro-nano:~$ ./perf list pmu
+
+		List of pre-defined events (to be used in -e):
+
+		cs_etm//                                    [Kernel PMU event]
+
+	linaro@linaro-nano:~$
+
+Regardless of the number of tracers available in a system (usually equal to the
+amount of processor cores), the "cs_etm" PMU will be listed only once.
+
+A Coresight PMU works the same way as any other PMU, i.e the name of the PMU is
+listed along with configuration options within forward slashes '/'.  Since a
+Coresight system will typically have more than one sink, the name of the sink to
+work with needs to be specified as an event option.  Names for sink to choose
+from are listed in sysFS under ($SYSFS)/bus/coresight/devices:
+
+	root@linaro-nano:~# ls /sys/bus/coresight/devices/
+		20010000.etf   20040000.funnel  20100000.stm  22040000.etm
+		22140000.etm  230c0000.funnel  23240000.etm 20030000.tpiu
+		20070000.etr     20120000.replicator  220c0000.funnel
+		23040000.etm  23140000.etm     23340000.etm
+
+	root@linaro-nano:~# perf record -e cs_etm/@20070000.etr/u --per-thread program
+
+The syntax within the forward slashes '/' is important.  The '@' character
+tells the parser that a sink is about to be specified and that this is the sink
+to use for the trace session.
+
+More information on the above and other example on how to use Coresight with
+the perf tools can be found in the "HOWTO.md" file of the openCSD gitHub
+repository [3].
+
 How to use the STM module
 -------------------------
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
