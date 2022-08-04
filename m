Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C41C19F2D
	for <linux-doc@archiver.kernel.org>; Thu,  4 Aug 2022 07:05:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238884AbiHDHFO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Aug 2022 03:05:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237783AbiHDHFN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Aug 2022 03:05:13 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62D98B7F
        for <linux-doc@vger.kernel.org>; Thu,  4 Aug 2022 00:05:12 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id m7so14424255qkk.6
        for <linux-doc@vger.kernel.org>; Thu, 04 Aug 2022 00:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=uD+oKDSdjeuj/x+J4VpWwCNMihrBqS4okZLqrGLp+oU=;
        b=KJIuSp3xFRoIfccZKnqM693LSOM6w20XEVpxV9nRanvLv8W+nOvTGeQkWOKoobaGWw
         0y67qVZTIRVKrh1J3yueI/px+rWHxv3lHSQWBdMpYSXwzFwBbiePKBsRSxPeXdvcIlJW
         eUSPnK0VbjXGt/0h8Z7eXPaMyGUOGzn026kEAf+h2701FnYozszagguE22GDaJgk0EXy
         WRkUXi8zL1ZWX8pppPgRgXAPXizaqnGsW3wfg2FfzdvM9K8oTiTBsUrJE9XY05Xdj2VA
         LiFShI6ntPecTxZ9x5E6tZHNfLtirwAX7JgLTdJxfcROgG8/UnBBZdDnJ7gB7rQgda0x
         dK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=uD+oKDSdjeuj/x+J4VpWwCNMihrBqS4okZLqrGLp+oU=;
        b=ctTSyt+AkkH8Lp5no9I8IvDqjoVqI+QNi6Hi90L4tFuy0lVCAMX4Qk3eENGDbgfbr/
         1aGDNufJQMVnwmy6sAqC8YygkosEHc8UHIlb3Af8tOjjU5tcnvfb3/lYlP8giLSGc7ZF
         Z09PGulyfrHg9SMNDwDLGXKKhv/u+U4cuPwfIcBranKkdxX1IETGTvaF2ZuQCq73cwiY
         5C/FuZ1NMnDwIJmf/iV7WZ1PW6etP5UjcArleUCIW2frQFaZWcLa9UR7Sv6pw3HRBVQ0
         dSUL4L97Z+CMw5ZJY6qh1r6wnnGLRLz2TGPDwXcZ2hoJ1J4lIsAEtRnS6qwfDzk3d4hl
         bIew==
X-Gm-Message-State: ACgBeo3Ar9CKAS/NKTytJQde/qdAeyL9A61aDW0v8IWVOKYIubBMosDH
        d/C9mt3HKPLPvikW7S1mwxzG0Za0g6ka/MGuektNYw==
X-Google-Smtp-Source: AA6agR4ePnHG7rHeMl5Py0nAvETcIQ4KSdWFDeuK5QHJQAe9Sps2HxxlWGqyY7gSNp/Xj7m9MDvi4eZwL/+yxQEsWc4=
X-Received: by 2002:a37:de18:0:b0:6b8:f2f3:f917 with SMTP id
 h24-20020a37de18000000b006b8f2f3f917mr321801qkj.203.1659596711365; Thu, 04
 Aug 2022 00:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220801211240.597859-1-quic_eberman@quicinc.com>
 <20220801211240.597859-4-quic_eberman@quicinc.com> <e1a93490-7deb-8221-f3f8-83546946c61a@linaro.org>
 <0f9afb39-83a9-96ec-2ee0-f511d4fa3403@quicinc.com>
In-Reply-To: <0f9afb39-83a9-96ec-2ee0-f511d4fa3403@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 4 Aug 2022 10:04:59 +0300
Message-ID: <CAA8EJprQ9Nc=6ms0VNVhO1rg6UXDHDrCb7WRwwkfLhxKrJBqjQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] arm64: gunyah: Add Gunyah hypercalls ABI
To:     Elliot Berman <quic_eberman@quicinc.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 4 Aug 2022 at 00:15, Elliot Berman <quic_eberman@quicinc.com> wrote:
>
> Hi Dmitry,
>
> On 8/2/2022 6:34 AM, Dmitry Baryshkov wrote:
> > On 02/08/2022 00:12, Elliot Berman wrote:
> >> Add initial support to perform Gunyah hypercalls. The arm64 ABI for
> >> Gunyah hypercalls generally follows the SMC Calling Convention.
> >
> > Seeing a c&p (or c&rework) from arm-smccc.h, could you please describe:
> >
> > 1) Why can't you use the existing arm_smccc_1_1_hvc()? I checked, you
> > don't seem to be getting more than 4 values back.
> >
>
> The Gunyah APIs can return up to 8 values. As you observed though, these
> initial patches are only using the first 4 values back. I'd like to use
> the larger v1.2 so I don't need to update later.

I'd suggest following the hyperv example here. It uses arm_smccc_1_1
when possible and 1_2 only when required. Note, that if you are using
the 1_2 call all the times, you are somewhat wasting the cpu cycles by
always copying x0...x17 instead of just x0...x3.

> > 2) If #1 is not possible, why can't you add necessary glue code to the
> > arm-smccc.h (as your code to support nargs/multiple return values is
> > generic enough) and use corresponding macro in asm/gunyah.h ?
> >
>
> I think the code here may be considered Gunyah-specific as I am limiting
> to 8 arguments and return values. If I add to arm-smccc.h, I would need
> to expand out to x17. Does it make sense to add another SMCCC 1.2
> interface to arm-smccc.h?

You do not need to handle 8 arguments at this moment, until the moment
you really need this code, I'd suggest postponing this change. And
when you need it, having the generic code is better than having the
gh-specific code.


-- 
With best wishes
Dmitry
