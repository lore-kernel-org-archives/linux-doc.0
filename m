Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7857CE7B5F3
	for <linux-doc@archiver.kernel.org>; Wed,  4 Oct 2023 11:41:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbjJDLlQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 4 Oct 2023 07:41:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232893AbjJDLlQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 Oct 2023 07:41:16 -0400
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 928A7D8
        for <linux-doc@vger.kernel.org>; Wed,  4 Oct 2023 04:41:12 -0700 (PDT)
Received: by mail-vs1-xe32.google.com with SMTP id ada2fe7eead31-45290cda80aso917979137.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Oct 2023 04:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696419671; x=1697024471; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZBqjb8SBtq9wVTBrX0JB2VzFgWKS26/mLUuG0CMFwr4=;
        b=VzU7r7uljraGt3khbyWnqfcWqKIbVBE/2K8saryW14OlL6YB1/Ul33p/HovDCNm3c+
         +YwV4xcIHWI9b8xUF3teSP39RHjSI7awr7C5WSZI2tDs+cUm4GBOh+EiBOoyzJndM0OZ
         1OkXfflP03135w71YZUAjzrvsotxMwW4prtvHNISNh7E9nQlWWDiMKs64krF4PwHhw6t
         QTQ4YYojYeWpKf0nvjvVsh5Cnd58Q8KPX9PVxiX+Be2ddoSucyC3DxHc0cr2/M00937q
         /1hVCDyNOCLuzQkcuZp7ts6Qe9wdkvhLQ6iMt4z7nkEct1zJMnEU76xJSTz62aiTuxFR
         gsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696419671; x=1697024471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZBqjb8SBtq9wVTBrX0JB2VzFgWKS26/mLUuG0CMFwr4=;
        b=Cg2NQmZz+1/9PjTZHClK7wktp9URwEtTSeY44nEFPSP8BEdVYS5JfLnaH0uA9NzwqE
         KisBjXQWj+1FYZVfKz2hVqT+vck8UPsSyU8bVo5B6DHX5Sq6dKIMZnRflykZAP1Db4Vl
         IryaAK5292w+uDYAm+PBijzurbymgtVF7UYnGTbBdtT2mfWGym2LLlWXME7VkqH8PLD5
         vXl9EreFoLVuvzlYaSpQZQbsEVLaAOu/lzrIKdD43c8RT7VNV/2LWbR4GbdvQLRlO823
         MK3qpbNLSw82wstabzU3bkxMpu1FkG9w0JjZw+AyCwKZR/ZmbTzoNzjBLmlD4nJi+sDY
         rusQ==
X-Gm-Message-State: AOJu0YwpcL4y2xM81Ntp+1U7x6cjlT/wxJwFq83L0IVIlZHD8ctwFaTr
        Mz9DGUtNM7l0cTYTAyvJwgf6kCTNXyYHn0xFpAWOjbkY34ePXMc/
X-Google-Smtp-Source: AGHT+IHztdTVjDAnmVdG0YXcot4MeT86xj/94ocjZyYXuT+kTPa1qEoTOA3UCpGK2bNG0G2V9jMUbPDM6N1z1s/HlRk=
X-Received: by 2002:a67:ed83:0:b0:452:7c1b:d57c with SMTP id
 d3-20020a67ed83000000b004527c1bd57cmr1243121vsp.28.1696419671631; Wed, 04 Oct
 2023 04:41:11 -0700 (PDT)
MIME-Version: 1.0
References: <20231002-gpiodoc-v1-1-a8ec8376bbf1@linaro.org>
In-Reply-To: <20231002-gpiodoc-v1-1-a8ec8376bbf1@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 4 Oct 2023 13:41:00 +0200
Message-ID: <CAMRc=Mc1ocs6aT9PdptBXSgKJOOva5wm00HwYse9oCY6UpE2Mw@mail.gmail.com>
Subject: Re: [PATCH] gpio: Further document optional GPIOLIB
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Oct 2, 2023 at 10:12=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> Optional GPIOLIB as in not depended on or selected by a driver
> should NOT use any *_optional() calls, this becomes paradoxical.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  Documentation/driver-api/gpio/consumer.rst | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/driver-api/gpio/consumer.rst b/Documentation/d=
river-api/gpio/consumer.rst
> index de6fc79ad6f0..3e588b9d678c 100644
> --- a/Documentation/driver-api/gpio/consumer.rst
> +++ b/Documentation/driver-api/gpio/consumer.rst
> @@ -29,6 +29,10 @@ warnings. These stubs are used for two use cases:
>    will use it under other compile-time configurations. In this case the
>    consumer must make sure not to call into these functions, or the user =
will
>    be met with console warnings that may be perceived as intimidating.
> +  Combining truly optional GPIOLIB usage with calls to
> +  ``[devm_]gpiod_get_optional()`` is a *bad idea*, and will result in we=
ird
> +  error messages. Use the ordinary getter functions with optional GPIOLI=
B:
> +  some open coding of error handling should be expected when you do this=
.
>
>  All the functions that work with the descriptor-based GPIO interface are
>  prefixed with ``gpiod_``. The ``gpio_`` prefix is used for the legacy
>
> ---
> base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
> change-id: 20231002-gpiodoc-cf9430641b91
>
> Best regards,
> --
> Linus Walleij <linus.walleij@linaro.org>
>

Applied, thanks!

Bart
