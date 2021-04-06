Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F93CC433B4
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 23:55:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B52861246
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 23:55:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236058AbhDFXzp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Apr 2021 19:55:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235884AbhDFXzo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Apr 2021 19:55:44 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C638C06174A;
        Tue,  6 Apr 2021 16:55:35 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id k8so11645640pgf.4;
        Tue, 06 Apr 2021 16:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SZG0o9Sq8gSXLCWuHmzcPqeuL417DqZYkn8x8MyGxHQ=;
        b=NTZwWhEZKlVya/n8yYBxyZOzXySnL1bjqtcIrcZa2I5L+9keFY9Xt9vneXC/ePKFw9
         wGOl66BIuNcN7bXuhRQxn4yO1aH7kygPDf2xUZJQRqWk2/5Okz7GJ0Lik4rgr41+HFX5
         L16awqaWfiUxsTfMU1Jk2DgXbFbA6Ug9GAGKykhkW2zp12xkSoJ1Yr0aoGV3kPtHXej6
         jaU3kvJDpNnDdhhLeOA8nvTd6la9GvU6SGQVQqko0TLxPnzClXCM1K2hLgBSdNhXGDZT
         p2N4I1pfTKGa1I0E6vT953p4/UP2gHgLEo5WUExn4+JfcFR1lc7YsseSD0+hmVJFRJAd
         4kRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SZG0o9Sq8gSXLCWuHmzcPqeuL417DqZYkn8x8MyGxHQ=;
        b=QYcZHk7pVCnTP10PWUOufynP4+vEXszj/hqWSwHoETgKww/WAXpwCOVzsPZceM+7DC
         8hVjS/hzvBOY9Riclu3H+XLnRJCdPmUz+P+FNs4pLBTAOkktPV9VkS/x4yrAHeX4MdeZ
         Ro4XDPDrKnqpPefQPPU4sPJGXHnR+EcITwgzoirUz1EkhOFH9Rjwco6jwav0cMtYv/uY
         4W1TxjM+pt8MC5nwLWeIuSin5luuqbD9vqUX+QAQw8UTwfXDWmTJ7mWk3+nHSVysGOS7
         J1OBkv5i8+OGss8Y/CM9EKJtgQcYx0K6Bef8lF0Fez6ge4tG1DPSkryhBXVj+l7ZUjel
         hfbQ==
X-Gm-Message-State: AOAM530FfPaaeis67UMoHe7Zo3hZwfY07f/EA3xNcIPP/MdhyaIqF4WZ
        jFXcRuwIYWzgFnTw0iLr4F4zmUsLLdIdPwBaFjo=
X-Google-Smtp-Source: ABdhPJyD0HObeSTao6LJs5+ocrMNoNigOm5sgQ7PFQ6V2rk27d8cNFgVGeRoZN47WRAPc8gcIJSR/UjD2mrZlhNA0as=
X-Received: by 2002:a65:480a:: with SMTP id h10mr612229pgs.63.1617753334628;
 Tue, 06 Apr 2021 16:55:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210402093000.72965-1-xie.he.0141@gmail.com> <20210406.161431.1568805748449868568.davem@davemloft.net>
In-Reply-To: <20210406.161431.1568805748449868568.davem@davemloft.net>
From:   Xie He <xie.he.0141@gmail.com>
Date:   Tue, 6 Apr 2021 16:55:23 -0700
Message-ID: <CAJht_EOZoxyb7+4910vcyz9D7j828nPOLGZv++AozWWGGj4bHw@mail.gmail.com>
Subject: Re: [PATCH net-next v5] net: x25: Queue received packets in the
 drivers instead of per-CPU queues
To:     David Miller <davem@davemloft.net>
Cc:     Martin Schiller <ms@dev.tdt.de>, Jakub Kicinski <kuba@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Halasa <khc@pm.waw.pl>,
        Linux X25 <linux-x25@vger.kernel.org>,
        Linux Kernel Network Developers <netdev@vger.kernel.org>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 6, 2021 at 4:14 PM David Miller <davem@davemloft.net> wrote:
>
> This no longe applies to net-next, please respin.

Oh. I see this has already been applied to net-next. Thank you!
There's no need to apply again.

Thanks!
