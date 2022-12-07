Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BF35C4708D
	for <linux-doc@archiver.kernel.org>; Wed,  7 Dec 2022 11:23:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbiLGLXh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Dec 2022 06:23:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbiLGLXc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Dec 2022 06:23:32 -0500
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55973228;
        Wed,  7 Dec 2022 03:23:30 -0800 (PST)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mxhk.zte.com.cn (FangMail) with ESMTPS id 4NRvzg3QsYz8RV6B;
        Wed,  7 Dec 2022 19:23:27 +0800 (CST)
Received: from szxlzmapp06.zte.com.cn ([10.5.230.252])
        by mse-fl2.zte.com.cn with SMTP id 2B7BNF5m061437;
        Wed, 7 Dec 2022 19:23:15 +0800 (+08)
        (envelope-from yang.yang29@zte.com.cn)
Received: from mapi (szxlzmapp02[null])
        by mapi (Zmail) with MAPI id mid14;
        Wed, 7 Dec 2022 19:23:18 +0800 (CST)
Date:   Wed, 7 Dec 2022 19:23:18 +0800 (CST)
X-Zmail-TransId: 2b04639077a61acce282
X-Mailer: Zmail v1.0
Message-ID: <202212071923184146141@zte.com.cn>
Mime-Version: 1.0
From:   <yang.yang29@zte.com.cn>
To:     <corbet@lwn.net>, <kuba@kernel.org>, <bagasdotme@gmail.com>
Cc:     <davem@davemloft.net>, <hannes@cmpxchg.org>,
        <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4LW5leHQgdjJdIGRvY3M6IHByb2MucnN0OiBhZGQgc29mdG5ldF9zdGF0IHRvIC9wcm9jL25ldA==?=
Content-Type: text/plain;
        charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 2B7BNF5m061437
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.250.137.novalocal with ID 639077AF.001 by FangMail milter!
X-FangMail-Envelope: 1670412207/4NRvzg3QsYz8RV6B/639077AF.001/10.5.228.133/[10.5.228.133]/mse-fl2.zte.com.cn/<yang.yang29@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 639077AF.001/4NRvzg3QsYz8RV6B
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Yang Yang <yang.yang29@zte.com.cn>

/proc/net/softnet_stat exists for a long time, but proc.rst miss it.
Softnet_stat shows some statistics of struct softnet_data of online
CPUs. Struct softnet_data manages incoming and output packets
on per-CPU queues. Notice that fastroute and cpu_collision in
softnet_stat are obsoleted, their value is always 0.

Signed-off-by: Yang Yang <yang.yang29@zte.com.cn>
Reviewed-by: xu xin <xu.xin16@zte.com.cn>
Reviewed-by: Zhang Yunkai <zhang.yunkai@zte.com.cn>
---
Changes since v1: - refine patch subject
---
 Documentation/filesystems/proc.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index e224b6d5b642..9d5fd9424e8b 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -1284,6 +1284,7 @@ support this. Table 1-9 lists the files and their meaning.
  rt_cache      Routing cache
  snmp          SNMP data
  sockstat      Socket statistics
+ softnet_stat  Per-CPU incoming packets queues statistics of online CPUs
  tcp           TCP  sockets
  udp           UDP sockets
  unix          UNIX domain sockets
-- 
2.15.2
