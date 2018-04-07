Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=unavailable
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6DD5E7DD32
	for <lwn-linux-doc@archive.lwn.net>; Sat,  7 Apr 2018 19:19:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752034AbeDGTTO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 7 Apr 2018 15:19:14 -0400
Received: from s3.sipsolutions.net ([144.76.63.242]:49224 "EHLO
        sipsolutions.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751591AbeDGTTN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 7 Apr 2018 15:19:13 -0400
Received: by sipsolutions.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        (envelope-from <johannes@sipsolutions.net>)
        id 1f4tMe-0000o4-3w; Sat, 07 Apr 2018 21:19:04 +0200
Message-ID: <1523128743.6507.5.camel@sipsolutions.net>
Subject: Re: make xmldocs failed with error after 4.17 merge period
From:   Johannes Berg <johannes@sipsolutions.net>
To:     Markus Heiser <markus.heiser@darmarit.de>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Masanari Iida <standby24x7@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-usb@vger.kernel.org
Date:   Sat, 07 Apr 2018 21:19:03 +0200
In-Reply-To: <B8BFEE5C-F2CF-485D-80D6-8EC31EE2429C@darmarit.de>
References: <CALLJCT0MFg6b+dG50cqe_hv6hxmQDj-ZM066BOtQt_wOiC8ENA@mail.gmail.com>
         <20180406075109.GA21589@kuha.fi.intel.com>
         <20180406075734.GA16728@kroah.com>
         <20180406081555.GB21589@kuha.fi.intel.com>
         <20180406083010.GA20174@kroah.com>
         <20180406091126.GC21589@kuha.fi.intel.com>
         <2A917B38-AFF6-44DC-A4A9-796B2BE560E2@darmarit.de>
         <20180406105139.GA28862@kuha.fi.intel.com>
         <B8BFEE5C-F2CF-485D-80D6-8EC31EE2429C@darmarit.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 (3.26.6-1.fc27) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 2018-04-06 at 13:38 +0200, Markus Heiser wrote:
> 
> Sorry, not yet. Johannes started a discussion about this. Its a long
> time ago and I do not have any new ideas yet :/ see:
> 
>   https://www.mail-archive.com/linux-doc@vger.kernel.org/msg07035.html

I still think the tools themselves don't matter all that much, as long
as there aren't totally onerous requirements. I'd argue pretty much
everything available on a modern distro would be OK provided we have a
reasonable fallback (e.g. to ASCII as I had even written), along with
some sort of documentation of dependencies, or perhaps better, some
command line option to gather the info dynamically.

But then again, I've already said pretty much this a year and a half ago
and most people seemed more interested in some kind of purity argument
than having better documentation :-)

johannes
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
