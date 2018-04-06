Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4D72F7DD32
	for <lwn-linux-doc@archive.lwn.net>; Fri,  6 Apr 2018 10:51:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751570AbeDFKvo (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 6 Apr 2018 06:51:44 -0400
Received: from mga04.intel.com ([192.55.52.120]:4927 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751434AbeDFKvn (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 6 Apr 2018 06:51:43 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Apr 2018 03:51:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,415,1517904000"; 
   d="scan'208";a="44609424"
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 06 Apr 2018 03:51:40 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 06 Apr 2018 13:51:39 +0300
Date:   Fri, 6 Apr 2018 13:51:39 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Markus Heiser <markus.heiser@darmarit.de>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Masanari Iida <standby24x7@gmail.com>,
        linux-kernel@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-usb@vger.kernel.org
Subject: Re: make xmldocs failed with error after 4.17 merge period
Message-ID: <20180406105139.GA28862@kuha.fi.intel.com>
References: <CALLJCT0MFg6b+dG50cqe_hv6hxmQDj-ZM066BOtQt_wOiC8ENA@mail.gmail.com>
 <20180406075109.GA21589@kuha.fi.intel.com>
 <20180406075734.GA16728@kroah.com>
 <20180406081555.GB21589@kuha.fi.intel.com>
 <20180406083010.GA20174@kroah.com>
 <20180406091126.GC21589@kuha.fi.intel.com>
 <2A917B38-AFF6-44DC-A4A9-796B2BE560E2@darmarit.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2A917B38-AFF6-44DC-A4A9-796B2BE560E2@darmarit.de>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Markus,

On Fri, Apr 06, 2018 at 12:03:55PM +0200, Markus Heiser wrote:
> >> There are ways to do this, look at how the v4l2 and I think the drm
> >> subsystems handle ascii art such that "real" drawings end up being
> >> produced.
> > 
> > Thanks. I did not actually find anything else except use of tables and
> > code-blocks in v4l documentation. Is that what you were referring?
> 
> If it is about *figures*: we have a directive named 'kernel-figure',
> which is a full replacement of the 'figure' directive from Sphinx-Doc.
> In addition it supports *inline* SVG and DOT markups. Read:
> 
>  https://www.kernel.org/doc/html/latest/doc-guide/sphinx.html#figures-images

Thanks for the info.

I don't want to use for example dot language in kernel documentation.
I want to be able to clearly see the figure also from the plain text
file. That's why I prefer ascii art.

Isn't there a way we could render ascii art as svg diagram?


Br,

-- 
heikki
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
