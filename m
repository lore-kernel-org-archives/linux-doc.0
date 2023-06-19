Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B24CAEB64D9
	for <linux-doc@archiver.kernel.org>; Mon, 19 Jun 2023 19:49:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbjFSTtz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Jun 2023 15:49:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230312AbjFSTty (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Jun 2023 15:49:54 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24AB5106
        for <linux-doc@vger.kernel.org>; Mon, 19 Jun 2023 12:49:53 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-25eb9e8299fso1442676a91.0
        for <linux-doc@vger.kernel.org>; Mon, 19 Jun 2023 12:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687204192; x=1689796192;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vl+W0dm86MLhJH1YgS+uWQvaw5Vcun/5O6JALu35QNk=;
        b=U6q9E4HBaSxAGXy6QOLon8eb8ICYa5e3HewjZ5qp2W+XhViL69FCQIJhros+ab4Hlg
         ob+eEnTk60AwQPK38A5mnNUQU6d9ZE6L6Tuba6o2l+a7FFiygNpr546Xdf5AmlxtkkZO
         tyS/DmjsUKg+Wz3Ss2UQql3XYL03ZPz50Mxbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687204192; x=1689796192;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vl+W0dm86MLhJH1YgS+uWQvaw5Vcun/5O6JALu35QNk=;
        b=dcSuUtcUOFyFsefesncJpFL4CBYOmS/RJgCwjgql7sPrnt7jJaPf30jtqOkWXc/8vj
         BsSJ6YdsB7HlZmCp5+b4zm9uJ0q2tW/GsRTG+QhMKwpSWlVvXiwk+I+FR3aPE2428ivr
         xnfNFhECify4AbvAfRlAO2FJS4tWnrWOyqv/bqZ39r/el+gwgTyG35RDStuHuf/bYU43
         OWkNCQVDKmTaxietwAVhnr2RoXCkOfkLtiYi+5T+AryR1TVacTRAyMLNdo/1YcUWIEdi
         T6+iD3oaUkimLxCbblS9hnqIal6OeUS04SDBTus8DB3oTJG8oY48VNGUbudlxW6n/JlU
         Bveg==
X-Gm-Message-State: AC+VfDygq37eBgIEZ3unzYeUcF1tB8dBUEiuKpo4gg/MccLV1MTBjhx4
        8kNwycXZRjAIlbUPwiMIU3VT6Q==
X-Google-Smtp-Source: ACHHUZ5RG6Ywm6bhbwEyCAB01M2NKK49+8NDckUGMte9UF4jutXGv3AUo0NtJ7eB0rimk49wTAS3xQ==
X-Received: by 2002:a17:90a:17ce:b0:25b:ce91:c204 with SMTP id q72-20020a17090a17ce00b0025bce91c204mr5457082pja.46.1687204192421;
        Mon, 19 Jun 2023 12:49:52 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id q23-20020a635057000000b0054fd1723554sm80580pgl.21.2023.06.19.12.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 12:49:51 -0700 (PDT)
Date:   Mon, 19 Jun 2023 12:49:51 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        tech-board-discuss@lists.linux-foundation.org,
        Theodore Ts'o <tytso@mit.edu>,
        Dan Williams <dan.j.williams@intel.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: Linux Contribution Maturity Model and the
 wider community
Message-ID: <202306191247.3CA085BA64@keescook>
References: <cd1786eadd1ff05d9ca053b72eb5f06ceb0c470d.1687167717.git.fthain@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd1786eadd1ff05d9ca053b72eb5f06ceb0c470d.1687167717.git.fthain@linux-m68k.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 19, 2023 at 07:41:57PM +1000, Finn Thain wrote:
> The Linux Contribution Maturity Model methodology is notionally based on
> the Open source Maturity Model (OMM) which was in turn based on the
> Capability Maturity Model Integration (CMMI).
> 
> According to Petrinja et al., the goal of the OMM was to extend the CMMI
> so as to be useful both for companies and for communities [1][2]. However,
> the Linux Contribution Maturity Model considers only companies and
> businesses.
> 
> This patch addresses this bias as it could hinder collaboration with
> not-for-profit organisations and individuals, which would be a loss to
> any stakeholder.
> 
> Level 5 is amended to remove the invitation to exercise the same bias
> i.e. employees rewarded indirectly by other companies.
> 
> [1] Petrinja, E., Nambakam, R., Sillitti, A.: Introducing the
> OpenSource Maturity Model. In: 2nd Emerging Trends in FLOSS Research
> and Development Workshop at ICSE 2009, Vancouver, BC, Canada (2009)
> 
> [2] Wittmann, M., Nambakam, R.: Qualipso Deliverable A6.D1.6.3
> CMM-like model for OSS.
> 
> Cc: Theodore Ts'o <tytso@mit.edu>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>
> ---
>  Documentation/process/contribution-maturity-model.rst | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/process/contribution-maturity-model.rst b/Documentation/process/contribution-maturity-model.rst
> index b87ab34de22c..863a2e4c22e2 100644
> --- a/Documentation/process/contribution-maturity-model.rst
> +++ b/Documentation/process/contribution-maturity-model.rst
> @@ -62,8 +62,8 @@ Level 3
>  =======
>  
>  * Software Engineers are expected to review patches (including patches
> -  authored by engineers from other companies) as part of their job
> -  responsibilities
> +  authored by contributors from outside of the organization) as part of
> +  their job responsibilities

This seems fine to me.

>  * Contributing presentations or papers to Linux-related or academic
>    conferences (such those organized by the Linux Foundation, Usenix,
>    ACM, etc.), are considered part of an engineer’s work.
> @@ -103,7 +103,6 @@ Level 5
>  
>  * Upstream kernel development is considered a formal job position, with
>    at least a third of the engineer’s time spent doing Upstream Work.
> -* Organizations will actively seek out community member feedback as a
> -  factor in official performance reviews.

This really cannot be dropped -- companies must factor upstream work
into performance reviews or it will continue to be seen as "free time"
work, and employees won't be recognized for their upstream contributions.
If an org has no perf reviews, this item is already nullified, IMO.

>  * Organizations will regularly report internally on the ratio of
> -  Upstream Work to work focused on directly pursuing business goals.
> +  Upstream Work to work focused on directly pursuing the organisation's
> +  other goals.

This seems fine to me.

-Kees

-- 
Kees Cook
