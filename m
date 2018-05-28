Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D2C477DF90
	for <lwn-linux-doc@archive.lwn.net>; Mon, 28 May 2018 08:47:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932114AbeE1Ipx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 28 May 2018 04:45:53 -0400
Received: from mail-wr0-f195.google.com ([209.85.128.195]:44367 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932110AbeE1Ipu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 May 2018 04:45:50 -0400
Received: by mail-wr0-f195.google.com with SMTP id y15-v6so18953307wrg.11
        for <linux-doc@vger.kernel.org>; Mon, 28 May 2018 01:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=g2s0qKAeszFhKKHrQ+56mjV/yVHzAXmicKjIaEfOtZk=;
        b=S0hLWFsgE3mmA3xopC+6pgFgANkdef1gSr3NR5eGgGGtXjM4wPBjKa93Oc9tNJXOIt
         JH2MlVlPySkHPlNrslrc6JrzNZzaqevOpUQ92zVDW5C20ficnGXxn5Be4HNE3rjPDsuy
         9lrimUSKk8sWGosAn6OdnDUZQuTmttfyMHOhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=g2s0qKAeszFhKKHrQ+56mjV/yVHzAXmicKjIaEfOtZk=;
        b=FiomTuLDUZiS78BNTljENEmptmlO2bn0N8wDz5J/cpoRtwQIfhI6TFUj3FRWmxsT8l
         7ymy0xspTW+Iht6Po13oBPg6fP+E8yfzxZlpZic/1GZOEUqqT2RENYQ5fx/1fVwBAZXX
         0jkUkr42w4qXqSsBUKXGUHWnU9Mj707tnkLgSycIT9rtupdZ8OhczLTEKydwxOXHSoAg
         zjIGS/CbFKlqSbcjFLqLDXSKKGsGPYOq/CSwLg6VZNB1N3455q6VOOgC9CFtpPPED60p
         ibXhjx6TDYKBchOXlT3epZL6lCN4gAlpYVXq2oCkPewBSJgC5C5c7QJaDFEelX1VvaEB
         paqQ==
X-Gm-Message-State: ALKqPwer3vEjGu5LD1KeTjvdvF8L5rS3hQgNwbF1zra9CBpgglQYvG+2
        BS9LIdif15GBsg3fauXvA1lvSg==
X-Google-Smtp-Source: AB8JxZogZ7Q3//gOdfGYRmOhkOMSZesGFk76lvKhO8pc0SgBnfgUNmDqLX+klA/oF8fpJpxyBWB1wQ==
X-Received: by 2002:adf:af6b:: with SMTP id z98-v6mr9416956wrc.250.1527497149509;
        Mon, 28 May 2018 01:45:49 -0700 (PDT)
Received: from localhost.localdomain ([45.76.138.171])
        by smtp.gmail.com with ESMTPSA id 123-v6sm21783013wmt.19.2018.05.28.01.45.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 28 May 2018 01:45:48 -0700 (PDT)
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
Subject: [RFT v3 2/4] perf script python: Add addr into perf sample dict
Date:   Mon, 28 May 2018 16:45:01 +0800
Message-Id: <1527497103-3593-3-git-send-email-leo.yan@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527497103-3593-1-git-send-email-leo.yan@linaro.org>
References: <1527497103-3593-1-git-send-email-leo.yan@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

ARM CoreSight auxtrace uses 'sample->addr' to record the target address
for branch instructions, so the data of 'sample->addr' is required for
tracing data analysis.

This commit collects data of 'sample->addr' into perf sample dict,
finally can be used for python script for parsing event.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 tools/perf/util/scripting-engines/trace-event-python.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/perf/util/scripting-engines/trace-event-python.c b/tools/perf/util/scripting-engines/trace-event-python.c
index 10dd5fc..7f8afac 100644
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
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
