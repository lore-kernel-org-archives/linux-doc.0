Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14EBAC433F5
	for <linux-doc@archiver.kernel.org>; Fri, 15 Apr 2022 08:27:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350037AbiDOI3a (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 15 Apr 2022 04:29:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241474AbiDOI31 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Apr 2022 04:29:27 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47F71B3DE8
        for <linux-doc@vger.kernel.org>; Fri, 15 Apr 2022 01:26:59 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id j17so6812510pfi.9
        for <linux-doc@vger.kernel.org>; Fri, 15 Apr 2022 01:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IouwgSoOU5RLyMJuBmnkWSebHjJ6FolzaVbEFNDsszU=;
        b=gTmvcqVWKjRoSWUlP6fJYRDMffX0KIawj4PuOOu801Wi/7rfmmcSGiH/BqjX+xIriT
         +nq2k+bskAd6ELn0+sBm+a3TTq/DF/RxNvQtcZ2ZYxGWeNbhFrH0w7Xj66Hq6YbSh7Ls
         xOZlEe+aipJWNgpkY2ZaBifeeD0SHr6tqi9VNoi5HKwONCBjHg3nEXJ94Pvr8CeiZfBn
         FVdPLZjKFpJfp7eoNOVHUv5vsm8OVhX1JQuC5S0MyZwPBN1KoZvjFxbSw+ejQd7RBEq2
         MWWeqibVdA1ug9lzdH+DA4fPTlCqRibLRvhX/zBXFTI9oD4bhezridMEKHTigA98IAWc
         B7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IouwgSoOU5RLyMJuBmnkWSebHjJ6FolzaVbEFNDsszU=;
        b=b67Kd8T31++YZ+/Xh86Tv1d+cNVNIJCs7FNuPootN8xmGL07UcbHHyl7mI660GuRnN
         RRWPDaUla78oIIjRbEb7/2xgadvCvHzkD5SaHa3t+iJIRltmT5+3p4C9+J6MqdWfOAsr
         Bo0HJuSMkDLD9893WY+DkuhZVp8hadZK7+iomhSY3KzJv1H38EIHLvfRpiagg73U2SGh
         hk4pMqzIIRTuM9Rrk1uvOpzBV9sWAj2VGB9yI9KIFt+lDKPSXLciSbFAD0Yq7iYt8xNr
         UBseJGVri7fq77fMWavKvXONNEX9iJX7NmTVbbXD/OYF+5kP/Rd0lUMfEZu48IsQTzmn
         XkmQ==
X-Gm-Message-State: AOAM533khvq5q2Z+GJP8ztr72QxYAbDaVucqwLd8ZS1Uka2QRKuY2dTQ
        qjtteDbyxVClVnkL0neIkqxaUiJvLKjSa8PnxeHweQ==
X-Google-Smtp-Source: ABdhPJwi7VZhcsJ5DGv660Mg4AHf5r56+3E7RgA5pVgaieMZjLUNyxDVauEwklWTDsyiDy13rPq5P6cpr0CplOR4IGc=
X-Received: by 2002:a63:1557:0:b0:39d:8460:2e07 with SMTP id
 23-20020a631557000000b0039d84602e07mr5680484pgv.344.1650011218652; Fri, 15
 Apr 2022 01:26:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220415054219.38078-1-aajith@arista.com> <4586921d-5fc4-b63f-8264-a6fd63c592b6@gmail.com>
In-Reply-To: <4586921d-5fc4-b63f-8264-a6fd63c592b6@gmail.com>
From:   Arun Ajith S <aajith@arista.com>
Date:   Fri, 15 Apr 2022 13:56:46 +0530
Message-ID: <CAOvjArSb4avVaV25925z+e5eKW89Q6k+AsPSq1yS+kroG_a=ww@mail.gmail.com>
Subject: Re: [PATCH net-next v5] net/ipv6: Introduce accept_unsolicited_na
 knob to implement router-side changes for RFC9131
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     netdev@vger.kernel.org, davem@davemloft.net,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        dsahern@kernel.org, yoshfuji@linux-ipv6.org, kuba@kernel.org,
        pabeni@redhat.com, corbet@lwn.net, prestwoj@gmail.com,
        gilligan@arista.com, noureddine@arista.com, gk@arista.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Sorry, it wasn't the mailer.
The rst file in my patch was missing tabs.
I have fixed it and verified the generated HTML is correct.
I'll post v6 with the fix.

On Fri, Apr 15, 2022 at 1:09 PM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>
> On 4/15/22 12:42, Arun Ajith S wrote:
> > +accept_unsolicited_na - BOOLEAN
> > +     Add a new neighbour cache entry in STALE state for routers on receiving an
> > +     unsolicited neighbour advertisement with target link-layer address option
> > +     specified. This is as per router-side behavior documented in RFC9131.
> > +     This has lower precedence than drop_unsolicited_na.
> > +
> > +   ====   ======  ======  ==============================================
> > +      drop   accept  fwding                   behaviour
> > +      ----   ------  ------  ----------------------------------------------
> > +         1        X       X  Drop NA packet and don't pass up the stack
> > +         0        0       X  Pass NA packet up the stack, don't update NC
> > +         0        1       0  Pass NA packet up the stack, don't update NC
> > +         0        1       1  Pass NA packet up the stack, and add a STALE
> > +                             NC entry
> > +   ====   ======  ======  ==============================================
> > +
>
> Hi,
>
> Building htmldocs with this patch, there are no more warnings from v4, but
> I don't see the table above generated in the output. I guess due to
> whitespace-mangling issues on your mailer, because the table syntax alignment
> (the =-s) don't match the contents/cells.
>
> Thanks.
>
> --
> An old man doll... just what I always wanted! - Clara
