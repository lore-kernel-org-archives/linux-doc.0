Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,RCVD_IN_SORBS_WEB autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 156937D581
	for <lwn-linux-doc@archive.lwn.net>; Tue, 18 Sep 2018 13:37:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728413AbeIRTJ4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 18 Sep 2018 15:09:56 -0400
Received: from mail.linuxfoundation.org ([140.211.169.12]:37758 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727207AbeIRTJ4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Sep 2018 15:09:56 -0400
Received: from localhost (unknown [147.67.4.98])
        by mail.linuxfoundation.org (Postfix) with ESMTPSA id A60CD8E2;
        Tue, 18 Sep 2018 13:37:17 +0000 (UTC)
Date:   Tue, 18 Sep 2018 15:37:15 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     "Tobin C. Harding" <me@tobin.cc>
Cc:     Jiri Slaby <jslaby@suse.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/3] tty_port: Fix function name and brief desc
Message-ID: <20180918133715.GB23431@kroah.com>
References: <20180912075044.8695-1-me@tobin.cc>
 <20180912075044.8695-3-me@tobin.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180912075044.8695-3-me@tobin.cc>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Sep 12, 2018 at 05:50:43PM +1000, Tobin C. Harding wrote:
> @@ -235,7 +235,7 @@ void tty_port_free_xmit_buf(struct tty_port *port)
>  EXPORT_SYMBOL(tty_port_free_xmit_buf);
>  
>  /**
> - * tty_port_destroy -- destroy inited port
> + * tty_port_destroy() - Destroy inited port.

Ok, using () for a function name, that's fine, but then you do:

>  /**
> - *	tty_port_tty_set	-	set the tty of a port
> - *	@port: tty port
> - *	@tty: the tty
> + * tty_port_tty_set - Set the tty of a port.

Oops, not here.  Consistency is the key.

thanks,

greg k-h
