Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91CB4C001B2
	for <linux-doc@archiver.kernel.org>; Thu, 22 Dec 2022 16:24:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbiLVQYd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 22 Dec 2022 11:24:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbiLVQYc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Dec 2022 11:24:32 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 346232497F;
        Thu, 22 Dec 2022 08:24:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9479861C43;
        Thu, 22 Dec 2022 16:24:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FF62C433EF;
        Thu, 22 Dec 2022 16:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1671726269;
        bh=m/JZ2MlUNjzmWc4uVPQGsugJ7FAGwWNl1f1pGALXa0U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mWWTm1aIXB9Cfm+ZRFrZkYsyC0A2TvsTQHAoR5O78dMvRN5yg91mIViPY3MzmNDKM
         D0HxihuOAnC7sIKtYOnfzthi4dNa/zg8Iql/mT5sRRDP2T42oJddrRGDw5Y2iQxjbC
         S7dK50jygWA4M6yvbvQflfyhmFE3hlKkI8Jum8Tk=
Date:   Thu, 22 Dec 2022 17:24:25 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Tudor Ambarus <tudor.ambarus@linaro.org>
Cc:     sashal@kernel.org, corbet@lwn.net, stable@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        joneslee@google.com
Subject: Re: [PATCH] Documentation: stable: Add rule on what kind of patches
 are accepted
Message-ID: <Y6SEuYEK/90dJjMe@kroah.com>
References: <20221222091658.1975240-1-tudor.ambarus@linaro.org>
 <Y6RchEaXUvg+9nKv@kroah.com>
 <86b513b7-b65f-4948-7c09-789844f0d90d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86b513b7-b65f-4948-7c09-789844f0d90d@linaro.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 22, 2022 at 04:20:42PM +0200, Tudor Ambarus wrote:
> 
> 
> On 22.12.2022 15:32, Greg KH wrote:
> > On Thu, Dec 22, 2022 at 11:16:58AM +0200, Tudor Ambarus wrote:
> > > The list of rules on what kind of patches are accepted, and which ones
> > > are not into the “-stable” tree, did not mention anything about new
> > > features and let the reader use its own judgement. One may be under the
> > > impression that new features are not accepted at all, but that's not true:
> > > new features are not accepted unless they fix a reported problem.
> > > Update documentation with missing rule.
> > > 
> > > Link: https://lore.kernel.org/lkml/fc60e8da-1187-ca2b-1aa8-28e01ea2769a@linaro.org/T/#mff820d23793baf637a1b39f5dfbcd9d4d0f0c3a6
> > > Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> > > ---
> > >   Documentation/process/stable-kernel-rules.rst | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/Documentation/process/stable-kernel-rules.rst b/Documentation/process/stable-kernel-rules.rst
> > > index 2fd8aa593a28..266290fab1d9 100644
> > > --- a/Documentation/process/stable-kernel-rules.rst
> > > +++ b/Documentation/process/stable-kernel-rules.rst
> > > @@ -22,6 +22,7 @@ Rules on what kind of patches are accepted, and which ones are not, into the
> > >      maintainer and include an addendum linking to a bugzilla entry if it
> > >      exists and additional information on the user-visible impact.
> > >    - New device IDs and quirks are also accepted.
> > > + - New features are not accepted unless they fix a reported problem.
> > 
> > No need to call this out, it falls under the "fixes a problem" option,
> > right?
> > 
> > The goal is not to iterate every single option here, that would be
> > crazy.  Let's keep it short and simple, our biggest problem is that
> > people do NOT read this document, not that it does not list these types
> > of corner cases.
> > 
> 
> When I read the document I thought that new features are not accepted
> at all, so I took into consideration making a custom fix for stable.
> But that would have been worse, as it implied forking the stable and
> would have made backporting additional fixes harder. An explicit rule
> like this would have saved me few emails changed and few hours spent on
> looking for an alternative fix. But maybe others find this a
> common sense implied rule and you won't have to be summoned for it
> anymore.

Let's just say that this is the first time in the 18+ years of stable
kernel development that it has come up as a question like this :)

thanks,

greg k-h
