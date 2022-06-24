Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC8B2C433EF
	for <linux-doc@archiver.kernel.org>; Fri, 24 Jun 2022 19:58:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231302AbiFXT6v (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 24 Jun 2022 15:58:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231331AbiFXT6u (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Jun 2022 15:58:50 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F449794CB
        for <linux-doc@vger.kernel.org>; Fri, 24 Jun 2022 12:58:49 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id z7so4861924edm.13
        for <linux-doc@vger.kernel.org>; Fri, 24 Jun 2022 12:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aYJrl/wB0ad9MyDM8wwvji/ZDuZftUz6c3QWw/c+yls=;
        b=Mu4aeU7G2lpQOAQQALgKApY2YNyyfwEim9iUgpMOsdAl20+ZMNrMNqs0Crqn5x1xQ5
         cJVd276kM+uTsWqBkWgEyU+NTmQ2JyrwepHIrXIlG87uc0ivdULhX8P2B/XJjZ9xvXR+
         VaKXl1xl6qnbNJRImCqY5AL7onNMSYPWaxEZywP1YHq3rPWuWaF8WzlAcaW8Rtc+rvFw
         Bu6byZ7S/5eXN9B47BgDM9ghOH2/aQIR33EdOUNGTHnIKWhQ30XNf3MZYvoJTMaACC3b
         Yne5oYE4/MzUwxEpZMpps5E0eFVMhTIZu9r9kqbgjlLLM0PF44aszFeHcCQ0+3pX5D/I
         JKZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aYJrl/wB0ad9MyDM8wwvji/ZDuZftUz6c3QWw/c+yls=;
        b=MNaU1bPrmPg5+7DiIT0ipJnMTbPVLOfoxqheisC5mhH+vsHbQVcwFTQcMaW4zW+LH1
         roMl5JPg82TsFPPpAfF/pTEcbP9L+bJyRFuJYDaCFBSFSTioZh31iPuNQt31uwxoPKju
         ncStzCE/DZwuMMPidy6Oyu16kG/gVHfHoZWnCxQtqqxi/RLMUovYSp2g1cDkTtON28MQ
         /hf+Q5nqES1OQHZsl+2vw385i/LUjKjxziUz+Gc+OoNpLA/WSHyR4PT6fdr+JytQuD16
         GvUGuBEQpFWqncaO1q5TdK3rtsUimHe/FGtwdAWUwvO4tDyLU3I9rBfgM9/vxDSjYja2
         OjoA==
X-Gm-Message-State: AJIora9q0Q5aKEvl7JcIpRpbYZ2ed7ofQPBlbT/VQU6JkVEtAisLkZDS
        jF5Hk6B96bYs71JpGM4T5Jd0+YqjIvJ/plHNMmedXw==
X-Google-Smtp-Source: AGRyM1vMzUWJmQCrglTjFheFdJbmfy02e1iBg6c4g/gixoMi/cMSAyDijx+4ELbZ/YQ5KVXE686/xx+qFt4WhiSVHRQ=
X-Received: by 2002:a05:6402:5188:b0:437:618c:c124 with SMTP id
 q8-20020a056402518800b00437618cc124mr946758edd.233.1656100727779; Fri, 24 Jun
 2022 12:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220603195626.121922-1-dlatypov@google.com> <87pmix3ktq.fsf@meer.lwn.net>
In-Reply-To: <87pmix3ktq.fsf@meer.lwn.net>
From:   Daniel Latypov <dlatypov@google.com>
Date:   Fri, 24 Jun 2022 12:58:36 -0700
Message-ID: <CAGS_qxqOZBr7Ti_pS20Qw3RLH+VjnhR5mDhJ2hyezKSo9Du-ew@mail.gmail.com>
Subject: Re: [PATCH 1/3] Documentation: kunit: remove duplicate kunit-tool.rst
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     brendanhiggins@google.com, davidgow@google.com,
        linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-doc@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 24, 2022 at 12:47 PM Jonathan Corbet <corbet@lwn.net> wrote:
>
> Daniel Latypov <dlatypov@google.com> writes:
>
> > The information is duplicated now in run_wrapper.rst, which was added in
> > commit 46201d47d6c4 ("Documentation: kunit: Reorganize documentation
> > related to running tests").
> >
> > You cna compare these pages here:
> > https://www.kernel.org/doc/html/v5.18/dev-tools/kunit/run_wrapper.html
> > https://www.kernel.org/doc/html/v5.18/dev-tools/kunit/kunit-tool.html
> >
> > We should have deleted it in then but it got overlooked.
> >
> > Signed-off-by: Daniel Latypov <dlatypov@google.com>
>
> So not that long ago these patches were going through Shuah...it seems
> that's not happening anymore?  I can pick up kunit docs patches,
> certainly.  I've taken the silence on these as assent and applied them.

Thanks!

Tbh, I'm not really sure what the status is either.
I saw that 46201d47d6c4 (which added the duplication) went through the
docs tree, so I followed suit for this.

I've been guilty of sending purely doc patches through
Shuah/-kselftest tree before, but that was mostly when there were code
change dependencies.

If it makes it simpler, we could try and agree that all kunit doc
patches go through Shuah going forward?
Shuah, Bredan: thoughts/opinions?

Daniel
