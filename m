Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 475D67DF96
	for <lwn-linux-doc@archive.lwn.net>; Mon, 28 May 2018 08:47:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933216AbeE1IqJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 28 May 2018 04:46:09 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:38998 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932165AbeE1IqE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 May 2018 04:46:04 -0400
Received: by mail-wm0-f68.google.com with SMTP id f8-v6so30025616wmc.4
        for <linux-doc@vger.kernel.org>; Mon, 28 May 2018 01:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NnN/fhGrSR8SrEds0HmRI/5r4C+zJoMVSRbsuhZ0Y3Y=;
        b=b1orCH8MJwaXP08XQQNpfqozC/WlgS86Zjhn020ibietnYcIa0mzJPKcXpguquzIaj
         6C1qUczNM6P3v2Q+iAhOfE9eoGSLy317ULJ5hBYidaBrxomBtJtkOurr4BOXDx2uWx11
         bakhbqiAWmuYxJ0XyRdYhzn85Xwb5WepY9HtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NnN/fhGrSR8SrEds0HmRI/5r4C+zJoMVSRbsuhZ0Y3Y=;
        b=IYz1xNjRQLXnk/BIcbuhgVS0ii/ciIRoXWgYisHNILgCOKlbmKNjF7F3Qy9PyqS975
         eOfTgtanIFHOfc5CiuV4VVwK22qC2pKbDtMe2zMqwxYnEaQJZ8E6/dimNGyoeldCcwym
         xwG4ljyucu9o4fPvmIFpV4GfBH7suKndbIgh3Rt6gSX33ONJ9kZhwrn1Z0qxEr4k0md7
         xjrAQsp6J/EGG2IxpB0/nkTDb+czF24gX65riSieLnT+GCgpxqKyopLIyFghnw2ZoHEX
         jlSHhdIkMFYyM7N9udKLUbdCv+hHE1vmy2S+iHf0Q37eCQa2V9oURFFURpFdCQYFg+ic
         pWrw==
X-Gm-Message-State: ALKqPwfTcjmT9FMKstfBCq1JRssti/N38tbyeZnCoZLua+UTiuTTMdSF
        qB/VE/3KDcjj+lAGkRPfCJceYA==
X-Google-Smtp-Source: ADUXVKI/oJvmhuQeXDePS2DJpGOqu1mYn+QEBfauRn/+x8XDKDOI84f9DbCi8VDrEfljgKf1s/eNWA==
X-Received: by 2002:a1c:da13:: with SMTP id r19-v6mr9019079wmg.2.1527497163176;
        Mon, 28 May 2018 01:46:03 -0700 (PDT)
Received: from localhost.localdomain ([45.76.138.171])
        by smtp.gmail.com with ESMTPSA id 123-v6sm21783013wmt.19.2018.05.28.01.45.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 28 May 2018 01:46:02 -0700 (PDT)
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
Subject: [RFT v3 4/4] coresight: Document for CoreSight trace disassembler
Date:   Mon, 28 May 2018 16:45:03 +0800
Message-Id: <1527497103-3593-5-git-send-email-leo.yan@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527497103-3593-1-git-send-email-leo.yan@linaro.org>
References: <1527497103-3593-1-git-send-email-leo.yan@linaro.org>
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
