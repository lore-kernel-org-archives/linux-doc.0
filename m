Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8D0BE7E27E
	for <lwn-linux-doc@archive.lwn.net>; Wed, 25 Apr 2018 14:00:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754061AbeDYOAL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 25 Apr 2018 10:00:11 -0400
Received: from mail.linuxfoundation.org ([140.211.169.12]:40962 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753509AbeDYOAL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Apr 2018 10:00:11 -0400
Received: from localhost (LFbn-1-12247-202.w90-92.abo.wanadoo.fr [90.92.61.202])
        by mail.linuxfoundation.org (Postfix) with ESMTPSA id 61D53890;
        Wed, 25 Apr 2018 14:00:10 +0000 (UTC)
Date:   Wed, 25 Apr 2018 16:00:03 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Masanari Iida <standby24x7@gmail.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Markus Heiser <markus.heiser@darmarit.de>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: typec.rst: Use literal-block element
 with ascii art
Message-ID: <20180425140003.GA23493@kroah.com>
References: <20180406124122.70676-1-heikki.krogerus@linux.intel.com>
 <87604fcsa2.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87604fcsa2.fsf@intel.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 25, 2018 at 04:47:01PM +0300, Jani Nikula wrote:
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

This is in my tree, will go to Linus in a day or so.

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
