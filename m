Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DC3557D043
	for <lwn-linux-doc@archive.lwn.net>; Mon, 21 May 2018 08:54:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751019AbeEUIxx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 21 May 2018 04:53:53 -0400
Received: from mail-pf0-f195.google.com ([209.85.192.195]:41234 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751171AbeEUIxs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 May 2018 04:53:48 -0400
Received: by mail-pf0-f195.google.com with SMTP id v63-v6so6755596pfk.8
        for <linux-doc@vger.kernel.org>; Mon, 21 May 2018 01:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=g2s0qKAeszFhKKHrQ+56mjV/yVHzAXmicKjIaEfOtZk=;
        b=GE279JS20lqPnyDT/EctkUZE9fTNwX7lTGyFFiii8DuW9FqzqUwbuB36MhTqT8qREB
         kr0ikmOfxnmdi9bjoTt8ivGLdPJDv8p7S9diaJUWxNJixSLt7APFpFf5Kn0axt0Grff3
         1YswPReSsmyAlRfroZ5unoR4PHFmkPYbtmnKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=g2s0qKAeszFhKKHrQ+56mjV/yVHzAXmicKjIaEfOtZk=;
        b=RIUhiD+qXeW6+an15icX6HIWkjUCyKLnSlp+t0+q+9GovTcL5HNnLTbBhLek037f30
         nmjemmanpCZJCyDzkAXAs7otg//W+Y71qfV1s3vdbQkhuZAUJEZpNiJjVpNSw2bAqIg/
         Q6hntEN2B5DwTCEARSTyVRJLRE420502yFroqoGy6dJvUA8ZnpfwfeAd0oBm6GHQ9G2m
         UN6KuSppB4wGHFhY4a8r9QXyHYS+xTuSxQj9bL738kCWa8VzQx0LoI+WQfAGnsvWdlqt
         FUDfm7rnbu7mnbOUrd5wCJ3VBzwtYIb7HxcE0t5YT/H0kfD0qtyT512xjKOdAsd05ZFd
         QUHw==
X-Gm-Message-State: ALKqPwcARC5SoL5ZTCaW7ZiJjzZMjdhrs+ke0xwW1sP0QxDSsOQ5JlVl
        6nQUS5CcuSGqouemYJG8e1O0PQ==
X-Google-Smtp-Source: AB8JxZpwxUD2cElAfq6PTAKRCXowDQc8bopKRd6oACbRojga41/2yROXVDPzlwgMyW43yVzcfJahjQ==
X-Received: by 2002:a62:3ec2:: with SMTP id y63-v6mr19235088pfj.102.1526892827728;
        Mon, 21 May 2018 01:53:47 -0700 (PDT)
Received: from localhost.localdomain (li1209-69.members.linode.com. [45.79.110.69])
        by smtp.gmail.com with ESMTPSA id 16-v6sm28553918pfq.115.2018.05.21.01.53.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 21 May 2018 01:53:46 -0700 (PDT)
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
Subject: [RFT v2 2/4] perf script python: Add addr into perf sample dict
Date:   Mon, 21 May 2018 16:52:26 +0800
Message-Id: <1526892748-326-3-git-send-email-leo.yan@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1526892748-326-1-git-send-email-leo.yan@linaro.org>
References: <1526892748-326-1-git-send-email-leo.yan@linaro.org>
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
