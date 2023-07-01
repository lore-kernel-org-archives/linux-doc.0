Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93FEBEB64DC
	for <linux-doc@archiver.kernel.org>; Sat,  1 Jul 2023 07:10:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbjGAHKi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 1 Jul 2023 03:10:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229917AbjGAHJq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 1 Jul 2023 03:09:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71D2772B8;
        Sat,  1 Jul 2023 00:04:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EB66460B8C;
        Sat,  1 Jul 2023 07:04:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3438C433C8;
        Sat,  1 Jul 2023 07:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1688195074;
        bh=hES+L8o5GSGup4HsXuiU8V2YWoehW//V/bJAjRMl0Xk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h2rv4gO6HOz3tcWoIlZF3wExZZ01Ycns514hrAGE25RSsiM5SSPVaZUM1+/7A6vZd
         DUtOsj0d0sTe//cvf/03/dlLT4+50VFJzDhOZ4GJuuhEN3z5IxgSfh5ObyH4PCyXa6
         0TEKdEOPhhuN98tImFUnnNR/V3392drQiE6psSqg=
Date:   Sat, 1 Jul 2023 09:04:31 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        tech-board-discuss@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [Tech-board-discuss] Measurement, was Re: [PATCH] Documentation:
 Linux Contribution Maturity Model and the wider community
Message-ID: <2023070113-trimming-undecided-4923@gregkh>
References: <20230620212502.GI286961@mit.edu>
 <5490402b-8b9f-f52d-3896-41090e639e51@linux-m68k.org>
 <20230621100845.12588f48@gandalf.local.home>
 <1f5b0227-dbf6-4294-8532-525b3e405dc2@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f5b0227-dbf6-4294-8532-525b3e405dc2@linux-m68k.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jul 01, 2023 at 11:46:18AM +1000, Finn Thain wrote:
> BTW. I assume that 'Fixes' tags are already being used to train AI models 
> to locate bugs in existing code. If this could be used to evaluate new 
> patches when posted, it might make the code review process more efficient.

That has been happening for many many years now with papers being
published about it and many conference presentations.  It shouldn't be a
secret it's been happening and directly helping with stable kernel
maintenance for a long time.

thanks,

greg k-h
