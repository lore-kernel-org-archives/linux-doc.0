Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C07B07DE78
	for <lwn-linux-doc@archive.lwn.net>; Sun,  8 Apr 2018 07:20:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751546AbeDHHUH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 8 Apr 2018 03:20:07 -0400
Received: from mail.linuxfoundation.org ([140.211.169.12]:44834 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751515AbeDHHUG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 8 Apr 2018 03:20:06 -0400
Received: from localhost (LFbn-1-12247-202.w90-92.abo.wanadoo.fr [90.92.61.202])
        by mail.linuxfoundation.org (Postfix) with ESMTPSA id 89C5CD83;
        Sun,  8 Apr 2018 07:20:05 +0000 (UTC)
Date:   Sun, 8 Apr 2018 09:19:58 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     changbin.du@intel.com
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: fix reST markup error in
 driver-api/usb/typec.rst
Message-ID: <20180408071958.GA7723@kroah.com>
References: <1523155632-10301-1-git-send-email-changbin.du@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1523155632-10301-1-git-send-email-changbin.du@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Apr 08, 2018 at 10:47:12AM +0800, changbin.du@intel.com wrote:
> From: Changbin Du <changbin.du@intel.com>
> 
> There is an format error in driver-api/usb/typec.rst that breaks sphinx
> docs building.
> 
> reST markup error:
> /home/changbin/work/linux/Documentation/driver-api/usb/typec.rst:215: (SEVERE/4) Unexpected section title or transition.
> 
> ------------------------
> Documentation/Makefile:68: recipe for target 'htmldocs' failed
> make[1]: *** [htmldocs] Error 1
> Makefile:1527: recipe for target 'htmldocs' failed
> make: *** [htmldocs] Error 2
> 
> Signed-off-by: Changbin Du <changbin.du@intel.com>
> ---
>  Documentation/driver-api/usb/typec.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, someone else already sent this, sorry.  I'll be sending it
onward after 4.17-rc1 is out.

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
