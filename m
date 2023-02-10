Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4498C636D4
	for <linux-doc@archiver.kernel.org>; Fri, 10 Feb 2023 21:07:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233511AbjBJVHd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 10 Feb 2023 16:07:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233425AbjBJVHc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Feb 2023 16:07:32 -0500
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FF0D7CCA9
        for <linux-doc@vger.kernel.org>; Fri, 10 Feb 2023 13:07:32 -0800 (PST)
Received: by mail-qt1-x834.google.com with SMTP id g8so7286953qtq.13
        for <linux-doc@vger.kernel.org>; Fri, 10 Feb 2023 13:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V8uBq1ZauDk7QYH9jbR4OgSbivcLQSOg6mx25pZOGUA=;
        b=h5+vogX+yVY1368kGDybI1xNnLGCQvGWlDcQ98ck2YVr6Sm0HNNdhdKsptyX9xWtiu
         ZZevfmvPemHKVXeYYBaiciYgZevaeExd27dpmfoeoaRftyFJgA1IcISDC+PmZqx8ijGP
         VDmQ3pt1PE1dfHdkrriv5DlfG4yt3cmvRTj94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8uBq1ZauDk7QYH9jbR4OgSbivcLQSOg6mx25pZOGUA=;
        b=cuTJpD+qTSoKSFttHrxzJKGmnHu/x2CfbIL+3S+JVoxfxhA0GfTAs6RPllgn+T7ACK
         +OPkE7EvYqo+VsVyCTh87SkqV7oxpBxDlCPUJTHew1V2mpX/rrkugGegOmzETv1PdMgi
         pOi0CRBeLxcGrfhANFUhElUPSLoJNiInoSZvjyCQHCjRljyuonogLbeTzONDT3VeR0KC
         F0rozlr7uQpERz5T//3O6Svj7uQ7+ZD64hKiFolfua+vSJt2T3BtF9JzCO6KuquJ4iA6
         OUl1bP3eaQzYq7kszmWLaHite+/n6VYEpl5/iVSdInhq7E8oEIijzv0VWBL2UNlirTgI
         rurA==
X-Gm-Message-State: AO0yUKVmZW7fKK1E5EQXrhMrPBG5kk0kSuOfOdd0ddA86hxINlKSajvF
        1IKK+fj46BWNGH3N79nD5AhC7Q==
X-Google-Smtp-Source: AK7set9bqw4f3N9X7w+83larwtCUiNA29Ni5P5++h6aVoFLLp70sK1gVioWYL3Ab/XoPTAgQi30hUw==
X-Received: by 2002:a05:622a:12:b0:3bb:801b:c3cc with SMTP id x18-20020a05622a001200b003bb801bc3ccmr14832431qtw.1.1676063251116;
        Fri, 10 Feb 2023 13:07:31 -0800 (PST)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id q185-20020ae9dcc2000000b0073a37f5d496sm20112qkf.128.2023.02.10.13.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 13:07:30 -0800 (PST)
Date:   Fri, 10 Feb 2023 16:07:28 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "elana.copperman@mobileye.com" <elana.copperman@mobileye.com>
Subject: Re: Removing the deprecated htmldocs for good?
Message-ID: <20230210210728.5zontxigmtqippta@nitro.local>
References: <CAKXUXMw-Tg7WcfVHaWZ-sK+WFnedL+S-jA_UnsdTR=HFwxAXSw@mail.gmail.com>
 <87wnjm9iba.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87wnjm9iba.fsf@meer.lwn.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 30, 2021 at 09:19:21AM -0700, Jonathan Corbet wrote:
> > While scanning through the internet for kernel documentation, I
> > stumbled upon the old deprecated htmldocs under
> > https://www.kernel.org/doc/htmldocs/. I see that on
> > https://www.kernel.org/doc/, we already point out that 'htmldocs -
> > Kernel Documentation in docbook format (deprecated).' is deprecated.
> > If I am not mistaken, all the content from htmldocs has now been
> > transformed into .rst and has potentially evolved further and hence
> > all relevant information should also already be available somewhere in
> > https://www.kernel.org/doc/html/latest/.
> >
> > Is it now time to delete the content under
> > https://www.kernel.org/doc/htmldocs/ for good?
> 
> I think that time may have come, yes; perhaps just have it redirect to
> https://www.kernel.org/doc/html/latest/ instead?

I'm going through my backlog (of which I have lots) and I finally got around
to making this change. Requesting https://www.kernel.org/doc/htmldocs/ should
now send you to the archives site, and it's gone from the listing in
www.kernel.org/doc.

-K
