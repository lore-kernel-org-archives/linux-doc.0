Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3ECDC3DA6F
	for <linux-doc@archiver.kernel.org>; Thu, 24 Aug 2023 20:56:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243604AbjHXUzc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Aug 2023 16:55:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243609AbjHXUzR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Aug 2023 16:55:17 -0400
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com [IPv6:2607:f8b0:4864:20::f2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE452199F
        for <linux-doc@vger.kernel.org>; Thu, 24 Aug 2023 13:55:14 -0700 (PDT)
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-64a5f9a165eso1561766d6.1
        for <linux-doc@vger.kernel.org>; Thu, 24 Aug 2023 13:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692910514; x=1693515314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9veUMJ/z882K9hkHEmh4pAoTDmJO4VmWvc8gTfMi6Q=;
        b=cNir2zO4Jw1bY15AO+BvLzyudCZQgZOZ6wmKu3gTiOE6O5d8uld/TL1ezLjaI6QYbm
         WOGGPHYDU/pK4dxlnF7Ms+FTC/sMRd3w0UHs5vWl7Ok8xxNThnUi40LTsEqvRgt612yt
         78aWAjEVTurY9yP/vzKIVztJ70N6XuOBe4TzTTYoIN4ZaN51LMOSChOtgvQbcVaqgblP
         cXZz8KRbjOvTDGzMC8MqwpETfoHXd3UWkIm9s5iVgENo6DP/sbX4cOh9u7J1okj8PlZZ
         BokMSSDN911JlFclyP8hVqyb+sA6fCfvwhQTmJ3jDmPDMIreFp+riuf57qJzWHHRcB6x
         9FPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692910514; x=1693515314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P9veUMJ/z882K9hkHEmh4pAoTDmJO4VmWvc8gTfMi6Q=;
        b=d0xFHdMJVs1JbrwwzSOhU2AZE7HhepMRvMcPhqCNoRq9j3XAoiOOFFnnBJ44qi1cg4
         6PN+JXUyCPN2CeKm/iaNSdqm47u7NaJKKxx5i8luHvR3w2M/jxUElctiojxhHCdLMzrH
         Gbbq+7hL+KVzSxOafNbP0YQGrA/qO9fqdV8ir+Smiea/8mh8bitDvciAI8rOeX8/8gqj
         PC9pb2f4pjTEBrPAjJoRR8fPKu9NzuwlblARWJMMbT0TlRUZdECKsOKWJhS1aKHOuSSO
         h3RdDtr2OBdAjxOB2/0R0/PZUKuVigol3B6XaDE9M+DgYUhfmdApNUebM+Hs3hlkOJhg
         T1eQ==
X-Gm-Message-State: AOJu0Ywgw2U5Q0t3phLXXxJbUPKq6lYQdZjUOm4yk2gQT45r6qZLy5kn
        nAhqJI+r06faykQxyqu9StHyv8W8JgGxMLaQQrqX6A==
X-Google-Smtp-Source: AGHT+IGp1K8B09Bdl+oZ3RkqbVetgjSDMnQuEIy2o3NTYbqmOnwJtltpQ9JU5CwHn6kcCYZRMLaYXjyuarXlr9l4qDA=
X-Received: by 2002:a0c:e2ca:0:b0:64f:3b07:c50a with SMTP id
 t10-20020a0ce2ca000000b0064f3b07c50amr13629295qvl.58.1692910513818; Thu, 24
 Aug 2023 13:55:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230824-docs-v1-1-67e061278b8f@google.com> <20230824184910.GA2015748@dev-arch.thelio-3990X>
In-Reply-To: <20230824184910.GA2015748@dev-arch.thelio-3990X>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 24 Aug 2023 13:55:03 -0700
Message-ID: <CAKwvOdkas2gmcyVKSp0DSXC56jxUB1HW8XRYKVBfS0sz3MSi5w@mail.gmail.com>
Subject: Re: [PATCH] Documentation/llvm: refresh docs
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>, Tom Rix <trix@redhat.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, llvm@lists.linux.dev,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 24, 2023 at 11:49=E2=80=AFAM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> On Thu, Aug 24, 2023 at 11:03:17AM -0700, ndesaulniers@google.com wrote:
> > -We provide prebuilt stable versions of LLVM on `kernel.org <https://ke=
rnel.org/pub/tools/llvm/>`_.
> > -Below are links that may be useful for building LLVM from source or pr=
ocuring
> > -it through a distribution's package manager.
> > +We provide prebuilt stable versions of LLVM on `kernel.org
> > +<https://kernel.org/pub/tools/llvm/>`_. These have been optimized with=
 profile
> > +data for building Linux kernels. Below are links that may be useful fo=
r
>
> Maybe make a note of why this matters? ", which should lower kernel
> build times compared to non-optimized LLVM toolchains."?

Oh, I forgot to address this in v2. Will send a v3.

--=20
Thanks,
~Nick Desaulniers
