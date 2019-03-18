Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 252BA7D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 18 Mar 2019 14:56:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726875AbfCRO4y (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 18 Mar 2019 10:56:54 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:44390 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbfCRO4y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Mar 2019 10:56:54 -0400
Received: by mail-ed1-f68.google.com with SMTP id x10so10618413edh.11;
        Mon, 18 Mar 2019 07:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NB/rgOf6VwaghcMOEkCXmpVkTDBCBqELqdoiPe8s1CI=;
        b=ez3G4y9BTpBPFKcNxi8u3XhO5UwjDByvq8y0haZUwUJFNKpFt16F4qwhn5SFyXt4tT
         8c+cg+DPLmP5cxi8MO/9c5cKKkZBzcMQiU7j3Q29AgWqa9sy7GXD84r5TQVC29l5bys6
         TmFIM4KhFh/7QfcVMjbf5cZF+36w26MSs1DiegDevrQtBHCbB3TdZ8ncwOZxSa9Y1Mmo
         I19XJ4EEuREaeN7OLKmd1eu+WFaDFNZOiMPxaQAJ32GfLEXBL0PE5BQLSjjimil1nq3Y
         vcavmHB3KmeE/Yq+qssGAe2Wd3KSc4tWATfvwuDQ4v7DZXM8WIE1dwHA7t/8RUmVaL9E
         91Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NB/rgOf6VwaghcMOEkCXmpVkTDBCBqELqdoiPe8s1CI=;
        b=RLlM6ZuBIgFVn6wNbe/HjeI+ZziqC2nLExuPztr+FWOq3V1LM0h6aYGmO1wwUBwVUP
         V+kRSHn5n7/wCi6Z+LjQYTdehn6ewsyxKpTGl2qHpU45BfWamESBgP6LuqvP6/g8yfR5
         Q5HtlygT0XIi3q0HP3/yccijXMVM7wqqwfvpyXrieLv6vqp3ccmULsYGXWAs0DMd2VU9
         qlygDahSkKhAcYng/vtyb3RWLs1wuY+2NOHTljuHslnZ8sSiwtoUJVYCGssJKz/lSQrA
         Uzd5a2W1Xt1kwtA+MVOsZWTI5fdqtTwiED1aThpZu4+aj4JEGaRL+VfuftxhBU985hqw
         pQ+A==
X-Gm-Message-State: APjAAAW9DSZ8WmeBlPkk5FEGy2bj3oIfELc4DnaluePz9eTtCmY2cQRC
        B/Q2QTMmnNldqIijevCdDrE5+QgRZSpBqZuZzvU=
X-Google-Smtp-Source: APXvYqx56Z0zrlV0SMBBJuszjE0JyI4DGiI1tbLh2To2EuXjtTC/NxXObKc9UNiBCOUuUkRQ8hAkA/7DLpzsOPBkZY4=
X-Received: by 2002:aa7:c707:: with SMTP id i7mr13705500edq.260.1552921012356;
 Mon, 18 Mar 2019 07:56:52 -0700 (PDT)
MIME-Version: 1.0
References: <1552907338-1784-1-git-send-email-tklauser@distanz.ch>
In-Reply-To: <1552907338-1784-1-git-send-email-tklauser@distanz.ch>
From:   Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date:   Mon, 18 Mar 2019 10:56:16 -0400
Message-ID: <CAF=yD-KNQARc8knKKDueZzvefhM9daN7S2Xpuj08p9KwCFOaLg@mail.gmail.com>
Subject: Re: [PATCH] doc: fix link to MSG_ZEROCOPY patchset
To:     Tobias Klauser <tklauser@distanz.ch>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Willem de Bruijn <willemb@google.com>,
        Network Development <netdev@vger.kernel.org>,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 18, 2019 at 7:18 AM Tobias Klauser <tklauser@distanz.ch> wrote:
>
> Use https and link to the patch directly.
>
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>

Acked-by: Willem de Bruijn <willemb@google.com>

That's a better reference, thanks.

But net-next is still closed, so probably need to resubmit in a few days.
