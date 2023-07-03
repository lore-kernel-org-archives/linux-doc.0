Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EFEFC001B3
	for <linux-doc@archiver.kernel.org>; Mon,  3 Jul 2023 18:35:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbjGCSfl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 Jul 2023 14:35:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbjGCSfk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Jul 2023 14:35:40 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F8FC1A2
        for <linux-doc@vger.kernel.org>; Mon,  3 Jul 2023 11:35:39 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1b89cb535afso4576785ad.2
        for <linux-doc@vger.kernel.org>; Mon, 03 Jul 2023 11:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688409339; x=1691001339;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bUmtkPfGFGLt/sWqyxDB3seIbhKCcY0ouJFur5sT6is=;
        b=T3xfRpMZUBrRfRyVx/RvzEmOyeERM4oSUVGO+qOoivWCgbOAFaQmQo4cY/xiie+cay
         nad8N913HoffqJe8j0NmInCTvMDNeC2XRRK5qs/rq0d4i75H3KuXwTApYMvrU3Tlld3Q
         2hVUeub3JzmYokqGbjoCg907XEIogd8u7b+8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688409339; x=1691001339;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bUmtkPfGFGLt/sWqyxDB3seIbhKCcY0ouJFur5sT6is=;
        b=g8I5EuWIeckRkzu4K6riBj/KTgCXNA0NdPKNN+rh4UYxdIm/EvqUKmc65ThyO7Oole
         EO6C6lOCJckjJrcxhJsQIbDsVbZEH5RQ49+NU0Pr75vY805CdO6JDiUynMET97agiMhd
         ZZ3ijqOPpDJj0/zstZa3zpP5Yz3eKkAb8eruk6FDLhdr5SYOcoTFDflp/q5A0A20Nj6b
         oQwTjolvAe715Z13Z4z8lXuW+ydhqBu6WUq3iN/tdtxeTxoj93VDKcou6sAMEXDK49mu
         KssXitcHLpUYjZguuiz4nbJvh3h+7uNXnkyF7sdpVELCXwXWHEQRd7O2CEfDj+OK6kJH
         whcA==
X-Gm-Message-State: ABy/qLaYS6ofLLVWbS4KHk/DSouvvk2r457Syg9Eo81/R7q82hzN0GwY
        g+SMv2pglv9OYkSkrvMACR32MA==
X-Google-Smtp-Source: APBJJlE0gEja4grNegOCxc+0vth+lPOPSiYX92TLbp6hq3tCxb8WUto6r2gI8npoQ6pZD8Ee1nBiVQ==
X-Received: by 2002:a17:902:efd6:b0:1b3:fb76:215b with SMTP id ja22-20020a170902efd600b001b3fb76215bmr8489185plb.48.1688409339122;
        Mon, 03 Jul 2023 11:35:39 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id t4-20020a170902a5c400b001b077301a58sm15603963plq.79.2023.07.03.11.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 11:35:38 -0700 (PDT)
Date:   Mon, 3 Jul 2023 11:35:37 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Willy Tarreau <w@1wt.eu>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, security@kernel.org, corbet@lwn.net,
        workflows@vger.kernel.org
Subject: Re: [PATCH 2/2] Documentation: security-bugs.rst: clarify CVE
 handling
Message-ID: <202307031131.51907BC65@keescook>
References: <2023063020-throat-pantyhose-f110@gregkh>
 <2023063022-retouch-kerosene-7e4a@gregkh>
 <202306301114.E199B136@keescook>
 <2023070213-capacity-moneybags-3668@gregkh>
 <ZKJJoK4kyOCEYcOR@1wt.eu>
 <2023070335-groggily-catfish-9ad5@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023070335-groggily-catfish-9ad5@gregkh>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jul 03, 2023 at 05:00:15PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Jul 03, 2023 at 06:08:00AM +0200, Willy Tarreau wrote:
> >   The security team does not assign CVEs, nor do we require them for
> >   reports or fixes, as this can needlessly complicate the process and may
> >   delay the bug handling.  If a reporter wishes to have a CVE identifier
> >   assigned, they should find one by themselves, for example by contacting
> >   MITRE directly.  However under no circumstances will a patch inclusion
> >   be delayed to wait for a CVE identifier to arrive.
> > 
> > This puts the responsibility for finding one in time on the reporter
> > depending on what they expect, and if they want it in the commit
> > message, they'd rather have one before reporting the problem.
> 
> Oh, nice wording, let me steal that!  :)

Yeah, this is good. The last sentence is a little hard to parse, so how
about this, with a little more rationale expansion:

However under no circumstances will patch publication be delayed for
CVE identifier assignment. Getting fixes landed takes precedence; the
CVE database entry will already reference the commit, so there is no loss
of information if the CVE is assigned later.


-Kees

-- 
Kees Cook
