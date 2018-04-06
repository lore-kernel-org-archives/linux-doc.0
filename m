Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C75C27DD32
	for <lwn-linux-doc@archive.lwn.net>; Fri,  6 Apr 2018 07:57:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751982AbeDFH5g (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 6 Apr 2018 03:57:36 -0400
Received: from mail.linuxfoundation.org ([140.211.169.12]:34832 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751852AbeDFH5f (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 6 Apr 2018 03:57:35 -0400
Received: from localhost (LFbn-1-12247-202.w90-92.abo.wanadoo.fr [90.92.61.202])
        by mail.linuxfoundation.org (Postfix) with ESMTPSA id B931DA73;
        Fri,  6 Apr 2018 07:57:34 +0000 (UTC)
Date:   Fri, 6 Apr 2018 09:57:34 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Masanari Iida <standby24x7@gmail.com>,
        linux-kernel@vger.kernel.org,
        linux-doc <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-usb@vger.kernel.org
Subject: Re: make xmldocs failed with error after 4.17 merge period
Message-ID: <20180406075734.GA16728@kroah.com>
References: <CALLJCT0MFg6b+dG50cqe_hv6hxmQDj-ZM066BOtQt_wOiC8ENA@mail.gmail.com>
 <20180406075109.GA21589@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180406075109.GA21589@kuha.fi.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 06, 2018 at 10:51:09AM +0300, Heikki Krogerus wrote:
> On Fri, Apr 06, 2018 at 12:38:42PM +0900, Masanari Iida wrote:
> > After merge following patch during 4.17 merger period,
> > make xmldocs start to fail with error.
> > 
> >  [bdecb33af34f79cbfbb656661210f77c8b8b5b5f]
> > usb: typec: API for controlling USB Type-C Multiplexers
> > 
> > Error messages.
> > reST markup error:
> > /home/iida/Repo/linux-2.6/Documentation/driver-api/usb/typec.rst:215:
> > (SEVERE/4) Unexpected section title or transition.
> > 
> > ------------------------
> > Documentation/Makefile:93: recipe for target 'xmldocs' failed
> > make[1]: *** [xmldocs] Error 1
> > Makefile:1527: recipe for target 'xmldocs' failed
> > make: *** [xmldocs] Error 2
> > 
> > $
> > 
> > An ascii graphic in typec.rst cause the error.
> 
> Thanks for the report. I'm going to propose that we fix this by
> marking the ascii art as comment:
> 
> diff --git a/Documentation/driver-api/usb/typec.rst b/Documentation/driver-api/usb/typec.rst
> index feb31946490b..972c11bf4141 100644
> --- a/Documentation/driver-api/usb/typec.rst
> +++ b/Documentation/driver-api/usb/typec.rst
> @@ -212,7 +212,7 @@ port drivers can use USB Role Class API with those.
> 
>  Illustration of the muxes behind a connector that supports an alternate mode:
> 
> -                     ------------------------
> +..                   ------------------------
>                       |       Connector      |
>                       ------------------------
>                              |         |
> 
> I hope that works.

Try it and see!  :)
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
