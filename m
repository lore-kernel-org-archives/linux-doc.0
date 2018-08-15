Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 237AC7D584
	for <lwn-linux-doc@archive.lwn.net>; Wed, 15 Aug 2018 20:30:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728083AbeHOXXp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 15 Aug 2018 19:23:45 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37822 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728001AbeHOXXk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Aug 2018 19:23:40 -0400
Received: by mail-lj1-f196.google.com with SMTP id v9-v6so1931075ljk.4
        for <linux-doc@vger.kernel.org>; Wed, 15 Aug 2018 13:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=TWNhjrmgLpSO5MJV73m5bOu5n1H+413r7T8xRTQZNdA=;
        b=HxVe4yiXT/cVV+jcYufkzUnRhINVIclBJ6+TZeyxYDn+E9lClIiJ94c7K32GTtBoMH
         MoqnRk9OE3GoxDL2nMCoApEWWe0BJrRJF8BJ6eTap96qrGtQuxC4hGNnASIJUC8KDGgm
         rB7r4/AD9a+q91ipw30ZUKyBV3I1iW/PpmepI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=TWNhjrmgLpSO5MJV73m5bOu5n1H+413r7T8xRTQZNdA=;
        b=DqWU8hAxBX25MHyWk3ys6dU7pbUoaIJx18uJ05Vl/0VOuXQsFf3lVun1mO8q99UoVg
         qgE+xO/QQW4TYbeTYTV+SRKr6hZXTdk0O0hvLhoVN0U9JTPKkNZFvxK3ASO5HTteOaP3
         RESX+54W2cSXEGqy5R4gpB/WequnUla7K5/zBawS6VZ5OSixfHIEzmL15sB1jrNKi4BF
         1TnTt/Ac7CkEhmSLTPmBOq4EApJ4cpJuO1ohDUjrHzina4xHuX7s/yJ94INg2N5F0ZfP
         oSMosAB848s2oQtgjb7wdh3PyKCupk5j77Nuyk9WHr4akPrpbfTSqFwbcnHuzoVUMcuG
         4jFQ==
X-Gm-Message-State: AOUpUlGuF+UX459A5TXflrtcdW6pmc+MH0WOoqdsn1P0KhHCaPBe6Qnd
        iy5cmxCjkPzC+7NUCcOIX9OTjQ==
X-Google-Smtp-Source: AA+uWPyRKpiccg6z9nNCverE8fzsWvrRsw9Y4gMmHbbk0N+67mNfjJSfK4ERdsrOl7ECr3dG+bxcAQ==
X-Received: by 2002:a2e:3c1a:: with SMTP id j26-v6mr9111405lja.149.1534364996620;
        Wed, 15 Aug 2018 13:29:56 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id w2-v6sm4139026lje.73.2018.08.15.13.29.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Aug 2018 13:29:55 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com, davem@davemloft.net
Cc:     corbet@lwn.net, netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH net-next] Documentation: networking: ti-cpsw: correct cbs parameters for Eth1 100Mb
Date:   Wed, 15 Aug 2018 23:29:53 +0300
Message-Id: <20180815202953.10137-1-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

If set cbs parameters calculated for 1000Mb, but use on 100Mb port
w/o h/w offload (for cpsw offload it doesn't matter), it works
incorrectly. According to the example and testing board, second port
is 100Mb interface. Correct them on recalculated for 100Mb interface.
It allows to use the same command for CBS software implementation for
board in example.

Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
---
Based on net-next/master

 Documentation/networking/ti-cpsw.txt | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/networking/ti-cpsw.txt b/Documentation/networking/ti-cpsw.txt
index 67039205bd69..d4d4c0751a09 100644
--- a/Documentation/networking/ti-cpsw.txt
+++ b/Documentation/networking/ti-cpsw.txt
@@ -469,17 +469,18 @@ $ tc -g class show dev eth1
 
 14)
 // Set rate for class A - 31 Mbit (tc0, txq2) using CBS Qdisc for Eth1
-// here only idle slope is important, others ignored
+// here only idle slope is important, others ignored, but calculated
+// for interface speed - 100Mb for eth1 port.
 // Set it +1 Mb for reserve (important!)
-$ tc qdisc add dev eth1 parent 100:3 cbs locredit -1453 \
-hicredit 47 sendslope -969000 idleslope 31000 offload 1
+$ tc qdisc add dev eth1 parent 100:3 cbs locredit -1035 \
+hicredit 465 sendslope -69000 idleslope 31000 offload 1
 net eth1: set FIFO3 bw = 31
 
 15)
 // Set rate for class B - 11 Mbit (tc1, txq3) using CBS Qdisc for Eth1
 // Set it +1 Mb for reserve (important!)
-$ tc qdisc add dev eth1 parent 100:4 cbs locredit -1483 \
-hicredit 34 sendslope -989000 idleslope 11000 offload 1
+$ tc qdisc add dev eth1 parent 100:4 cbs locredit -1335 \
+hicredit 405 sendslope -89000 idleslope 11000 offload 1
 net eth1: set FIFO2 bw = 11
 
 16)
-- 
2.17.1

