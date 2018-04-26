Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 027557DD32
	for <lwn-linux-doc@archive.lwn.net>; Thu, 26 Apr 2018 02:27:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751560AbeDZC1N (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 25 Apr 2018 22:27:13 -0400
Received: from mail-pg0-f67.google.com ([74.125.83.67]:35346 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750868AbeDZC1M (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Apr 2018 22:27:12 -0400
Received: by mail-pg0-f67.google.com with SMTP id j11so14722224pgf.2
        for <linux-doc@vger.kernel.org>; Wed, 25 Apr 2018 19:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=BGn9RurNL8JCQhf6cDNAQ8blDFcwJiAtHhzz92PlreM=;
        b=VRp83QKWbQ8vgyFKl4i0ohQ5v3DG7+6wyPj7IWJgOCiUbNUgaSKrHxWrRjPeNMz8FY
         suTGtMxcpmvjgg4lBI8y5prgEHKk3sxuQLit0dcrpgZ5gnMh99F27gutyZkZ7myZeiCi
         HoY+L1C7eSHKAazsc4EMgJC1SyuDU+hpvf72c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=BGn9RurNL8JCQhf6cDNAQ8blDFcwJiAtHhzz92PlreM=;
        b=o6PwCx6fBuP1WOUbofyGxHLjwtFcEirTBNAMtTTwlPw9QilXz9lGh5wlX3mrODrxS4
         GpmwUkrwG+KFVcS9bgxAHzRT8jYFjWBRSYi4mpjIXd1mVNE3G9usQkfncxbKGrD02Od0
         qhGteHGU5Tym8p3cqAyj5hCrSd5CN6XgX3/R8LBjAzY95YygZglw4sES6n65J/ApzvQL
         3eJ1exeS9mYtVSkB9/sxV9PTpseeGADcPsCgsAJ1d36sru506HXd7k/BATKY1GecXsxL
         A5jUqUCk/OMUn3Nfti3wnfF9AEXEJL1LzDHkjaE8eJzHMrjHRgzT7crnOix5F80HIGmW
         sL1A==
X-Gm-Message-State: ALQs6tBKMSnrUu68q+bZO7dP2dhbW7sqUig4U2lcAVAxQDpl/i6ATbXD
        zeGawr70pZOzgXxnrLDEqL/0Yg==
X-Google-Smtp-Source: AIpwx4+gmxQtgDeKVUG9f6dEaNb/ZM9jvdsR9cb3cOQBw23t45dCDA5BCBaf5MTYncyNC2teqS6oWQ==
X-Received: by 10.98.103.86 with SMTP id b83mr30273948pfc.76.1524709631529;
        Wed, 25 Apr 2018 19:27:11 -0700 (PDT)
Received: from localhost.localdomain (li1168-94.members.linode.com. [45.79.69.94])
        by smtp.gmail.com with ESMTPSA id w17sm38598161pfa.141.2018.04.25.19.27.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 25 Apr 2018 19:27:10 -0700 (PDT)
From:   Leo Yan <leo.yan@linaro.org>
To:     Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Leo Yan <leo.yan@linaro.org>
Subject: [PATCH bpf-next] bpf, doc: Update bpf_jit_enable limitation for CONFIG_BPF_JIT_ALWAYS_ON
Date:   Thu, 26 Apr 2018 10:26:51 +0800
Message-Id: <1524709611-29437-1-git-send-email-leo.yan@linaro.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When CONFIG_BPF_JIT_ALWAYS_ON is enabled, kernel has limitation for
bpf_jit_enable, so it has fixed value 1 and we cannot set it to 2
for JIT opcode dumping; this patch is to update the doc for it.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 Documentation/networking/filter.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/networking/filter.txt b/Documentation/networking/filter.txt
index fd55c7d..feddab9 100644
--- a/Documentation/networking/filter.txt
+++ b/Documentation/networking/filter.txt
@@ -483,6 +483,12 @@ Example output from dmesg:
 [ 3389.935851] JIT code: 00000030: 00 e8 28 94 ff e0 83 f8 01 75 07 b8 ff ff 00 00
 [ 3389.935852] JIT code: 00000040: eb 02 31 c0 c9 c3
 
+When CONFIG_BPF_JIT_ALWAYS_ON is enabled, bpf_jit_enable is set to 1 by default
+and it returns failure if change to any other value from proc node; this is
+for security consideration to avoid leaking info to unprivileged users. In this
+case, we can't directly dump JIT opcode image from kernel log, alternatively we
+need to use bpf tool for the dumping.
+
 In the kernel source tree under tools/bpf/, there's bpf_jit_disasm for
 generating disassembly out of the kernel log's hexdump:
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
