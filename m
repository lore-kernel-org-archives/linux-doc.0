Return-Path: <SRS0=3V3V=AK=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A74A6C433E0
	for <linux-doc@archiver.kernel.org>; Mon, 29 Jun 2020 21:04:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 89B872073E
	for <linux-doc@archiver.kernel.org>; Mon, 29 Jun 2020 21:04:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LdqciQKk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731194AbgF2VEY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 29 Jun 2020 17:04:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731113AbgF2TMo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Jun 2020 15:12:44 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EACBEC0147C1
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2020 01:25:08 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id u9so3205391pls.13
        for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2020 01:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9NfPVc9X1tGAaTQ7LTtkR4j1ayN5pMJRPHgx7xTYQLA=;
        b=LdqciQKkXx0vF40NVmUbSHqVzrdkPFKV3dLzzHZQ0CmTxL0oifFIHpiE1eOCfrV+cj
         3cVFOU1CWsgeA4WPaCLwixL8fpHf2gD4VmBWCeugFP0phu7dzgx0EP4jXAFdYovq5cJG
         mqrifK45bUERCQFkFNqN5CCv0cbp9O0w33VxEH9fSjt8seAUkgCj5NWfSlx7GXbXerH+
         3zTNgotZ4LFOJ+OuIfxb02TkTqZNjsAvm094siM8wm3CPW3Xw1zLi37XGdZb0Rf/F3fj
         b5purGoOvV/g6TdTCZgkSYAkw1VmcplH6qmVLCU/WwZMug1lxsBcwO8BPtFaLkGUy4cC
         Y6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9NfPVc9X1tGAaTQ7LTtkR4j1ayN5pMJRPHgx7xTYQLA=;
        b=bSv4TN6x2jXyfgXucVliZfzpsr2GXnwBOlVNdT0LrMEp3rUukDT1fEL+YoW+ULtc6J
         PmYgjf5odPBte8E/08BpJeZLcINXXm61q3lgfJo0anY3hKf77iaiOcIV449XystGpODP
         XgfcUj1pUhaqhtKJqL7J88bUC3itIk1dn4YvP4o+g774i9v9TKVbM+V40BznbHZry3Uc
         T0Q5fKXmYX/dS6Drp7MYNPp7RHoIcwB+7RrCCCL2u1uXTz8UFCjSmTLJpjrgxWxWfzMH
         /VSVqEL3H8xHWhAbAMjaUyuPz0zomPYpV4kysJ7mHwqdSK61PNB9mZYJKGKWTtSPHTC6
         1M3A==
X-Gm-Message-State: AOAM533aE11fAmIL/63jEXmfiWW5Qm82uqXaHj1hyWRKQr7DV83+Wfg7
        huQ3Vm+Wgmv2MXnW4D3Ftpvmdg==
X-Google-Smtp-Source: ABdhPJyR6iTPdisyGhDmgEwBMsi6ZvJ9kAEpwNBdUll/2hJsHd7ZMJ+XKDb/SY3trQjtVNUA1QgVcA==
X-Received: by 2002:a17:902:694b:: with SMTP id k11mr13062647plt.245.1593419108221;
        Mon, 29 Jun 2020 01:25:08 -0700 (PDT)
Received: from localhost ([122.172.127.76])
        by smtp.gmail.com with ESMTPSA id u2sm8807092pfl.21.2020.06.29.01.25.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jun 2020 01:25:07 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rafael Wysocki <rjw@rjwysocki.net>, Arnd Bergmann <arnd@arndb.de>,
        Ben Segall <bsegall@google.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Juri Lelli <juri.lelli@redhat.com>,
        Mel Gorman <mgorman@suse.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-pm@vger.kernel.org, kernel-team@android.com,
        tkjos@google.com, adharmap@codeaurora.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, Quentin Perret <qperret@google.com>
Subject: [PATCH V4 0/3] cpufreq: Allow default governor on cmdline and fix locking issues
Date:   Mon, 29 Jun 2020 13:54:57 +0530
Message-Id: <cover.1593418662.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

I have picked Quentin's series over my patch, modified both and tested.

V3->V4:
- Do __module_get() for cpufreq_default_governor() case as well and get
  rid of an extra variable.
- Use a single character array, default_governor, instead of two of them.

V2->V3:
- default_governor is a string now and we don't set it on governor
  registration or unregistration anymore.
- Fixed locking issues in cpufreq_init_policy().

--
Viresh

Original cover letter fro Quentin:

This series enables users of prebuilt kernels (e.g. distro kernels) to
specify their CPUfreq governor of choice using the kernel command line,
instead of having to wait for the system to fully boot to userspace to
switch using the sysfs interface. This is helpful for 2 reasons:
  1. users get to choose the governor that runs during the actual boot;
  2. it simplifies the userspace boot procedure a bit (one less thing to
     worry about).

To enable this, the first patch moves all governor init calls to
core_initcall, to make sure they are registered by the time the drivers
probe. This should be relatively low impact as registering a governor
is a simple procedure (it gets added to a llist), and all governors
already load at core_initcall anyway when they're set as the default
in Kconfig. This also allows to clean-up the governors' init/exit code,
and reduces boilerplate.

The second patch introduces the new command line parameter, inspired by
its cpuidle counterpart. More details can be found in the respective
patch headers.

Changes in v2:
 - added Viresh's ack to patch 01
 - moved the assignment of 'default_governor' in patch 02 to the governor
   registration path instead of the driver registration (Viresh)

Quentin Perret (2):
  cpufreq: Register governors at core_initcall
  cpufreq: Specify default governor on command line

Viresh Kumar (1):
  cpufreq: Fix locking issues with governors

 .../admin-guide/kernel-parameters.txt         |  5 ++
 Documentation/admin-guide/pm/cpufreq.rst      |  6 +-
 .../platforms/cell/cpufreq_spudemand.c        | 26 +-----
 drivers/cpufreq/cpufreq.c                     | 87 ++++++++++++-------
 drivers/cpufreq/cpufreq_conservative.c        | 22 ++---
 drivers/cpufreq/cpufreq_ondemand.c            | 24 ++---
 drivers/cpufreq/cpufreq_performance.c         | 14 +--
 drivers/cpufreq/cpufreq_powersave.c           | 18 +---
 drivers/cpufreq/cpufreq_userspace.c           | 18 +---
 include/linux/cpufreq.h                       | 14 +++
 kernel/sched/cpufreq_schedutil.c              |  6 +-
 11 files changed, 100 insertions(+), 140 deletions(-)

-- 
2.25.0.rc1.19.g042ed3e048af

