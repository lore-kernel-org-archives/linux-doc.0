Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E03A0C61DA4
	for <linux-doc@archiver.kernel.org>; Wed, 15 Mar 2023 15:26:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231673AbjCOP0R (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Mar 2023 11:26:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231466AbjCOP0Q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Mar 2023 11:26:16 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 517497282
        for <linux-doc@vger.kernel.org>; Wed, 15 Mar 2023 08:26:15 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-540cb2fb5b9so270353877b3.3
        for <linux-doc@vger.kernel.org>; Wed, 15 Mar 2023 08:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678893974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bu84jybfGCS1OFYI0X1q86/LXT2GUi5G2nbOb5+yd9E=;
        b=ckkvpbR8JMm9JoVMiLM6F5ZkGLx0NFY7D94sXQ3cJme0Fygl626p1DaWG9E+3lAZnd
         SDBe+NpBkTixEMWp+hfdmymw8nwhpigSNLUFeKpcIiTNMXCmp3MvHepLuTuhfi655U3O
         r80toNjeSAvmTKK5vqD8LB49zC+ldxgMqweeFL1vmYd7iP3llLJiwo3iFQzesXtHQAV6
         94U/mVqJAwAxE2tZ8JMh99/0VO3mRcWpW/XssoVoVMf9nPxwitYsbtzmRVBOWX1NGgt1
         AlySVB3Oe1o/8P3eP1T/Vsa9ATkst1w3O7iuXABOwm/Rl7NRyJM4s2gZIGx+IIqqLz/h
         5+iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678893974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bu84jybfGCS1OFYI0X1q86/LXT2GUi5G2nbOb5+yd9E=;
        b=MtCbQpwiWFll4w1v39vyoQXQI9zC9koXnDHro9i7wnUPxFzO2EvdYiiVGZkx1oB4Jx
         HBz1sDB3Vv+v0KyRXA0c6h5838Q6FWpYw9x5ENvxNA3NUQ/yfuWpOQkp972sIJD4kFja
         rIfvM3DELPoEpiJDMP5ONU0V0iMDCyv6pa29cB2fHW+hrT/GumUuCMe6EoxQFa/MqH/8
         Xx/pi5VRZHDBZC1vmwHoxcRmsuhth7Z82Xwx/sFJL39i/fmkr5vvCCAJBjszgNzaq0Ga
         D+f/5/B6N9hheY7fsAWi/097uznLVU1xxfuff46qXOlwXJjHqh6PI8yaNBAYqoQ9B+j8
         UGxg==
X-Gm-Message-State: AO0yUKUHJPPSwBpFmgUyT/om+5HZawpmz9QNoAJ91tdZeU42m04TnwZs
        d11q8DTnqefF++FjLkbPuMUdLzhmQCT9rCs0itU=
X-Google-Smtp-Source: AK7set9NqnVDu3BBX5YHBT98AdyTAmbs3/ekfg8mUKINzD16zIEKfdFgIy+0OZiAOXs9nADwlsXWt++2n82YV382YHc=
X-Received: by 2002:a81:ec0c:0:b0:536:3c2c:bf5e with SMTP id
 j12-20020a81ec0c000000b005363c2cbf5emr161752ywm.8.1678893974521; Wed, 15 Mar
 2023 08:26:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAGypqWxMz5Sb268HRuXmtfo6EZFWY12iN8+0-GHuoZE2vdr5kQ@mail.gmail.com>
 <b4674fec-9763-ef16-9b6b-c2292df2f469@gmail.com> <20230313110815.57961698@kernel.org>
 <CAGypqWyGZ+xSJ154i9CtmeG1Q5-eRw6tyVYVY79LC_c9HCir9Q@mail.gmail.com> <06c615d6-e7d1-9a78-d45f-5d5b37aa8fbf@gmail.com>
In-Reply-To: <06c615d6-e7d1-9a78-d45f-5d5b37aa8fbf@gmail.com>
From:   Bharath SM <bharathsm.hsk@gmail.com>
Date:   Wed, 15 Mar 2023 20:56:03 +0530
Message-ID: <CAGypqWyQKRxd-qbjD2EQep9XGHBtqB9EUAUODAoC3V-4UN99ow@mail.gmail.com>
Subject: Re: [PATCH] dns_resolver: correct documentation error in dns resolver
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        David Howells <dhowells@redhat.com>, davem@davemloft.net,
        edumazet@google.com, "pabeni@redhat.com" <pabeni@redhat.com>,
        corbet@lwn.net, linux-doc@vger.kernel.org,
        Bharath S M <bharathsm@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 14, 2023 at 1:48=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
>
> On 3/14/23 01:56, Bharath SM wrote:
> >>> I can't tell what the error you fix is unless I see the diff below.
> >>> At a first glance, I though that you fix Sphinx warnings.
> > Fixing incorrect sysfs path, right?
> >
> > yes, It fixes the incorrect sysfs path in dns_resolver documentation.
> >
>
> OK. Can you please send v2 with patch description mentioning above?
>
> Also, can you configure your email client to have a reply below the
> quote and not on above (aka top-posting)? When replying, you may also
> need to trim unnecessary context lines, leaving the appropriate ones
> intact.

Thanks for your feedback. I have sent patch v2 to the mailing list.
New subject: "[PATCH v2] dns_resolver: correct documentation error in
dns resolver"
