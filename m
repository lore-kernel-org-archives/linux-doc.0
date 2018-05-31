Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BB5557D08C
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 May 2018 10:33:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754455AbeEaKc7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 31 May 2018 06:32:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:57190 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754622AbeEaKc4 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 31 May 2018 06:32:56 -0400
Received: from jouet.infradead.org (unknown [179.97.41.186])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4BEAD208AF;
        Thu, 31 May 2018 10:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1527762775;
        bh=mlu6QK9XxQ6Li+Dl6cAvn4DJKpxSNP8bY/8LRp7/350=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EPOTzMCBxqM5drbQznYWEU1wo9elaU4U9onwpng/vgaCtblaIsBW4+grFwrRQl2s0
         3ckxK6pzp2Nmi5iSIXsH2wH0ooXD1J8JgPXKBknQ9e/gqXlFBj0R4p4cAYDsv0aB9Y
         gN/on6tfUBirdugOB5inJrgvsbiYG/5ngFR4rRa4=
From:   Arnaldo Carvalho de Melo <acme@kernel.org>
To:     Ingo Molnar <mingo@kernel.org>
Cc:     Clark Williams <williams@redhat.com>, linux-kernel@vger.kernel.org,
        linux-perf-users@vger.kernel.org, Leo Yan <leo.yan@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mike Leach <mike.leach@linaro.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Robert Walker <robert.walker@arm.com>,
        Tor Jeremiassen <tor@ti.com>, coresight@lists.linaro.org,
        kim.phillips@arm.co, linux-arm-kernel@lists.infradead.org,
        linux-doc@vger.kernel.org,
        Arnaldo Carvalho de Melo <acme@redhat.com>
Subject: [PATCH 6/7] perf script python: Add addr into perf sample dict
Date:   Thu, 31 May 2018 07:32:19 -0300
Message-Id: <20180531103220.24684-7-acme@kernel.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180531103220.24684-1-acme@kernel.org>
References: <20180531103220.24684-1-acme@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Leo Yan <leo.yan@linaro.org>

ARM CoreSight auxtrace uses 'sample->addr' to record the target address
for branch instructions, so the data of 'sample->addr' is required for
tracing data analysis.

This commit collects data of 'sample->addr' into perf sample dict,
finally can be used for python script for parsing event.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Jiri Olsa <jolsa@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Mike Leach <mike.leach@linaro.org>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Robert Walker <robert.walker@arm.com>
Cc: Tor Jeremiassen <tor@ti.com>
Cc: coresight@lists.linaro.org
Cc: kim.phillips@arm.co
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-doc@vger.kernel.org
Link: http://lkml.kernel.org/r/1527497103-3593-3-git-send-email-leo.yan@linaro.org
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/perf/util/scripting-engines/trace-event-python.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/perf/util/scripting-engines/trace-event-python.c b/tools/perf/util/scripting-engines/trace-event-python.c
index 10dd5fce082b..7f8afacd08ee 100644
--- a/tools/perf/util/scripting-engines/trace-event-python.c
+++ b/tools/perf/util/scripting-engines/trace-event-python.c
@@ -531,6 +531,8 @@ static PyObject *get_perf_sample_dict(struct perf_sample *sample,
 			PyLong_FromUnsignedLongLong(sample->period));
 	pydict_set_item_string_decref(dict_sample, "phys_addr",
 			PyLong_FromUnsignedLongLong(sample->phys_addr));
+	pydict_set_item_string_decref(dict_sample, "addr",
+			PyLong_FromUnsignedLongLong(sample->addr));
 	set_sample_read_in_dict(dict_sample, sample, evsel);
 	pydict_set_item_string_decref(dict, "sample", dict_sample);
 
-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
