Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6600DC433EF
	for <linux-doc@archiver.kernel.org>; Wed,  6 Jul 2022 22:29:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234014AbiGFW3m (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Jul 2022 18:29:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230412AbiGFW3l (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Jul 2022 18:29:41 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A0B015A32
        for <linux-doc@vger.kernel.org>; Wed,  6 Jul 2022 15:29:40 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id d2so29475209ejy.1
        for <linux-doc@vger.kernel.org>; Wed, 06 Jul 2022 15:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OGUR4OSSACdoQGymUgb58rO3deGhSo3mmc2zAbWJQeE=;
        b=MLVtEo7K97RJCHXIRkkYHN7vXWU9zIKn6VxhLksoxNPEadsQYtKR+BmrwV3VaoDKLv
         sx4xCnoRvDoQA53p4/HfB0RftG9w3QApDYJXuyoRt1iFTSCv93YfmPG3LyZCDFZtMb3b
         WX5YNtO5QMw081AJgzdbHuJnOdl9ZuSGhb47Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OGUR4OSSACdoQGymUgb58rO3deGhSo3mmc2zAbWJQeE=;
        b=gQcpgdxJlbzzHt14jeclB+PqV0Ukb7kEvl9OdNcMgqG+Yq8N8hYCfZOaGr6DyFdaWp
         iVzvvwS4RKFLcLoJPB+TiFcjsk4xgq0g4lDBiY9pFWJunU3lR6ITwcBM+pAGXLrAUvsH
         2qsFunJbIzs+VjrJybIxv5OMJBg2NN7vJk3bkAsDROofc1eEhrk4UhrhsnbF/XYU7NFW
         B2LRIrDMNq1b2R1hZhlJmttkHOvdYXemaN0D7tLvrAgfWM4o7gR8MMfwLRJxFDUxFVZ6
         ltVv5mlQoPnPeEEjb1fzQOpi2AN+pfWE0L8kTxvnvRSwe1lHMJvgRYQz9mLWd2Tmqwjo
         ebGw==
X-Gm-Message-State: AJIora+BU9KDQ/nY/jvuw/PHL+0pZcbW6xR1DuNx5IRTJ7W+0wUmyuvq
        9zkWzNymS4edpU85CBNCD86kk859YYX7V3uO
X-Google-Smtp-Source: AGRyM1tY6wDTpB+lgSCrsbJAQ57fxSGcwEpf+zrIx2g9fkYMoVk8shHTm3O/V6bRqskLYy1v1hT8cQ==
X-Received: by 2002:a17:906:149:b0:712:c9:7981 with SMTP id 9-20020a170906014900b0071200c97981mr40181634ejh.218.1657146578826;
        Wed, 06 Jul 2022 15:29:38 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id w2-20020a50fa82000000b0043a64eee322sm7512395edr.28.2022.07.06.15.29.37
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 15:29:38 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id s1so23893986wra.9
        for <linux-doc@vger.kernel.org>; Wed, 06 Jul 2022 15:29:37 -0700 (PDT)
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr38500441wrr.583.1657146577575; Wed, 06
 Jul 2022 15:29:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1656759988.git.mchehab@kernel.org> <0ae8251f97c642cfd618f2e32eb1e66339e5dfde.1656759989.git.mchehab@kernel.org>
 <CAD=FV=W7gzG4xSsR3HxOv96ytzyNvT5a1oQnmy4F0BqpCOChOw@mail.gmail.com>
In-Reply-To: <CAD=FV=W7gzG4xSsR3HxOv96ytzyNvT5a1oQnmy4F0BqpCOChOw@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 6 Jul 2022 15:29:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XdiDANmGsSmb1RNYyKxcbtZORyDbJFvhKpQG=dbvG14Q@mail.gmail.com>
Message-ID: <CAD=FV=XdiDANmGsSmb1RNYyKxcbtZORyDbJFvhKpQG=dbvG14Q@mail.gmail.com>
Subject: Re: [PATCH 11/12] docs: arm: index.rst: add google/chromebook-boot-flow
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Arnd Bergmann <arnd@arndb.de>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Wed, Jul 6, 2022 at 9:34 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Sat, Jul 2, 2022 at 4:07 AM Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
> >
> > This document was added without placing it at arm book.
> >
> > Fixes: 59228d3b9060 ("dt-bindings: Document how Chromebooks with depthcharge boot")
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > ---
> >
> > To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> > See [PATCH 00/12] at: https://lore.kernel.org/all/cover.1656759988.git.mchehab@kernel.org/
> >
> >  Documentation/arm/index.rst | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/arm/index.rst b/Documentation/arm/index.rst
> > index 2bda5461a80b..495ada7915e1 100644
> > --- a/Documentation/arm/index.rst
> > +++ b/Documentation/arm/index.rst
> > @@ -31,6 +31,8 @@ SoC-specific documents
> >  .. toctree::
> >     :maxdepth: 1
> >
> > +   google/chromebook-boot-flow
> > +
>
> Sure, seems reasonable. It's not truly SoC-specific but I guess
> there's no better place for it.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Just to be clear, this probably should go into the Qualcomm tree.

-Doug
