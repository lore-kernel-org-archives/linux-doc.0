Return-Path: <SRS0=iD3b=BR=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22482C433E0
	for <linux-doc@archiver.kernel.org>; Fri,  7 Aug 2020 03:51:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 098A22177B
	for <linux-doc@archiver.kernel.org>; Fri,  7 Aug 2020 03:51:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbgHGDvy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 Aug 2020 23:51:54 -0400
Received: from agw1.byu.edu ([128.187.16.185]:50986 "EHLO agw1.byu.edu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726489AbgHGDvy (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 6 Aug 2020 23:51:54 -0400
Received: from cangw3.byu.edu (cangw3.byu.edu [10.18.21.143])
        by agw1.byu.edu (Postfix) with ESMTPS id 9CABB1813A;
        Thu,  6 Aug 2020 21:51:53 -0600 (MDT)
Received: from mail2.fsl.byu.edu (mail2.rc.byu.edu [128.187.49.32])
        by cangw3.byu.edu (8.15.2/8.15.2/Debian-8) with ESMTPS id 0773posG014177
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 6 Aug 2020 21:51:50 -0600
Received: from imjin (unknown [166.70.219.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail2.fsl.byu.edu (Postfix) with ESMTPSA id 0212D3F2D9;
        Thu,  6 Aug 2020 21:51:49 -0600 (MDT)
Date:   Thu, 6 Aug 2020 21:51:48 -0600
From:   Billy Wilson <billy_wilson@byu.edu>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] docs: Correct the release date of 5.2 stable
Message-ID: <20200807035148.GB7953@imjin>
References: <20200806231754.7735-1-billy_wilson@byu.edu>
 <84f3c886-7ade-5870-22a0-6cef2735c19b@infradead.org>
 <20200807000823.GA7953@imjin>
 <d67c4c89-72c9-43d8-9e86-c5ad48df132b@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d67c4c89-72c9-43d8-9e86-c5ad48df132b@infradead.org>
X-Bayes-Prob: 0.0001 (Score -1, tokens from: Outbound, byu-edu:default, base:default, @@RPTN)
X-CanIt-Geo: ip=128.187.49.32; country=US; region=Utah; city=Provo; latitude=40.2329; longitude=-111.6688; http://maps.google.com/maps?q=40.2329,-111.6688&z=6
X-CanItPRO-Stream: byu-edu:Outbound (inherits from byu-edu:default,base:default)
X-Canit-Stats-ID: 0a3crPOuh - babd0343e318 - 20200806
X-Scanned-By: CanIt (www . roaringpenguin . com)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 06, 2020 at 05:41:55PM -0700, Randy Dunlap wrote:
> On 8/6/20 5:08 PM, Billy Wilson wrote:
> > On Thu, Aug 06, 2020 at 04:46:13PM -0700, Randy Dunlap wrote:
> >> On 8/6/20 4:17 PM, Billy Wilson wrote:
> >>> A table lists the 5.2 stable release date as September 15, but it was
> >>> released on July 7. This may confuse a reader who is trying to
> >>> understand the stable update release cycle.
> >>>
> >>> Signed-off-by: Billy Wilson <billy_wilson@byu.edu>
> >>> ---
> >>>  Documentation/process/2.Process.rst | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/Documentation/process/2.Process.rst b/Documentation/process/2.Process.rst
> >>> index 3588f48841eb..4ae1e0f600c1 100644
> >>> --- a/Documentation/process/2.Process.rst
> >>> +++ b/Documentation/process/2.Process.rst
> >>> @@ -113,7 +113,7 @@ than one development cycle past their initial release. So, for example, the
> >>>  5.2 kernel's history looked like this (all dates in 2019):
> >>>  
> >>>  	==============  ===============================
> >>> -	September 15 	5.2 stable release
> >>> +	July 7		5.2 stable release
> >>>  	July 14		5.2.1
> >>>  	July 21		5.2.2
> >>>  	July 26		5.2.3
> >>
> >> Hi,
> >> For clarification, what 5.2 kernel do you find that was released on
> >> July 7, 2019?  IOW, what you consider the 5.2 stable release of that date?
> >> or where did you get that date?
> >>
> >> thanks.
> >>
> >> -- 
> >> ~Randy
> >>
> > 
> > I found the date of July 7 at https://kernelnewbies.org/Linux_5.2 . I
> > just double checked that date against the git tag for v5.2 (commit
> > 0ecfebd2b524) and it looks like it matches.
> 
> OK, that part makes sense (to me).
> 
> > September 15, meanwhile, is the 5.3 stable release date. I mainly
> > noticed this because the table uses the 5.2 release dates to illustrate
> > the stable update release cycle. I was scratching my head for a few
> > minutes trying to figure out why 5.2 had a date of September 15 and
> > 5.2.1 had a date of July 14, until I realized it was a mistake.
> 
> I had 2 questions. One was why not July 8 instead of July 7,
> but you answered that part satisfactorily (above).  (July 8 is when
> the tarball and .sign files are dated.)
> 
> The other question is do we call v5.2 stable?  Or should we begin
> stable at v5.2.1?
> 
> 
> thanks.
> -- 
> ~Randy
> 

That's a good question. This same page describes the cycle of -rc
kernels as, "a normal series will get up to somewhere between -rc6 and
-rc9 before the kernel is considered to be sufficiently stable and the
final release is made."

In that context, I had read "stable" as in sufficiently stable, not as
"released by the stable team."

The author also did well at introducing the stable tree shortly after
that. "Once a stable release is made, its ongoing maintenance is passed
off to the 'stable team.'"

Personally, I think those clarifications make it okay to call v5.2
stable in this particular table. But there could be nuances with that
choice that I am missing.
