Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38CEBC61DA4
	for <linux-doc@archiver.kernel.org>; Mon, 13 Mar 2023 18:56:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbjCMS4y (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 13 Mar 2023 14:56:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231557AbjCMS4j (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Mar 2023 14:56:39 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E53710F9
        for <linux-doc@vger.kernel.org>; Mon, 13 Mar 2023 11:56:35 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5419d4c340aso74744587b3.11
        for <linux-doc@vger.kernel.org>; Mon, 13 Mar 2023 11:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678733794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4FqH2s7APO4TNP6UZzPGfxUBH+42/JyzswE/RiYzEh8=;
        b=Z+02z+B0g3rBUiefjv4qSWPnX1pvvFWZVsm+jUxemxSMqAUNlP2uEGV2jTDFWBRGxd
         y5nyhX2BdbypocPw/OaCksaLolYF6k0R9/BNoGHSZpC4T8egg9/7Xq1yVvCHd0B0txpo
         PZpprC03a/SvNxPVJP0JPWfB+ddy9Shnhfne6k0QqicI144/5U1rfKo9Nx/t5j2GhOhi
         aR29LOwteWU5IdqJY8PjO1gZzDoUtVpAlyc4Ih4GWEIC08q1462gXT1VSNt1Md9DQvcx
         5i2JAk2HcnjJ4t0XaDAlggERf+byjgWRm1E/bmuadSKSOau4kRvWGDjZoelWCzrfBj0q
         kkdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678733794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4FqH2s7APO4TNP6UZzPGfxUBH+42/JyzswE/RiYzEh8=;
        b=ZqqPIH618/4JLkEJnHOkHl/kXW30Hq9JlNSqYaU/RgvnQU/dq7kG+WpOsbh2IWeyIz
         MtVqe6Fr42D4Ba1JRYOtQPLBnWOwYdhOn8GdFg8oTcLo+C0wkLnCl9EszSdJNWoFttmb
         4OllP59D78CWGctAlKURFVOAFGXVnaj+jHeZC96AtGRj8H/E5ly/YuWy84wfBneZV1uh
         Ly7EosYS5qFqjVjgDtRcVMNWYQaqCkieLdIp5ncySquWlAy2gefYOGucKAWPxi8j01St
         H9VCWYNU4lAL3o8DWuJ2irYgmwsrDHMaWis2rh04UsX/JSyHxh5k4JpZF34CN7uywfiN
         bk6Q==
X-Gm-Message-State: AO0yUKVlVZg0x6hL6yeA58e0v/dp5L8WBAWstfg+bU1vCZAyqcZopB2O
        4iWVfe75HG6TqVa121FNAj+aWJvYFOeV+/RLIGDPzY8sYDAFMw==
X-Google-Smtp-Source: AK7set8+wr0aOrXQGkS7sYyYLYFykGG/oa5CvHnOzuT+YqpSy0YnXFZckmTqbF1PuSm2znyOBiuezFmUVzuuW8zenZk=
X-Received: by 2002:a81:4424:0:b0:536:3c2c:bf5e with SMTP id
 r36-20020a814424000000b005363c2cbf5emr23102103ywa.8.1678733794577; Mon, 13
 Mar 2023 11:56:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAGypqWxMz5Sb268HRuXmtfo6EZFWY12iN8+0-GHuoZE2vdr5kQ@mail.gmail.com>
 <b4674fec-9763-ef16-9b6b-c2292df2f469@gmail.com> <20230313110815.57961698@kernel.org>
In-Reply-To: <20230313110815.57961698@kernel.org>
From:   Bharath SM <bharathsm.hsk@gmail.com>
Date:   Tue, 14 Mar 2023 00:26:23 +0530
Message-ID: <CAGypqWyGZ+xSJ154i9CtmeG1Q5-eRw6tyVYVY79LC_c9HCir9Q@mail.gmail.com>
Subject: Re: [PATCH] dns_resolver: correct documentation error in dns resolver
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Bagas Sanjaya <bagasdotme@gmail.com>,
        David Howells <dhowells@redhat.com>, davem@davemloft.net,
        edumazet@google.com, "pabeni@redhat.com" <pabeni@redhat.com>,
        corbet@lwn.net, linux-doc@vger.kernel.org,
        Bharath S M <bharathsm@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> > I can't tell what the error you fix is unless I see the diff below.
> > At a first glance, I though that you fix Sphinx warnings.
Fixing incorrect sysfs path, right?

yes, It fixes the incorrect sysfs path in dns_resolver documentation.

On Mon, Mar 13, 2023 at 11:38=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> w=
rote:
>
> On Mon, 13 Mar 2023 10:44:39 +0700 Bagas Sanjaya wrote:
> > On 3/13/23 02:42, Bharath SM wrote:
> > > Fix error in dns_resolver documentation
> > >
> >
> > I can't tell what the error you fix is unless I see the diff below.
> > At a first glance, I though that you fix Sphinx warnings.
> >
> > Also, is this patch [PATCH net]?
>
> No strong preference, dns_resolver is sort of in between network
> filesystems and actual networking. So Ack for linux-doc taking this
> directly if that's easier.
