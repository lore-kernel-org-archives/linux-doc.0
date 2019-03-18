Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3B69F7D099
	for <lwn-linux-doc@archive.lwn.net>; Mon, 18 Mar 2019 00:17:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727566AbfCRARu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 17 Mar 2019 20:17:50 -0400
Received: from merlin.infradead.org ([205.233.59.134]:51540 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726735AbfCRARu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 17 Mar 2019 20:17:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ibrFeGCGNaPSQVIEn8BUSxkvDL6oxW1aG9/8TPJfK/Y=; b=uC1FTWoot0UFj+XjemtLZ5pdf+
        cw8wKUrDgvMjpUyxydEPx5S+9YUlSH8mCwuQ1dLSFThnbwsogxubdpFRmZBkoeVSifn+Yzi7yfy/e
        zBLCZUxW58bBynbVoyUtlEYYOI9p+b+U7BhmVvX8mPCQyAzcJ6dwHT6aoZhUQNe0h5yc38ouRRfEb
        EsGxFKKDQr7wltSH4cjQUA/g/E05PSuv1/ko9H8yKVcKnFzM0nuJt6QC10j+VpSnn1NnL8NaaMLYR
        9KMyGFYSUGXeumAlnWS6N1FoAo7AWvM+Mhh5JtX4tZAq91quGDxorayELZv/ecJECvz6mq9iCHUpW
        rf9/eyDQ==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1h5fyO-00061g-0d; Mon, 18 Mar 2019 00:17:48 +0000
To:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        David Miller <davem@davemloft.net>
Cc:     yupeng <yupeng0921@gmail.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] networking: fix snmp_counter.rst Doc. Warnings
Message-ID: <d5d2f833-0a08-6b02-1754-6262b5102369@infradead.org>
Date:   Sun, 17 Mar 2019 17:17:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix documentation markup warnings in snmp_counter.rst:

Documentation/networking/snmp_counter.rst:416: WARNING: Title underline too short.
Documentation/networking/snmp_counter.rst:684: WARNING: Bullet list ends without a blank line; unexpected unindent.
Documentation/networking/snmp_counter.rst:693: WARNING: Title underline too short.
Documentation/networking/snmp_counter.rst:707: WARNING: Bullet list ends without a blank line; unexpected unindent.
Documentation/networking/snmp_counter.rst:712: WARNING: Bullet list ends without a blank line; unexpected unindent.
Documentation/networking/snmp_counter.rst:722: WARNING: Title underline too short.
Documentation/networking/snmp_counter.rst:733: WARNING: Bullet list ends without a blank line; unexpected unindent.
Documentation/networking/snmp_counter.rst:736: WARNING: Bullet list ends without a blank line; unexpected unindent.
Documentation/networking/snmp_counter.rst:739: WARNING: Bullet list ends without a blank line; unexpected unindent.

Fixes: 80cc49507ba48 ("net: Add part of TCP counts explanations in snmp_counters.rst")
Fixes: 8e2ea53a83dfb ("add snmp counters document")
Fixes: a6c7c7aac2de6 ("net: add document for several snmp counters")

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: yupeng <yupeng0921@gmail.com>
---
 Documentation/networking/snmp_counter.rst |   12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

--- lnx-51-rc1.orig/Documentation/networking/snmp_counter.rst
+++ lnx-51-rc1/Documentation/networking/snmp_counter.rst
@@ -413,7 +413,7 @@ algorithm.
 .. _F-RTO: https://tools.ietf.org/html/rfc5682
 
 TCP Fast Path
-============
+=============
 When kernel receives a TCP packet, it has two paths to handler the
 packet, one is fast path, another is slow path. The comment in kernel
 code provides a good explanation of them, I pasted them below::
@@ -681,6 +681,7 @@ The TCP stack receives an out of order d
 DSACK to the sender.
 
 * TcpExtTCPDSACKRecv
+
 The TCP stack receives a DSACK, which indicates an acknowledged
 duplicate packet is received.
 
@@ -690,7 +691,7 @@ The TCP stack receives a DSACK, which in
 duplicate packet is received.
 
 invalid SACK and DSACK
-====================
+======================
 When a SACK (or DSACK) block is invalid, a corresponding counter would
 be updated. The validation method is base on the start/end sequence
 number of the SACK block. For more details, please refer the comment
@@ -704,11 +705,13 @@ explaination:
 .. _Add counters for discarded SACK blocks: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=18f02545a9a16c9a89778b91a162ad16d510bb32
 
 * TcpExtTCPSACKDiscard
+
 This counter indicates how many SACK blocks are invalid. If the invalid
 SACK block is caused by ACK recording, the TCP stack will only ignore
 it and won't update this counter.
 
 * TcpExtTCPDSACKIgnoredOld and TcpExtTCPDSACKIgnoredNoUndo
+
 When a DSACK block is invalid, one of these two counters would be
 updated. Which counter will be updated depends on the undo_marker flag
 of the TCP socket. If the undo_marker is not set, the TCP stack isn't
@@ -719,7 +722,7 @@ will be updated. If the undo_marker is s
 will be updated. As implied in its name, it might be an old packet.
 
 SACK shift
-=========
+==========
 The linux networking stack stores data in sk_buff struct (skb for
 short). If a SACK block acrosses multiple skb, the TCP stack will try
 to re-arrange data in these skb. E.g. if a SACK block acknowledges seq
@@ -730,12 +733,15 @@ seq 14 to 20. All data in skb2 will be m
 discard, this operation is 'merge'.
 
 * TcpExtTCPSackShifted
+
 A skb is shifted
 
 * TcpExtTCPSackMerged
+
 A skb is merged
 
 * TcpExtTCPSackShiftFallback
+
 A skb should be shifted or merged, but the TCP stack doesn't do it for
 some reasons.
 


