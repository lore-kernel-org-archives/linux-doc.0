Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DAD197DE78
	for <lwn-linux-doc@archive.lwn.net>; Fri, 30 Mar 2018 03:15:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752511AbeC3DPs (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Mar 2018 23:15:48 -0400
Received: from mail-wm0-f65.google.com ([74.125.82.65]:50984 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752096AbeC3DPr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Mar 2018 23:15:47 -0400
Received: by mail-wm0-f65.google.com with SMTP id l201so13711914wmg.0
        for <linux-doc@vger.kernel.org>; Thu, 29 Mar 2018 20:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=g8hRWBH9Ffr8aq1M++fL3sQ9CcLWhWZkFaFf/4I20MQ=;
        b=GLWOQTv4s7guwpWgEybMCzCpzUcoUMWdwn5VHNoizQ4jcjehHekaoPOS7tqkghE9yT
         GD7JAtquFfJ4XqXf3MF9NtvAVk8Kq10PkeCF0DjR6azfsb2tXjSa9ieZp8XPTFY7d21h
         v1Fm2dw03rJBxdZvIJAY8ggdrxPXUEbgHctso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=g8hRWBH9Ffr8aq1M++fL3sQ9CcLWhWZkFaFf/4I20MQ=;
        b=R9WZpXvngvGoSiLC/Pvl9CAWYMjOamAevOrYbcfP1lf3uM2C6Sw+2ilXA1MtD2INln
         lS7bzYePyDpfNJpYHWMFwSsEiyjN37LqJcX2YqJaNrkuRJyyhIh3IW9aDZO+SviWK3x/
         3o+gDq2j3uwkpSIad8uiBdxK9fpd0sK3mIt1qvHsS3e8JZc5uyyZ2G9dCsmnZYVqkJAA
         WqtRMhOCtieOu+XXBlGRuKlW0ul4XJSUNNMd+iivnPiOll1Pm+ffQ0pmx43+prZp9Kt2
         F39WfpYHyeD2Q/p0paUHeWMK+HkK66W3ClcmSbU/dlK6cOY4Dxm19E5+PXGGqDzqL1VJ
         pXrg==
X-Gm-Message-State: ALQs6tCOFYlGfMOW5/H204k2LIpVQeoP6h20yomY5Q5OZAid0y2lRuGw
        n7E4GyT4wzYLEPRi1U70ofUP8w==
X-Google-Smtp-Source: AIpwx4/T8uY17IfiY71hFu/7ZK2I9ULoXw2Dm4S5vUsbCd4jBVt8hqpeZOA0t1j0uO1tw/MOAgU9Ow==
X-Received: by 10.28.45.204 with SMTP id t195mr970417wmt.20.1522379746232;
        Thu, 29 Mar 2018 20:15:46 -0700 (PDT)
Received: from localhost.localdomain (li622-172.members.linode.com. [212.71.249.172])
        by smtp.gmail.com with ESMTPSA id z9sm12798903wrz.4.2018.03.29.20.15.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 29 Mar 2018 20:15:45 -0700 (PDT)
From:   Leo Yan <leo.yan@linaro.org>
To:     Jonathan Corbet <corbet@lwn.net>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        Kim Phillips <kim.phillips@arm.com>,
        Mike Leach <mike.leach@linaro.org>
Cc:     Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v4 0/6] Coresight: Support panic kdump
Date:   Fri, 30 Mar 2018 11:15:18 +0800
Message-Id: <1522379724-30648-1-git-send-email-leo.yan@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch set is to explore Coresight tracing data for postmortem
debugging.  When kernel panic happens, the Coresight panic kdump can
help to save on-chip tracing data and tracer metadata into DRAM, later
relies on kdump and crash/perf tools to recovery tracing data for
"offline" analysis.

The documentation is important to understand the purpose of Coresight
panic kdump, the implementation of framework and usage. Patches 0001
and patch 0002 are used for creating new sub directory for placing
Coresight docs and add a new doc for Coresight panic kdump.

Patch 0003 introduces the simple panic kdump framework which provides
helper functions can be used by Coresight devices, and it registers
panic notifier for dump tracing data.

Patches 0004/0005 support panic kdump for ETB; Patch 0006 supports the
kdump for ETMv4.

This patch set has been reworked by following suggestions at Linaro
HKG18 connect (mainly suggestions from Mathieu, thanks a lot!), and
it's rebased on acme git tree [1] with last commit 109d59b900e7 ('perf
vendor events s390: Add JSON files for IBM z14').

Due Coresight kdump data structure has been changed significantly, the
corresponding crash extension program also has been updated for this
reason [2]; furthermore the crash extension program is updated to
dynamically generate kernel buildid according to vmlinux elf info [3],
this is a fixing for the old code which uses hard-coded buildid value.

This patch set has been verified on 96boards Hikey620 with Coresight
enabling by the sysFS interface.  Also the updated crash extension
program has been verified to cowork with Coresight panic kdump and it
successfully extracts tracing data from the vmcore and finally can be
decoded by perf tool.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git
[2] https://git.linaro.org/people/leo.yan/crash.git/tree/extensions/csdump.c
[3] https://git.linaro.org/people/leo.yan/crash.git/tree/extensions/csdump_buildid.c

Changes from v3:
* Following Mathieu suggestion, reworked the panic kdump framework,
  used kdump array to maintain source and sink device handlers;
* According to Mathieu suggestion, optimized panic notifier to
  firstly dump panic CPU tracing data and then dump other CPUs tracing
  data;
* Refined doc to reflect these implementation changes;
* Changed ETMv4 driver to add source device handler at probe phase;
* Refactored crash extension program to reflect kernel changes.

Changes from v2:
* Add the two patches for documentation.
* Following Mathieu suggestion, reworked the panic kdump framework,
  removed the useless flag "PRE_PANIC".
* According to comment, changed to add and delete kdump node operations
  in sink enable/disable functions;
* According to Mathieu suggestion, handle kdump node
  addition/deletion/updating separately for sysFS interface and perf
  method.

Changes from v1:
* Add support to dump ETMv4 meta data.
* Wrote 'crash' extension csdump.so so rely on it to generate 'perf'
  format compatible file.
* Refactored panic dump driver to support pre & post panic dump.

Changes from RFC:
* Follow Mathieu's suggestion, use general framework to support dump
  functionality.
* Changed to use perf to analyse trace data.

Leo Yan (6):
  doc: Add Coresight documentation directory
  doc: Add documentation for Coresight panic kdump
  coresight: Support panic kdump functionality
  coresight: tmc: Hook callback for panic kdump
  coresight: Set and clear sink device handler for kdump node
  coresight: etm4x: Support panic kdump

 Documentation/trace/coresight-cpu-debug.txt        | 187 ----------
 Documentation/trace/coresight.txt                  | 383 ---------------------
 .../trace/coresight/coresight-cpu-debug.txt        | 187 ++++++++++
 .../trace/coresight/coresight-panic-kdump.txt      | 130 +++++++
 Documentation/trace/coresight/coresight.txt        | 383 +++++++++++++++++++++
 MAINTAINERS                                        |   5 +-
 drivers/hwtracing/coresight/Kconfig                |   9 +
 drivers/hwtracing/coresight/Makefile               |   1 +
 drivers/hwtracing/coresight/coresight-etm-perf.c   |   5 +
 drivers/hwtracing/coresight/coresight-etm4x.c      |  27 ++
 drivers/hwtracing/coresight/coresight-etm4x.h      |  15 +
 .../hwtracing/coresight/coresight-panic-kdump.c    | 199 +++++++++++
 drivers/hwtracing/coresight/coresight-priv.h       |  12 +
 drivers/hwtracing/coresight/coresight-tmc-etf.c    |  30 ++
 drivers/hwtracing/coresight/coresight.c            |  16 +-
 include/linux/coresight.h                          |   4 +
 16 files changed, 1019 insertions(+), 574 deletions(-)
 delete mode 100644 Documentation/trace/coresight-cpu-debug.txt
 delete mode 100644 Documentation/trace/coresight.txt
 create mode 100644 Documentation/trace/coresight/coresight-cpu-debug.txt
 create mode 100644 Documentation/trace/coresight/coresight-panic-kdump.txt
 create mode 100644 Documentation/trace/coresight/coresight.txt
 create mode 100644 drivers/hwtracing/coresight/coresight-panic-kdump.c

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
