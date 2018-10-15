Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DCA467D08A
	for <lwn-linux-doc@archive.lwn.net>; Mon, 15 Oct 2018 18:26:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726967AbeJPCNJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 15 Oct 2018 22:13:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:36846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726790AbeJPCNJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 15 Oct 2018 22:13:09 -0400
Received: from localhost (ip-213-127-77-176.ip.prioritytelecom.net [213.127.77.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2115420881;
        Mon, 15 Oct 2018 18:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1539628005;
        bh=LFHnTiWnZC4sfBa4kt89KDEC/FNMDC7FAmDd+MFpoBU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nzo3Ls59xNBsgtbNn+fRdXdA9z4sI4n2l2kEGDtiyoMDXvOP/xpjiPbBjqqjrLxxe
         hgUEAKp65DjrXYYZbqzfz7y4tj3nFuOQs1jll7ZBMuxhpfGRWqB680jh2rEIRzzo26
         svoSzp+PRFZVdpK4yz/xtDOcjHQyW/Xk721WlzAY=
Date:   Mon, 15 Oct 2018 20:26:43 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Will Korteland <will@korte.land>
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/uio: fix a grammar nitpick
Message-ID: <20181015182643.GA6188@kroah.com>
References: <3c4f4e78-3557-ce1b-a5f0-cdcefae1fbd3@korte.land>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c4f4e78-3557-ce1b-a5f0-cdcefae1fbd3@korte.land>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Oct 13, 2018 at 09:47:46PM +0000, Will Korteland wrote:
> This patch fixes a minor, incorrect piece of grammar in the UIO howto.
> 
> Signed-off-by: Will Korteland <will@korte.land>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> This is my first attempt at a kernel patch, so please let me know if
> I've done something silly.

You sent this in html format :(

Also, the non-html format did not apply to the tree, can you redo this
against linux-next and resend it?

thanks,

greg k-h
