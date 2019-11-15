Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BA7DC7D90F
	for <lwn-linux-doc@archive.lwn.net>; Fri, 15 Nov 2019 23:32:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727200AbfKOXcu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 15 Nov 2019 18:32:50 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34596 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727056AbfKOXcu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Nov 2019 18:32:50 -0500
Received: by mail-lf1-f67.google.com with SMTP id y186so9255041lfa.1
        for <linux-doc@vger.kernel.org>; Fri, 15 Nov 2019 15:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zQG0qUbYH14tVQ6lFVHRQKP5g1FuG7PlCWJm71gYvYM=;
        b=EDDFjN363dJQAubdvxVKTXqRyheP1vcbF4znJL4rgOMmIQR4UYeadaCKtTaIClUAZw
         PoimrpgbWbqsVmZqYhrTj4UneQP9sBPLgmfIeo3QCfj00xYDZ1uRZbjgmli6wmWiNSWY
         icnbj6f4/7axH9I95BpVvWvQEV+xf7siSFZ30oqEDQtPsYp867QHmg3zHMayAeosQK9Q
         XOsXYNk1nuvLy+uocfcjK/BnPICRc2MoVJzPN6JV0n19G60jDbLOBRBdKnCQ+lw8APJ4
         tgERVjEECKPzyWzuI4IVauGT+5ahAb/cXyCISD3I2fXt+XMrIEFZ+zZ9353y4DfO2yxB
         2RHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zQG0qUbYH14tVQ6lFVHRQKP5g1FuG7PlCWJm71gYvYM=;
        b=LBNlNsknMj1XLhDFDoNd/UsSTlF0dkuHzxHn+cZrCKWziMBgWUjYSTPlkVu658Itfv
         20Yap64sBE5oc0Ss75YDEcKp+1LGp68k1SZwdbLw1WCE4Sr/LXYTIlgf4R9yGPY4hC18
         7Kyi/sdHKF9GXwNZA/S4LJyIuHU2Cu06TQBb26YMc8lTyzlXxMrbatZYCN/titvmdKA0
         sg+kfGaJU1t70QBQRVFj4ibKJUuie2T8mq5WaFXLWiGmr5skt5Sny8fm7quCa1I9mHvm
         ZmYdCkiJw/uPM+rbdd/jPSfi5yODGa/AeWx7RBpycl3tdqIASQhi/n/h4gJFRAJHnU5x
         tjxw==
X-Gm-Message-State: APjAAAUSyAC3HhhvbZZjZMS7OgdWvdHoUHlXSV1+wIhOoMECBCt/fpCG
        /V1/fo+RE/xWKZjsrQkz759Dh8ovSslqRI3yloyAxQ==
X-Google-Smtp-Source: APXvYqziUgdAOZgBaIcZ3mhX9fg82sLBEL2DeVYu/E/jDcxQ3NTDPOFU6J4e0omNB49KmAnqksZLndSd9vLAzmf+oC4=
X-Received: by 2002:a19:651b:: with SMTP id z27mr12621677lfb.117.1573860766481;
 Fri, 15 Nov 2019 15:32:46 -0800 (PST)
MIME-Version: 1.0
References: <20191115133021.13165-1-linus.walleij@linaro.org> <20191115130017.46d77037@lwn.net>
In-Reply-To: <20191115130017.46d77037@lwn.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 16 Nov 2019 00:32:35 +0100
Message-ID: <CACRpkdbr=y6eApvZcqnaU0He+B5QBE9JCezuQhEjEjpU5ZHW1A@mail.gmail.com>
Subject: Re: [PATCH] Documentation: Document how to get links with git am
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Nov 15, 2019 at 9:00 PM Jonathan Corbet <corbet@lwn.net> wrote:
> On Fri, 15 Nov 2019 14:30:21 +0100
> Linus Walleij <linus.walleij@linaro.org> wrote:
>
> > This adds Kees' clever apply hook to the kernel documentation so
> > it can be easily references when needed.
> >
> > Cc: Kees Cook <keescook@chromium.org>
> > Link: https://lists.linuxfoundation.org/pipermail/ksummit-discuss/2019-July/006608.html
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
> Seems generally useful.  I have a couple of overall questions...
>
>  - Might this be better placed in the maintainer manual?  It is more
>    likely to be relevant to that audience, methinks.

Oh that exists now, Documentation/maintainer? Sure I fix.

>  - I wonder if the hook script should just go under tools/ somewhere for
>    people to grab.

Does one exclude the other?

Can we place it under tools/scripts/git and somehow source the contents into
this file so you can also see it?

Yours,
Linus Walleij
