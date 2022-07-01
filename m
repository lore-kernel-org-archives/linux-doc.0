Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A5BC433EF
	for <linux-doc@archiver.kernel.org>; Fri,  1 Jul 2022 14:06:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbiGAOGU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 1 Jul 2022 10:06:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231566AbiGAOGT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Jul 2022 10:06:19 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AD2231528
        for <linux-doc@vger.kernel.org>; Fri,  1 Jul 2022 07:06:14 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id c130-20020a1c3588000000b0039c6fd897b4so3774673wma.4
        for <linux-doc@vger.kernel.org>; Fri, 01 Jul 2022 07:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1Z/mT3fDDdH8JukUsNUAeEComBrn2eg2dO2KaEAI2LQ=;
        b=8Ra9FMIoDI0o0BaALUgPFE1iLdhuMIaWKp2hKWcBzen1m+uTHXyVJAgOfEq7UVBv0M
         ON/91JaUREgvmPQpqf9TdXLeHsEfqhdtxstKErb9mX/7bNsMyelr2DpuYphM1jcGNSWa
         jN42WnvA0rqkuacKbptsGcdWeUiF5B8ShB7ANE7akdUktkd2/fEE5cAX8Iwq4Lqp/SLL
         qDheycdaR0iutk1RfYxLkxrHqYNxGQsvZBZqZiccqd1cGcakRuR/TTTWLM35LAD5MwsQ
         R8Y/A3tnkzMJLzu1gaVhqx1ak+P3O5lD5EQO47L0Vxb/DxFKEkVEz28LTq42DhDqVlYq
         QsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1Z/mT3fDDdH8JukUsNUAeEComBrn2eg2dO2KaEAI2LQ=;
        b=VMMTQ0FN3torHLREJVt0vQYvEjtLnrs/m3A+tL2cfdB1N4ZmxOuyRJ1rFGlhE7eKBl
         OlTjCZkNbJJ9zjsyZwli4rTmJrg5e6V97DhlTRZAjfgxKI79xlXwcgrvXj9LC/89GGTN
         RwAc0ijTSNcbYiM5LBYzFF5gJpkVJ80FsV3pUy8cTGI0qydqfMzaLOgYFzLlf/2w/a1u
         1wJRw2Rul+ZELYWhs7loZlHCu+Nw5eW1Hvf5EXYqlV1E75wxRFOsKjW0h6Z83ypCJNIU
         wY3u3wSgsYAz86JLT7O2voiijDNETMPS+dFfzQ+nxwsXEeQqkg8gNHSN1KM4+vf/FcVy
         jCBQ==
X-Gm-Message-State: AJIora9xVuFX5h3tz1JIxBHr4LGa3kYbyMBMWucVhmF+ouNdyYPhp2Tw
        qp7XxAeRpCpJNlJuRWQ4m61i1CmD8AV9WPnB
X-Google-Smtp-Source: AGRyM1vSYSbKrn5umfeskAumyIPzUDGtXG288DiMUN993SOTUCCG4lEX1ifU/00bF67hl5WX/ZdXRA==
X-Received: by 2002:a7b:c8d8:0:b0:3a0:42ca:d03 with SMTP id f24-20020a7bc8d8000000b003a042ca0d03mr18612608wml.167.1656684372914;
        Fri, 01 Jul 2022 07:06:12 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id bq8-20020a5d5a08000000b0021b903a018bsm18224262wrb.92.2022.07.01.07.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 07:06:12 -0700 (PDT)
Date:   Fri, 1 Jul 2022 16:06:11 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     David Lamparter <equinox@diac24.net>
Cc:     Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
        corbet@lwn.net, linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next] eth: remove neterion/vxge
Message-ID: <Yr7/UwsV4mqg0I5t@nanopsycho>
References: <20220701044234.706229-1-kuba@kernel.org>
 <Yr7NpQz6/esZAiZv@nanopsycho>
 <Yr7z7HU2Z79pMrM0@eidolon.nox.tf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yr7z7HU2Z79pMrM0@eidolon.nox.tf>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fri, Jul 01, 2022 at 03:17:32PM CEST, equinox@diac24.net wrote:
>[culled Cc:]
>
>On Fri, Jul 01, 2022 at 12:34:13PM +0200, Jiri Pirko wrote:
>> Fri, Jul 01, 2022 at 06:42:34AM CEST, kuba@kernel.org wrote:
>> >The last meaningful change to this driver was made by Jon in 2011.
>> >As much as we'd like to believe that this is because the code is
>> >perfect the chances are nobody is using this hardware.
>> 
>> Hmm, I can understand what for driver for HW that is no longer
>> developed, the driver changes might be very minimal. The fact that the
>> code does not change for years does not mean that there are users of
>> this NIC which this patch would break :/
>
>As a "reference datapoint", I'm a user that was affected by the removal
>of the Mellanox SwitchX-2 driver about a year ago.  But that was a bit

You could not be. There was really no functionality implemented in
switchx2 driver. I doubt you used 32x40G port switch with slow-path
forwarding through kernel with total max bandwidth of like 1-2G for the
whole switch :)


>different since the driver was apparently rather incomplete (I don't
>know the details, was still messing around to even get things going.)
>
>(FWIW my use case is in giving old hardware a second life, in this case
>completely throwing away the PowerPC control board from Mellanox SX6000
>series switches and replacing it with a new custom CPU board...  I might
>well be the only person interested in that driver.
>
>> Isn't there some obsoletion scheme globally applied to kernel device
>> support? I would expect something like that.
>
>I have the same question - didn't see any such policy but didn't look
>particularly hard.  But would like to avoid putting time into making
>something work just to have the kernel driver yanked shortly after :)
>
>
>-David
