Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8BDC17DD32
	for <lwn-linux-doc@archive.lwn.net>; Fri,  6 Apr 2018 11:38:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751869AbeDFLiL convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 6 Apr 2018 07:38:11 -0400
Received: from smtp2.goneo.de ([85.220.129.33]:35458 "EHLO smtp2.goneo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751809AbeDFLiL (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 6 Apr 2018 07:38:11 -0400
Received: from localhost (localhost [127.0.0.1])
        by smtp2.goneo.de (Postfix) with ESMTP id DC45723F848;
        Fri,  6 Apr 2018 13:38:08 +0200 (CEST)
X-Virus-Scanned: by goneo
Received: from smtp2.goneo.de ([127.0.0.1])
        by localhost (smtp2.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 1j3EUMah8nK3; Fri,  6 Apr 2018 13:38:08 +0200 (CEST)
Received: from [192.168.1.112] (dyndsl-091-248-139-043.ewe-ip-backbone.de [91.248.139.43])
        by smtp2.goneo.de (Postfix) with ESMTPSA id 852F523F814;
        Fri,  6 Apr 2018 13:38:07 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: make xmldocs failed with error after 4.17 merge period
From:   Markus Heiser <markus.heiser@darmarit.de>
In-Reply-To: <20180406105139.GA28862@kuha.fi.intel.com>
Date:   Fri, 6 Apr 2018 13:38:06 +0200
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Masanari Iida <standby24x7@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-usb@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <B8BFEE5C-F2CF-485D-80D6-8EC31EE2429C@darmarit.de>
References: <CALLJCT0MFg6b+dG50cqe_hv6hxmQDj-ZM066BOtQt_wOiC8ENA@mail.gmail.com>
 <20180406075109.GA21589@kuha.fi.intel.com> <20180406075734.GA16728@kroah.com>
 <20180406081555.GB21589@kuha.fi.intel.com> <20180406083010.GA20174@kroah.com>
 <20180406091126.GC21589@kuha.fi.intel.com>
 <2A917B38-AFF6-44DC-A4A9-796B2BE560E2@darmarit.de>
 <20180406105139.GA28862@kuha.fi.intel.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        johannes@sipsolutions.net
X-Mailer: Apple Mail (2.3273)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


> Am 06.04.2018 um 12:51 schrieb Heikki Krogerus <heikki.krogerus@linux.intel.com>:
> 
> Hi Markus,
> 
> On Fri, Apr 06, 2018 at 12:03:55PM +0200, Markus Heiser wrote:
>>>> There are ways to do this, look at how the v4l2 and I think the drm
>>>> subsystems handle ascii art such that "real" drawings end up being
>>>> produced.
>>> 
>>> Thanks. I did not actually find anything else except use of tables and
>>> code-blocks in v4l documentation. Is that what you were referring?
>> 
>> If it is about *figures*: we have a directive named 'kernel-figure',
>> which is a full replacement of the 'figure' directive from Sphinx-Doc.
>> In addition it supports *inline* SVG and DOT markups. Read:
>> 
>> https://www.kernel.org/doc/html/latest/doc-guide/sphinx.html#figures-images
> 
> Thanks for the info.
> 
> I don't want to use for example dot language in kernel documentation.
> I want to be able to clearly see the figure also from the plain text
> file. That's why I prefer ascii art.
> 
> Isn't there a way we could render ascii art as svg diagram?

Sorry, not yet. Johannes started a discussion about this. Its a long
time ago and I do not have any new ideas yet :/ see:

  https://www.mail-archive.com/linux-doc@vger.kernel.org/msg07035.html

-- Markus --

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
