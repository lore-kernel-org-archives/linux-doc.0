Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 49C0F7D08E
	for <lwn-linux-doc@archive.lwn.net>; Mon,  8 Oct 2018 11:06:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbeJHSQT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 8 Oct 2018 14:16:19 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:52832 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727285AbeJHSQT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Oct 2018 14:16:19 -0400
Received: from ramsan.of.borg ([84.194.111.163])
        by xavier.telenet-ops.be with bizsmtp
        id kz561y0043XaVaC01z56XY; Mon, 08 Oct 2018 13:05:06 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.86_2)
        (envelope-from <geert@linux-m68k.org>)
        id 1g9TLV-000510-TU; Mon, 08 Oct 2018 13:05:05 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1g9TLV-0006dJ-RR; Mon, 08 Oct 2018 13:05:05 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Petr Mladek <pmladek@suse.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Tobin C . Harding" <me@tobin.cc>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] lib/vsprintf: Hash remaining raw addresses
Date:   Mon,  8 Oct 2018 13:05:01 +0200
Message-Id: <20181008110504.25449-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

	Hi all,

There are still two format specifiers that print unhanced kernel
addresses, potentially leaking sensitive information regarding the
kernel layout in memory.

This patch series fixes this by printing hashed addresses instead.
    
Thanks!

Geert Uytterhoeven (3):
  lib/vsprintf: Prepare for more general use of ptr_to_id()
  lib/vsprintf: Hash legacy clock addresses
  lib/vsprintf: Hash printed address for netdev bits fallback

 Documentation/core-api/printk-formats.rst |  5 ++---
 lib/vsprintf.c                            | 17 ++++++++++-------
 2 files changed, 12 insertions(+), 10 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
