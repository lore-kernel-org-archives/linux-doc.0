Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EF5C27E22E
	for <lwn-linux-doc@archive.lwn.net>; Wed,  2 May 2018 05:01:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750925AbeEBFBL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 2 May 2018 01:01:11 -0400
Received: from mail-pf0-f194.google.com ([209.85.192.194]:43925 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750907AbeEBFBK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 May 2018 01:01:10 -0400
Received: by mail-pf0-f194.google.com with SMTP id j11so10732696pff.10
        for <linux-doc@vger.kernel.org>; Tue, 01 May 2018 22:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=/Z8HkkwWQGVuJx9xej1YLou5MF/Etvpj7G8LDecxa7Q=;
        b=HTloIcZ5A66tMInQOTfOZfpONkS8xp0+8PToVXmPv3v1dp8KbR3ffDIo0coyVgcwEs
         NZJlw6vDfm1Rwy6a6H2eZdZswizWi6HVtZaSknv3Nw8x9RQsDOgn1j4DLaXBc/AolLFy
         uEEL4ENXTFSbDgBJwRumoIhbJS/yKafEur0I0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=/Z8HkkwWQGVuJx9xej1YLou5MF/Etvpj7G8LDecxa7Q=;
        b=evi38AiLVDx+H662uUitGcKipw0StmWhhZIB+2olfd7Yp31J0R0W29PL6fuRppuyCK
         2OYq5LsAAubcDBwop5nAX9HAikf62wOvb8X9pSQKcdgYwg1tA2ttzCXKK17vRYWQmkXg
         +CJUjI3Qm5mRVmHsAWOGZXzlNkZyD2PEE3qHQmBEh0U8l/5FmSMPT7a3eqZE4kBcl9y9
         B22xrlePZSLZfpAtV/Ozyoo4mkgO4Uqt8WCEs++b4iYRkpzLN2jUPr6phKi70lc81iCG
         uFtqmVC382AWVEE/1pGqK3FnW6VtPp8OwBG1MpEKflhSZI/rQhld8/ykcPFT2d0/3B3s
         bkjA==
X-Gm-Message-State: ALQs6tDkvx/3e0EuMDC8nanMO8GTjR4JLak4Cc6OTn+OkJjR5BojwsGD
        qcadah5gklPC4bOrPXLRv6edZg==
X-Google-Smtp-Source: AB8JxZo5fSlXIqzRLIabGixkEvOaWRRH6EULViUpB923kOifXxzMYKapNywUax/HDa6vtBcQ4OAJkw==
X-Received: by 10.167.132.204 with SMTP id x12mr7541589pfn.79.1525237269839;
        Tue, 01 May 2018 22:01:09 -0700 (PDT)
Received: from localhost.localdomain (li1168-94.members.linode.com. [45.79.69.94])
        by smtp.gmail.com with ESMTPSA id 27sm22473636pfo.137.2018.05.01.22.01.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 01 May 2018 22:01:08 -0700 (PDT)
From:   Leo Yan <leo.yan@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>
Cc:     Leo Yan <leo.yan@linaro.org>
Subject: [PATCH] coresight: Remove %px for printing pcsr value
Date:   Wed,  2 May 2018 13:00:51 +0800
Message-Id: <1525237251-32496-1-git-send-email-leo.yan@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The driver prints pcsr twice: the first time it uses specifier %px to
print hexadecimal pcsr value and the second time uses specifier %pS for
output kernel symbols.

As suggested by Kees, using %pS should be sufficient and %px isn't
necessary; the reason is if the pcsr is a kernel space address, we can
easily get to know the code line from %pS format, on the other hand, if
the pcsr value doesn't fall into kernel space range (e.g. if the CPU is
stuck in firmware), %pS also gives out pcsr hexadecimal value.

So this commit removes useless %px and update section "Output format"
in the document for alignment between the code and document.

Suggested-by: Kees Cook <keescook@chromium.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 Documentation/trace/coresight-cpu-debug.txt       | 4 ++--
 drivers/hwtracing/coresight/coresight-cpu-debug.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/trace/coresight-cpu-debug.txt b/Documentation/trace/coresight-cpu-debug.txt
index 2b9b51c..89ab09e 100644
--- a/Documentation/trace/coresight-cpu-debug.txt
+++ b/Documentation/trace/coresight-cpu-debug.txt
@@ -177,11 +177,11 @@ Here is an example of the debugging output format:
 ARM external debug module:
 coresight-cpu-debug 850000.debug: CPU[0]:
 coresight-cpu-debug 850000.debug:  EDPRSR:  00000001 (Power:On DLK:Unlock)
-coresight-cpu-debug 850000.debug:  EDPCSR:  [<ffff00000808e9bc>] handle_IPI+0x174/0x1d8
+coresight-cpu-debug 850000.debug:  EDPCSR:  handle_IPI+0x174/0x1d8
 coresight-cpu-debug 850000.debug:  EDCIDSR: 00000000
 coresight-cpu-debug 850000.debug:  EDVIDSR: 90000000 (State:Non-secure Mode:EL1/0 Width:64bits VMID:0)
 coresight-cpu-debug 852000.debug: CPU[1]:
 coresight-cpu-debug 852000.debug:  EDPRSR:  00000001 (Power:On DLK:Unlock)
-coresight-cpu-debug 852000.debug:  EDPCSR:  [<ffff0000087fab34>] debug_notifier_call+0x23c/0x358
+coresight-cpu-debug 852000.debug:  EDPCSR:  debug_notifier_call+0x23c/0x358
 coresight-cpu-debug 852000.debug:  EDCIDSR: 00000000
 coresight-cpu-debug 852000.debug:  EDVIDSR: 90000000 (State:Non-secure Mode:EL1/0 Width:64bits VMID:0)
diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index 9cdb3fb..78a054e 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -315,7 +315,7 @@ static void debug_dump_regs(struct debug_drvdata *drvdata)
 	}
 
 	pc = debug_adjust_pc(drvdata);
-	dev_emerg(dev, " EDPCSR:  [<%px>] %pS\n", (void *)pc, (void *)pc);
+	dev_emerg(dev, " EDPCSR:  %pS\n", (void *)pc);
 
 	if (drvdata->edcidsr_present)
 		dev_emerg(dev, " EDCIDSR: %08x\n", drvdata->edcidsr);
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
