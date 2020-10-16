Return-Path: <SRS0=BNGE=DX=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22912C43457
	for <linux-doc@archiver.kernel.org>; Fri, 16 Oct 2020 12:18:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B914920874
	for <linux-doc@archiver.kernel.org>; Fri, 16 Oct 2020 12:18:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BRCGCazZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407407AbgJPMSu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 16 Oct 2020 08:18:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407408AbgJPMSu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Oct 2020 08:18:50 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCAD2C0613D5
        for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2020 05:18:49 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id t9so2601130wrq.11
        for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2020 05:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0pdmY6ok4ux/pRIx0LbllshB3HAtBqzH8ww+t6IFCvg=;
        b=BRCGCazZgsunLR6jJ78OyJPB+VKA4STGJjhLL24E+nm0fiJ6C/tvZ3LCjySWqlTlCt
         FUHsNt9eHJHmF2gky45/dqPZGAujEldnyGBehFiP6wzx+HHPBnNvmkGo0Nva+JZ1lx+N
         jKwgEwvqg+M8unp+nDGAVNz0NGNRvAt7yQp9qnjJYEKOUfZ5L1WWgjTSZ4yL7ywY181w
         vxN+H2/4XXo5DbRolcOHaJPsqOB+4SYlIYSBhLHzpcwBI8tSBD8oK2sP9s7bovofZHsa
         voBX29Z23s32AgJqa77Y/uIl/lVcwzwdXFH0p+lqZvROc5zvEH40JJj5saTH1GSrfsCm
         NkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0pdmY6ok4ux/pRIx0LbllshB3HAtBqzH8ww+t6IFCvg=;
        b=JrzBYLC/cOKrxaEBdjT4Ryeklpvf3rq4iSliyyWTvzefRuytn/l3wiMTgCN9CrU24p
         yInj17FppLaQM2nv0/a97DSU+YG6Ksqr25pJ7DSMalHeQYPO47voU1Dz3/o9ETXeFLxy
         ZnasvdFrfZjTkdGU3uhhBz7CupEkjpG+cLNjX97dH7ZlzAyQ2FQUbkZCl6UEOSuYC0aS
         LXnTc0QPEpyZ+KqapOAGXrDV47+b85Ht5fRudfHc5FvXThL20UscotD/6eMa14lXEwTW
         qO+9i1jPFdfiOk4pLaIn5rV3hsHM31nGYrRqaSdKyN8P79H04tIG1wF/hZ4P0AOjl8Lm
         DsyQ==
X-Gm-Message-State: AOAM533o0bThIPXmmx2uKqCGXB1ipU0nsZ6schyIDf9eVgtbfsXtnvZ2
        8Zbv6Vx1IbpBhyANb1jWxRDxSg==
X-Google-Smtp-Source: ABdhPJynsLog2SBXEjNnrjD188QPZKXARHTTCwJpoH5mJt1b6bt+GnFTOCBbSDzlQUbUzWRgybvrog==
X-Received: by 2002:a5d:4144:: with SMTP id c4mr3565269wrq.311.1602850728236;
        Fri, 16 Oct 2020 05:18:48 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:110:f693:9fff:fef4:a7ef])
        by smtp.gmail.com with ESMTPSA id c68sm2636719wmd.34.2020.10.16.05.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 05:18:47 -0700 (PDT)
Date:   Fri, 16 Oct 2020 13:18:44 +0100
From:   Quentin Perret <qperret@google.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Lukasz Luba <lukasz.luba@arm.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Dietmar Eggemann <Dietmar.Eggemann@arm.com>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        "Nayak, Rajendra" <rnayak@codeaurora.org>
Subject: Re: [PATCH v2 0/3] Clarify abstract scale usage for power values in
 Energy Model, EAS and IPA
Message-ID: <20201016121844.GA2420691@google.com>
References: <d2960f6a-1805-1fb4-98ae-4a756d20370b@arm.com>
 <765e6603-b614-fb72-64ff-248b42474803@linaro.org>
 <b19c1f12-b7cf-fcae-4ebb-617019effe2e@arm.com>
 <55d3fb0f-f7d8-63c5-2bdb-53eaa62380e0@linaro.org>
 <f660731e-132b-2514-f526-d7123ed3522c@arm.com>
 <d04019bd-9e85-5f3e-2a1b-66780b8df3dc@linaro.org>
 <3e3dd42c-48ac-7267-45c5-ca88205611bd@arm.com>
 <00ceec64-3273-bb4a-6f38-22de8d877ab5@linaro.org>
 <CAJZ5v0hV8fwRnADdjiiF=zapO3AE6=_W_PeOQ_WhUirCcFkgdA@mail.gmail.com>
 <e321191c-61d2-a15d-47c2-653b277984ca@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e321191c-61d2-a15d-47c2-653b277984ca@linaro.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Friday 16 Oct 2020 at 13:48:33 (+0200), Daniel Lezcano wrote:
> If the SCMI is returning abstract numbers, the thermal IPA governor will
> use these numbers as a reference to mitigate the temperature at the
> specified sustainable power which is expressed in mW in the DT. So it
> does not work and we can not detect such conflict.
> 
> That is why I'm advocating to keep mW for the energy model and make the
> SCMI and DT power numbers incompatible.

I think it's fair to say SCMI-provided number should only be compared to
other SCMI-provided numbers, so +1 on that. But what I don't understand
is why specifying the EM in mW helps with that? Can we not let the
providers specify the unit? And then it's up to the clients to decide
what they want to do. The scheduler wouldn't care, and IPA would have to
check things are comparable, but all in all that should work out fine
without a strong requirement on the actual unit.

Also, I thought SCMI had a notion of sustained performance too, why
can't we use that for IPA? Lukasz?

Thanks.
Quentin
