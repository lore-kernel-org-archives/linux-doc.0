Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B4BDB7D08A
	for <lwn-linux-doc@archive.lwn.net>; Fri, 30 Nov 2018 21:47:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725749AbeLAI5r (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 1 Dec 2018 03:57:47 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:60518 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbeLAI5r (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 1 Dec 2018 03:57:47 -0500
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::bf5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 7F99A14F245C8;
        Fri, 30 Nov 2018 13:47:04 -0800 (PST)
Date:   Fri, 30 Nov 2018 13:47:03 -0800 (PST)
Message-Id: <20181130.134703.1703684498402097596.davem@davemloft.net>
To:     jarkko.sakkinen@linux.intel.com
Cc:     axboe@kernel.dk, dave@stgolabs.net, keescook@chromium.org,
        linux-kernel@vger.kernel.org, amir73il@gmail.com,
        akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com,
        dja@axtens.net, linux@dominikbrodowski.net,
        dri-devel@lists.freedesktop.org, edumazet@google.com,
        federico.vaga@vaga.pv.it, geert+renesas@glider.be, deller@gmx.de,
        corbet@lwn.net, kumba@gentoo.org, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-ide@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-media@vger.kernel.org,
        linux-mips@linux-mips.org, linux-mtd@lists.infradead.org,
        linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-scsi@vger.kernel.org, matthias.bgg@gmail.com,
        netdev@vger.kernel.org, nouveau@lists.freedesktop.org,
        pabeni@redhat.com, paul.burton@mips.com, pmladek@suse.com,
        robh@kernel.org, sean.wang@mediatek.com,
        sergey.senozhatsky@gmail.com, shannon.nelson@oracle.com,
        sbrivio@redhat.com, rostedt@goodmis.org, me@tobin.cc,
        makita.toshiaki@lab.ntt.co.jp, willemb@google.com, yhs@fb.com,
        yanjun.zhu@oracle.com
Subject: Re: [PATCH RFC 00/15] Zero ****s, hugload of hugs <3
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20181130214233.GF23772@linux.intel.com>
References: <d7c34289-f03a-b641-cc9c-00395306511d@kernel.dk>
        <20181130.123507.1940310466680455876.davem@davemloft.net>
        <20181130214233.GF23772@linux.intel.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Fri, 30 Nov 2018 13:47:06 -0800 (PST)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Date: Fri, 30 Nov 2018 13:42:33 -0800

> Can you tell how the CoC should be interpreted then?

Regardless of what I think, as others have showen the CoC explicitly
does not apply to existing code.
