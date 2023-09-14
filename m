Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E4D5CA0ECD
	for <linux-doc@archiver.kernel.org>; Thu, 14 Sep 2023 04:11:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234613AbjINELE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 14 Sep 2023 00:11:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234661AbjINELC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Sep 2023 00:11:02 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BBBDEC
        for <linux-doc@vger.kernel.org>; Wed, 13 Sep 2023 21:10:57 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so3544050a12.1
        for <linux-doc@vger.kernel.org>; Wed, 13 Sep 2023 21:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dowhile0-org.20230601.gappssmtp.com; s=20230601; t=1694664656; x=1695269456; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aufe5J8vU+SctNgmT1W1/mq3RGiP8XjApWBecp6gONY=;
        b=ImRwRd6b/zFAX4YmIppIskNk6Jwzcmx7YL+FTacGwAvYnCrNJRX0yKmaMhmCZ2B+nQ
         Z0hvQnKO/+d4R+T5zPDCzXqVijeV7lPjUgT52LPLoIEwcXwjWICndpZmo5cvepOghKRu
         nMrMH4br6I+JX4xqkTFJnVA1TjYa1dpF9ciPzEh2VeWKVM67h5b/yXRUyCFgFSqpfeqy
         hIfcXxm4uHBwfR0pvgeyucgUAnzPeek4IwHtIobEoYl4JH+ZPOQkqfqMTBw/z3TWG1N2
         Omb/f1GYTAHZENLFi8VnpUx4o5RRa93XM5gAqLk8mK835rPdoZLhLLtCsWvcXVxYg+xY
         evyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694664656; x=1695269456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aufe5J8vU+SctNgmT1W1/mq3RGiP8XjApWBecp6gONY=;
        b=MWszQTZMNewqeZt5IiEGWuzP09lnseo4F7lZez3bD8/c1V+wt6WdjU4U4Lq+/55C77
         1y/eKm/0x9Pd8YBbm2c1w3iKw32aIXClD9seRfaYXR0Ps+Eo9hGD3JFTjTM8ZUvi3Pjt
         rNbPeQzhs2snU4Az2+uMn3DlsHwtVWvZejOvGl+GFWPiVdBOwtThWD7/qapv+hX1mdhG
         p/6CbiI5wSwsGfTgrYTQ8VsaMVAZHBBHGW+TonD1K6dgcc8S/vNRC33PyTa+St9JjMax
         UY7nO1ORZsmf1MRyxsxBYnxb/5F0gL1o5TYrenvA6KV+MjTISIhuiQogD1PAnw7E0mxp
         FBZQ==
X-Gm-Message-State: AOJu0YwGyMvySkEUA1SmxW4TyLe0n4CtdJDXvs1yce+uA01xFBmCuzSy
        pIRE4PQbhilgMPrkffKrX3lJCDtAltHDCXayRAC4mw==
X-Google-Smtp-Source: AGHT+IFtsvUmPS4Noz40u6zbY6fpqmr+96j8eujD/00V5cBzXdC4gU7MPilZUrybMC4DFXO6Yn+sO+DlY8NEeebB66I=
X-Received: by 2002:a17:906:5399:b0:9a1:b528:d0f6 with SMTP id
 g25-20020a170906539900b009a1b528d0f6mr839462ejo.27.1694664655307; Wed, 13 Sep
 2023 21:10:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230913-submitting-patches-delay-v1-1-a2d48c5ca205@kernel.org>
In-Reply-To: <20230913-submitting-patches-delay-v1-1-a2d48c5ca205@kernel.org>
From:   Javier Martinez Canillas <javier@dowhile0.org>
Date:   Thu, 14 Sep 2023 06:10:43 +0200
Message-ID: <CABxcv==jJvujerZNmN8PXF1-YYXy4Ra1WAHcmX4YUJRbRPUPzw@mail.gmail.com>
Subject: Re: [PATCH] docs: submitting-patches: Suggest a longer expected time
 for responses
To:     Mark Brown <broonie@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello Mark,

On Wed, Sep 13, 2023 at 4:57=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> While some subsystems do typically have very fast turnaround times on
> review this is far from standard over the kernel and is likely to set
> unrealistic expectations for submitters.  Tell submitters to expect 2-3
> weeks instead, this will cover more of the kernel.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
> Mark Brown <broonie@kernel.org>
>

Agreed that 2-3 weeks is more realistic.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
