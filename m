Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 431F67E244
	for <lwn-linux-doc@archive.lwn.net>; Thu,  1 Mar 2018 13:39:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1030646AbeCANjk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 1 Mar 2018 08:39:40 -0500
Received: from gofer.mess.org ([88.97.38.141]:33599 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1030704AbeCANjg (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 1 Mar 2018 08:39:36 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 76AF86020C; Thu,  1 Mar 2018 13:39:34 +0000 (GMT)
Date:   Thu, 1 Mar 2018 13:39:34 +0000
From:   Sean Young <sean@mess.org>
To:     "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>,
        linux-doc ML <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@s-opensource.com>
Subject: lirc.4 man page
Message-ID: <20180301133934.wr6sjfzykt6z2d7x@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

The lirc man page:

https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/tree/man4/lirc.4

is very much out of date. Multiple ioctls were never implemented, so
should be removed. No mainline driver uses LIRC_MODE_LIRCCODE any more
and there is a new mode LIRC_MODE_SCANCODE.

kernel-doc is much more up to date. Can it be generated from there?

Thanks,

Sean
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
