Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B5B7F7D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 14 Jan 2019 04:17:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbfANERv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 13 Jan 2019 23:17:51 -0500
Received: from merlin.infradead.org ([205.233.59.134]:43576 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726306AbfANERv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 13 Jan 2019 23:17:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=zTQTh72oJ8SFMcfWPVR9R8rzHYMPo9WoweTe42exdRQ=; b=jJ82Yyp05ictuQKwqD1pd4smBD
        pptbycj5CVLYVAD72y4+LLzGH9eUNn/Pr/wtw6gOz7Uph+N3L/dup+NbXE7mGgmzccPZ0oetXi3Oc
        aXVwDT0Mve3YCXCdv6AEd4byEFoKyfmqc7awtmteLZohmbYannKPlTzpe2Asr0r766GCyAY/rjQfc
        yO4rBq5Oj0b8ntHyEF5F7VOjMh0WrEWeLT6fyhqvuYKprIbZix2fT9RTlq/xpyMXKzR5KlRfaQxI5
        dHXFjvaDz4K7H64ztUDhEAVmyYsPqGA0t5PDvtc0McjSPFjvPJsizgd3M1ApkwHn/tBncXZjhpyWa
        YxUIrC9A==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1gith1-0002GI-6z; Mon, 14 Jan 2019 04:17:44 +0000
To:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        David Miller <davem@davemloft.net>
Cc:     yupeng <yupeng0921@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] networking: Documentation: fix snmp_counters.rst Sphinx
 warnings
Message-ID: <b6936a0a-6ef8-47c0-19f1-f8ad17244407@infradead.org>
Date:   Sun, 13 Jan 2019 20:17:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix over 100 documentation warnings in snmp_counter.rst by
extending the underline string lengths and inserting a blank line
after bullet items.

Examples:

Documentation/networking/snmp_counter.rst:1: WARNING: Title overline too short.
Documentation/networking/snmp_counter.rst:14: WARNING: Bullet list ends without a blank line; unexpected unindent.

Fixes: 2b96547223e3 ("add document for TCP OFO, PAWS and skip ACK counters")
Fixes: 8e2ea53a83df ("add snmp counters document")
Fixes: 712ee16c230f ("add documents for snmp counters")
Fixes: 80cc49507ba4 ("net: Add part of TCP counts explanations in snmp_counters.rst")
Fixes: b08794a922c4 ("documentation of some IP/ICMP snmp counters")

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: yupeng <yupeng0921@gmail.com>
---
 Documentation/networking/snmp_counter.rst |  113 +++++++++++++++-----
 1 file changed, 86 insertions(+), 27 deletions(-)

--- lnx-50-rc2.orig/Documentation/networking/snmp_counter.rst
+++ lnx-50-rc2/Documentation/networking/snmp_counter.rst
@@ -1,16 +1,17 @@
-===========
+============
 SNMP counter
-===========
+============
 
 This document explains the meaning of SNMP counters.
 
 General IPv4 counters
-====================
+=====================
 All layer 4 packets and ICMP packets will change these counters, but
 these counters won't be changed by layer 2 packets (such as STP) or
 ARP packets.
 
 * IpInReceives
+
 Defined in `RFC1213 ipInReceives`_
 
 .. _RFC1213 ipInReceives: https://tools.ietf.org/html/rfc1213#page-26
@@ -23,6 +24,7 @@ and so on).  It indicates the number of
 GRO/LRO.
 
 * IpInDelivers
+
 Defined in `RFC1213 ipInDelivers`_
 
 .. _RFC1213 ipInDelivers: https://tools.ietf.org/html/rfc1213#page-28
@@ -33,6 +35,7 @@ supported protocols will be delivered, i
 socket, all valid IP packets will be delivered.
 
 * IpOutRequests
+
 Defined in `RFC1213 ipOutRequests`_
 
 .. _RFC1213 ipOutRequests: https://tools.ietf.org/html/rfc1213#page-28
@@ -42,6 +45,7 @@ multicast packets, and would always be u
 IpExtOutOctets.
 
 * IpExtInOctets and IpExtOutOctets
+
 They are Linux kernel extensions, no RFC definitions. Please note,
 RFC1213 indeed defines ifInOctets  and ifOutOctets, but they
 are different things. The ifInOctets and ifOutOctets include the MAC
@@ -49,6 +53,7 @@ layer header size but IpExtInOctets and
 only include the IP layer header and the IP layer data.
 
 * IpExtInNoECTPkts, IpExtInECT1Pkts, IpExtInECT0Pkts, IpExtInCEPkts
+
 They indicate the number of four kinds of ECN IP packets, please refer
 `Explicit Congestion Notification`_ for more details.
 
@@ -60,6 +65,7 @@ for the same packet, you might find that
 IpExtInNoECTPkts counts 2 or more.
 
 * IpInHdrErrors
+
 Defined in `RFC1213 ipInHdrErrors`_. It indicates the packet is
 dropped due to the IP header error. It might happen in both IP input
 and IP forward paths.
@@ -67,6 +73,7 @@ and IP forward paths.
 .. _RFC1213 ipInHdrErrors: https://tools.ietf.org/html/rfc1213#page-27
 
 * IpInAddrErrors
+
 Defined in `RFC1213 ipInAddrErrors`_. It will be increased in two
 scenarios: (1) The IP address is invalid. (2) The destination IP
 address is not a local address and IP forwarding is not enabled
@@ -74,6 +81,7 @@ address is not a local address and IP fo
 .. _RFC1213 ipInAddrErrors: https://tools.ietf.org/html/rfc1213#page-27
 
 * IpExtInNoRoutes
+
 This counter means the packet is dropped when the IP stack receives a
 packet and can't find a route for it from the route table. It might
 happen when IP forwarding is enabled and the destination IP address is
@@ -81,6 +89,7 @@ not a local address and there is no rout
 address.
 
 * IpInUnknownProtos
+
 Defined in `RFC1213 ipInUnknownProtos`_. It will be increased if the
 layer 4 protocol is unsupported by kernel. If an application is using
 raw socket, kernel will always deliver the packet to the raw socket
@@ -89,10 +98,12 @@ and this counter won't be increased.
 .. _RFC1213 ipInUnknownProtos: https://tools.ietf.org/html/rfc1213#page-27
 
 * IpExtInTruncatedPkts
+
 For IPv4 packet, it means the actual data size is smaller than the
 "Total Length" field in the IPv4 header.
 
 * IpInDiscards
+
 Defined in `RFC1213 ipInDiscards`_. It indicates the packet is dropped
 in the IP receiving path and due to kernel internal reasons (e.g. no
 enough memory).
@@ -100,20 +111,23 @@ enough memory).
 .. _RFC1213 ipInDiscards: https://tools.ietf.org/html/rfc1213#page-28
 
 * IpOutDiscards
+
 Defined in `RFC1213 ipOutDiscards`_. It indicates the packet is
 dropped in the IP sending path and due to kernel internal reasons.
 
 .. _RFC1213 ipOutDiscards: https://tools.ietf.org/html/rfc1213#page-28
 
 * IpOutNoRoutes
+
 Defined in `RFC1213 ipOutNoRoutes`_. It indicates the packet is
 dropped in the IP sending path and no route is found for it.
 
 .. _RFC1213 ipOutNoRoutes: https://tools.ietf.org/html/rfc1213#page-29
 
 ICMP counters
-============
+=============
 * IcmpInMsgs and IcmpOutMsgs
+
 Defined by `RFC1213 icmpInMsgs`_ and `RFC1213 icmpOutMsgs`_
 
 .. _RFC1213 icmpInMsgs: https://tools.ietf.org/html/rfc1213#page-41
@@ -126,6 +140,7 @@ IcmpOutMsgs would still be updated if th
 a userspace program.
 
 * ICMP named types
+
 | These counters include most of common ICMP types, they are:
 | IcmpInDestUnreachs: `RFC1213 icmpInDestUnreachs`_
 | IcmpInTimeExcds: `RFC1213 icmpInTimeExcds`_
@@ -180,6 +195,7 @@ straightforward. The 'In' counter means
 and the 'Out' counter means kernel sends such a packet.
 
 * ICMP numeric types
+
 They are IcmpMsgInType[N] and IcmpMsgOutType[N], the [N] indicates the
 ICMP type number. These counters track all kinds of ICMP packets. The
 ICMP type number definition could be found in the `ICMP parameters`_
@@ -192,12 +208,14 @@ IcmpMsgOutType8 would increase 1. And if
 packet, IcmpMsgInType0 would increase 1.
 
 * IcmpInCsumErrors
+
 This counter indicates the checksum of the ICMP packet is
 wrong. Kernel verifies the checksum after updating the IcmpInMsgs and
 before updating IcmpMsgInType[N]. If a packet has bad checksum, the
 IcmpInMsgs would be updated but none of IcmpMsgInType[N] would be updated.
 
 * IcmpInErrors and IcmpOutErrors
+
 Defined by `RFC1213 icmpInErrors`_ and `RFC1213 icmpOutErrors`_
 
 .. _RFC1213 icmpInErrors: https://tools.ietf.org/html/rfc1213#page-41
@@ -209,7 +227,7 @@ and the sending packet path use IcmpOutE
 is increased, IcmpInErrors would always be increased too.
 
 relationship of the ICMP counters
--------------------------------
+---------------------------------
 The sum of IcmpMsgOutType[N] is always equal to IcmpOutMsgs, as they
 are updated at the same time. The sum of IcmpMsgInType[N] plus
 IcmpInErrors should be equal or larger than IcmpInMsgs. When kernel
@@ -229,8 +247,9 @@ IcmpInMsgs should be less than the sum o
 IcmpInErrors.
 
 General TCP counters
-==================
+====================
 * TcpInSegs
+
 Defined in `RFC1213 tcpInSegs`_
 
 .. _RFC1213 tcpInSegs: https://tools.ietf.org/html/rfc1213#page-48
@@ -247,6 +266,7 @@ isn't aware of GRO. So if two packets ar
 counter would only increase 1.
 
 * TcpOutSegs
+
 Defined in `RFC1213 tcpOutSegs`_
 
 .. _RFC1213 tcpOutSegs: https://tools.ietf.org/html/rfc1213#page-48
@@ -258,6 +278,7 @@ GSO, so if a packet would be split to 2
 increase 2.
 
 * TcpActiveOpens
+
 Defined in `RFC1213 tcpActiveOpens`_
 
 .. _RFC1213 tcpActiveOpens: https://tools.ietf.org/html/rfc1213#page-47
@@ -267,6 +288,7 @@ state. Every time TcpActiveOpens increas
 increase 1.
 
 * TcpPassiveOpens
+
 Defined in `RFC1213 tcpPassiveOpens`_
 
 .. _RFC1213 tcpPassiveOpens: https://tools.ietf.org/html/rfc1213#page-47
@@ -275,6 +297,7 @@ It means the TCP layer receives a SYN, r
 the SYN-RCVD state.
 
 * TcpExtTCPRcvCoalesce
+
 When packets are received by the TCP layer and are not be read by the
 application, the TCP layer will try to merge them. This counter
 indicate how many packets are merged in such situation. If GRO is
@@ -282,12 +305,14 @@ enabled, lots of packets would be merged
 wouldn't be counted to TcpExtTCPRcvCoalesce.
 
 * TcpExtTCPAutoCorking
+
 When sending packets, the TCP layer will try to merge small packets to
 a bigger one. This counter increase 1 for every packet merged in such
 situation. Please refer to the LWN article for more details:
 https://lwn.net/Articles/576263/
 
 * TcpExtTCPOrigDataSent
+
 This counter is explained by `kernel commit f19c29e3e391`_, I pasted the
 explaination below::
 
@@ -297,6 +322,7 @@ explaination below::
   more useful to track the TCP retransmission rate.
 
 * TCPSynRetrans
+
 This counter is explained by `kernel commit f19c29e3e391`_, I pasted the
 explaination below::
 
@@ -304,6 +330,7 @@ explaination below::
   retransmissions into SYN, fast-retransmits, timeout retransmits, etc.
 
 * TCPFastOpenActiveFail
+
 This counter is explained by `kernel commit f19c29e3e391`_, I pasted the
 explaination below::
 
@@ -313,6 +340,7 @@ explaination below::
 .. _kernel commit f19c29e3e391: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f19c29e3e391a66a273e9afebaf01917245148cd
 
 * TcpExtListenOverflows and TcpExtListenDrops
+
 When kernel receives a SYN from a client, and if the TCP accept queue
 is full, kernel will drop the SYN and add 1 to TcpExtListenOverflows.
 At the same time kernel will also add 1 to TcpExtListenDrops. When a
@@ -337,7 +365,7 @@ to the accept queue.
 
 
 TCP Fast Open
-============
+=============
 When kernel receives a TCP packet, it has two paths to handler the
 packet, one is fast path, another is slow path. The comment in kernel
 code provides a good explanation of them, I pasted them below::
@@ -370,22 +398,24 @@ will disable the fast path at first, and
 receives packets.
 
 * TcpExtTCPPureAcks and TcpExtTCPHPAcks
+
 If a packet set ACK flag and has no data, it is a pure ACK packet, if
 kernel handles it in the fast path, TcpExtTCPHPAcks will increase 1,
 if kernel handles it in the slow path, TcpExtTCPPureAcks will
 increase 1.
 
 * TcpExtTCPHPHits
+
 If a TCP packet has data (which means it is not a pure ACK packet),
 and this packet is handled in the fast path, TcpExtTCPHPHits will
 increase 1.
 
 
 TCP abort
-========
-
+=========
 
 * TcpExtTCPAbortOnData
+
 It means TCP layer has data in flight, but need to close the
 connection. So TCP layer sends a RST to the other side, indicate the
 connection is not closed very graceful. An easy way to increase this
@@ -404,11 +434,13 @@ when the application closes a connection
 immediately and increase the TcpExtTCPAbortOnData counter.
 
 * TcpExtTCPAbortOnClose
+
 This counter means the application has unread data in the TCP layer when
 the application wants to close the TCP connection. In such a situation,
 kernel will send a RST to the other side of the TCP connection.
 
 * TcpExtTCPAbortOnMemory
+
 When an application closes a TCP connection, kernel still need to track
 the connection, let it complete the TCP disconnect process. E.g. an
 app calls the close method of a socket, kernel sends fin to the other
@@ -430,10 +462,12 @@ the tcp_mem. Please refer the tcp_mem se
 
 
 * TcpExtTCPAbortOnTimeout
+
 This counter will increase when any of the TCP timers expire. In such
 situation, kernel won't send RST, just give up the connection.
 
 * TcpExtTCPAbortOnLinger
+
 When a TCP connection comes into FIN_WAIT_2 state, instead of waiting
 for the fin packet from the other side, kernel could send a RST and
 delete the socket immediately. This is not the default behavior of
@@ -441,6 +475,7 @@ Linux kernel TCP stack. By configuring t
 you could let kernel follow this behavior.
 
 * TcpExtTCPAbortFailed
+
 The kernel TCP layer will send RST if the `RFC2525 2.17 section`_ is
 satisfied. If an internal error occurs during this process,
 TcpExtTCPAbortFailed will be increased.
@@ -448,7 +483,7 @@ TcpExtTCPAbortFailed will be increased.
 .. _RFC2525 2.17 section: https://tools.ietf.org/html/rfc2525#page-50
 
 TCP Hybrid Slow Start
-====================
+=====================
 The Hybrid Slow Start algorithm is an enhancement of the traditional
 TCP congestion window Slow Start algorithm. It uses two pieces of
 information to detect whether the max bandwidth of the TCP path is
@@ -464,23 +499,27 @@ relate with the Hybrid Slow Start algori
 .. _Hybrid Slow Start paper: https://pdfs.semanticscholar.org/25e9/ef3f03315782c7f1cbcd31b587857adae7d1.pdf
 
 * TcpExtTCPHystartTrainDetect
+
 How many times the ACK train length threshold is detected
 
 * TcpExtTCPHystartTrainCwnd
+
 The sum of CWND detected by ACK train length. Dividing this value by
 TcpExtTCPHystartTrainDetect is the average CWND which detected by the
 ACK train length.
 
 * TcpExtTCPHystartDelayDetect
+
 How many times the packet delay threshold is detected.
 
 * TcpExtTCPHystartDelayCwnd
+
 The sum of CWND detected by packet delay. Dividing this value by
 TcpExtTCPHystartDelayDetect is the average CWND which detected by the
 packet delay.
 
 TCP retransmission and congestion control
-======================================
+=========================================
 The TCP protocol has two retransmission mechanisms: SACK and fast
 recovery. They are exclusive with each other. When SACK is enabled,
 the kernel TCP stack would use SACK, or kernel would use fast
@@ -499,12 +538,14 @@ https://pdfs.semanticscholar.org/0e9c/96
 .. _RFC6582: https://tools.ietf.org/html/rfc6582
 
 * TcpExtTCPRenoRecovery and TcpExtTCPSackRecovery
+
 When the congestion control comes into Recovery state, if sack is
 used, TcpExtTCPSackRecovery increases 1, if sack is not used,
 TcpExtTCPRenoRecovery increases 1. These two counters mean the TCP
 stack begins to retransmit the lost packets.
 
 * TcpExtTCPSACKReneging
+
 A packet was acknowledged by SACK, but the receiver has dropped this
 packet, so the sender needs to retransmit this packet. In this
 situation, the sender adds 1 to TcpExtTCPSACKReneging. A receiver
@@ -515,6 +556,7 @@ the RTO expires for this packet, then th
 has been dropped by the receiver.
 
 * TcpExtTCPRenoReorder
+
 The reorder packet is detected by fast recovery. It would only be used
 if SACK is disabled. The fast recovery algorithm detects recorder by
 the duplicate ACK number. E.g., if retransmission is triggered, and
@@ -525,6 +567,7 @@ order packet. Thus the sender would find
 expectation, and the sender knows out of order occurs.
 
 * TcpExtTCPTSReorder
+
 The reorder packet is detected when a hole is filled. E.g., assume the
 sender sends packet 1,2,3,4,5, and the receiving order is
 1,2,4,5,3. When the sender receives the ACK of packet 3 (which will
@@ -534,6 +577,7 @@ fill the hole), two conditions will let
 than the retransmission timestamp.
 
 * TcpExtTCPSACKReorder
+
 The reorder packet detected by SACK. The SACK has two methods to
 detect reorder: (1) DSACK is received by the sender. It means the
 sender sends the same packet more than one times. And the only reason
@@ -558,39 +602,46 @@ sender side.
 .. _RFC2883 : https://tools.ietf.org/html/rfc2883
 
 * TcpExtTCPDSACKOldSent
+
 The TCP stack receives a duplicate packet which has been acked, so it
 sends a DSACK to the sender.
 
 * TcpExtTCPDSACKOfoSent
+
 The TCP stack receives an out of order duplicate packet, so it sends a
 DSACK to the sender.
 
 * TcpExtTCPDSACKRecv
+
 The TCP stack receives a DSACK, which indicate an acknowledged
 duplicate packet is received.
 
 * TcpExtTCPDSACKOfoRecv
+
 The TCP stack receives a DSACK, which indicate an out of order
 duplicate packet is received.
 
 TCP out of order
-===============
+================
 * TcpExtTCPOFOQueue
+
 The TCP layer receives an out of order packet and has enough memory
 to queue it.
 
 * TcpExtTCPOFODrop
+
 The TCP layer receives an out of order packet but doesn't have enough
 memory, so drops it. Such packets won't be counted into
 TcpExtTCPOFOQueue.
 
 * TcpExtTCPOFOMerge
+
 The received out of order packet has an overlay with the previous
 packet. the overlay part will be dropped. All of TcpExtTCPOFOMerge
 packets will also be counted into TcpExtTCPOFOQueue.
 
 TCP PAWS
-=======
+========
 PAWS (Protection Against Wrapped Sequence numbers) is an algorithm
 which is used to drop old packets. It depends on the TCP
 timestamps. For detail information, please refer the `timestamp wiki`_
@@ -600,13 +651,15 @@ and the `RFC of PAWS`_.
 .. _timestamp wiki: https://en.wikipedia.org/wiki/Transmission_Control_Protocol#TCP_timestamps
 
 * TcpExtPAWSActive
+
 Packets are dropped by PAWS in Syn-Sent status.
 
 * TcpExtPAWSEstab
+
 Packets are dropped by PAWS in any status other than Syn-Sent.
 
 TCP ACK skip
-===========
+============
 In some scenarios, kernel would avoid sending duplicate ACKs too
 frequently. Please find more details in the tcp_invalid_ratelimit
 section of the `sysctl document`_. When kernel decides to skip an ACK
@@ -618,6 +671,7 @@ it has no data.
 .. _sysctl document: https://www.kernel.org/doc/Documentation/networking/ip-sysctl.txt
 
 * TcpExtTCPACKSkippedSynRecv
+
 The ACK is skipped in Syn-Recv status. The Syn-Recv status means the
 TCP stack receives a SYN and replies SYN+ACK. Now the TCP stack is
 waiting for an ACK. Generally, the TCP stack doesn't need to send ACK
@@ -631,6 +685,7 @@ increase TcpExtTCPACKSkippedSynRecv.
 
 
 * TcpExtTCPACKSkippedPAWS
+
 The ACK is skipped due to PAWS (Protect Against Wrapped Sequence
 numbers) check fails. If the PAWS check fails in Syn-Recv, Fin-Wait-2
 or Time-Wait statuses, the skipped ACK would be counted to
@@ -639,18 +694,22 @@ TcpExtTCPACKSkippedTimeWait. In all othe
 would be counted to TcpExtTCPACKSkippedPAWS.
 
 * TcpExtTCPACKSkippedSeq
+
 The sequence number is out of window and the timestamp passes the PAWS
 check and the TCP status is not Syn-Recv, Fin-Wait-2, and Time-Wait.
 
 * TcpExtTCPACKSkippedFinWait2
+
 The ACK is skipped in Fin-Wait-2 status, the reason would be either
 PAWS check fails or the received sequence number is out of window.
 
 * TcpExtTCPACKSkippedTimeWait
+
 Tha ACK is skipped in Time-Wait status, the reason would be either
 PAWS check failed or the received sequence number is out of window.
 
 * TcpExtTCPACKSkippedChallenge
+
 The ACK is skipped if the ACK is a challenge ACK. The RFC 5961 defines
 3 kind of challenge ACK, please refer `RFC 5961 section 3.2`_,
 `RFC 5961 section 4.2`_ and `RFC 5961 section 5.2`_. Besides these
@@ -664,10 +723,10 @@ unacknowledged number (more strict than
 
 
 examples
-=======
+========
 
 ping test
---------
+---------
 Run the ping command against the public dns server 8.8.8.8::
 
   nstatuser@nstat-a:~$ ping 8.8.8.8 -c 1
@@ -711,7 +770,7 @@ and its corresponding Echo Reply packet
 So the IpExtInOctets and IpExtOutOctets are 20+16+48=84.
 
 tcp 3-way handshake
-------------------
+-------------------
 On server side, we run::
 
   nstatuser@nstat-b:~$ nc -lknv 0.0.0.0 9000
@@ -753,7 +812,7 @@ ACK, so client sent 2 packets, received
 1, TcpOutSegs increased 2.
 
 TCP normal traffic
------------------
+------------------
 Run nc on server::
 
   nstatuser@nstat-b:~$ nc -lkv 0.0.0.0 9000
@@ -876,7 +935,7 @@ and the packet received from client qual
 was counted into 'TcpExtTCPHPHits'.
 
 TcpExtTCPAbortOnClose
---------------------
+---------------------
 On the server side, we run below python script::
 
   import socket
@@ -910,7 +969,7 @@ If we run tcpdump on the server side, we
 RST after we type Ctrl-C.
 
 TcpExtTCPAbortOnMemory and TcpExtTCPAbortOnTimeout
------------------------------------------------
+---------------------------------------------------
 Below is an example which let the orphan socket count be higher than
 net.ipv4.tcp_max_orphans.
 Change tcp_max_orphans to a smaller value on client::
@@ -1032,7 +1091,7 @@ FIN_WAIT_1 state finally. So we wait for
   TcpExtTCPAbortOnTimeout         10                 0.0
 
 TcpExtTCPAbortOnLinger
----------------------
+----------------------
 The server side code::
 
   nstatuser@nstat-b:~$ cat server_linger.py
@@ -1077,7 +1136,7 @@ After run client_linger.py, check the ou
   TcpExtTCPAbortOnLinger          1                  0.0
 
 TcpExtTCPRcvCoalesce
--------------------
+--------------------
 On the server, we run a program which listen on TCP port 9000, but
 doesn't read any data::
 
@@ -1137,7 +1196,7 @@ the receiving queue. So the TCP layer me
 could find the TcpExtTCPRcvCoalesce increased 1.
 
 TcpExtListenOverflows and TcpExtListenDrops
-----------------------------------------
+-------------------------------------------
 On server, run the nc command, listen on port 9000::
 
   nstatuser@nstat-b:~$ nc -lkv 0.0.0.0 9000
@@ -1185,7 +1244,7 @@ TcpExtListenOverflows and TcpExtListenDr
 the SYN of the 4th nc was dropped, the client was retrying.
 
 IpInAddrErrors, IpExtInNoRoutes and IpOutNoRoutes
-----------------------------------------------
+-------------------------------------------------
 server A IP address: 192.168.122.250
 server B IP address: 192.168.122.251
 Prepare on server A, add a route to server B::
@@ -1280,7 +1339,7 @@ a route for the 8.8.8.8 IP address, so s
 IpOutNoRoutes.
 
 TcpExtTCPACKSkippedSynRecv
-------------------------
+--------------------------
 In this test, we send 3 same SYN packets from client to server. The
 first SYN will let server create a socket, set it to Syn-Recv status,
 and reply a SYN/ACK. The second SYN will let server reply the SYN/ACK
@@ -1328,7 +1387,7 @@ Check snmp cunter on nstat-b::
 As we expected, TcpExtTCPACKSkippedSynRecv is 1.
 
 TcpExtTCPACKSkippedPAWS
-----------------------
+-----------------------
 To trigger PAWS, we could send an old SYN.
 
 On nstat-b, let nc listen on port 9000::
@@ -1365,7 +1424,7 @@ failed, the nstat-b replied an ACK for t
 for the second SYN, and updated TcpExtTCPACKSkippedPAWS.
 
 TcpExtTCPACKSkippedSeq
---------------------
+----------------------
 To trigger TcpExtTCPACKSkippedSeq, we send packets which have valid
 timestamp (to pass PAWS check) but the sequence number is out of
 window. The linux TCP stack would avoid to skip if the packet has

