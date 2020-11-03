Return-Path: <SRS0=f+/j=EJ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6889AC00A89
	for <linux-doc@archiver.kernel.org>; Tue,  3 Nov 2020 00:42:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B8EA22268
	for <linux-doc@archiver.kernel.org>; Tue,  3 Nov 2020 00:42:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cIBtkV3r"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbgKCAmY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 2 Nov 2020 19:42:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726563AbgKCAmW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Nov 2020 19:42:22 -0500
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC334C061A49
        for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2020 16:42:20 -0800 (PST)
Received: by mail-ua1-x944.google.com with SMTP id w3so1423871uau.2
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2020 16:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=inHX6bFfbXo/rqCNZibX/SoGds+Oh6m2ZoC9dpKySuk=;
        b=cIBtkV3rfYlpJdRmlM5S5gzfFC3gEqaAv+xn3S/pWzIBl/UZeMNKdLEc9zbYw3XzmT
         SnfKp5pu0dJOr+/aK2AYfwcPdDbM6Vni0GB33DXOVAWpzF3nwTuZHzHfxG4O7ANp9J90
         w9HGKNSxw1+Zd1sfs4sY/NnfNlJjtzPwDIxmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=inHX6bFfbXo/rqCNZibX/SoGds+Oh6m2ZoC9dpKySuk=;
        b=hNptrjXYaD2foTcLqKzf+QwNzEQ9el4om6n+hlNgOs3dLQpeLGeiJFAv2hkTNf37CY
         FwNWs4oI4fjDlXhxVz7ESKhiU2tk/EUmbVIUmD7KijdE+TP2Ef6OjZcmT6RGKclAEcsy
         HgDfUBu91vNWVByacm4p3crLre4RCvz9n3zAw1TqSfePrMTGAnfPbDu2l78MB0UqmJ6z
         L5JEnyNDd+PXmNlvPJyuOYoPCGVBGqXXt7P9+6QvEl/zM6MmSVV59pUeuxYLeyjXqucB
         t7mLJWdHtBiEFOPeSqPcJm6FG+BPctHHHaLJ/5tcbL0byAYTJY/NaEE9GNs/QhtI+YZd
         WjTQ==
X-Gm-Message-State: AOAM532lqFuev2JG41fMmrWQ8+2Vi/aGjmSXcA1TeJSQZpje+ylJRkSa
        jlboVPsRwf2WgmfHI1nsIQSpNPLeZnXQeQ==
X-Google-Smtp-Source: ABdhPJxhG/VEM1hgdsWFAPEM7/KCpsaXBIxQ4Oj0woS/NE8r9Sb3WI25lQeN0hHbS1vEzAFnV5BE4w==
X-Received: by 2002:ab0:768:: with SMTP id h95mr9046481uah.23.1604364139718;
        Mon, 02 Nov 2020 16:42:19 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id l6sm2063151vkk.56.2020.11.02.16.42.17
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2020 16:42:18 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id f7so2764885vsh.10
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2020 16:42:17 -0800 (PST)
X-Received: by 2002:a67:ef98:: with SMTP id r24mr2239428vsp.37.1604364137278;
 Mon, 02 Nov 2020 16:42:17 -0800 (PST)
MIME-Version: 1.0
References: <20201019140601.3047-1-lukasz.luba@arm.com> <d3c64655-dc31-73dc-8483-bf5805a9d389@arm.com>
 <20201102135449.GE2221764@google.com>
In-Reply-To: <20201102135449.GE2221764@google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 2 Nov 2020 16:41:57 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VDCbWU4ukYwJUsTKMfEz9+55rmdLL1a39JWcPzjUmZCQ@mail.gmail.com>
Message-ID: <CAD=FV=VDCbWU4ukYwJUsTKMfEz9+55rmdLL1a39JWcPzjUmZCQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Clarify abstract scale usage for power values in
 Energy Model, EAS and IPA
To:     Quentin Perret <qperret@google.com>
Cc:     Lukasz Luba <lukasz.luba@arm.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Dietmar Eggemann <Dietmar.Eggemann@arm.com>,
        morten.rasmussen@arm.com, Matthias Kaehlcke <mka@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Mon, Nov 2, 2020 at 5:54 AM Quentin Perret <qperret@google.com> wrote:
>
> On Monday 02 Nov 2020 at 08:54:38 (+0000), Lukasz Luba wrote:
> > Gentle ping to Quentin and Daniel for sharing opinion on this patch set.
> > If you are OK, then I could use this as a base for next work.
>
> One or two small nits, but overall this LGTM. Thanks Lukasz.
>
> > As you probably know I am working also on 'sustainable power' estimation
> > which could be used when there is no DT value but it comes from FW.
> > That would meet requirement from Doug, when the DT cannot be used,
> > but we have sustainable levels from FW [1].
>
> Cool, and also, I'd be happy to hear from Doug if passing the sustained
> power via sysfs is good enough for his use-case in the meantime?

It does sound like sysfs could be made to work for us, but it's
definitely a workaround.  If the normal way to set these values was
through sysfs then it would be fine, but I think most people expect
that these values are just setup properly by the kernel.  That means
anyone using our board with a different userspace (someone running
upstream on it) would need to figure out what mechanism they were
going to use to program them.  There's very little advantage here
compared to a downstream patch that just violates official upstream
policy by putting something bogoWatts based in the device tree.

My current plan of record (which I don't love) is basically:

1. Before devices are in consumer's hands, accept bogoWatts numbers in
our downstream kernel.

2. Once devices are in consumers hands, run the script I sent out to
generate some numbers and post them upstream.

If, at some point, there's a better solution then I'll switch to it,
but until then that seems workable even if it makes me grumpy.


-Doug
