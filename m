Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AB4247E27E
	for <lwn-linux-doc@archive.lwn.net>; Wed, 25 Apr 2018 13:56:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753571AbeDYNzo (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 25 Apr 2018 09:55:44 -0400
Received: from ms.lwn.net ([45.79.88.28]:33270 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753399AbeDYNzo (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 25 Apr 2018 09:55:44 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 30FCD537;
        Wed, 25 Apr 2018 13:55:43 +0000 (UTC)
Date:   Wed, 25 Apr 2018 07:55:41 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Masanari Iida <standby24x7@gmail.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Markus Heiser <markus.heiser@darmarit.de>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: typec.rst: Use literal-block element
 with ascii art
Message-ID: <20180425075541.1c846dc2@lwn.net>
In-Reply-To: <87604fcsa2.fsf@intel.com>
References: <20180406124122.70676-1-heikki.krogerus@linux.intel.com>
        <87604fcsa2.fsf@intel.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 25 Apr 2018 16:47:01 +0300
Jani Nikula <jani.nikula@linux.intel.com> wrote:

> On Fri, 06 Apr 2018, Heikki Krogerus <heikki.krogerus@linux.intel.com> wrote:
> > Using reStructuredText literal-block element with ascii-art.
> > That prevents the ascii art from being processed as
> > reStructuredText.
> >
> > Reported-by: Masanari Iida <standby24x7@gmail.com>
> > Fixes: bdecb33af34f ("usb: typec: API for controlling USB Type-C Multiplexers")
> > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>  
> 
> Jon, this fixes a documentation build failure in v4.17-rc1. It's not
> just a warning, it's a complete fail. Our docs builder at 01.org is
> failing, apparently the same at kernel.org. Please pick it up soon.

Sorry, I'd seen the attached and was assuming Greg would ship it
Linusward.  I'll get it upstream soon.

jon

From: Greg KH <gregkh@linuxfoundation.org>
To: changbin.du@intel.com
Cc: corbet@lwn.net, linux-doc@vger.kernel.org,         linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: fix reST markup error in  driver-api/usb/typec.rst
Date: Sun, 8 Apr 2018 09:19:58 +0200
Sender: linux-kernel-owner@vger.kernel.org

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
