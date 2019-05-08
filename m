Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 30A127D08A
	for <lwn-linux-doc@archive.lwn.net>; Wed,  8 May 2019 08:24:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbfEHIYa (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 8 May 2019 04:24:30 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:33100 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbfEHIYa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 May 2019 04:24:30 -0400
Received: by mail-vs1-f67.google.com with SMTP id z145so12139647vsc.0
        for <linux-doc@vger.kernel.org>; Wed, 08 May 2019 01:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XNonYk8/ihexURqWmbVWGo+HlXE5x3mb0fn10s1rhqQ=;
        b=NCJGCMhKpS7Nhq/WlWT49Dtmz49HBFEsfHuLJFyUR7lU7KrMSRbEg5CxmzO2MYJYAc
         xeTN36amdNGYTYJcDBGer9V9C59ZmERZ814kwtqfK1+2l3beltuBS2EBTwo2kQ9rU39r
         RxT3GqRpQuluDKyof/1SKJz3cvlP8m/dXmvHfAu5yzWo82mFctlVQWntst4XRWOzOPVw
         pT0eC6YSnaSl4yILqf+YIau2ag0dZA0fAHDEdr3/OOzOk1GCM6ac31g5+xSm3J9KG3XW
         6K2sZ28EunqXWhvUgwN4V6aDhQP8XPfopzGQDynU3l2hP3w2aC3ch8IfGiLu/yOgCROn
         V77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XNonYk8/ihexURqWmbVWGo+HlXE5x3mb0fn10s1rhqQ=;
        b=We0SPprj0k58GTA53FblcZbUHOipvqfDxtMGhvYCRKjkAP3WghKuHx2slZ6a1d75ml
         0eFOa6dykRl6U6d7HRE/m8zaxtye7AHylPD2DmwA04CVZiJf+HbAJO0P2jPPcGvxW5dS
         oh0gIGdck6XVopXiVcl0lfL1O6Si3y9aItwwzplV5Xif7PWFEDgsE3rSH0B1p5oPiPgH
         2JldWyezT7foLjQaz556FAic6zoO3muO8fDmPJ+Sxk/4dxbvQ/VVpx1WORzx3N46QUVp
         MxBtPLkeRuOrCCchEqORN+J9kptldHZ0yIA2zsXNuXXSIL00Gn9HwnZu21qXVIaDDkMh
         I2qA==
X-Gm-Message-State: APjAAAVwSXyy+y3tPZtBcY4JooNAqSskljgsyvV0xxbO8QnSHh35/0w3
        GtmzMD48+LPhXIW5OgIb8BcqkBtdQj3BNntGcOueZg==
X-Google-Smtp-Source: APXvYqzvqdfI/hjY2GupzJ4hQmeRb6kwfQPT4h75YLOR9fvCTVxVuStyB4lVkDgiLkIc9vXwMXKH+beoO6ciJweK3Yw=
X-Received: by 2002:a67:fa95:: with SMTP id f21mr19250315vsq.180.1557303869534;
 Wed, 08 May 2019 01:24:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190415155636.32748-1-sashal@kernel.org> <20190507174020.GH1747@sasha-vm>
 <CAFA6WYPk5Bm11RfaC72g_C8rnMQEPyp-MhtopmDM3Of31v1Z_w@mail.gmail.com> <20190508080232.vzdyvmrqx2apfvlf@holly.lan>
In-Reply-To: <20190508080232.vzdyvmrqx2apfvlf@holly.lan>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Wed, 8 May 2019 13:54:18 +0530
Message-ID: <CAFA6WYP206hVoqkKcbEvLP9O7ZAOLLru3OZPbVDO95Me=euFnA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] ftpm: a firmware based TPM driver
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     Sasha Levin <sashal@kernel.org>, peterhuewe@gmx.de,
        jarkko.sakkinen@linux.intel.com, jgg@ziepe.ca, corbet@lwn.net,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-kernel@microsoft.com, thiruan@microsoft.com,
        bryankel@microsoft.com, tee-dev@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 8 May 2019 at 13:32, Daniel Thompson <daniel.thompson@linaro.org> wrote:
>
> On Wed, May 08, 2019 at 10:11:54AM +0530, Sumit Garg wrote:
> > + TEE ML
> >
> > Hi Sasha,
> >
> > Firstly apologies for my comments here as I recently joined
> > linux-integrity ML so I don't have other patches in my inbox. Also, it
> > would be nice if you could cc TEE ML in future patches, so that people
> > are aware of such interesting use-cases and may provide some feedback.
>
> If this kind is desire exists then shouldn't it be captured in
> MAINTAINERS?
>

Makes sense, will send a patch to capture it in MAINTAINERS file.

-Sumit

>
> Daniel.
>
> >
> > On Tue, 7 May 2019 at 23:10, Sasha Levin <sashal@kernel.org> wrote:
> > >
> > > On Mon, Apr 15, 2019 at 11:56:34AM -0400, Sasha Levin wrote:
> > > >From: "Sasha Levin (Microsoft)" <sashal@kernel.org>
> > > >
> > > >Changes since v2:
> > > >
> > > > - Drop the devicetree bindings patch (we don't add any new ones).
> > > > - More code cleanups based on Jason Gunthorpe's review.
> > > >
> > > >Sasha Levin (2):
> > > >  ftpm: firmware TPM running in TEE
> > > >  ftpm: add documentation for ftpm driver
> > >
> > > Ping? Does anyone have any objections to this?
> > >
> >
> > From [PATCH v3 1/2] ftpm: firmware TPM running in TEE:
> >
> > > +static const struct of_device_id of_ftpm_tee_ids[] = {
> > > + { .compatible = "microsoft,ftpm" },
> > > + { }
> > > +};
> > > +MODULE_DEVICE_TABLE(of, of_ftpm_tee_ids);
> > > +
> > > +static struct platform_driver ftpm_tee_driver = {
> > > + .driver = {
> > > + .name = DRIVER_NAME,
> > > + .of_match_table = of_match_ptr(of_ftpm_tee_ids),
> > > + },
> > > + .probe = ftpm_tee_probe,
> > > + .remove = ftpm_tee_remove,
> > > +};
> > > +
> > > +module_platform_driver(ftpm_tee_driver);
> >
> > Here this fTPM driver (seems to communicate with OP-TEE based TA)
> > should register on TEE bus [1] rather than platform bus as its actual
> > dependency is on TEE driver rather than using deferred probe to meet
> > its dependency. Have a look at OP-TEE based RNG driver here [2].
> >
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0fc1db9d105915021260eb241661b8e96f5c0f1a
> > [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5fe8b1cc6a03c46b3061e808256d39dcebd0d0f0
> >
> > -Sumit
> >
> > > --
> > > Thanks,
> > > Sasha
