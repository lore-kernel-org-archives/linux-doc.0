Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 227AC7D043
	for <lwn-linux-doc@archive.lwn.net>; Fri, 29 Jun 2018 12:48:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755502AbeF2MsM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 29 Jun 2018 08:48:12 -0400
Received: from mail-yw0-f194.google.com ([209.85.161.194]:46174 "EHLO
        mail-yw0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755497AbeF2MsL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Jun 2018 08:48:11 -0400
Received: by mail-yw0-f194.google.com with SMTP id g123-v6so3345911ywf.13
        for <linux-doc@vger.kernel.org>; Fri, 29 Jun 2018 05:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JZhpXvXRE3/POhG15jwPdKe0GeIdj50A+HUCgpZVFI0=;
        b=BXZyMPTg6/AmiPmPcOGsUUzxMvVb5u+6VczZhGXz8Dh4r69cho0TBsfxiaxwDGwOuN
         TxzdtSglvyLUDhpQzzPFuGgqosm7wuCN7dtUrp+iZizHQpaDR0+6r6gmNEHyAC/1v6jj
         sGg8CITFXJaGx5ykjkE2uwDPWY+uLTneqNxF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JZhpXvXRE3/POhG15jwPdKe0GeIdj50A+HUCgpZVFI0=;
        b=FOI0k0l7LEWpFesCLO224gI03lK3CFDBSObF27WIWW47KBtyumyPow8vqH3iN03U5z
         ZMT+68o/QtuoUuSfFODsgUz3At1dg+7Lh8/T7tst+ZHrVb5isA+Znv9Md+KvgmY+s8mX
         asWlsP32gkwqzCRZKwHttv+8ToiFvh939kEfPaVMoFtDuiGrmBXxQtM+zB2YIHg0rSyh
         37cwpq4TTmYLBU3Q2nzj4qeIMKLSm9vwx65EDh4xnc82EBmD/DT+PVm2dCFL/Y1TasGY
         Tcy7/tKbp3SKfK2v4JAcL8UqWOVdiIqVnzNvarSvY9DwJdKgEZfJIltDkNXy9hIH4lOr
         fdRQ==
X-Gm-Message-State: APt69E0Ao6MkNFjxDYhPM59pAFyXzCZxqqHsJd7XrHApw5gG5pSbJ4I8
        HCxyHmXyRBrYJELdQKvpQeNFmVyTaPdVsJ4rorOTqNhD
X-Google-Smtp-Source: AAOMgpd4PWEfycLjEIvB3I7BwwSiL9JbMr/QIz3LKBSJk2WAYaqeEg5I6I5lq2PE2qSqyfX1XXP8l41b0JyjK0jRDz4=
X-Received: by 2002:a0d:f547:: with SMTP id e68-v6mr7118992ywf.298.1530276490550;
 Fri, 29 Jun 2018 05:48:10 -0700 (PDT)
MIME-Version: 1.0
References: <20180629100248.11560-1-anders.roxell@linaro.org> <53d599f2-44a1-c366-4a5c-2ca6cd19b031@kernel.org>
In-Reply-To: <53d599f2-44a1-c366-4a5c-2ca6cd19b031@kernel.org>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Fri, 29 Jun 2018 14:47:59 +0200
Message-ID: <CADYN=9L3hQCfiD2CBrx3_2pLxTaZGPTt-gAcScKqe7pTq4ZgCg@mail.gmail.com>
Subject: Re: [PATCH] doc: dev-tools: kselftest.rst: update contributing new tests
To:     Shuah Khan <shuah@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>, linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 29 Jun 2018 at 14:10, Shuah Khan <shuah@kernel.org> wrote:
>
> On 06/29/2018 04:02 AM, Anders Roxell wrote:
> > Add a description that kernel config options should be added into a
> > config file that is placed next to the newly added test.
> >
> > Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> > ---
> >  Documentation/dev-tools/kselftest.rst | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
> > index 3bf371a938d0..4c546a35bd58 100644
> > --- a/Documentation/dev-tools/kselftest.rst
> > +++ b/Documentation/dev-tools/kselftest.rst
> > @@ -156,6 +156,9 @@ Contributing new tests (details)
> >     installed by the distro on the system should be the primary focus to be able
> >     to find regressions.
> >
> > + * If a new test needs specific kernel options, they should be enabled in
>
> get rid of new
>
> > +   then config file in the same directory where the test is added.
>
> "the config" instead of "then config"
>
> Rephrasing this might be better:
>
> "If a test needs specific kernel config options enabled, add a config file in the
> test directory to enable them.
>
> e.g: tools/testing/selftests/android/ion/config

I like it. sending v2 shortly.

Thank you.

Cheers,
Anders

>
> > +
> >  Test Harness
> >  ============
> >
> >
>
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
