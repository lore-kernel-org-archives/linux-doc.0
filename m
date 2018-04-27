Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3AEC57DE78
	for <lwn-linux-doc@archive.lwn.net>; Fri, 27 Apr 2018 10:35:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932546AbeD0Kfs (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 27 Apr 2018 06:35:48 -0400
Received: from mail-wr0-f193.google.com ([209.85.128.193]:35408 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932415AbeD0Kfr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Apr 2018 06:35:47 -0400
Received: by mail-wr0-f193.google.com with SMTP id w3-v6so1298118wrg.2;
        Fri, 27 Apr 2018 03:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=pMVzJh8Wqnz04wkN8songpGDeHnnhUDZOHq47GugNfc=;
        b=Tck11ogN7J4BYnnufRUNvkcd8NyLiMev1gOFkrQByC9st0cxrALdZc7QWf76pCti50
         t8CbmE52Sh/1Lcj4KeOEsQBSRbNJSfhqYEGnerAumRiK/IRzt9Ptus5RYMguCA66qPIH
         2zblX6Tq57v4tieoJ+6TJqX9eMPWLspwBn0zfKhP3VTTUOn/1nph+u5/2VwCqg3r3Nyh
         6X6l8ukGrndUEyKUoaFm55VBrtGcgV0CtaVk/UDeBbqpQ2HiJJYK6j18skTYNZlFVz3x
         P45eCRXwC946pZB1wtKr5X27h2G+8sIL10JQYVrPiSgFmOg7qZTAODW2BTgdxRWKZDQS
         o4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=pMVzJh8Wqnz04wkN8songpGDeHnnhUDZOHq47GugNfc=;
        b=sNeabwt+yeTH8aHNqDYP2Km5iw6FwkiqDzbIXCsyj3e4VaetO+kZSeTCZbH1D74E2T
         1FzH2E6bh/M+feC4SZpNEoJdx0xjRAnUdEFCzMsG7e7eMfOau+cUt6gDZI2ffuGWV3yE
         YOoP5vwkauctdfIcLTopkCMGU4rJyQUwP1HEBMsfGEyl7D/3JJG2bIvBScg2czYHcOh8
         0IXWLg+TJpIldYFrJ3HWuGHkOgxV2osjb6LAFw8x/vL8Lmr3pN+WgDxeSLwxAZ4fzVEV
         OkTyigSOckbAbfD0OpPJckpDtMDoXXYlnWVvQYmQrQ/7P0PGCjpYlCzld51XTQyyqr1g
         7vsw==
X-Gm-Message-State: ALQs6tCe5R60hdGGr4yixhB7Hp6GeaF3hSlqSVhuk4RBUv7sr+YjXigM
        U4Z/e96AHPQy6CGEWf+MtYM=
X-Google-Smtp-Source: AB8JxZrdhRfN34LbF+93NhofATqhYVcFBhJkYnLKzBGxLZ0o1zXNEtJAVxHW8jhWHE0mcLbWn/huSg==
X-Received: by 2002:adf:8248:: with SMTP id 66-v6mr1402076wrb.127.1524825346114;
        Fri, 27 Apr 2018 03:35:46 -0700 (PDT)
Received: from localhost.localdomain ([192.135.27.140])
        by smtp.gmail.com with ESMTPSA id a129sm1892537wme.3.2018.04.27.03.35.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 27 Apr 2018 03:35:45 -0700 (PDT)
From:   Ahmed Abdelsalam <amsalam20@gmail.com>
To:     davem@davemloft.net, linux-doc@vger.kernel.org,
        netdev@vger.kernel.org
Cc:     Ahmed Abdelsalam <amsalam20@gmail.com>
Subject: [net-next] ipv6: sr: Add documentation for seg_flowlabel sysctl
Date:   Fri, 27 Apr 2018 12:35:44 +0200
Message-Id: <1524825344-2573-1-git-send-email-amsalam20@gmail.com>
X-Mailer: git-send-email 2.1.4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch adds a documentation for seg_flowlabel sysctl into
Documentation/networking/ip-sysctl.txt

Signed-off-by: Ahmed Abdelsalam <amsalam20@gmail.com>
---
 Documentation/networking/ip-sysctl.txt | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/networking/ip-sysctl.txt b/Documentation/networking/ip-sysctl.txt
index 5dc1a04..7528f71 100644
--- a/Documentation/networking/ip-sysctl.txt
+++ b/Documentation/networking/ip-sysctl.txt
@@ -1428,6 +1428,19 @@ ip6frag_low_thresh - INTEGER
 ip6frag_time - INTEGER
 	Time in seconds to keep an IPv6 fragment in memory.
 
+IPv6 Segment Routing:
+
+seg6_flowlabel - INTEGER
+	Controls the behaviour of computing the flowlabel of outer
+	IPv6 header in case of SR T.encaps
+
+	-1 set flowlabel to zero.
+	0 copy flowlabel from Inner paceket in case of Inner IPv6
+		(Set flowlabel to 0 in case IPv4/L2)
+	1 Compute the flowlabel using seg6_make_flowlabel()
+
+	Default is 0.
+
 conf/default/*:
 	Change the interface-specific default settings.
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
