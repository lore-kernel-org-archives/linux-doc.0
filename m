Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1A3C17D90D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 12 Aug 2019 21:13:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727258AbfHLVNT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 12 Aug 2019 17:13:19 -0400
Received: from ms.lwn.net ([45.79.88.28]:37086 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726718AbfHLVNT (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 12 Aug 2019 17:13:19 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id D7D5D2D8;
        Mon, 12 Aug 2019 21:13:18 +0000 (UTC)
Date:   Mon, 12 Aug 2019 15:13:17 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-doc@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] kernel-doc: Allow anonymous enum
Message-ID: <20190812151317.746379b2@lwn.net>
In-Reply-To: <20190812160631.32844-1-andriy.shevchenko@linux.intel.com>
References: <20190812160631.32844-1-andriy.shevchenko@linux.intel.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 12 Aug 2019 19:06:31 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> In C is a valid construction to have an anonymous enumerator.
> 
> Though we have now:
> 
>   drivers/pinctrl/intel/pinctrl-intel.c:240: error: Cannot parse enum!
> 
> Support it in the kernel-doc script.

So I don't get this error; I guess the only anonymous enum of interest has
yet to find its way into the mainline.

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  scripts/kernel-doc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> index 6b03012750da..079502bcc5a3 100755
> --- a/scripts/kernel-doc
> +++ b/scripts/kernel-doc
> @@ -1245,7 +1245,7 @@ sub dump_enum($$) {
>      # strip #define macros inside enums
>      $x =~ s@#\s*((define|ifdef)\s+|endif)[^;]*;@@gos;
>  
> -    if ($x =~ /enum\s+(\w+)\s*\{(.*)\}/) {
> +    if ($x =~ /enum\s+(\w*)\s*\{(.*)\}/) {

Ah the joy of regexes...

Applied, thanks.

jon
