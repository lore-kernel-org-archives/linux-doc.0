Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C84C433EF
	for <linux-doc@archiver.kernel.org>; Wed, 13 Apr 2022 11:27:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232370AbiDML3k (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 Apr 2022 07:29:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbiDML3j (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Apr 2022 07:29:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51F823B033
        for <linux-doc@vger.kernel.org>; Wed, 13 Apr 2022 04:27:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DFCC161D96
        for <linux-doc@vger.kernel.org>; Wed, 13 Apr 2022 11:27:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF2E1C385A6;
        Wed, 13 Apr 2022 11:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1649849238;
        bh=7r8ih9/ir6iyEhCsbbrqbL2pAafjwByOWipcDbg49DI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h09kirG245L/6uaEtpKjY/VWBhvoCZNwr+UxwHIEx3kHc9H7R0KZgHlLe4zPH3TKD
         479h5kfNirWcVCBWHEFJC/PdZnln7CuLOfUa8hYTtl/0vqesbcMpfPtwT+g03EkY2A
         1+TJ9uaAfl0Qm6vybEqKvByn6BAKnz/Cnro6dyfU=
Date:   Wed, 13 Apr 2022 13:27:15 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     Kosuke Fujimoto <fujimotokosuke0@gmail.com>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: Is there any Japanese translation maintainer?
Message-ID: <Ylazk8qA498v9AKc@kroah.com>
References: <172fa015-26df-c978-853d-3aba67c581cc@gmail.com>
 <15b941a4-c41d-3fc1-c4f8-9a6736f6b874@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15b941a4-c41d-3fc1-c4f8-9a6736f6b874@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 13, 2022 at 08:06:08PM +0900, Akira Yokosawa wrote:
> [+Cc: Jon, Greg]
> 
> Hello Fujimoto-san,
> 
> On Wed, 13 Apr 2022 18:09:59 +0900,
> Kosuke Fujimoto wrote:
> > Hello,
> > 
> > I would like to contact with Japanese documentation maintainer for some 
> > changes. However, it looks like there is no one listed in MAINTAINERS file.
> > Is there anyone who is maintaining Japanese documentation?
> 
> Existing Japanese translation has a note on its first page saying:
> 
> > This document is maintained by Tsugikazu Shibata <tshibata@ab.jp.nec.com>
> 
> However, this email address is not reachable any more.
> 
> I also have a few things I'd like to fix/update in it.
> I'm glad to know there exists someone else who has similar
> thoughts.
> 
> I think I can play a role as a tentative maintainer who can
> review your changes.
> 
> Jon, Greg, do you have any idea of Shibata-san's whereabouts?

Yes, he has retired from NEC and now is doing other Linux-related work.
I can dig up his email address and send it to you off-list if you like.

thanks,

greg k-h
