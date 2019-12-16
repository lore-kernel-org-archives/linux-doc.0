Return-Path: <SRS0=XnAq=2G=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5977C2D0BF
	for <linux-doc@archiver.kernel.org>; Mon, 16 Dec 2019 09:40:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 720C4206D7
	for <linux-doc@archiver.kernel.org>; Mon, 16 Dec 2019 09:40:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IeceTOiP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726959AbfLPJkH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 16 Dec 2019 04:40:07 -0500
Received: from mail-vs1-f42.google.com ([209.85.217.42]:38641 "EHLO
        mail-vs1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726881AbfLPJkH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 Dec 2019 04:40:07 -0500
Received: by mail-vs1-f42.google.com with SMTP id y195so3710422vsy.5
        for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2019 01:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=efbgTWq8E30bo1goC1Duh6RnWJItngSdLLJmSmuEoCQ=;
        b=IeceTOiP/bP5mLWy6gexUgBuP0MKYDGPWylM/W5iUxdPtrbnLOCXqdgQOSlQZmsf5I
         WPTqE/EBeYAC6RyL/f326H5ADcf3h6RzfpRDWROV0jSNRtphHY/N+qX7f1T8KxUiz1Wc
         XaERWbd3adzRFB4UTgjOKlNGyCP8gNeF5ZFXoFbb/YLnQ8QdJTAD2OFL3NnH0Ci1Wb3O
         kyguCiBbNZa/XFGRk5R1dM0BZw5g56GYPzVkNEr0Aa9+dXnWZlSGmUN5QB0VbWoCjEaj
         uHnFCpIzs3LvWfbfBsOAEhIlmTdCYhApk6HD5rluMzRhGYozvn2J8dqTI/ecRBmlMFXu
         8UXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=efbgTWq8E30bo1goC1Duh6RnWJItngSdLLJmSmuEoCQ=;
        b=Voi6nEvDzrlfcfXbul20uaSFnphbsMV1FER1EJo5X+H5W+PI8HFrDUNUn4wbv9/uMj
         4KelhD+Zy7ymWf2fye0EqJ5aVnvy5cZt0o5Wqq1U+2DmduIbSgwLNVDWU3rkrZHahvno
         Q45KQk0/laVCkLxCwHohAv8fTyFgIzOYRoTSyjnh2bpCygH1iLHJqNlrvgH+Q6Y/YDz9
         ErDPcFrODYpxctxHWqYmOdsLftSrkxu1SybJMUCbXfzehdZf135rBLyOSr3F29Ig+vcK
         zka6SaWjyGhwtOZX6BBjpYTnaDnoKvN3q27wAtnsOlXKgpqOuoIZtXdq9zfAJpkGjWBO
         Td3w==
X-Gm-Message-State: APjAAAXvEbTRBKas5A2Va23Q1fhfNfg5omBE+yrQv8lyYYgv38kxXFBb
        hOCOyp/UqV7mGkvzW+iPOBx+Cj6Wlnhzh5ndy+ajOlJGj9TY4g==
X-Google-Smtp-Source: APXvYqygsUmNTJXK7DCAfnCkmj0NTzev1RnLNm4j1bpfg63GyKPTUK5gJhsgCmXCmCJc7a5Vu0oHcyWwruDqsIwR8HI=
X-Received: by 2002:a67:d592:: with SMTP id m18mr20795571vsj.85.1576489205893;
 Mon, 16 Dec 2019 01:40:05 -0800 (PST)
MIME-Version: 1.0
References: <20191212135016.GH25745@shell.armlinux.org.uk>
In-Reply-To: <20191212135016.GH25745@shell.armlinux.org.uk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 16 Dec 2019 10:39:54 +0100
Message-ID: <CACRpkdbAWkuyVK8uejvvKgpg4qhVfZ_a3dNmXAKsK5fu=Ns6zQ@mail.gmail.com>
Subject: Re: Link: documentation seems to be misplaced
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Russell,

On Thu, Dec 12, 2019 at 2:50 PM Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:

> Surely, the format of the Link: tag should be documented in the
> submitting-patches document with all the other attributations that
> we define in a commit message, with a reference to that from
> Documentation/maintainer/configure-git.rst ?

I agree, so I sent a rough patch as a starting point so we get
something going here.

Yours,
Linus Walleij
