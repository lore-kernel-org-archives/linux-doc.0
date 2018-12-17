Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 54FF77D8A3
	for <lwn-linux-doc@archive.lwn.net>; Mon, 17 Dec 2018 16:01:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387862AbeLQQBN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 17 Dec 2018 11:01:13 -0500
Received: from wp227.webpack.hosteurope.de ([80.237.132.234]:37188 "EHLO
        wp227.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726548AbeLQQBM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Dec 2018 11:01:12 -0500
Received: from ip4d142c80.dynamic.kabel-deutschland.de ([77.20.44.128] helo=truhe.fritz.box); authenticated
        by wp227.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        id 1gYuhH-0007y3-BG; Mon, 17 Dec 2018 16:20:43 +0100
From:   Thorsten Leemhuis <linux@leemhuis.info>
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/1] RFC: Revamp admin-guide/tainted-kernels.rst to make it more comprehensible
Date:   Mon, 17 Dec 2018 16:20:42 +0100
Message-Id: <20181217152043.9989-1-linux@leemhuis.info>
X-Mailer: git-send-email 2.18.1
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1545062472;ec753de2;
X-HE-SMSGID: 1gYuhH-0007y3-BG
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi! Find my first contribution to the kernel documentation in the reply to this
mail. Hopefully a lot more will follow. This patch got triggered while working
on an update for reporting-bugs.rst, as improving the documentation around
reporting bugs and regressions was one of the main things that a lot of people
wanted to see while regression tracking was discussed in the kernel and
maintainer summit 2017 in Prague. 

I'm used to writing, but not in English. Hope the result is not too bad. Needs
someone to do a spell check, too, as I'm bad at finding spelling or grammatical
errors in general; it's even worse when I try to proofread my own texts. :-/

Sorry for using the simple table format for the table. I only noticed the list
table format is preferred after creating the table. Shall I convert it for the
next submission? Sounds like a downside to me, as for a table this small the
simple table format seems way easier to parse when reading the plain text file.

Any feedback much appreciated.

Ciao, Thorsten

Thorsten Leemhuis (1):
  docs: Revamp tainted-kernels.rst to make it more comprehensible

 Documentation/admin-guide/tainted-kernels.rst | 105 ++++++++++++++++--
 1 file changed, 96 insertions(+), 9 deletions(-)

-- 
2.18.1

