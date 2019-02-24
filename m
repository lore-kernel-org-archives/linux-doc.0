Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A21DD7D04D
	for <lwn-linux-doc@archive.lwn.net>; Sun, 24 Feb 2019 12:54:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726274AbfBXMyw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 24 Feb 2019 07:54:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:50280 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725956AbfBXMyw (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 24 Feb 2019 07:54:52 -0500
Received: from localhost (5356596B.cm-6-7b.dynamic.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0826020652;
        Sun, 24 Feb 2019 12:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1551012891;
        bh=zUgthBSJZBzfTrB5LGn0lHCj5A75XcY3L2t95cXkzfs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qwx/NwgLykiphngUImDzg352dttpRZ0Az0u7Z4lAUKsPALAxze5L1sj/6XzlNRugn
         /fGhiz44z6tn3D1fE/76hgYRSThlpWL8twmHsOLGBwBoPdmQwwVr8bvMT2fBtqjaAb
         3mIB1rpVzkIikdIwmCRjYk5ZP3hhTNrHtaGolZSk=
Date:   Sun, 24 Feb 2019 13:54:49 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Federico Vaga <federico.vaga@vaga.pv.it>
Cc:     Zenghui Yu <zenghuiyu96@gmail.com>, corbet@lwn.net,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] Documentation/process/howto: Update for 4.x -> 5.x
 versioning
Message-ID: <20190224125449.GC10876@kroah.com>
References: <CAKcZhuWHU+udbAyL910JW8rhZsbpomz5TXs0z2FD4m5c5Sf8hw@mail.gmail.com>
 <4160738.QP7Yp4kBzP@harkonnen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4160738.QP7Yp4kBzP@harkonnen>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Feb 24, 2019 at 11:16:56AM +0100, Federico Vaga wrote:
> hello,
> 
> I have just a general observation for the community, not related to the 
> content of this patch, but related with the idea behind.
> 
> Is it really important to specify the major release number in the documents? . 
> Can't we just use a generic x.y.z, or a more generic statement?
> 
> When you open a documentation page like
> 
> https://www.kernel.org/doc/html/latest/
> 
> you will see the release number in the top left corner, which implies that 
> what you read is (should be) valid for that version. And if you read from the 
> sources you should know which version you checked out, and if you don't you
> can always verify.
> 
> I do not see the added value of having those numbers in the documents, unless 
> the purpose is to highlight some specific exceptions.
> 
> Am I missing some important reasons that justify these numbers?

Nothing really, it's just "history".  Given that the "major" number only
changes every 3-4 years, it's not all that big of a deal.

If you can think of a way to write these documents such that they do not
depend on a version number at all, I'm sure no one would object to those
patches.

thanks,

greg k-h
