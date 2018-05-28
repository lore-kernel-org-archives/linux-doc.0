Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6C92E7DF8C
	for <lwn-linux-doc@archive.lwn.net>; Mon, 28 May 2018 08:47:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754111AbeE1Iph (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 28 May 2018 04:45:37 -0400
Received: from mail-wm0-f52.google.com ([74.125.82.52]:38724 "EHLO
        mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754095AbeE1Ipg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 May 2018 04:45:36 -0400
Received: by mail-wm0-f52.google.com with SMTP id m129-v6so29902124wmb.3
        for <linux-doc@vger.kernel.org>; Mon, 28 May 2018 01:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Jcv36zqK5z4CBDKrfpSmhF6yClhbmwK2Wy9b+M/nBZ0=;
        b=b3M4Z/995/1LcmA+1WeaiC+zvqd3mTSrG8Nv8VC7dHn6iyS98er1K3MfBilu1guj7M
         bJO7/I/UtEoB3TzRo31YhWLLQqDJ77nUQFGgsf6VEPJ3nzogsreHE+E/vpfByQdMqKhx
         my1AtWYe0UgXoe/vm5vFf1ijjF8IGsZmBFmqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Jcv36zqK5z4CBDKrfpSmhF6yClhbmwK2Wy9b+M/nBZ0=;
        b=fPrCWFohlsxSqxdaGQDoPnDA0CruvxRSBMrL6Cq+4Pxq2WTNwsTdzeQtL7eB7qloJe
         nMZkXfoQHZKV9Ro3VtMlg04uhzc2Ux25b5PwXz1BOvj5FNJxG8Cu6ic3nptjPTONUyt0
         3NZjUG9jVfHHFvw/GxNWRx/RWPKITQvQi1r5BSoX20JBMLH6Fhx8IobzB0i3qadLciUF
         rE6vIJd5JPb+AXwKLHV3ZQZzaHibDB4AOFKx0u8bM4e4Bd/HLJ1xAj3QfKVZI6j9WFRY
         BhBGZd7s9Ys20pEz9lMlLyuvIqZmlFOY4ajUu967BjhhBwn4ZkEMxhJJWzjBiaBZIp1K
         +F6w==
X-Gm-Message-State: ALKqPwczpTiJRUyJxHt8S7H9qzaaVdhyif47byTW3ptORjX7BjLPsLUZ
        JeQm2O7srRSsHPmcxvsofCkpBQ==
X-Google-Smtp-Source: ADUXVKKJKeCP0NVDBuNK3Q8dDfkiCnp4ck7XPSIkjpqFQ2mUW8/RmwD5O/TqLdE0OJUGvDIrWSyFlA==
X-Received: by 2002:a1c:b109:: with SMTP id a9-v6mr7096006wmf.18.1527497134835;
        Mon, 28 May 2018 01:45:34 -0700 (PDT)
Received: from localhost.localdomain ([45.76.138.171])
        by smtp.gmail.com with ESMTPSA id 123-v6sm21783013wmt.19.2018.05.28.01.45.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 28 May 2018 01:45:33 -0700 (PDT)
From:   Leo Yan <leo.yan@linaro.org>
To:     Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Robert Walker <Robert.Walker@arm.com>, mike.leach@linaro.org,
        kim.phillips@arm.co, Tor Jeremiassen <tor@ti.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        Leo Yan <leo.yan@linaro.org>
Subject: [RFT v3 0/4] Perf script: Add python script for CoreSight trace disassembler
Date:   Mon, 28 May 2018 16:44:59 +0800
Message-Id: <1527497103-3593-1-git-send-email-leo.yan@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch series is to support for using 'perf script' for CoreSight
trace disassembler, for this purpose this patch series adds a new
python script to parse CoreSight tracing event and use command 'objdump'
for disassembled lines, finally this can generate readable program
execution flow for reviewing tracing data.

Patch 0001 is one fixing patch to generate samples for the start packet
and exception packets.

Patch 0002 is the prerequisite to add addr into sample dict, so this
value can be used by python script to analyze instruction range.

Patch 0003 is to add python script for trace disassembler.

Patch 0004 is to add doc to explain python script usage and give
example for it.

This patch series has been rebased on acme git tree [1] with the commit
19422a9f2a3b ("perf tools: Fix kernel_start for PTI on x86") and tested
on Hikey (ARM64 octa CA53 cores).

In this version the script has no dependency on ARM64 platform and is
expected to support ARM32 platform, but I am lacking ARM32 platform for
testing on it, so firstly upstream to support ARM64 platform.

This patch series is firstly to support 'per-thread' recording tracing
data, but we also need to verify the script can dump trace disassembler
CPU wide tracing and kernel panic kdump tracing data.  I also verified
this patch series which can work with kernel panic kdump tracing data,
because Mathieu is working on CPU wide tracing related work, so after
this we need to retest for CPU wide tracing and kdump tracing to ensure
the python script can handle well for all cases.

You are very welcome to test the script in this patch series, your
testing result and suggestion are very valuable to perfect this script
to cover more cases.

Changes from v2:
* Synced with Rob for handling CS_ETM_TRACE_ON packet, so refined 0001
  patch according to dicussion;
* Minor cleanup and fixes in 0003 patch for python script: remove 'svc'
  checking.

Changes from v1:
* According to Mike and Rob suggestion, add the fixing to generate samples
  for the start packet and exception packets.
* Simplify the python script to remove the exception prediction algorithm,
  we can rely on the sane exception packets for disassembler.


Leo Yan (4):
  perf cs-etm: Generate branch sample for missed packets
  perf script python: Add addr into perf sample dict
  perf script python: Add script for CoreSight trace disassembler
  coresight: Document for CoreSight trace disassembler

 Documentation/trace/coresight.txt                  |  52 +++++
 tools/perf/scripts/python/arm-cs-trace-disasm.py   | 235 +++++++++++++++++++++
 tools/perf/util/cs-etm.c                           |  93 ++++++--
 .../util/scripting-engines/trace-event-python.c    |   2 +
 4 files changed, 362 insertions(+), 20 deletions(-)
 create mode 100644 tools/perf/scripts/python/arm-cs-trace-disasm.py

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
