Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BA9AC433EF
	for <linux-doc@archiver.kernel.org>; Fri,  3 Jun 2022 16:36:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343994AbiFCQgR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Jun 2022 12:36:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242947AbiFCQgL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Jun 2022 12:36:11 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5713517D9
        for <linux-doc@vger.kernel.org>; Fri,  3 Jun 2022 09:36:10 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id gc3-20020a17090b310300b001e33092c737so7534893pjb.3
        for <linux-doc@vger.kernel.org>; Fri, 03 Jun 2022 09:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=QCRDkByz/Cqn8FqkNLEnmKbs9KeQuUc6m3mJSKWw6Ik=;
        b=W1Vw0oMKj94lsFUnzp1X1AUXf57Fj3HSCxxEgcLGLUwgDDQPUYYBuHbgdM7VOeb63n
         HE6Nsi4RTBMQKuTU9ItB5usKhcOZ9O4kgEkG4GyKKNooC2Vr4TN1cLABoXiZDWD99alZ
         uxIoBlRFPpkwIHqrIXZtM1YwTlbad8wUDTUHVpOsToijuJQ41qXSXIdvCagLEXR/fJRc
         8zCnFAWU6DmidutMAnqHWfL+p0yRBb4GaC/LZBRUDOo6qgGsN77UUyrFbJUBNuwL+40c
         pDDKe0LuCJgkf5WiMu7yVlGRCuHynj/s0AzVb1P6EWjd7/C9mkClr9Lphjx+HFxkxkdQ
         N7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QCRDkByz/Cqn8FqkNLEnmKbs9KeQuUc6m3mJSKWw6Ik=;
        b=m1oTptOqc8Me550OpGrVKJG3fn2vtKw60Jd81rPCGPbyeVEkMHgy3Qch6fpTJOoBGt
         8YUjG9TtJAbdxzJI3qZUYNrtF3Rkq1Lc3EuMOswB4/zQ/n2vvXWcGlSNfl8XUfY8xqck
         xHD7Iopt37rmTryu+GfLWYJp28owQXitifaqT/qxL0NImkSLi14a+5NlgRTtRhNWgASm
         ODPt9JVmG1RFZ0KPIO5eSEgOSFZOQRmsQpGWmHHa709NcF1Hfb/i3kJwwIkSo3Gr607T
         jlzbWZnswGSfqri4zsWWxYApx6/buPmHd3Q+WL4HjlrEmn5Dp6jHmmSbhSDetIuZzi6q
         YdJw==
X-Gm-Message-State: AOAM531AV0EeZ6pFKAOH94tilwkz01capTvD6qZ9YGBDrHbuw9wjtDpS
        9oVaS8ZqkuI7ZIGFLPCPKtA=
X-Google-Smtp-Source: ABdhPJzwlvybJyPU4FlnJtv1an6XmMilaFxaQx6edmzD7QvGnVwtpWGisMr2XOpscKZVVaXihPdNqQ==
X-Received: by 2002:a17:902:bf0a:b0:162:201e:1f49 with SMTP id bi10-20020a170902bf0a00b00162201e1f49mr10811881plb.39.1654274170186;
        Fri, 03 Jun 2022 09:36:10 -0700 (PDT)
Received: from [192.168.11.5] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id e13-20020aa798cd000000b0050dc76281b8sm5985260pfm.146.2022.06.03.09.36.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jun 2022 09:36:09 -0700 (PDT)
Message-ID: <4f13e688-1b4c-1a8e-7ca5-b2fc6d21263c@gmail.com>
Date:   Sat, 4 Jun 2022 01:36:04 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: Sphinx pre v3 -- removing support
Content-Language: en-US
To:     Adam Turner <aaturnerpython@outlook.com>,
        Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <LO3P123MB26810D190462B6BBBF1305F6C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
 <52a6ffc3-300f-289e-b523-bc1ea93459d1@gmail.com>
 <LO3P123MB2681A3F3A05E269AE0351799C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
 <87ee05oior.fsf@intel.com>
 <LO3P123MB26814568842CC74EF831288EC2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <LO3P123MB26814568842CC74EF831288EC2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

[+Cc: Mauro]

On Fri, 3 Jun 2022 15:54:33 +0000,
Adam Turner wrote:
>>> No releases will be removed from PyPI, but if pre v3 syntax is still
>>> used, Sphinx 6.0 would fail to properly parse it.
> 
>> And that's the crux of the problem. From kernel POV I'd very much prefer
>> not setting an upper bound for the Sphinx version. I think it's
>> important to be able to build the documentation using the latest Sphinx,
>> and gradually iron out the inevitable quirks that arise.
> 
>> However, if you decide to drop support for pre v3 syntax in Sphinx v6,
>> and we decide to stick to being able to use pre v3 Sphinx, we can't move
>> forward to newer versions until we bump the lower bound for the Sphinx
>> version to v3+. (Or we need to hack around Sphinx version differences in
>> kernel, but I think that would be best avoided.)

I might not be grasping the full context here, but I think the main script of
kernel documentation tool ./scripts/kernel-doc (a perl script) changes its
behavior depending on the target Sphinx version.

Its help text says:

>    Output format modifiers

>       reStructuredText only

>        -sphinx-version VERSION

>                Use the ReST C domain dialect compatible with a specific Sphinx

>                Version.


>
>                If not specified, kernel-doc will auto-detect using the

>                sphinx-build version found on PATH.

So it looks to me like it is already compatible with Sphinx 3.1 and later.

> 
> I don't want to be in the position of knowingly breaking the
> documentation tooling for the kernel. A strawman of a compromise
> would be for us (Sphinx) to delay the removal to Sphinx 7.0, and the
> kernel to increase the minimum to Sphinx 3.1 (required for
> ".. c:namespace::").

Yes, ".. c:namespace::" is actively used in userspace-api documentation.

FYI, see a recent reply from Mauro WRT support of kernel documentation
with different versions of Sphinx at:

  https://lore.kernel.org/linux-doc/20220521114629.6ee9fc06@coco.lan/

        Thanks, Akira


>                       That would enable the kernel to gradually update
> the syntax over a longer period, as I believe you won't be able to 
> use the v3 syntax currently.
> 
> Equally, Jonathan said he was hesitant to increase the minimum to 
> Sphinx 3, so perhaps that wouldn't work.
> 
> A
