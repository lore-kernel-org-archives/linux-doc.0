Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFD08C43460
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 13:51:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF102613C0
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 13:51:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347983AbhDGNvZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Apr 2021 09:51:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:35936 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1352713AbhDGNvR (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 7 Apr 2021 09:51:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4EE4D6139E;
        Wed,  7 Apr 2021 13:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617803467;
        bh=e29TQ2cEhJbQpfyiTO8OZU/hP09K/z5i+R0jIzk84Pw=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=Rm2Q2hv2fZ3oHQS+wnazO1aBGLWn28T4TGTlgeHHxUw2E4rvD3t687BjEf3EhjNgv
         3hhBhL/4e7j/JB3KU1uWamHsHt1LIDgiPsf4ctY/UY4sE62k938DQav5ezBDXTD7s7
         AXYc7psu7RM4nXfWVGyqvl44NVovMGyexx6h6YRvf9/JrXaACXjKJbvn7TqMoFINXU
         IoUL2qUAe+4lLI+8pOXfggUMU9MiPzbA4le6QMBGA4QAElzSlTCNUdJQhaHIPqPGU2
         0s7gLNzXHNCfB79huxdrrP2BhDcLUjoer+rW8ZINAMBLi7tvcWBQwh7KpQ+QTM2LCy
         jCVN6tyM+H57A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id EB3085C029A; Wed,  7 Apr 2021 06:51:06 -0700 (PDT)
Date:   Wed, 7 Apr 2021 06:51:06 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v2 15/19] docs: update rcu_dereference.rst reference
Message-ID: <20210407135106.GC4510@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <cover.1617783062.git.mchehab+huawei@kernel.org>
 <ea2236875b0f5159ab07853d78f1e3c2f565a5e7.1617783062.git.mchehab+huawei@kernel.org>
 <5e171c69-4d76-9f7f-d0ee-1d4f31ad7e2c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e171c69-4d76-9f7f-d0ee-1d4f31ad7e2c@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 07, 2021 at 07:10:00PM +0900, Akira Yokosawa wrote:
> Hello Mauro,
> 
> (Dropped most CC)
> 
> On Wed,  7 Apr 2021 10:20:54 +0200, Mauro Carvalho Chehab wrote:
> > Changeset b00aedf978aa ("doc: Convert to rcu_dereference.txt to rcu_dereference.rst")
> > renamed: Documentation/RCU/rcu_dereference.txt
> > to: Documentation/RCU/rcu_dereference.rst.
> > 
> > Update its cross-reference accordingly.
> > 
> > Fixes: b00aedf978aa ("doc: Convert to rcu_dereference.txt to rcu_dereference.rst")
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> 
> Paul has sent a pull request to mingo for v5.13 including v1 of
> this patch.
> 
> > Mauro Carvalho Chehab (2):
> >       rcu: Fix kfree_rcu() docbook errors
> >       doc: Update rcu_dereference.rst reference   <---
> 
> See: https://lore.kernel.org/lkml/20210331192934.GA8127@paulmck-ThinkPad-P72/
> 
> Hmm, your email address is on the CC list...

My approach would be simply to take Mauro's patch into the -rcu dev
branch.  If it affected kernel function in a bad way, I would submit it
into v5.13, but as it is, I would just run it through my normal process.
This would likely get it into v5.14.

Seem reasonable?

							Thanx, Paul

>         Thanks, Akira
> 
> >  tools/memory-model/Documentation/glossary.txt | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tools/memory-model/Documentation/glossary.txt b/tools/memory-model/Documentation/glossary.txt
> > index b2da6365be63..6f3d16dbf467 100644
> > --- a/tools/memory-model/Documentation/glossary.txt
> > +++ b/tools/memory-model/Documentation/glossary.txt
> > @@ -19,7 +19,7 @@ Address Dependency:  When the address of a later memory access is computed
> >  	 from the value returned by the rcu_dereference() on line 2, the
> >  	 address dependency extends from that rcu_dereference() to that
> >  	 "p->a".  In rare cases, optimizing compilers can destroy address
> > -	 dependencies.	Please see Documentation/RCU/rcu_dereference.txt
> > +	 dependencies.	Please see Documentation/RCU/rcu_dereference.rst
> >  	 for more information.
> >  
> >  	 See also "Control Dependency" and "Data Dependency".
> > 
