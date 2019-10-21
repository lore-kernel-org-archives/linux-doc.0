Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 248557D923
	for <lwn-linux-doc@archive.lwn.net>; Mon, 21 Oct 2019 12:15:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727256AbfJUMPW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 21 Oct 2019 08:15:22 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39874 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727959AbfJUMPV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Oct 2019 08:15:21 -0400
Received: by mail-pg1-f195.google.com with SMTP id p12so7716428pgn.6
        for <linux-doc@vger.kernel.org>; Mon, 21 Oct 2019 05:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=pnzJsmuP9CKg9EDHDwS6w3J2PHJifgSu4We6SYgSAmQ=;
        b=MPXS8Hgx2hMZyNlkxK1TpJq79YlVtmaPiMszJobyCWB6W2W/iMtbsrJ3k8abj8Jjgd
         kKokTdR0uO+rz6zBWhKNqeITZRkQm1P0Hmv50IwnpFD6h/NLMA0ZkRzwp4YoYAAZ0Yrq
         7QN4onmyAX49U1ISSKDimvWDGWYpeWW6Yc/TQ2zvNYmz/QHuegKU8gS55zwiL3U//q26
         AfAmznmph4e8VBioWsB5opWwavJ00Q9dCofFRuLXmZauAJ1bmQH31xAtn7Ji0/Xt5aOq
         95t/l5XDDehU95n2bGCHPHAwoszt9EVvBQRw+jDOtO+GI1oOZo9lab2e34tdUsFEdCFz
         HVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=pnzJsmuP9CKg9EDHDwS6w3J2PHJifgSu4We6SYgSAmQ=;
        b=FrcE+oDbJOtQ32Is9BHkutDf8prd/qdDL4KlXgjP0+JtPFGAQRaF+JCngKaOr84qxX
         VfqabFdP79uA56txBaZLFiC5CI2SxXK9xd8speJwVPhGB8Ym/gC/qsoWbi81e9SyClkr
         e59+UQjiGllYp0v1yUh7jWk3SWTVVsTO6EZZWJifHG6NHezsZOl9DLijIFRHZWyFnZiU
         v+FwmhxmohdYSVEg/Omh8yyZKsq1NaKk/irFjBnnRQhk7ftYc5UWHSwp5QUO9Lb3JVNO
         Mv7P0omAaggj5v8XGh7llqPnruYkhSxKuVnQFAWrjzQRIBrlcJCM/x1qQe56jWwRXTDG
         xz3Q==
X-Gm-Message-State: APjAAAW3bLfpbH42xm0cwPxG6ozkMke6JiNzOKJU/mjfqTLLuWPIn9Fh
        HTIo8dCTuxPLcY83+CMjmNL4+g==
X-Google-Smtp-Source: APXvYqyTx9szRJ/IlXGm9s39CYsVN3ql4UST/yfWvA3CcItmEPfi67K+EXUUV46r2Q/R5XlRwxpzFQ==
X-Received: by 2002:a62:7a8c:: with SMTP id v134mr23078737pfc.143.1571660120619;
        Mon, 21 Oct 2019 05:15:20 -0700 (PDT)
Received: from localhost ([49.248.62.222])
        by smtp.gmail.com with ESMTPSA id 203sm3006606pfa.165.2019.10.21.05.15.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 05:15:19 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        daniel.lezcano@linaro.org, viresh.kumar@linaro.org,
        sudeep.holla@arm.com, bjorn.andersson@linaro.org,
        edubezval@gmail.com, agross@kernel.org, tdas@codeaurora.org,
        swboyd@chromium.org, ilina@codeaurora.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Ben Segall <bsegall@google.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ingo Molnar <mingo@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Mel Gorman <mgorman@suse.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-clk@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: [PATCH v5 0/6] Initialise thermal framework and cpufreq earlier during boot
Date:   Mon, 21 Oct 2019 17:45:09 +0530
Message-Id: <cover.1571656014.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changes since v4:
- Collect Acks
- Pick the US spelling for 'initialis^Hze' consistently.

Changes since v3:
- Init schedutil governor earlier too
- Simplified changes to thermal_init() error path
- Collects Acks

Changes since v2:
- Missed one patch when posting v2. Respinning.

Changes since v1:
- Completely get rid of netlink support in the thermal framework.
- This changes the early init patch to a single line - change to
  core_initcall. Changed authorship of patch since it is nothing like the
  original. Lina, let me know if you feel otherwise.
- I've tested to make sure that the qcom-cpufreq-hw driver continues to
  work correctly as a module so this won't impact Android's GKI plans.
- Collected Acks

Device boot needs to be as fast as possible while keeping under the thermal
envelope. Now that thermal framework is built-in to the kernel, we can
initialize it earlier to enable thermal mitigation during boot.

We also need the cpufreq HW drivers to be initialised earlier to act as the
cooling devices. This series only converts over the qcom-hw driver to
initialize earlier but can be extended to other platforms as well.

Amit Kucheria (6):
  thermal: Remove netlink support
  thermal: Initialize thermal subsystem earlier
  cpufreq: Initialize the governors in core_initcall
  cpufreq: Initialize cpufreq-dt driver earlier
  clk: qcom: Initialize clock drivers earlier
  cpufreq: qcom-hw: Move driver initialization earlier

 .../driver-api/thermal/sysfs-api.rst          |  26 +----
 drivers/clk/qcom/clk-rpmh.c                   |   2 +-
 drivers/clk/qcom/gcc-qcs404.c                 |   2 +-
 drivers/clk/qcom/gcc-sdm845.c                 |   2 +-
 drivers/cpufreq/cpufreq-dt-platdev.c          |   2 +-
 drivers/cpufreq/cpufreq_conservative.c        |   2 +-
 drivers/cpufreq/cpufreq_ondemand.c            |   2 +-
 drivers/cpufreq/cpufreq_performance.c         |   2 +-
 drivers/cpufreq/cpufreq_powersave.c           |   2 +-
 drivers/cpufreq/cpufreq_userspace.c           |   2 +-
 drivers/cpufreq/qcom-cpufreq-hw.c             |   2 +-
 drivers/thermal/thermal_core.c                | 103 +-----------------
 include/linux/thermal.h                       |  11 --
 kernel/sched/cpufreq_schedutil.c              |   2 +-
 14 files changed, 19 insertions(+), 143 deletions(-)

-- 
2.17.1

