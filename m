Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 105597D90F
	for <lwn-linux-doc@archive.lwn.net>; Fri, 15 Nov 2019 20:00:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbfKOUAU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 15 Nov 2019 15:00:20 -0500
Received: from ms.lwn.net ([45.79.88.28]:44220 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726466AbfKOUAU (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 15 Nov 2019 15:00:20 -0500
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C2CEC1E5;
        Fri, 15 Nov 2019 20:00:19 +0000 (UTC)
Date:   Fri, 15 Nov 2019 13:00:17 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-doc@vger.kernel.org, Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] Documentation: Document how to get links with git am
Message-ID: <20191115130017.46d77037@lwn.net>
In-Reply-To: <20191115133021.13165-1-linus.walleij@linaro.org>
References: <20191115133021.13165-1-linus.walleij@linaro.org>
Organization: LWN.net
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 15 Nov 2019 14:30:21 +0100
Linus Walleij <linus.walleij@linaro.org> wrote:

> This adds Kees' clever apply hook to the kernel documentation so
> it can be easily references when needed.
> 
> Cc: Kees Cook <keescook@chromium.org>
> Link: https://lists.linuxfoundation.org/pipermail/ksummit-discuss/2019-July/006608.html
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Seems generally useful.  I have a couple of overall questions...

 - Might this be better placed in the maintainer manual?  It is more
   likely to be relevant to that audience, methinks.

 - I wonder if the hook script should just go under tools/ somewhere for
   people to grab.

Thanks,

jon
