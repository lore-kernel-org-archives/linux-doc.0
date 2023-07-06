Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37BABEB64DC
	for <linux-doc@archiver.kernel.org>; Thu,  6 Jul 2023 05:07:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbjGFFHN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 Jul 2023 01:07:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232730AbjGFFHK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Jul 2023 01:07:10 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C10811709
        for <linux-doc@vger.kernel.org>; Wed,  5 Jul 2023 22:07:09 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-40371070eb7so136061cf.1
        for <linux-doc@vger.kernel.org>; Wed, 05 Jul 2023 22:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688620029; x=1691212029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hffRxnSunklfp89DvzvKwrWLyrgvALeN7SrVEPvDGfM=;
        b=P3c5Ah9qbElG18sj1GFPMyDiu/SS2+LTy7Ar2rnSPEBE1HJ//UgMlpZWTZ307UWpA0
         UdSX5eWZMYwgGCA+lSGEyKwbGOluaLUhuOu8nIqgMmPfA5Zn3OoUdrvHO8kljaGXC+LG
         wysq4DhNl9b5WHQkJMfvMH038IzSwuDyP5zT/8Gu0iox6x2tBGT+byKjC0Pxw0PW6Z5I
         ss9XF1C+aTIq/YhDdfV59dyzOr0oi/t3qAfffIQ/mP+rzbSnVDw+46z+aj4PKB/4rP4A
         ogLXbyrZI2bRePeUpP1FRLLIkItgP96LTrewH0MINhim4aQobRNUPn5+LsQ165pq45KP
         z9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688620029; x=1691212029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hffRxnSunklfp89DvzvKwrWLyrgvALeN7SrVEPvDGfM=;
        b=hQw1U86YcyuMfOfrpfN3+yrJJ5/8lkmGydvwU6xwK/xMOnzPTml/MOLzdQrUvzundc
         AAuj/tuVY3gwk2q3caMWryeHmYM6jbVpOGjAmLCuCCJYKpljlHv4yNEDadeYXPbDqqil
         JPaDL1mRdGhRJK9QhRDc+kw/lazqTBJy16M/pJeDNw3/LVTnquBhEcqigvKpdI9dnXKb
         Jc1FIOxI+0ThQRnDRy8JVitPlDnDSfqYgA84PZZp79yeT8KVme/rXX0f7PKLDsSfDqp3
         B/pIbXek9ZTI92TletI4/ajDqjxl9MTQbrbZlnfTWSs3CUyGZLw62dtywxfPCi/dB3IC
         Pobw==
X-Gm-Message-State: ABy/qLbxZE7Qa0o1JMYnJUBLeA62tRuSUOxRiLFUwt500onHjjXKjB4R
        sN3UnuX4NeJFt/kbqvJg6YM4yV3wsU3i+O+FrSja
X-Google-Smtp-Source: APBJJlGGYKrR1oEbXVo41fG7AIqxtwNP5cFvFHu0YbwAbU9CriMrOnef4ZhaOJso815c6Zac+BtBRSCVqOzeXBALYTw=
X-Received: by 2002:a05:622a:2c2:b0:3f0:af20:1a37 with SMTP id
 a2-20020a05622a02c200b003f0af201a37mr40610qtx.15.1688620028818; Wed, 05 Jul
 2023 22:07:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230704052405.5089-1-rdunlap@infradead.org> <20230704052405.5089-2-rdunlap@infradead.org>
In-Reply-To: <20230704052405.5089-2-rdunlap@infradead.org>
From:   John Stultz <jstultz@google.com>
Date:   Wed, 5 Jul 2023 22:06:57 -0700
Message-ID: <CANDhNCoicO=CRuDnWrs--XikWu=SwNPU46erntiCjWvSoWZv2A@mail.gmail.com>
Subject: Re: [PATCH 2/3] jiffies: add kernel-doc for all APIs
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jul 3, 2023 at 10:24=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> Add kernel-doc notation in <linux/jiffies.h> for interfaces that
> don't already have it (i.e. most interfaces).
>
> Fix some formatting and typos in other comments.
>

Looks ok to me. Thanks for sending this out!

Acked-by: John Stultz <jstultz@google.com>

thanks
-john
