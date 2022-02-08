Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F7DC433EF
	for <linux-doc@archiver.kernel.org>; Tue,  8 Feb 2022 13:39:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355125AbiBHNjT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Feb 2022 08:39:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235186AbiBHNjS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Feb 2022 08:39:18 -0500
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA0A1C03FED0
        for <linux-doc@vger.kernel.org>; Tue,  8 Feb 2022 05:39:17 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id e145so29863194yba.12
        for <linux-doc@vger.kernel.org>; Tue, 08 Feb 2022 05:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jkWKVFY9Ane+4hLx7KO8wJLB4fAu322gdHrEZT3DJhA=;
        b=roCaBezV/DQ17i+sXf/6XpzD0kL3lOx0tmGDYIQeLnFfebE+ICp2HRuPG2IM2OTZ6U
         oxUfMDdFvyCgHJWd07HTyS796Uu/Xb40/dqYd0h2UgrG0FDL1UEWaTPpvJ+Bn0XaXkHW
         z79H5Oz0JfkFDiomzRoZug3tTey8JUBGRcKGzeViKw8Cn2IbxzfPPkbBrupntOFHryUy
         phoG8jGtTaisDjxtJW0duvFMpIYU1ydx+KE98ezaImPdL2JSEInpLxYQuhlKF1ncpz/y
         L/DKbzp03/UiCgOARSWW+guLsK9dx4vi8Jfi3cq1N+i6yudIQC4v9hq8A+N0imsmrdkg
         ZDTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jkWKVFY9Ane+4hLx7KO8wJLB4fAu322gdHrEZT3DJhA=;
        b=Ij6X/cX8RYUpRgWgiMfKzSgbNaXOmMXdAcTIoU664mfgTW8PQKQ3VJ9H4iJ4M42fqi
         zkutDt5xC+c9m+zz4YKlu32xmIALUjK8+uNVFROw69X7FFxXWGT+DX+KkP6E5VK3aBTz
         7ldpQ6bg1dYgeVYxgYSKwjXXKxgsqtAifsKaOa19g71UscVURhxYY4EZGIx1WmQyjCiV
         VxZy1W7akoSDhCnOedx+0D2+DanLhotWBEMpWgL1Z8Bcln4X2SKQvywwAzl5sq3zT7rc
         CIQsq4uoYetelfuOCkw86NNMbbNTB/FR1vO61TLPfIMIUlJsp9kO0yuEmSwPIg5xXmo7
         PRKg==
X-Gm-Message-State: AOAM533AHaQq0m1vT1lO7zV9PGvPBAPaMx+pSv1+YfUepe1LCVBabXGS
        1LmCiJbWQgaAshzma4Qa5++DDiylzS8aQaeP4Jqjq7cR9H7XmQ==
X-Google-Smtp-Source: ABdhPJxVPX7eETUkWHJHX+qRDcXXalcx4ypoqmAMKW5Ugv2G+t/qfCIMALqgvBuTV9JQ7+kf/GBhkFyc36+EodIy1rk=
X-Received: by 2002:a81:1153:: with SMTP id 80mr4667357ywr.327.1644327556844;
 Tue, 08 Feb 2022 05:39:16 -0800 (PST)
MIME-Version: 1.0
References: <1644324666-15947-1-git-send-email-yangtiezhu@loongson.cn> <1644324666-15947-5-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1644324666-15947-5-git-send-email-yangtiezhu@loongson.cn>
From:   Marco Elver <elver@google.com>
Date:   Tue, 8 Feb 2022 14:39:05 +0100
Message-ID: <CANpmjNOFL1vTZS28z_DWSz+X64_ghXBiGj3Fhee=wpRexZy7kA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] ubsan: no need to unset panic_on_warn in ubsan_epilogue()
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Xuefeng Li <lixuefeng@loongson.cn>, kexec@lists.infradead.org,
        linux-doc@vger.kernel.org, kasan-dev@googlegroups.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 8 Feb 2022 at 13:51, Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>
> panic_on_warn is unset inside panic(), so no need to unset it
> before calling panic() in ubsan_epilogue().
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>

Reviewed-by: Marco Elver <elver@google.com>


> ---
>  lib/ubsan.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/lib/ubsan.c b/lib/ubsan.c
> index bdc380f..36bd75e 100644
> --- a/lib/ubsan.c
> +++ b/lib/ubsan.c
> @@ -154,16 +154,8 @@ static void ubsan_epilogue(void)
>
>         current->in_ubsan--;
>
> -       if (panic_on_warn) {
> -               /*
> -                * This thread may hit another WARN() in the panic path.
> -                * Resetting this prevents additional WARN() from panicking the
> -                * system on this thread.  Other threads are blocked by the
> -                * panic_mutex in panic().
> -                */
> -               panic_on_warn = 0;
> +       if (panic_on_warn)
>                 panic("panic_on_warn set ...\n");
> -       }
>  }
>
>  void __ubsan_handle_divrem_overflow(void *_data, void *lhs, void *rhs)
> --
> 2.1.0
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/kasan-dev/1644324666-15947-5-git-send-email-yangtiezhu%40loongson.cn.
