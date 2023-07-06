Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDBFAEB64D9
	for <linux-doc@archiver.kernel.org>; Thu,  6 Jul 2023 05:12:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233022AbjGFFMt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 Jul 2023 01:12:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbjGFFMr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Jul 2023 01:12:47 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 769301BDB
        for <linux-doc@vger.kernel.org>; Wed,  5 Jul 2023 22:12:40 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-401f4408955so134341cf.1
        for <linux-doc@vger.kernel.org>; Wed, 05 Jul 2023 22:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688620359; x=1691212359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ytLtdURE8ci1p8O07WRCYTemM1Z6XZ6vCUH5E5BlFNk=;
        b=wdriVbGjW43OPJ6t+uBLbF8yBP9zVmCjpkWDsp/8C07ojo5tvNbeU/8KpY2peE3R6o
         gBZEL4+YIWkd8t2MnPcVTjjG0AczP2KJJdTxb0zvlmq231NtE5mGgF4uk1EmmvQdpAIw
         Z+NTkULhjtgZqkS8m67oOdCNmHmQyyVHrqY9aArYaxqChB2kxgL8G86RBofUUIIbQLMx
         MoHvoFYv1p9GtPVVac0eCDahj/qrbdIgsrcUmyrLF6BPNNiyVn9MN2W2OaT7RKLVxNeM
         JKPdTl5gQXzEbQ59r4B2fjFl9akz8KR5IjfQZAMNPiSnN79XU3NpA9rQ8fvMXjonXet4
         dUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688620359; x=1691212359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ytLtdURE8ci1p8O07WRCYTemM1Z6XZ6vCUH5E5BlFNk=;
        b=eMPpKsOvUlLyojSAatBsDJdTD4mofagVnWGx1TWxm/LVCzVlWf+n1CTFsf03mRl3At
         aqm/4WJRvFNdV/IJ30UAAfm4c1mqBpYtC9G8um+DPxUKUi+DmjYZngm+rX9/aFScR/Bm
         l7imZ2NbhijjtguQnKdUo5GSwdJZ5RbOO3oy5mV5YlUD2D6GpQFO6g3JZstjzu1svunq
         QwS5vP7yDwMdpMQOFsivmHM6AhhdS0GARjMkBhOfEcyQTNpVR5OLzjRQx2vMupsfaYpH
         vh/rKEcY4UlaMPBm3VWrwsnCDT819Urmnl2OdSUrxZrfax0j/VgtuiF0hf5ne91A44qC
         8Uzw==
X-Gm-Message-State: ABy/qLb9lVkJ4hrYNVA9H65tI+xBhlmO2FGUOn4E9270qUns0U0mG4LA
        be9tK+Ac4gR91yg3IruwLmBjpPsRZ6JUeHdqAla5
X-Google-Smtp-Source: APBJJlFC39UupwXY44uw6HCPSzb8ZZHacNRKC5iAYB0XEXyIDerGoosbNVBvV/EMY0jseiKcB596jxl2p048/OWEhPs=
X-Received: by 2002:ac8:7d0a:0:b0:3ef:404a:b291 with SMTP id
 g10-20020ac87d0a000000b003ef404ab291mr41859qtb.7.1688620359494; Wed, 05 Jul
 2023 22:12:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230704052405.5089-1-rdunlap@infradead.org> <20230704052405.5089-3-rdunlap@infradead.org>
In-Reply-To: <20230704052405.5089-3-rdunlap@infradead.org>
From:   John Stultz <jstultz@google.com>
Date:   Wed, 5 Jul 2023 22:12:28 -0700
Message-ID: <CANDhNCpVznR-6-cf6dLYF30MPK3ktj4=DjDjku3OWU6p2hyzaw@mail.gmail.com>
Subject: Re: [PATCH 3/3] time: add kernel-doc in time.c
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
> Add kernel-doc for all APIs that do not already have it.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: John Stultz <jstultz@google.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org

Acked-by: John Stultz <jstultz@google.com>

Thanks again!
-john
