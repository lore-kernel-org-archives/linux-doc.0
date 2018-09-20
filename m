Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D2CA67D57F
	for <lwn-linux-doc@archive.lwn.net>; Thu, 20 Sep 2018 13:11:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387684AbeITSzI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 20 Sep 2018 14:55:08 -0400
Received: from mail.linuxfoundation.org ([140.211.169.12]:48210 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387418AbeITSzI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Sep 2018 14:55:08 -0400
Received: from localhost (ip-213-127-77-73.ip.prioritytelecom.net [213.127.77.73])
        by mail.linuxfoundation.org (Postfix) with ESMTPSA id 26BCA11B8;
        Thu, 20 Sep 2018 13:11:39 +0000 (UTC)
Date:   Thu, 20 Sep 2018 15:11:37 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Vladimir Zapolskiy <vz@mleia.com>
Cc:     Evgeniy Polyakov <zbr@ioremap.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] Documentation: filesystems: remove reminiscences of
 POHMELFS
Message-ID: <20180920131137.GA18628@kroah.com>
References: <20180912124419.10623-1-vz@mleia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180912124419.10623-1-vz@mleia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Sep 12, 2018 at 03:44:19PM +0300, Vladimir Zapolskiy wrote:
> The POHMELFS filesystem was removed in 2012 by commit 67435319866f8
> ("staging: pohmelfs: remove drivers/staging/pohmelfs") promising that
> a newer version will be included to the kernel, but unfortunately
> it didn't happen.
> 
> Since likely any delopment of the filesystem is halted, the change removes
> the abandoned POHMELFS documentation from the kernel tree.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>

I've taken this through the staging tree as that is where this code used
to live.  Thanks for the cleanup.

greg k-h
