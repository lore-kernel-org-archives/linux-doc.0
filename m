Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE672C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 12 May 2022 15:25:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355895AbiELPZW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 May 2022 11:25:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355916AbiELPZS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 May 2022 11:25:18 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13B2120F4ED
        for <linux-doc@vger.kernel.org>; Thu, 12 May 2022 08:25:17 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id l18so10922057ejc.7
        for <linux-doc@vger.kernel.org>; Thu, 12 May 2022 08:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LZMxjSJmldQ3JWCoivCnvn/+FiMrBE9vcPF4uGtQz2A=;
        b=hhzaIlWaIG4YpufqFFKKB+9c/4n/9E89t2cVHITLb/CTZiRXgM4WOJTmuW5fPTCYtC
         c/jh9WFhKOMhx5aVbeKji3Tus8LJw4bjHpNOfXm+PqFrROCEA6/i0kitKKu49HOEzdzz
         4sobYKpWQqGS+YoDGoLZ/xoT2+4FdIAQgU9YbMrz1boNVhux5IHe8ZdQ/dqcwgcNq1Dh
         N9enZ/zIy58r4SEc42V6EkirsIn9CWFVD82Wfx2nk6whuMj++SmG7uYjm1wvISVRnprR
         xXLLtQvXbWxruFV4WKCz6UeWZiYrAcJPVsvRxLuxAQvAdy+8T5CjQiLzuSqz6pUBq2wM
         JX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LZMxjSJmldQ3JWCoivCnvn/+FiMrBE9vcPF4uGtQz2A=;
        b=nVXmJVRHH26uZiq+70B15hD8Cf1HOnD7opZMVTsBR5a07XTbjKa2/Bdui2YEsH9LFI
         RsFoUhEWUlI+kZGxG2esJyknqIaJYr181ja5LGr4NQ3n36CNIQk94awDZEO2Z86qlxTC
         bV6Dy0a7BX6mSkq5jVFoxOxXpwg2drJAKCJl9wVmNloI1FlBPWx/q+AdknHJSDXRw6i6
         z7Np+xp+0kRhWlj4vS9zGunQk3ZclP6KWkJm5gvikttAmgT3PYd8bFHGL5gpGDdEDsrd
         sRtBb2zbzb+iQlDq0rR1RDX4gmhSN9clb7blR7G+KwVExeY555MuKEyWKbNoV915W5Kk
         B5VA==
X-Gm-Message-State: AOAM531UgvRilliORzM9TH1QmoLmTNU18op1OxaPJAsiOlDOPCSdag6b
        d4yCedUYk1OHEuUujOkNIijZzndUisXSkrmk+2PjyA==
X-Google-Smtp-Source: ABdhPJyw52u6k4SKpOakHeWu7gjr6JuceopSOtVUJ5BHjzjLTgPQPdonUQjHuVeMJTBgwp2cRZ99WzBoL3BHUYZYrEk=
X-Received: by 2002:a17:907:72ce:b0:6f4:5a57:320c with SMTP id
 du14-20020a17090772ce00b006f45a57320cmr389491ejc.75.1652369115386; Thu, 12
 May 2022 08:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <bc6e9ed7-d98b-c4da-2a59-ee0915c18f10@gmail.com> <5ca35c47-6145-4ec1-6c05-3c46f436cb4d@gmail.com>
In-Reply-To: <5ca35c47-6145-4ec1-6c05-3c46f436cb4d@gmail.com>
From:   Daniel Latypov <dlatypov@google.com>
Date:   Thu, 12 May 2022 08:25:04 -0700
Message-ID: <CAGS_qxpE9qGsS1LqaobVGFKFgV6TwvwNLR4e9PG5zsfPACSf_Q@mail.gmail.com>
Subject: Re: [RFC] KTAP spec v2: prefix to KTAP data
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     David Gow <davidgow@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Kees Cook <keescook@chromium.org>, Tim.Bird@sony.com,
        Brendan Higgins <brendanhiggins@google.com>,
        Jonathan Corbet <corbet@lwn.net>, rmr167@gmail.com,
        guillaume.tucker@collabora.com, kernelci@groups.io,
        kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 11, 2022 at 11:01 PM Frank Rowand <frowand.list@gmail.com> wrote:
> ================================================================================
> #### discussion notes:
>
> - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
> PRO: minimally invasive to specification.
>
> - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
> CON:
>
> KTAP does not include any mechanism to describe the value of <prefix string>
> to test harnesses and test output processing programs.  The test output
> processing programs must infer the value of <prefix string> by detecting
> the <prefix string> in the "Version lines".
>
> The detection of a "Version lines" might be a match of the regex:
>
>    "^.*KTAP version 2$"
>
> This risks falsely detecting a "Version lines", but the risk is small???

Agree this is a risk and also think it's probably small, but it's hard to say.
I think the $ anchoring the regex is probably safe enough.

As noted earlier, this tracks with what kunit.py already does.
That was necessitated by dynamic prefixes such as timestamps, etc.
So I think this is probably a fine risk to take.

I imagine we could add constraints of prefix string, e.g. must have []
around it, etc. if we want to try and minimize this risk.
But I don't know if it's necessarily worth it, given what we know right now.

Along those lines, I think I like this approach (Alternative 1) more
than Alternative 2/2b.
I'm not sure we need a structured way to specify metadata in KTAP yet?
The prefix seems like a reasonable candidate, but do others have ideas
of other bits of metadata we'd want to be able to declare?

Daniel
