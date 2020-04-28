Return-Path: <SRS0=FEXm=6M=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71DCBC83007
	for <linux-doc@archiver.kernel.org>; Tue, 28 Apr 2020 18:33:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 56A5121835
	for <linux-doc@archiver.kernel.org>; Tue, 28 Apr 2020 18:33:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729458AbgD1Sd0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Apr 2020 14:33:26 -0400
Received: from ms.lwn.net ([45.79.88.28]:41352 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729930AbgD1Sd0 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 28 Apr 2020 14:33:26 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id AB7DA44A;
        Tue, 28 Apr 2020 18:33:25 +0000 (UTC)
Date:   Tue, 28 Apr 2020 12:33:24 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Juan Manuel =?UTF-8?B?TcOpbmRleg==?= Rey <vejeta@gmail.com>
Cc:     ericvh@gmail.com, lucho@ionkov.net, asmadeus@codewreck.org,
        v9fs-developer@lists.sourceforge.net, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Update the documentation referencing Plan 9 from User
 Space.
Message-ID: <20200428123324.7406f340@lwn.net>
In-Reply-To: <20200426015250.GA35090@camelot>
References: <20200426015250.GA35090@camelot>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 26 Apr 2020 03:52:50 +0200
Juan Manuel Méndez Rey <vejeta@gmail.com> wrote:

> The page originally referenced to checkout Plan9 application and libraries
> have been missing for quite some time and the development is carried out
> in github and documented on this new site.
> 
> Signed-off-by: Juan Manuel Méndez Rey <vejeta@gmail.com>
> ---
>  Documentation/filesystems/9p.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/filesystems/9p.rst b/Documentation/filesystems/9p.rst
> index 671fef39a802..2995279ddc24 100644
> --- a/Documentation/filesystems/9p.rst
> +++ b/Documentation/filesystems/9p.rst
> @@ -192,4 +192,4 @@ For more information on the Plan 9 Operating System check out
>  http://plan9.bell-labs.com/plan9
>  
>  For information on Plan 9 from User Space (Plan 9 applications and libraries
> -ported to Linux/BSD/OSX/etc) check out http://swtch.com/plan9
> +ported to Linux/BSD/OSX/etc) check out https://9fans.github.io/plan9port/

Applied, thanks.

jon
