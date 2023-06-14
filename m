Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97001EB64D9
	for <linux-doc@archiver.kernel.org>; Wed, 14 Jun 2023 10:07:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243705AbjFNKHo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Jun 2023 06:07:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243703AbjFNKH0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Jun 2023 06:07:26 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A16C2135
        for <linux-doc@vger.kernel.org>; Wed, 14 Jun 2023 03:07:15 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-77d89dc9ac3so11877639f.1
        for <linux-doc@vger.kernel.org>; Wed, 14 Jun 2023 03:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686737235; x=1689329235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjCmMtFWwB2mu1iBP1u/gNAJuDezygzcIcRRdC5qhOg=;
        b=dN/RPc2uJVqQoBzUWFUPvSNTOsL2/6BzZ6XbMJgjSsggKGhxCoyZx4qahBrqo6G6V7
         T2ObtSt81xwHzWYxge+OyCriEfpqz7NbQzH3m0L+4LPF2NFBOv5ZQDZ+yn75c37Q0OLb
         L/+l5FJ1La6wE29gV1ga+6SAspEGZnPZkTJbr5Wc+YLa5iPF4VlTE2WfpRx10QfE4Iql
         wf4CzCh+9HAf2P52b5FKyrUhbGzTnpn9ywWLMahLwtuozndpPL27f6qfpq4KQ3X9+pEt
         giOtZ/zqhaMpPO7zl/6wJ8XCG4iwl22+36lQ4hLNg6rO4ZNMNivRbFYo1NTWXC7xwxxa
         eIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686737235; x=1689329235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tjCmMtFWwB2mu1iBP1u/gNAJuDezygzcIcRRdC5qhOg=;
        b=QA2AyWJ77H1Z5XjB3FMCh6y471rk7OPwIIbwVhZo43FH94LT33f8f2gpsaQwXoqi0m
         FM0u4ZXIUkYTL/4kZNTkbWsnfdhgF/mCS+a4NUrkJT52LHx5rNeG3i3dDfM8+XOaguBL
         2Svav829FNsscIaClb1HAHEvBMoUmIWioCnNKnAucUERnHKjS8CNgbaikoB63py1VbHV
         1tkzumhgSxTxCs8mYk7hNr4PwYOpiMyeir0+Ydq3FoFj8EYf7jYWKc3TfvVKkUQJaOiX
         +PoUYBpl9c/OrnmP0B7hUb7N9Cm0jg4aUEsFg7Sbcom3C0s8PNrIbZlAPZU5NGm5pm7k
         g4iw==
X-Gm-Message-State: AC+VfDzKASEdOKHGlCcToK4N7b3L6UtcwPBxj+WbFYfQmfAzv/24CP/6
        LUz0LDSeELvtotdEgDM2FIf15lDDs5JB2qG0Owi54gbXR2jyfUgUuIo=
X-Google-Smtp-Source: ACHHUZ5XSR6ZLiDY1jdrgyARjmxixyspigafx6IBJqMWkzbgMS9KLnPvgObJlj35gRYHDv3X9b7FA/PNHnA4mh3QJBA=
X-Received: by 2002:a6b:dc11:0:b0:77a:d2d3:fbfa with SMTP id
 s17-20020a6bdc11000000b0077ad2d3fbfamr12536786ioc.6.1686737234757; Wed, 14
 Jun 2023 03:07:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230614095158.1133673-1-elver@google.com>
In-Reply-To: <20230614095158.1133673-1-elver@google.com>
From:   Alexander Potapenko <glider@google.com>
Date:   Wed, 14 Jun 2023 12:06:38 +0200
Message-ID: <CAG_fn=UDZFa3D4JwkEMFoy-d6n-sNB5ARh+3b4ymgtzZCUe8uA@mail.gmail.com>
Subject: Re: [PATCH] kasan: add support for kasan.fault=panic_on_write
To:     Marco Elver <elver@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Taras Madan <tarasmadan@google.com>,
        Aleksandr Nogikh <nogikh@google.com>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, kasan-dev@googlegroups.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jun 14, 2023 at 11:52=E2=80=AFAM Marco Elver <elver@google.com> wro=
te:
>
> KASAN's boot time kernel parameter 'kasan.fault=3D' currently supports
> 'report' and 'panic', which results in either only reporting bugs or
> also panicking on reports.
>
> However, some users may wish to have more control over when KASAN
> reports result in a kernel panic: in particular, KASAN reported invalid
> _writes_ are of special interest, because they have greater potential to
> corrupt random kernel memory or be more easily exploited.
>
> To panic on invalid writes only, introduce 'kasan.fault=3Dpanic_on_write'=
,
> which allows users to choose to continue running on invalid reads, but
> panic only on invalid writes.
>
> Signed-off-by: Marco Elver <elver@google.com>
Reviewed-by: Alexander Potapenko <glider@google.com>

Thanks!
