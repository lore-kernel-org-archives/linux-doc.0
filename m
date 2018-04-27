Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B71117DE78
	for <lwn-linux-doc@archive.lwn.net>; Fri, 27 Apr 2018 10:03:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1757805AbeD0KDO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 27 Apr 2018 06:03:14 -0400
Received: from mail-pf0-f194.google.com ([209.85.192.194]:46822 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757353AbeD0KDN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Apr 2018 06:03:13 -0400
Received: by mail-pf0-f194.google.com with SMTP id p12so1122199pff.13
        for <linux-doc@vger.kernel.org>; Fri, 27 Apr 2018 03:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=myTNeqJtMk7yitRmERDuqpgI0jkaKPcizQ4lSE912aY=;
        b=YZPZk8ONWeL5Lw6pOUEC2T7CDGzAuxumm0BgNVPpgeqq+R7z0CSJmQR5LBP9uJcwvF
         erCkgyP7QaGMAHA4xqkkijmLg8+XcpHO/g/AA+G2UOOOWxooDuwqncJKsUITxS6D8pzd
         m3/3E5iH0rXgGbF1930p1B42rnLTnNCUvvzP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=myTNeqJtMk7yitRmERDuqpgI0jkaKPcizQ4lSE912aY=;
        b=Fgn/ro0k76o2HzLvzhHCLxaALCZStHyF9LGh1qzwfrv4ENMfCL4CpfmanoETgrdpAp
         QbpaT5Rf9vp9NcY4H1ARWV3nUAhk80txPCOl0m8JEsmJnhViNy/xt/nv85ehWNFCEZYi
         amQf/g2v10LyNlQ8oVbUyFKsRmGRBMehjoZAevJmNaMU2plW0Cliaa7CDoHqp5XRsw6V
         CCRSDWFogdVBk3edmZRmHblWb7fkE5hgnl55A5wFMU65uOleBuXYtLoXMm0JfZffuWrz
         4s61Y09vPvn+fTKthIOYlzuUs9KDepnQTcsQX2eeGy0NXDKIO4bvAp1ELOoI9t3r0El0
         4XBA==
X-Gm-Message-State: ALQs6tAcEoM4Sd5Bb+eYtt2JfHbfRo3fGwskbdvpb//yc427yCPeZec7
        CgVHnGCEe27ZfzUGumXby2TRhg==
X-Google-Smtp-Source: AB8JxZoDkb9qx9w38H7HRzrXLbJcQhZncLfQVSYVT+hu0oO3hA7j6rAcDb8zwI5xAqmE4I7aXpnb1g==
X-Received: by 2002:a17:902:2805:: with SMTP id e5-v6mr1708944plb.55.1524823393484;
        Fri, 27 Apr 2018 03:03:13 -0700 (PDT)
Received: from localhost.localdomain (li1168-94.members.linode.com. [45.79.69.94])
        by smtp.gmail.com with ESMTPSA id 17sm2843733pfo.4.2018.04.27.03.03.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 27 Apr 2018 03:03:12 -0700 (PDT)
From:   Leo Yan <leo.yan@linaro.org>
To:     Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Leo Yan <leo.yan@linaro.org>
Subject: [PATCH bpf-next v2] bpf, doc: Update bpf_jit_enable limitation for CONFIG_BPF_JIT_ALWAYS_ON
Date:   Fri, 27 Apr 2018 18:02:54 +0800
Message-Id: <1524823374-6174-1-git-send-email-leo.yan@linaro.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When CONFIG_BPF_JIT_ALWAYS_ON is enabled, kernel has limitation for
bpf_jit_enable, so it has fixed value 1 and we cannot set it to 2
for JIT opcode dumping; this patch is to update the doc for it.

Suggested-by: Daniel Borkmann <daniel@iogearbox.net>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 Documentation/networking/filter.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/networking/filter.txt b/Documentation/networking/filter.txt
index fd55c7d..5032e12 100644
--- a/Documentation/networking/filter.txt
+++ b/Documentation/networking/filter.txt
@@ -483,6 +483,12 @@ Example output from dmesg:
 [ 3389.935851] JIT code: 00000030: 00 e8 28 94 ff e0 83 f8 01 75 07 b8 ff ff 00 00
 [ 3389.935852] JIT code: 00000040: eb 02 31 c0 c9 c3
 
+When CONFIG_BPF_JIT_ALWAYS_ON is enabled, bpf_jit_enable is permanently set to 1 and
+setting any other value than that will return in failure. This is even the case for
+setting bpf_jit_enable to 2, since dumping the final JIT image into the kernel log
+is discouraged and introspection through bpftool (under tools/bpf/bpftool/) is the
+generally recommended approach instead.
+
 In the kernel source tree under tools/bpf/, there's bpf_jit_disasm for
 generating disassembly out of the kernel log's hexdump:
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
