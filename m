Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 750AF7DE79
	for <lwn-linux-doc@archive.lwn.net>; Sun, 29 Apr 2018 07:31:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752595AbeD2HbE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 29 Apr 2018 03:31:04 -0400
Received: from mx2.suse.de ([195.135.220.15]:42965 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752128AbeD2HbE (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 29 Apr 2018 03:31:04 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 4BBB2AD77;
        Sun, 29 Apr 2018 07:31:02 +0000 (UTC)
Date:   Sun, 29 Apr 2018 07:31:01 +0000
From:   "Luis R. Rodriguez" <mcgrof@kernel.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        DOCUMENTATION <linux-doc@vger.kernel.org>,
        Linus Torvalds <torvalds@linuxfoundation.org>,
        Andrew Morton <akpm@linuxfoundation.org>,
        Kate Stewart <kate@linuxfoundation.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Christoph Hellwig <hch@lst.de>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Rob Herring <rob.herring@linaro.org>,
        Jonas Oberg <jonas@fsfe.org>, Joe Perches <joe@perches.com>,
        linux-xfs@vger.kernel.org,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Florian Fainelli <f.fainelli@gmail.com>, mcgrof@kernel.org
Subject: Re: LICENSES: Missing ISC text & possibly a category ("Not
 recommended" vs. "Preferred licenses")
Message-ID: <20180429073101.GD27875@wotan.suse.de>
References: <CACna6rz_Ms2Uv1P6E0gCGNsRwK4nm=PMAOaJ5Uk9aJxs2VSamQ@mail.gmail.com>
 <20180429052617.GC24294@kroah.com>
 <20180429070315.GC27875@wotan.suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180429070315.GC27875@wotan.suse.de>
User-Agent: Mutt/1.6.0 (2016-04-01)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Apr 29, 2018 at 07:03:15AM +0000, Luis R. Rodriguez wrote:
> On Sun, Apr 29, 2018 at 07:26:17AM +0200, Greg Kroah-Hartman wrote:
> > I see it is only used in a very small number of dts files.  Why not just
> > use BSD-2-Clause instead?  What do you find in ISC that is not available
> > to you with just BSD?
> 
> ISC license is a simplified version of the BSD license due to the Berne
> convention. It was also used for wireless drivers to help the BSD community in
> particular OpenBSD who had picked that license for new contributions claimed
> simplification of the BSD-2-Clause. Because of this reason many BSD communities
> feel super comfortable with picking up kernel code in Linux under this license.
> 
> Granted, I'm on no longer a fan of promoting permissive licenses as it didn't
> buy us cross-collaboration at all. We tried.
> 
> But it would be unfair to advice against a license unless a reason is stated in
> favor of another BSD license. Why is the ISC license worse than the
> BSD-2-Clause?

Here's a good 'ol discussed reason as to why to prefer the 2-clause BSD
I suppose, and also to consider dual licensing actually:

http://lkml.kernel.org/r/20120408155709.1c817f1f@pyramind.ukuu.org.uk

So essentially tested over time, runtime considerations, and whatever the FSF
decides today may change tomorrow. So best to be safe. The dual licensing
strategy also helps with "unanticipated incompatibility".

  Luis
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
