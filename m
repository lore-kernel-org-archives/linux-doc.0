Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8AA3B7D043
	for <lwn-linux-doc@archive.lwn.net>; Mon, 21 May 2018 08:56:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751154AbeEUIxh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 21 May 2018 04:53:37 -0400
Received: from mail-pg0-f51.google.com ([74.125.83.51]:46075 "EHLO
        mail-pg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751087AbeEUIxg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 May 2018 04:53:36 -0400
Received: by mail-pg0-f51.google.com with SMTP id w3-v6so6065400pgv.12
        for <linux-doc@vger.kernel.org>; Mon, 21 May 2018 01:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=7HNfZFmkg7H2Dsk1KDP61dJ//0n7TfGIrRFVLHVIUGw=;
        b=BMk7NoVHQzrpmWA45Ejw3uTfudT6ayf1MAKS0W/pgmRFdHbHvNvEL2Mc40nG4VbfYW
         n0OmTOYxHvAe+e67JWUi0/xoz1UDTc/4OffOZlBb1pTZlxHrPLgXcPAUDFvUxVuC4eol
         LhKIqLWJYTSBXERSiw6V3MEpYrOV9CJCw6dPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=7HNfZFmkg7H2Dsk1KDP61dJ//0n7TfGIrRFVLHVIUGw=;
        b=A3FUKTwrSiU3AXFLLvYGqRuislVEq1jAdTlIir9oBY4BX+tyu7lOKPBIH7GggkiXCb
         dSQ5mY3qvUzUdz3DxwM3LTou57Co/7PaDtVavP0db/ZqXTAT1oi+ySF3ThKnWIcz/M11
         QszHOQEK3StJI8YBv2PKxXb3ybE19ApsDr+Ic8w6Jw5SaW0KbdCYe+bzIWDgpN8OHweq
         8XtBEBI4slm8xL3vP2i0+WfrzgJ6E6foQqC7rdt0Ubr0WAetPAz3KUAd0OeN9oQLnal4
         ZRR0j9/VE1HAD/Ku21P26c3leTyYQNP6va3HdwwAggBS0bcYUKOyzXUpSrR5aE4AmWao
         DK8Q==
X-Gm-Message-State: ALKqPwelVylZTzv1cWjbx01BWSHZU9X218O+DqLtDWo3qy0i7m3cX5cx
        CQa/ejRSyFAVGqCmakDsTNnsEw==
X-Google-Smtp-Source: AB8JxZqVtx+881z9OW6NHzx+OaGznngtTrTyO1/VMaPFTpyawUY1FA655sdg5HtGj9cJ7clpHerYLw==
X-Received: by 2002:a62:e107:: with SMTP id q7-v6mr19105268pfh.226.1526892815536;
        Mon, 21 May 2018 01:53:35 -0700 (PDT)
Received: from localhost.localdomain (li1209-69.members.linode.com. [45.79.110.69])
        by smtp.gmail.com with ESMTPSA id 16-v6sm28553918pfq.115.2018.05.21.01.53.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 21 May 2018 01:53:34 -0700 (PDT)
From:   Leo Yan <leo.yan@linaro.org>
To:     Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tor Jeremiassen <tor@ti.com>,
        mike.leach@linaro.org, kim.phillips@arm.com,
        Robert Walker <Robert.Walker@arm.com>,
        coresight@lists.linaro.org
Cc:     Leo Yan <leo.yan@linaro.org>
Subject: [RFT v2 0/4] Perf script: Add python script for CoreSight trace disassembler
Date:   Mon, 21 May 2018 16:52:24 +0800
Message-Id: <1526892748-326-1-git-send-email-leo.yan@linaro.org>
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

This patch series has been rebased on acme git tree [1] with the last
commit 19422a9f2a3b ("perf tools: Fix kernel_start for PTI on x86") and
tested on Hikey (ARM64 octa CA53 cores).

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

Changes from v1:
* According to Mike and Rob suggestion, add the fixing to generate samples
  for the start packet and exception packets.
* Simplify the python script to remove the exception prediction algorithm,
  we can rely on the sane exception packets for disassembler.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git


Leo Yan (4):
  perf cs-etm: Generate sample for missed packets
  perf script python: Add addr into perf sample dict
  perf script python: Add script for CoreSight trace disassembler
  coresight: Document for CoreSight trace disassembler

 Documentation/trace/coresight.txt                  |  52 +++++
 tools/perf/scripts/python/arm-cs-trace-disasm.py   | 234 +++++++++++++++++++++
 tools/perf/util/cs-etm.c                           |  35 ++-
 .../util/scripting-engines/trace-event-python.c    |   2 +
 4 files changed, 316 insertions(+), 7 deletions(-)
 create mode 100644 tools/perf/scripts/python/arm-cs-trace-disasm.py

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
