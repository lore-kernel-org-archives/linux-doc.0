Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 949E2C25B0F
	for <linux-doc@archiver.kernel.org>; Sat, 13 Aug 2022 07:04:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237536AbiHMHEM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 13 Aug 2022 03:04:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235221AbiHMHEM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 13 Aug 2022 03:04:12 -0400
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCA052B630
        for <linux-doc@vger.kernel.org>; Sat, 13 Aug 2022 00:04:10 -0700 (PDT)
Received: by mail-ua1-x92c.google.com with SMTP id 5so1086497uay.5
        for <linux-doc@vger.kernel.org>; Sat, 13 Aug 2022 00:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=JkpTd2lx/Y7WIS3TAJAROUSBlo87wCC8feGuimexJrU=;
        b=iBq9V+8jyPDvnsS6vDhVT3IXGpCn1lPIa10ZJQORFgVkAh2frhQoVcDNGRB7iszfOF
         GRMnX3drN/zleyVRCmpT0OZPLbTC8VfYjXec7/EbiceGDYpCyrvMSFxuly7VjfqojhmO
         /QDokrp4VoObEEkYTWH4x68bDP/M6CUO2doxXY1mCqerGwJ1hkawaIKLC7OoGU+2t9Ih
         iyi/QBRaqJFUpfu9Y0tJTpskoktlV28y2pXSu4tFpeyqXF3gUsXCoHBHqCG0x+1gKJRx
         9NkBs8wcGENBPkV+qy5WJWhGEEASyilzGphNhtJ/U14bhWbgdfghkDynZZbbfcv3SyHc
         BAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=JkpTd2lx/Y7WIS3TAJAROUSBlo87wCC8feGuimexJrU=;
        b=LmsvmiuT5e21UeHdqPOQrdkXoK7Xdc8BceevFLGVUbU5kzLkITikZsDVSYXEa6HlPI
         twbM3/ljdtY43QSq9NoWgwQVmRW5UobB+Dsnee5CRiijQ1Ufhn9/6gP+1dP2xNgiZa59
         u2Nxz6PmeJESnlyD4TaqYBmQSAwIntjT85KlaKew3kR75BH0dcNYH/BqPi8JDTeHRexN
         NDhg9J6eVhZnCN5Lrah+aNlwtyvWStQWyOebpRYCJ77y9XZQhAU7ORXS8pGhYhhwarFw
         h/i7y5t6lHgyBv2abTTInUsh8oDCoNEDytMbZhLnV4Z8+mfaSpoyNsjtRLn0bXrzPi0D
         BB2g==
X-Gm-Message-State: ACgBeo0MfkHnoNDjKp+pRd5eZTH9r1Ca9VGzjsiDb3WMTCqYrxbTsU2/
        hqqo8f5CtfMZnGfNSZDH4NwizfndGeps6RUllh1axg==
X-Google-Smtp-Source: AA6agR41YD78B4nu4AR0tYVIBqSQG9S7hcXRV4eYHlV+7JUByAnffHbhVyk+rl8KL0U+a6vZaWfjp+MODklq+hln5L4=
X-Received: by 2002:ab0:2359:0:b0:387:2dff:87d5 with SMTP id
 h25-20020ab02359000000b003872dff87d5mr3299629uao.104.1660374249998; Sat, 13
 Aug 2022 00:04:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220813042055.136832-1-tales.aparecida@gmail.com> <20220813042055.136832-2-tales.aparecida@gmail.com>
In-Reply-To: <20220813042055.136832-2-tales.aparecida@gmail.com>
From:   David Gow <davidgow@google.com>
Date:   Sat, 13 Aug 2022 15:03:58 +0800
Message-ID: <CABVgOS=WKEos8XH3VAXUiUmcvABiy07jYFZN9nL95XCiARuvqw@mail.gmail.com>
Subject: Re: [PATCH 1/4] Documentation: kunit: fix trivial typo
To:     Tales Aparecida <tales.aparecida@gmail.com>
Cc:     Sadiya Kazi <sadiyakazi@google.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Trevor Woerner <twoerner@gmail.com>, siqueirajordao@riseup.net,
        mwen@igalia.com, andrealmeid@riseup.net,
        =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>,
        Isabella Basso <isabbasso@riseup.net>, magalilemes00@gmail.com,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Aug 13, 2022 at 12:21 PM Tales Aparecida
<tales.aparecida@gmail.com> wrote:
>
> Missing closing block-quote
>
> Signed-off-by: Tales Aparecida <tales.aparecida@gmail.com>
> ---

This is fine. A couple of minor nitpicks:
1. A slightly more descriptive commit title would be nice (e.g. "fix
missing quote in run_wrapper")
2. The whole --jobs=`nproc --all` bit shouldn't be necessary anymore,
thanks to: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ad659ccb5412874c6a89d3588cb18857c00e9d0f

Neither of those seem worth sending another version out for, but may
be worth keeping in mind in the future.

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David


>  Documentation/dev-tools/kunit/run_wrapper.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/dev-tools/kunit/run_wrapper.rst b/Documentation/dev-tools/kunit/run_wrapper.rst
> index cce203138fb7..db1e867820e7 100644
> --- a/Documentation/dev-tools/kunit/run_wrapper.rst
> +++ b/Documentation/dev-tools/kunit/run_wrapper.rst
> @@ -30,7 +30,7 @@ We may want to use the following options:
>
>  .. code-block::
>
> -       ./tools/testing/kunit/kunit.py run --timeout=30 --jobs=`nproc --all
> +       ./tools/testing/kunit/kunit.py run --timeout=30 --jobs=`nproc --all`
>
>  - ``--timeout`` sets a maximum amount of time for tests to run.
>  - ``--jobs`` sets the number of threads to build the kernel.
> --
> 2.37.1
>
> --
> You received this message because you are subscribed to the Google Groups "KUnit Development" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kunit-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kunit-dev/20220813042055.136832-2-tales.aparecida%40gmail.com.
