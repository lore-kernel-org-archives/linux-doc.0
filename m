Return-Path: <SRS0=G1XG=75=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D71C433DF
	for <linux-doc@archiver.kernel.org>; Tue, 16 Jun 2020 16:40:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4736C208B3
	for <linux-doc@archiver.kernel.org>; Tue, 16 Jun 2020 16:40:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IfhLyJyM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729051AbgFPQkL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 16 Jun 2020 12:40:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728928AbgFPQkK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Jun 2020 12:40:10 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F672C061573
        for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2020 09:40:10 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id u26so2632798wmn.1
        for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2020 09:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=9YnYFHSDFso0fOXJihLtGhBF6BHm2kdc2yEvgjFZSLo=;
        b=IfhLyJyMNmzDSSV/StjX50lByTvyQPH5cwg/i2ouZ3scawz9Ws2ZXbzUj3sMoGFYkp
         z9bmwLiPc/i836ZAYwG1k/EczuGLtoSrgEtgmsEu3+N0Pd1N20aUmG/qEnQVjyYpphCk
         tJdD3IF8QPe+YLX8zFovV5c9zHil/g8wUjp2K3k04v8et2E95wbSpaEMrAM1wrPdMVsw
         /r9hZXrrEIp4wSLDjIAgUZ9v4pwNz3nO9IUhrbcS9as/9HdK0SQf1DgTW4xLhosImMUU
         6yAM3NLdzbN60IPeaEQHOL4vlQp/FqcfHspanV/ThlWgxjK+66IzuZYtXZH24gdI9075
         wQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=9YnYFHSDFso0fOXJihLtGhBF6BHm2kdc2yEvgjFZSLo=;
        b=EIK+HflusXkB53PlkKbR8DEO5dy9k9YHB8O0PEZWNvu2cu7s7fbyNH77oab2lVDYJE
         S9LF6z/yKgIQT23LawS6K4dJhmEmau19KyQnh0RTb2id5mmkAoJcw32YaZtk7fiV/MAO
         TsijRhB4nVQQqurbw2p8KS/lHWC1Jz+6mOru/hGwPNtDr3mSsPY6znoPga28UD4bXSL4
         X6DjmaLhNDkyH+YU9M+nEOEF8KAIEfrGA/9sr1QHZggSBg7X/bs5Xp7jVXZ3kIiCtcBf
         sRC9FFIaeq23NVl/9OpqVNUwxBE/K8k6ebD/1eufZfEPcFeWC/z9BEX0uFHdm3L6X0Xn
         aEYQ==
X-Gm-Message-State: AOAM533m4wE7xY/h1xmdVfpbctsjF4aFUpSm8obAl0/30WY8KQese2mo
        yaLg59l5AbwBJv2uNajoC6SkNA==
X-Google-Smtp-Source: ABdhPJwOW/ZcdzOtmgDO7T7j7fpeFuwagPUWSfa/Hl/yBeEfz5zBBT5h5oAt0PPG2VgQ6j/9Xifpxw==
X-Received: by 2002:a7b:c761:: with SMTP id x1mr4341190wmk.90.1592325608924;
        Tue, 16 Jun 2020 09:40:08 -0700 (PDT)
Received: from linaro.org ([2a00:23c5:6801:1801:dc9e:c297:59e5:dbd9])
        by smtp.gmail.com with ESMTPSA id g82sm4843866wmf.1.2020.06.16.09.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 09:40:08 -0700 (PDT)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        coresight@lists.linaro.org, mathieu.poirier@linaro.org
Cc:     suzuki.poulose@arm.com, corbet@lwn.net,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v5 0/5] Update CoreSight infrastructure to select a default sink.
Date:   Tue, 16 Jun 2020 17:40:01 +0100
Message-Id: <20200616164006.15309-1-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patchset provides an infrastructure to allow for the automatic
selection of a sink during CoreSight tracing operations.

Currently starting tracing using perf requires a sink selection on the
command line:-

sudo ./perf record -e cs_etm/@tmc_etr0/ --per-thread uname -a

After this set (and the follow-up perf change set) the infrastructure will
be able to select a default sink:-

sudo ./perf record -e cs_etm// --per-thread uname -a

This matches with the default operation provided with perf and intelpt.

Where no sink is specified at the start of a trace session, the CoreSight
system will walk the connection graph from the source ETM, to find a
suitable sink using the first encountered highest priority device.

The CoreSight infrastructure is updated to define sink sub_types to
differentiate between sinks with built in buffers (ETB / ETF) - BUFFER
type, and those that use system memory (ETR) - SYSMEM - types.

SYSMEM types are considered higher priority.

When two sinks are found of equal priority, then the closest sink to the
source in terms of connection nodes is chosen.

The automatic sink selection will also operate if an ETM is enabled using
sysfs commands, and no sink is currently enabled. A last_sink attribute is
added to trace sources that is set to the value of the sink used when a
source is enabled via sysfs. This is set in both default and user enabled
sink scenarios.

Applies to Linux 5.8-rc1

Tested on Dragonboard DB410c.

Changes since v4:
1) Added reviewed-by etc that were missing from previous sets.
2) Added last_sink attribute to source devices.
3) Added documentation patch to update docs for default sinks.
4) Moved comment fix patch into separate misc fixes set.

Mike Leach (5):
  coresight: Add default sink selection to CoreSight base.
  coresight: tmc: Update sink types for default selection.
  coresight: etm: perf: Add default sink selection to etm perf.
  coresight: sysfs: Allow select default sink on source enable.
  documentation: coresight: Update CoreSight document for default sink.

 Documentation/trace/coresight/coresight.rst   |  48 ++--
 .../hwtracing/coresight/coresight-etm-perf.c  |  17 +-
 drivers/hwtracing/coresight/coresight-priv.h  |   2 +
 drivers/hwtracing/coresight/coresight-tmc.c   |   3 +-
 drivers/hwtracing/coresight/coresight.c       | 205 +++++++++++++++++-
 include/linux/coresight.h                     |   6 +
 6 files changed, 261 insertions(+), 20 deletions(-)

-- 
2.17.1

