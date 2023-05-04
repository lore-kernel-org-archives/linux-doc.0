Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30DD1C77B78
	for <linux-doc@archiver.kernel.org>; Thu,  4 May 2023 05:43:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbjEDFnr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 May 2023 01:43:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjEDFnp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 May 2023 01:43:45 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FF071FD2
        for <linux-doc@vger.kernel.org>; Wed,  3 May 2023 22:43:43 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-3ef34c49cb9so628471cf.1
        for <linux-doc@vger.kernel.org>; Wed, 03 May 2023 22:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683179022; x=1685771022;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sKEkZFVH2KZiPZGQ6onZKDypE8VqSqbA6RJxh3D4iqQ=;
        b=Curk6tJTkLFKybxwmRhdhOMhDNxdujlcyezyNSQuqzZfggOJNoM2EDpT5V4XZ6oapu
         zvSeaSNeD2mM1fS4+ksRbGvxoNMfklBWHYPW2fxxgvcd+Cn1oWxDAG3ZB6UkDRtxgHnH
         r2unq2szYHJNzNP0HuPrxQq+12Wk3ftDc7KWHswgtcc2z/9gMabf1AYtfCeGZgCZUEFR
         GnmfDW3b1sDfyIkGHZ07v/dLE0OBZrvXnS9Umkyr/rrqiShf94DasX9ZyGTjGmU/f72i
         ZLSQfR7GBXBHe4k6Nis2bbhKHjwRb9E0gl4x0lakCcsu/Mn7nqSeAZaiwKwRiZVD3UVf
         vJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683179022; x=1685771022;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sKEkZFVH2KZiPZGQ6onZKDypE8VqSqbA6RJxh3D4iqQ=;
        b=iCRu0QLGEas4HpOI7zuyWTB+D7BTzZFn2z8W5diTHj+mc9mxeIebYIkwQGc35QShnb
         GcfBgs9wrFC0eOY/fUPcfMw78ILwey3OtCuOoTKvKRTJoZ/FqoULgp9aqTytmPAc0Itl
         lSQEpCpbGjrEjoF3o2n+O+M/5GUSD3spX3I0Q7aSS66EYXk9eiXA0q2qEuhaMQ0aUpoQ
         vXcQ3Vi8Tnp4WjQToMi0o82JGJlzDGKcsREimDK2rpZdODClWLdYAEIcVU4b3bIozQ+n
         OJNp1rjWAQnac+dhfAmCKc+pKAZrRlgtU+uTHk7CNWkiQO1FUTrhuz1kLw/2n0kEAfhC
         hpXw==
X-Gm-Message-State: AC+VfDyS36X+HtKOD8/XstO+1xhVKsGwzKjZ3Xb+WAVtzL0a3LWMQ2Y1
        VFG3dfhbSp1bx14lguJ2/wCD586PE8tET0a8l9T5iKrvneqV0iCI+FJRyg==
X-Google-Smtp-Source: ACHHUZ7RvWHRoqldbb67i60EZSm+acqQngBOgNM2wTe++snax2ecwD2gfyTdGVL3Jwl/t82usGOl2xAK1L+4QqJLqaE=
X-Received: by 2002:ac8:5785:0:b0:3ef:3083:a437 with SMTP id
 v5-20020ac85785000000b003ef3083a437mr240044qta.18.1683179022549; Wed, 03 May
 2023 22:43:42 -0700 (PDT)
MIME-Version: 1.0
References: <b403478fc67715f955b8ff40c5c99ba7cc966063.1683021926.git.geert+renesas@glider.be>
In-Reply-To: <b403478fc67715f955b8ff40c5c99ba7cc966063.1683021926.git.geert+renesas@glider.be>
From:   David Gow <davidgow@google.com>
Date:   Thu, 4 May 2023 13:43:30 +0800
Message-ID: <CABVgOS=_ZLQSbAYevA3wYZpoqkJgRF8iipL8rwSzPqwhX=3-fw@mail.gmail.com>
Subject: Re: [PATCH] Documentation: kunit: Modular tests should not depend on KUNIT=y
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Brendan Higgins <brendan.higgins@linux.dev>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Daniel Latypov <dlatypov@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sadiya Kazi <sadiyakazi@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 2 May 2023 at 18:06, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>
> When the documentation was updated for modular tests, the dependency on
> "KUNIT=y" was forgotten to be updated, now encouraging people to create
> tests that cannot be enabled when the KUNIT framework itself is modular.
> Fix this by changing the dependency to "KUNIT".
>
> Document when it is appropriate (and required) to depend on "KUNIT=y".
>
> Fixes: c9ef2d3e3f3b3e56 ("KUnit: Docs: make start.rst example Kconfig follow style.rst")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Nice catch: we definitely should be recommending that all tests are
buildable as modules if possible.

(I think this is already the case in most of the rest of the
documentation..., but the getting started guide really shouldn't be
teaching bad habits.)

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David


>  Documentation/dev-tools/kunit/start.rst | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/dev-tools/kunit/start.rst b/Documentation/dev-tools/kunit/start.rst
> index c736613c9b199bff..9619a044093042ce 100644
> --- a/Documentation/dev-tools/kunit/start.rst
> +++ b/Documentation/dev-tools/kunit/start.rst
> @@ -256,9 +256,12 @@ Now we are ready to write the test cases.
>
>         config MISC_EXAMPLE_TEST
>                 tristate "Test for my example" if !KUNIT_ALL_TESTS
> -               depends on MISC_EXAMPLE && KUNIT=y
> +               depends on MISC_EXAMPLE && KUNIT
>                 default KUNIT_ALL_TESTS
>
> +Note: If your test does not support being built as a loadable module (which is
> +discouraged), replace tristate by bool, and depend on KUNIT=y instead of KUNIT.
> +
>  3. Add the following lines to ``drivers/misc/Makefile``:
>
>  .. code-block:: make
> --
> 2.34.1
>
