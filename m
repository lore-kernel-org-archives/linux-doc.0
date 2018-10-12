Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D70BC7D082
	for <lwn-linux-doc@archive.lwn.net>; Fri, 12 Oct 2018 17:39:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726665AbeJMBM6 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 12 Oct 2018 21:12:58 -0400
Received: from ms.lwn.net ([45.79.88.28]:51242 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725854AbeJMBM6 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 12 Oct 2018 21:12:58 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 5745C9B1;
        Fri, 12 Oct 2018 17:39:22 +0000 (UTC)
Date:   Fri, 12 Oct 2018 11:39:21 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "Tobin C . Harding" <me@tobin.cc>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Rob Herring <robh@kernel.org>, Petr Mladek <pmladek@suse.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] doc: printk-formats: Remove bogus kobject references
 for device nodes
Message-ID: <20181012113921.04b5a4d9@lwn.net>
In-Reply-To: <20181008110848.25648-1-geert+renesas@glider.be>
References: <20181008110848.25648-1-geert+renesas@glider.be>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon,  8 Oct 2018 13:08:48 +0200
Geert Uytterhoeven <geert+renesas@glider.be> wrote:

> When converting from text to rst, the kobjects section and its sole
> subsection about device tree nodes were coalesced into a single section,
> yielding an inconsistent result.
> 
> Remove all references to kobjects, as
>   1. Device tree object pointers are not compatible to kobject pointers
>      (the former may embed the latter, though), and
>   2. there are no printk formats defined for kobject types.
> 
> Update the vsprintf() source code comments to match the above.
> 
> Fixes: b3ed23213eab1e08 ("doc: convert printk-formats.txt to rst")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied, thanks.

jon
