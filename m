Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 582DB7DE78
	for <lwn-linux-doc@archive.lwn.net>; Fri,  6 Apr 2018 08:16:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750935AbeDFIQB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 6 Apr 2018 04:16:01 -0400
Received: from mga07.intel.com ([134.134.136.100]:25899 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750815AbeDFIQA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 6 Apr 2018 04:16:00 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Apr 2018 01:15:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,414,1517904000"; 
   d="scan'208";a="44583388"
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 06 Apr 2018 01:15:56 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 06 Apr 2018 11:15:55 +0300
Date:   Fri, 6 Apr 2018 11:15:55 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Masanari Iida <standby24x7@gmail.com>,
        linux-kernel@vger.kernel.org,
        linux-doc <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-usb@vger.kernel.org
Subject: Re: make xmldocs failed with error after 4.17 merge period
Message-ID: <20180406081555.GB21589@kuha.fi.intel.com>
References: <CALLJCT0MFg6b+dG50cqe_hv6hxmQDj-ZM066BOtQt_wOiC8ENA@mail.gmail.com>
 <20180406075109.GA21589@kuha.fi.intel.com>
 <20180406075734.GA16728@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180406075734.GA16728@kroah.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 06, 2018 at 09:57:34AM +0200, Greg KH wrote:
> On Fri, Apr 06, 2018 at 10:51:09AM +0300, Heikki Krogerus wrote:
> > On Fri, Apr 06, 2018 at 12:38:42PM +0900, Masanari Iida wrote:
> > > After merge following patch during 4.17 merger period,
> > > make xmldocs start to fail with error.
> > > 
> > >  [bdecb33af34f79cbfbb656661210f77c8b8b5b5f]
> > > usb: typec: API for controlling USB Type-C Multiplexers
> > > 
> > > Error messages.
> > > reST markup error:
> > > /home/iida/Repo/linux-2.6/Documentation/driver-api/usb/typec.rst:215:
> > > (SEVERE/4) Unexpected section title or transition.
> > > 
> > > ------------------------
> > > Documentation/Makefile:93: recipe for target 'xmldocs' failed
> > > make[1]: *** [xmldocs] Error 1
> > > Makefile:1527: recipe for target 'xmldocs' failed
> > > make: *** [xmldocs] Error 2
> > > 
> > > $
> > > 
> > > An ascii graphic in typec.rst cause the error.
> > 
> > Thanks for the report. I'm going to propose that we fix this by
> > marking the ascii art as comment:
> > 
> > diff --git a/Documentation/driver-api/usb/typec.rst b/Documentation/driver-api/usb/typec.rst
> > index feb31946490b..972c11bf4141 100644
> > --- a/Documentation/driver-api/usb/typec.rst
> > +++ b/Documentation/driver-api/usb/typec.rst
> > @@ -212,7 +212,7 @@ port drivers can use USB Role Class API with those.
> > 
> >  Illustration of the muxes behind a connector that supports an alternate mode:
> > 
> > -                     ------------------------
> > +..                   ------------------------
> >                       |       Connector      |
> >                       ------------------------
> >                              |         |
> > 
> > I hope that works.
> 
> Try it and see!  :)

It will fix this issue. I was just wondering if use of ascii art is
acceptable in general with the .rst files? But then again, why
wouldn't it be.

Sorry for the noise. I'll just send that patch.


Thanks,

-- 
heikki
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
