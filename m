Return-Path: <SRS0=tUtt=7I=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95D0DC433E0
	for <linux-doc@archiver.kernel.org>; Tue, 26 May 2020 17:31:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71ACD2053B
	for <linux-doc@archiver.kernel.org>; Tue, 26 May 2020 17:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590514310;
	bh=uUb0Aljolk6q+slL8zSxy9yrXkJQy8VSSCi0T37NOrE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=wADZwGsd53pH9kop/ZpR+t+VHnp7bZwLCI/mb7K5hgIhh3vBikxblTRL2WM+FGbg5
	 CuJHrccGLQJGPe6NspNoeRKYwvvIUDmufGXmqiFzWe2Q0XcVgECuc8/U8vVp31iLdJ
	 mnY2OlFxr7ulK63fxmhMVCsN1iyqDS3pUjASTh28=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728339AbgEZRbu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 May 2020 13:31:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728138AbgEZRbt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 May 2020 13:31:49 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88609C03E96D
        for <linux-doc@vger.kernel.org>; Tue, 26 May 2020 10:31:48 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id p12so16775922qtn.13
        for <linux-doc@vger.kernel.org>; Tue, 26 May 2020 10:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=WH+ZkAcw+fY+7NvXcBPsljklY5B1kJkdLnNzW5zqKws=;
        b=KwY5eh/Jt7ke3gqrjjnVZOkWlx0ZKGPDahhxz5YQxprK8o5OB98NU5KRlHIJcaK2j0
         Le4t3zqqnYWGRAV750FsYFuqE9YwlO6O/NrANL0JwYhuhLnx0ktqz6pZQIi6Kf04YjZ3
         GHMfxzw/IzpynfbqMJXvq4NK7qrvvIEMIb4Ik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=WH+ZkAcw+fY+7NvXcBPsljklY5B1kJkdLnNzW5zqKws=;
        b=fNj31CxOj22kHuUAw6TMHZrUBOznGLQJHn/InUI1Ud4pfdoPTVHrcHVI6UXMvLGaT4
         YANKrZ9bGv4Fd/vty8SNDHd1+0zuopbAD1KUkSZORV33hdrw68Up3imrXV0UwJo3Xhe1
         FCnG+c4t7TyUABPRGgvIflLTah0lUwnEUC2FxsnvYBDTDpuB9qc+ddEVuJUu3DmAwkLe
         OoTntGstQFdyLfAm3X8dzFpFl1kEmRSIOUO8F2iOQXM/8Y0k5AYZQpVa5ySPwRjL31Tb
         1PSlO3Z38aqBt6Y7+4UotMrOpc4aNTlBoxnvfgFn1DID8JDC8XfWBKQDVEpoqh0ctpfM
         NoeA==
X-Gm-Message-State: AOAM531/2TFoMcP3pvnEZ9mJwzVF6oumQ6Pl0PTrLnv++3w9H5AH05Dj
        R24pl6tosdScdg6ViiAgj4HxzFDeYSI=
X-Google-Smtp-Source: ABdhPJxsmwXtSMREQHxldJbRjDU5sQgCKYxPvzY9MPZh0N7+TDx7CoJ4iWNzGxAnwnX0z7/SGBiEvQ==
X-Received: by 2002:ac8:1a46:: with SMTP id q6mr2605618qtk.338.1590514307406;
        Tue, 26 May 2020 10:31:47 -0700 (PDT)
Received: from i7.mricon.com (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id g51sm297763qtb.69.2020.05.26.10.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 10:31:46 -0700 (PDT)
Received: by i7.mricon.com (sSMTP sendmail emulation); Tue, 26 May 2020 13:31:44 -0400
Date:   Tue, 26 May 2020 13:31:44 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Markus Heiser <markus.heiser@darmarit.de>,
        linux-doc@vger.kernel.org
Subject: Re: Building directly with sphinx
Message-ID: <20200526173144.zczwvnsidiexs36d@chatter.i7.local>
Mail-Followup-To: Jani Nikula <jani.nikula@linux.intel.com>,
        Markus Heiser <markus.heiser@darmarit.de>,
        linux-doc@vger.kernel.org
References: <20200520215343.btkr7avo3ruu2iap@chatter.i7.local>
 <153afc64-542f-3965-0fd3-d1ae93e3a913@darmarit.de>
 <20200521175122.zcyoa7zz33anokit@chatter.i7.local>
 <87367o2p4n.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87367o2p4n.fsf@intel.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 25, 2020 at 03:08:40PM +0300, Jani Nikula wrote:
> >> It is wasting time ;) .. The Makefile targets do build 
> >> intermedaiate
> >> files using perl and other scripts, this will never work on RTD.
> >
> > Okay, I'd suspected as much after poking around things a bit. Another 
> > possibility would be to have a separate repository where we commit the 
> > doc tree (after it's massaged into the "ready to be built with sphinx" 
> > condition). We could run this automatically on our end on each mainline 
> > release, but it's certainly not a necessity.
> 
> FWIW, when I was developing the Sphinx documentation build for the
> kernel, I carefully tried to ensure everything would build directly, and
> consequently also at readthedocs.org. I kept testing it at RTD too.
> 
> For this reason I kept resisting the addition of any Makefile trickery,
> and insisting we should do everything through Sphinx. This would have
> meant writing Sphinx extensions for all the hacks people wanted to
> add. But it would also have lead to a self-contained system with fewer
> moving parts, which I thought was worth pursuing. And, obviously, would
> have made it possible to host the documentation at RTD.
> 
> I failed. Stuff just keeps piling up in the Makefiles.

Well, if someone gives me a way to create a sphinx-buildable tree out of 
the contents of Documentation/*, I would be happy to maintain it and 
host on RTD. I think there is benefit to have a repository of just docs, 
even if it is secondary to the main repo and is auto-committed there on 
each mainline release.

> In fairness, the kernel documentation build was growing too big even for
> RTD. It kept timing out and/or consuming too much resources. I believe
> that would have been possible to sort out with the RTD maintainers,
> given the possibility to host kernel documentation, but there was no
> point in pursuing this since the docs wouldn't build directly anyway.

I've already negotiated with RTD.org to significantly extend the build 
time, so that's not a concern.

-K
