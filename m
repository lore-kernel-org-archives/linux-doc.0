Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8876C7DE78
	for <lwn-linux-doc@archive.lwn.net>; Sun,  8 Apr 2018 07:21:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750952AbeDHHVx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 8 Apr 2018 03:21:53 -0400
Received: from mga01.intel.com ([192.55.52.88]:53327 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750810AbeDHHVx (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 8 Apr 2018 03:21:53 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Apr 2018 00:21:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,422,1517904000"; 
   d="scan'208";a="44377799"
Received: from gvt-dell.bj.intel.com (HELO intel.com) ([10.238.154.59])
  by fmsmga004.fm.intel.com with SMTP; 08 Apr 2018 00:21:51 -0700
Date:   Sun, 8 Apr 2018 15:12:19 +0800
From:   "Du, Changbin" <changbin.du@intel.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     changbin.du@intel.com, corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: fix reST markup error in
 driver-api/usb/typec.rst
Message-ID: <20180408071218.c2hlv3lgmokclj6a@intel.com>
References: <1523155632-10301-1-git-send-email-changbin.du@intel.com>
 <20180408071958.GA7723@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180408071958.GA7723@kroah.com>
User-Agent: NeoMutt/20180323-6-5ca392
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Apr 08, 2018 at 09:19:58AM +0200, Greg KH wrote:
> On Sun, Apr 08, 2018 at 10:47:12AM +0800, changbin.du@intel.com wrote:
> > From: Changbin Du <changbin.du@intel.com>
> > 
> > There is an format error in driver-api/usb/typec.rst that breaks sphinx
> > docs building.
> > 
> > reST markup error:
> > /home/changbin/work/linux/Documentation/driver-api/usb/typec.rst:215: (SEVERE/4) Unexpected section title or transition.
> > 
> > ------------------------
> > Documentation/Makefile:68: recipe for target 'htmldocs' failed
> > make[1]: *** [htmldocs] Error 1
> > Makefile:1527: recipe for target 'htmldocs' failed
> > make: *** [htmldocs] Error 2
> > 
> > Signed-off-by: Changbin Du <changbin.du@intel.com>
> > ---
> >  Documentation/driver-api/usb/typec.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Thanks, someone else already sent this, sorry.  I'll be sending it
> onward after 4.17-rc1 is out.
>
No problem. Thanks for your quick checking!

> greg k-h

-- 
Thanks,
Changbin Du
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
