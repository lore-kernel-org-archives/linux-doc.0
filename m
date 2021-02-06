Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F81DC433E0
	for <linux-doc@archiver.kernel.org>; Sat,  6 Feb 2021 15:09:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B61264E39
	for <linux-doc@archiver.kernel.org>; Sat,  6 Feb 2021 15:09:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbhBFPJW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 6 Feb 2021 10:09:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbhBFPJT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 6 Feb 2021 10:09:19 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 563A8C061756
        for <linux-doc@vger.kernel.org>; Sat,  6 Feb 2021 07:08:40 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id u15so5102470plf.1
        for <linux-doc@vger.kernel.org>; Sat, 06 Feb 2021 07:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZspU6L37XgcENXFVgUeRV2DHijrkLVw1Znnl1QRz8qQ=;
        b=Pi7VUqJE9S7HbzCe6zVqL1qdjye7sNokP1s+h3GR8Nk4Xx5zudG/G7cdogBLeojNwj
         Uo0obEO2XhTuIY8qKmCOwQs80ZbVerqMWD+GXIfvQAtVJvuoPmyazypubYeNO5fphLUD
         mZChTM6WXoCfeyL/quAOU7bB3gcHPwebhhhM1A4FRnqb7UAcvbpkDvJY9J67/kIvfNKY
         cWwrqajDDJ7hABa8MUPp4W5B73NmN02Q9frVhEHEXRUgCZM0MRdVPbxRsn4JIDHb1Xfh
         uuJW9Z4DeQCK2Vypu1nfM8v4FDNey2UEvy0OGAN9H4ywEWX6W5QnNdqyKbeT+ZFIUsp1
         4f3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZspU6L37XgcENXFVgUeRV2DHijrkLVw1Znnl1QRz8qQ=;
        b=mYbzaG0XkMGqZ5/ovMBGwU9D/M+zED5SEACEsw+GZPpVYSmWFiROmESd+Q6WGjE0+I
         fcwYqslL8zre5SLqM1htm64XVpveLJ0Z+wABXy7KV4ZqyIrVEPumWjWnSk6Nk2ALone9
         COsGFMeP61Bd5UmgyYgX7BMKwHh+UBelD0qOymuYctlb+xmozPIT1Ci05IAmbjWvGJ/J
         PRaEoFvUziNs4RkQtQktBHqnbRxZ8X2Aq2GgA1tUtQ6H7vYOdv24NkxJNcGgNQ20SNxD
         biOG/rxBtNIfvV+3Sv7UwB2yj3f4rCd8C+MyVxYwbo2AaRXTXJQfWsXaa0FaR+WS+bCO
         jjrQ==
X-Gm-Message-State: AOAM5323LdiP/qHnF7xMQ+Ry0SJ4laeaVFecFx8PEFzEP+trR9ofzi+0
        7DixSZ9rYgIOJ+dZZZfNX56uXA==
X-Google-Smtp-Source: ABdhPJwu5jxF7iqb3RH136Hsl5o2diii5bu45/NlStNlwhGDLf0//lIT22219V8yVqUES/fqav9fag==
X-Received: by 2002:a17:90a:5788:: with SMTP id g8mr2809110pji.219.1612624119668;
        Sat, 06 Feb 2021 07:08:39 -0800 (PST)
Received: from localhost ([45.137.216.202])
        by smtp.gmail.com with ESMTPSA id a24sm14483595pff.18.2021.02.06.07.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 07:08:38 -0800 (PST)
From:   Leo Yan <leo.yan@linaro.org>
To:     Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        John Garry <john.garry@huawei.com>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Daniel Kiss <Daniel.Kiss@arm.com>,
        Denis Nikitin <denik@chromium.org>,
        Al Grant <al.grant@arm.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v3 0/8] coresight: etm-perf: Fix pid tracing with VHE
Date:   Sat,  6 Feb 2021 23:08:25 +0800
Message-Id: <20210206150833.42120-1-leo.yan@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch series is to support PID tracing with Virtualization Host
Extensions (VHE).

To be backward compatibility, and can both support PID tracing for the
kernel is running at either EL1 or EL2, the two new PMU formats
"contextid1" and "contextid2" are introduced, which works as switches
to trace PID for EL1 kernel and EL2 kernel respectively.

The existed PMU format "contextid" needs to be backward compatible for
users, it's changed as an alias for "contextid1" on EL1 kernel and for
"contextid2" on EL2 kernel.  Therefore, even without setting "contextid"
config, the perf tool can dynamically pick up the config for PID
tracing, the user doesn't have to set the "contexid" config manually.

This patch series can be cleanly applied on perf/core branch:

  commit cd07e536b020 ("Merge remote-tracking branch 'torvalds/master' into perf/core")

... and applied on the mainline kernel:

  commit 1e0d27fce010 ("Merge branch 'akpm' (patches from Andrew)")

The patch series has been tested on Arm Juno-r2 board.  Verified the
kernel with EL1 and didn't find issue; after some hacking in kernel
driver and tool to emulate the code paths for kernel on EL2, can see
the code path is hit without failure.


Changes from v2:
* Split into two patches for clarification comment on perf options, one
  patch is for kernel change and the another one is for tools' change
  (Suzuki);
* Simplified cs_etm__get_pid_fmt() to return ETM_OPT_CTXTID2 OR
  ETM_OPT_CTXTID, but not both (Suzuki);
* Cached "pid_fmt" in cs_etm_decoder__set_tid() (Suzuki);
* Refined documentation for more clear description for PMU format usages
  (Mike);
* Added Suzuki's and Mike's Reviewed tags.

Changes from v1:
* Refactored PMU formats, added formats "contextid1"/"contextid2", and
  reworked format "contextid" (Suzuki/Mathieu);
* Refined the comments for perf configs (Leo/Mike);
* Added patch 07/07 for description PID tracing in docs;
* Found the issue for bitmap for option, extracted patch 03/07 for the
  fixing.

Changes from RFC:
* Added comments to clarify cases requested (Leo);
* Explain the change to generic flags for cs_etm_set_option() in the
  commit description;
* Stored PID format in metadata and passed it to decoder (Leo);
* Enhanced cs-etm for backward compatibility (Denis Nikitin).


Leo Yan (4):
  coresight: etm-perf: Clarify comment on perf options
  tools headers UAPI: Update tools' copy of linux/coresight-pmu.h
  perf cs-etm: Add helper cs_etm__get_pid_fmt()
  Documentation: coresight: Add PID tracing description

Suzuki K Poulose (4):
  coresight: etm-perf: Support PID tracing for kernel at EL2
  perf cs-etm: Fix bitmap for option
  perf cs-etm: Support PID tracing in config
  perf cs-etm: Detect pid in VMID for kernel running at EL2

 Documentation/trace/coresight/coresight.rst   | 32 ++++++++
 .../hwtracing/coresight/coresight-etm-perf.c  | 32 +++++++-
 .../coresight/coresight-etm4x-core.c          | 13 ++++
 include/linux/coresight-pmu.h                 | 20 +++--
 tools/include/linux/coresight-pmu.h           | 20 +++--
 tools/perf/arch/arm/util/cs-etm.c             | 73 +++++++++++++++----
 .../perf/util/cs-etm-decoder/cs-etm-decoder.c | 38 +++++++++-
 tools/perf/util/cs-etm.c                      | 42 +++++++++++
 tools/perf/util/cs-etm.h                      |  1 +
 9 files changed, 239 insertions(+), 32 deletions(-)

-- 
2.25.1

