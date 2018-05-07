Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 933867E27D
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 May 2018 09:38:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752504AbeEGJgJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 May 2018 05:36:09 -0400
Received: from osg.samsung.com ([64.30.133.232]:60958 "EHLO osg.samsung.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752176AbeEGJgE (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 7 May 2018 05:36:04 -0400
Received: from localhost (localhost [127.0.0.1])
        by osg.samsung.com (Postfix) with ESMTP id AB90623411;
        Mon,  7 May 2018 02:36:03 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at dev.s-opensource.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from osg.samsung.com ([127.0.0.1])
        by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id zkD-_p8ZMPac; Mon,  7 May 2018 02:36:02 -0700 (PDT)
Received: from smtp.s-opensource.com (177.41.109.86.dynamic.adsl.gvt.net.br [177.41.109.86])
        by osg.samsung.com (Postfix) with ESMTPSA id 39696233DB;
        Mon,  7 May 2018 02:36:01 -0700 (PDT)
Received: from mchehab by smtp.s-opensource.com with local (Exim 4.90_1)
        (envelope-from <mchehab@smtp.s-opensource.com>)
        id 1fFcYo-00087A-N9; Mon, 07 May 2018 06:35:58 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Oliver Hartkopp <socketcan@hartkopp.net>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        "David S. Miller" <davem@davemloft.net>, linux-can@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH 01/18] docs: can.rst: fix a footnote reference
Date:   Mon,  7 May 2018 06:35:37 -0300
Message-Id: <2a04ab24f302a0802572c4c80c4d416b953f213d.1525684985.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525684985.git.mchehab+samsung@kernel.org>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
In-Reply-To: <cover.1525684985.git.mchehab+samsung@kernel.org>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

As stated at:
	http://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#footnotes

A footnote should contain either a number, a reference or
an auto number, e. g.:
	[1], [#f1] or [#].

While using [*] accidentaly works for html, it fails for other
document outputs. In particular, it causes an error with LaTeX
output, causing all books after networking to not be built.

So, replace it by a valid syntax.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/networking/can.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/networking/can.rst b/Documentation/networking/can.rst
index d23c51abf8c6..2fd0b51a8c52 100644
--- a/Documentation/networking/can.rst
+++ b/Documentation/networking/can.rst
@@ -164,7 +164,7 @@ The Linux network devices (by default) just can handle the
 transmission and reception of media dependent frames. Due to the
 arbitration on the CAN bus the transmission of a low prio CAN-ID
 may be delayed by the reception of a high prio CAN frame. To
-reflect the correct [*]_ traffic on the node the loopback of the sent
+reflect the correct [#f1]_ traffic on the node the loopback of the sent
 data has to be performed right after a successful transmission. If
 the CAN network interface is not capable of performing the loopback for
 some reason the SocketCAN core can do this task as a fallback solution.
@@ -175,7 +175,7 @@ networking behaviour for CAN applications. Due to some requests from
 the RT-SocketCAN group the loopback optionally may be disabled for each
 separate socket. See sockopts from the CAN RAW sockets in :ref:`socketcan-raw-sockets`.
 
-.. [*] you really like to have this when you're running analyser
+.. [#f1] you really like to have this when you're running analyser
        tools like 'candump' or 'cansniffer' on the (same) node.
 
 
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
