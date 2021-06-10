Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 563C3C47094
	for <linux-doc@archiver.kernel.org>; Thu, 10 Jun 2021 08:25:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D572613DF
	for <linux-doc@archiver.kernel.org>; Thu, 10 Jun 2021 08:25:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230350AbhFJI1F (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Jun 2021 04:27:05 -0400
Received: from mail-pg1-f176.google.com ([209.85.215.176]:34649 "EHLO
        mail-pg1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230317AbhFJI1E (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Jun 2021 04:27:04 -0400
Received: by mail-pg1-f176.google.com with SMTP id l1so22011967pgm.1
        for <linux-doc@vger.kernel.org>; Thu, 10 Jun 2021 01:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dx3LD+QONQZ90XyumvQYMedCFWUAyiq58QYIKI9G5zg=;
        b=P2q0IrTnZYJcNJxgCNUHZgCPckId6L8Xpz9JvHK94UQxbHTBsvAoHdRevTah0jtZ3C
         DCZ6YmT9q2kBAB7ezTldLlg1d+TpPCX4gGqUxhneVHoJ49Uc/el/KNIL60EsASs+ZlNC
         JEDN6py3rNeV5OcXFDOtSDN0tP/JK+MbjrpCq1S4hdgRmboCcjRNphTQdxRzsuiHmmb5
         yfyQl++2mNNsb7k2L/BGPE9wUTxeN1Nskrt0HKrJjII+LfLXiGwuZz6Vu3TTHIMFcgAB
         Wmy5LLcTK/ZMpMXPY4uhxUvBaF/ddyPrNPoR0AcOk9q9cdPYIl8Yze1Zad+LaPa2WcsZ
         4aiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dx3LD+QONQZ90XyumvQYMedCFWUAyiq58QYIKI9G5zg=;
        b=IWQ0XBV7TpFkznmhkxrnB1Mm50RycQiJjOl7UDzB+84SvcfgX2e1K8KrZt1aaXrG09
         Pbgh86+890EsIzySsgSIliUJh64iutfFkRjnFIg4xQTHpq5klABZzm256w+iLjPeFR7t
         Rfv4tVwAJ8cGid5HqO2+Ztc6lxmrsT9zc3jkwytrhm9D5RRcRuPNxdGRWveCD5oUeiaX
         +rMAW/QfQpYQyVUlTXBl7f5W12UTwTDomBZ4+8xh6JAw/ZFDV++6kaECR4GUNwNPBcSj
         FA9/J/1VQ2g4DiC1FrEC3aA8t8wcS0tTFJYBzVid2rVWofvAcwa1clZrN7g59zecNXqO
         AmFA==
X-Gm-Message-State: AOAM531AVshXsrZKtN/p07d/Y8wgn5K1xu9sWeyBbWCcBoiZ0c8mjhaW
        PCDkEfmokqOuROIzAZg9GZNFKg==
X-Google-Smtp-Source: ABdhPJyi+O4KwGPfvZR518NR4+exaoYeuUIiRL46B3bKaN8ChQ5bmYUKDSfTaz+qd2RgLjB3qxti9A==
X-Received: by 2002:aa7:8888:0:b029:2ec:763f:4bcc with SMTP id z8-20020aa788880000b02902ec763f4bccmr1846743pfe.35.1623313448946;
        Thu, 10 Jun 2021 01:24:08 -0700 (PDT)
Received: from localhost ([136.185.169.128])
        by smtp.gmail.com with ESMTPSA id h7sm1739207pfe.62.2021.06.10.01.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 01:24:08 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rafael Wysocki <rjw@rjwysocki.net>,
        Qian Cai <quic_qiancai@quicinc.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Jonathan Corbet <corbet@lwn.net>, Len Brown <lenb@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Ionela Voinescu <ionela.voinescu@arm.com>,
        Dirk Brandewie <dirk.j.brandewie@intel.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/5] cpufreq: cppc: Fix suspend/resume specific races with FIE code
Date:   Thu, 10 Jun 2021 13:53:56 +0530
Message-Id: <cover.1623313323.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Qian,

It would be helpful if you can test this patchset and confirm if the races you
mentioned went away or not and that the FIE code works as we wanted it to.

I don't have a real setup and so it won't be easy for me to test this out.

I have already sent a temporary fix for 5.13 and this patchset is targeted for
5.14 and is based over that.

-------------------------8<-------------------------

The CPPC driver currently stops the frequency invariance related
kthread_work and irq_work from cppc_freq_invariance_exit() which is only
called during driver's removal.

This is not sufficient as the CPUs can get hot-plugged out while the
driver is in use, the same also happens during system suspend/resume.

In such a cases we can reach a state where the CPU is removed by the
kernel but its kthread_work or irq_work aren't stopped.

Fix this by implementing the start_cpu() and stop_cpu() callbacks in the
cpufreq core, which will be called for each CPU's addition/removal.

A similar call was already available in the cpufreq core, which isn't required
anymore and so its users are migrated to use exit() callback instead.

This is targeted for v5.14-rc1.

--
Viresh

Viresh Kumar (5):
  cpufreq: cppc: Migrate to ->exit() callback instead of ->stop_cpu()
  cpufreq: intel_pstate: Migrate to ->exit() callback instead of
    ->stop_cpu()
  cpufreq: powerenv: Migrate to ->exit() callback instead of
    ->stop_cpu()
  cpufreq: Add start_cpu() and stop_cpu() callbacks
  cpufreq: cppc: Fix suspend/resume specific races with the FIE code

 Documentation/cpu-freq/cpu-drivers.rst |   7 +-
 drivers/cpufreq/Kconfig.arm            |   1 -
 drivers/cpufreq/cppc_cpufreq.c         | 163 ++++++++++++++-----------
 drivers/cpufreq/cpufreq.c              |  11 +-
 drivers/cpufreq/intel_pstate.c         |   9 +-
 drivers/cpufreq/powernv-cpufreq.c      |  23 ++--
 include/linux/cpufreq.h                |   5 +-
 7 files changed, 119 insertions(+), 100 deletions(-)

-- 
2.31.1.272.g89b43f80a514

