Return-Path: <SRS0=V28G=7D=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A7BC433E0
	for <linux-doc@archiver.kernel.org>; Thu, 21 May 2020 17:51:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3393420759
	for <linux-doc@archiver.kernel.org>; Thu, 21 May 2020 17:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590083488;
	bh=2d8nqPCko1fpe5XkTOVIVvgDrM5HYatl3QB2pRosB9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=2mM9GOCZ+/dgwICwxm7qu2+ZEo9d65fyfFX25qFR6zTX1PfMVdgo+6Jb7y/anFmBa
	 ZLWfZqrnK2iyw/u2uVHArLI029Vc3wMYWHlHJ9YkBDSd708VRLD01hhjTatzZVgcpv
	 akGBvzp5lEOFonxrZ38+kn3w5HrtbeZt1rPfOYok=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728553AbgEURv1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 21 May 2020 13:51:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728022AbgEURv1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 21 May 2020 13:51:27 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D934FC061A0E
        for <linux-doc@vger.kernel.org>; Thu, 21 May 2020 10:51:26 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id m11so8115300qka.4
        for <linux-doc@vger.kernel.org>; Thu, 21 May 2020 10:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=AmK0JS5D8R0n4cEbrxrK4/Z7C6iNtMbN195hmPxIAVk=;
        b=eajNCLxW3IDlRomqfX3e/EA6M9xI4O7UM37/jiblKqXPJmt1C57/Ug0glGT0btKX2K
         O224Swy9NAz+WuCbqEIuZZObkSKkS5oYJPEO4qwevZ1koV7l5qroun+/GfnOunEaHXeL
         H13jqItA5nHl4qQwvzLs9y7r+dGlxsIsdMVCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=AmK0JS5D8R0n4cEbrxrK4/Z7C6iNtMbN195hmPxIAVk=;
        b=Nmez6NmrIU2nuPAEI8FppAoqoS0dMISnFr7BpO45t0TIWOsjHbS7bE18G7N5LVP6AZ
         f3IHabKpInsFs6sXlKbJTpChiJ02q3quIuPcrWDuw4RtQGErnNrcdlOBORT5drxMRTFk
         Cd5W8yDgBQXZYw3hzndHzxFFvq9F2JCeXZ1xm6nZPmTIyjjuAGQJjqyT/aBjLI0cHL2l
         MWk+cBN0RXeP7PtLHNg0F1O8SSUBen3qX1029yL9BE+sVMHBqAzAEXHulTu7CuRaPGT8
         JhU5ZX6OsmzlN3x/SHxDJ1aHTIF2zyZEec5v30tWK/JXV9y0q/5NFTSXr+94+DQhN9hS
         n50g==
X-Gm-Message-State: AOAM531zqU8K0pnl9rwoEsBz3F4WWDNDJfKat7GhqdYVpRhixWDcBUuH
        HhpyvKxnYB6QJ/3/D85BAoTKOR6CwtE=
X-Google-Smtp-Source: ABdhPJxf3wFVCSDH3yoJgl+DPXw6gizL9DRC9e7MAd5d92MEIEePNfum7NqKpi0tMHhKHmQOL9AStQ==
X-Received: by 2002:a05:620a:642:: with SMTP id a2mr10906128qka.328.1590083485914;
        Thu, 21 May 2020 10:51:25 -0700 (PDT)
Received: from i7.mricon.com (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id d74sm5396690qke.100.2020.05.21.10.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 10:51:24 -0700 (PDT)
Received: by i7.mricon.com (sSMTP sendmail emulation); Thu, 21 May 2020 13:51:22 -0400
Date:   Thu, 21 May 2020 13:51:22 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Markus Heiser <markus.heiser@darmarit.de>
Cc:     linux-doc@vger.kernel.org
Subject: Re: Building directly with sphinx
Message-ID: <20200521175122.zcyoa7zz33anokit@chatter.i7.local>
Mail-Followup-To: Markus Heiser <markus.heiser@darmarit.de>,
        linux-doc@vger.kernel.org
References: <20200520215343.btkr7avo3ruu2iap@chatter.i7.local>
 <153afc64-542f-3965-0fd3-d1ae93e3a913@darmarit.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <153afc64-542f-3965-0fd3-d1ae93e3a913@darmarit.de>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 21, 2020 at 10:35:51AM +0200, Markus Heiser wrote:
> > 
> > I was playing around with readthedocs.org recently and wanted to see if
> > I could build kernel docs there. I cannot directly run "make htmldocs"
> > there, and it proved to be quite tricky to make sphinx do the right
> > thing without all the things that are being defined in the Makefile.
> > 
> > Is it possible at all, or am I wasting my time?
> 
> It is wasting time ;) .. The Makefile targets do build intermedaiate
> files using perl and other scripts, this will never work on RTD.

Okay, I'd suspected as much after poking around things a bit. Another 
possibility would be to have a separate repository where we commit the 
doc tree (after it's massaged into the "ready to be built with sphinx" 
condition). We could run this automatically on our end on each mainline 
release, but it's certainly not a necessity.

> FWIW: in other projects I worked some time with RTD but at the end
> I gave up: If you have e.g. auto generated content in your build
> process which is not generated by the python developer-mainstream
> tools, RTD gives you too little freedom to implement your more
> or less complex build procedures.  And .. often I get the RTD-Oops
> links from search engines ..  RTD is (my experience is a  while
> ago; "was") not very comfortable to to rebind obsolete URLs to
> new content.
> 
> Overall I think kernel.org does a good job .. since years, no need
> for additional RTD confusions;
> 
>    https://www.kernel.org/doc/html/latest/

Glad to hear it. My primary interest in getting it hooked up with RTD 
was just from the perspective of creating an external mirror for folks 
who are already using RTD. For now, I'm going to shelve this effort and 
just continue building docs straight from the tree on our end.

Thanks for your help!

-K
