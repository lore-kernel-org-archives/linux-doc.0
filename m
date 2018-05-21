Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C2DEC7D043
	for <lwn-linux-doc@archive.lwn.net>; Mon, 21 May 2018 08:54:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751246AbeEUIyo (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 21 May 2018 04:54:44 -0400
Received: from mail-pf0-f194.google.com ([209.85.192.194]:37474 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751879AbeEUIyA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 May 2018 04:54:00 -0400
Received: by mail-pf0-f194.google.com with SMTP id e9-v6so6767082pfi.4
        for <linux-doc@vger.kernel.org>; Mon, 21 May 2018 01:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NnN/fhGrSR8SrEds0HmRI/5r4C+zJoMVSRbsuhZ0Y3Y=;
        b=Myu1ilwl1cX/e+DgnWHGowuOZYQcc6J3QGoDMvIwz8KULGpSPGEGOAOjk1nTuMV3cD
         QQfkeldDdwlzhz2PclCVUIhdvyp8CWM1WUyTZ/K4pzsiGXQhOC8nT3PIAgmuwc7FPEwR
         wR/4tdETaXc15BMZOUuWfTLJDWbYghUMbQqIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NnN/fhGrSR8SrEds0HmRI/5r4C+zJoMVSRbsuhZ0Y3Y=;
        b=q+bK0sQpa1vuHV2tSdKfMJxoKre6bwEF+YGbCLTeUnPXfNrR6eOvwiGCo1qwsYED6r
         FQQ8ay2MX5B0JEEzDxoZrYsm7gxPoEPmjX5OXlLkEd5i/RoROMlhiqPgR33BYbGpqmY9
         AQ036UrsQ9HEyZo/4uPbW5ivOzdIIlFRRGf0f+OTspJch+f4DLNnDcrAtlOHsbyHTvTa
         JPSdrHAVyJg/xhqRzHUcx/c7WTcBIckNNI8payM2122yaR4bMmE2mYQ1X1Px0jbxD0o/
         7gm5Y8qCC390bh+g92Itx8wUvMdQJ9OT1oUA4P4tksTzvNx+b9pb5xMlcc1lVVXFbdkr
         T2nQ==
X-Gm-Message-State: ALKqPweFoYQd7tr7NYKacnPqxUPJEUCM/Tq5FRpRnzzXmlKmN1LdlYHQ
        WuZrFC/gI8Bjkb82aE881ZVcbQ==
X-Google-Smtp-Source: AB8JxZqQJb10smTJX1GyMKYt41JhARlwzG4PlVNTBHkO6SDpePpjRIPVxD5TPtV53ih6j9D4Tae0Yw==
X-Received: by 2002:a62:9d89:: with SMTP id a9-v6mr19171509pfk.206.1526892839364;
        Mon, 21 May 2018 01:53:59 -0700 (PDT)
Received: from localhost.localdomain (li1209-69.members.linode.com. [45.79.110.69])
        by smtp.gmail.com with ESMTPSA id 16-v6sm28553918pfq.115.2018.05.21.01.53.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 21 May 2018 01:53:58 -0700 (PDT)
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
Subject: [RFT v2 4/4] coresight: Document for CoreSight trace disassembler
Date:   Mon, 21 May 2018 16:52:28 +0800
Message-Id: <1526892748-326-5-git-send-email-leo.yan@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1526892748-326-1-git-send-email-leo.yan@linaro.org>
References: <1526892748-326-1-git-send-email-leo.yan@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This commit documents CoreSight trace disassembler usage and gives
example for it.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 Documentation/trace/coresight.txt | 52 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/Documentation/trace/coresight.txt b/Documentation/trace/coresight.txt
index 6f0120c..b8f2359 100644
--- a/Documentation/trace/coresight.txt
+++ b/Documentation/trace/coresight.txt
@@ -381,3 +381,55 @@ sort example is from the AutoFDO tutorial (https://gcc.gnu.org/wiki/AutoFDO/Tuto
 	$ taskset -c 2 ./sort_autofdo
 	Bubble sorting array of 30000 elements
 	5806 ms
+
+
+Tracing data disassembler
+-------------------------
+
+'perf script' supports to use script to parse tracing packet and rely on
+'objdump' for disassembled lines, this can convert tracing data to readable
+program execution flow for easily reviewing tracing data.
+
+The CoreSight trace disassembler is located in the folder:
+tools/perf/scripts/python/arm-cs-trace-disasm.py.  This script support below
+options:
+
+	-d, --objdump: Set path to objdump executable, this option is
+		       mandatory.
+	-k, --vmlinux: Set path to vmlinux file.
+	-v, --verbose: Enable debugging log, after enable this option the
+		       script dumps every event data.
+
+Below is one example for using python script to dump CoreSight trace
+disassembler:
+
+	$ perf script -s arm-cs-trace-disasm.py -i perf.data \
+	    -F cpu,event,ip,addr,sym -- -d objdump -k ./vmlinux > cs-disasm.log
+
+Below is one example for the disassembler log:
+
+ARM CoreSight Trace Data Assembler Dump
+	ffff000008a5f2dc <etm4_enable_hw+0x344>:
+	ffff000008a5f2dc:	340000a0 	cbz	w0, ffff000008a5f2f0 <etm4_enable_hw+0x358>
+	ffff000008a5f2f0 <etm4_enable_hw+0x358>:
+	ffff000008a5f2f0:	f9400260 	ldr	x0, [x19]
+	ffff000008a5f2f4:	d5033f9f 	dsb	sy
+	ffff000008a5f2f8:	913ec000 	add	x0, x0, #0xfb0
+	ffff000008a5f2fc:	b900001f 	str	wzr, [x0]
+	ffff000008a5f300:	f9400bf3 	ldr	x19, [sp, #16]
+	ffff000008a5f304:	a8c27bfd 	ldp	x29, x30, [sp], #32
+	ffff000008a5f308:	d65f03c0 	ret
+	ffff000008a5fa18 <etm4_enable+0x1b0>:
+	ffff000008a5fa18:	14000025 	b	ffff000008a5faac <etm4_enable+0x244>
+	ffff000008a5faac <etm4_enable+0x244>:
+	ffff000008a5faac:	b9406261 	ldr	w1, [x19, #96]
+	ffff000008a5fab0:	52800015 	mov	w21, #0x0                   	// #0
+	ffff000008a5fab4:	f901ca61 	str	x1, [x19, #912]
+	ffff000008a5fab8:	2a1503e0 	mov	w0, w21
+	ffff000008a5fabc:	3940e261 	ldrb	w1, [x19, #56]
+	ffff000008a5fac0:	f901ce61 	str	x1, [x19, #920]
+	ffff000008a5fac4:	a94153f3 	ldp	x19, x20, [sp, #16]
+	ffff000008a5fac8:	a9425bf5 	ldp	x21, x22, [sp, #32]
+	ffff000008a5facc:	a94363f7 	ldp	x23, x24, [sp, #48]
+	ffff000008a5fad0:	a8c47bfd 	ldp	x29, x30, [sp], #64
+	ffff000008a5fad4:	d65f03c0 	ret
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
