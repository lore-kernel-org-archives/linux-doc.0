Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 93FE77D087
	for <lwn-linux-doc@archive.lwn.net>; Tue,  9 Oct 2018 14:05:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726468AbeJIVWt (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 9 Oct 2018 17:22:49 -0400
Received: from mx2.suse.de ([195.135.220.15]:56464 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726564AbeJIVWt (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 9 Oct 2018 17:22:49 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 0B35FAD4C;
        Tue,  9 Oct 2018 14:05:41 +0000 (UTC)
Date:   Tue, 9 Oct 2018 16:05:40 +0200
From:   Petr Mladek <pmladek@suse.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Tobin C . Harding" <me@tobin.cc>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/3] lib/vsprintf: Hash legacy clock addresses
Message-ID: <20181009140540.mz77x5a7bfmupxbb@pathway.suse.cz>
References: <20181008110504.25449-1-geert+renesas@glider.be>
 <20181008110504.25449-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181008110504.25449-3-geert+renesas@glider.be>
User-Agent: NeoMutt/20170421 (1.8.2)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon 2018-10-08 13:05:03, Geert Uytterhoeven wrote:
> On platforms using the Common Clock Framework, "%pC" prints the clock's
> name. On legacy platforms, it prints the unhashed clock's address,
> potentially leaking sensitive information regarding the kernel layout in
> memory.
> 
> Avoid this leak by printing the hashed address instead.  To distinguish
> between clocks, a 32-bit unique identifier is as good as an actual
> pointer value.
> 
> Fixes: ad67b74d2469d9b8 ("printk: hash addresses printed with %p")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

It makes sense.

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
