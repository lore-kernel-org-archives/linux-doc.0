Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E691AEB64DD
	for <linux-doc@archiver.kernel.org>; Mon, 26 Jun 2023 13:27:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbjFZN1L (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Jun 2023 09:27:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230177AbjFZN1K (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Jun 2023 09:27:10 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F0841AD
        for <linux-doc@vger.kernel.org>; Mon, 26 Jun 2023 06:27:09 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-34570b2d069so243365ab.1
        for <linux-doc@vger.kernel.org>; Mon, 26 Jun 2023 06:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687786028; x=1690378028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSZHpIGj9wwkIa9hVVPRK76zK+0CMnJhqGyhyWSAmH0=;
        b=QU4ktPnXPtrQ92+3m0NNpOS4TkW9tT8cF2/6OaqIvDumeqYRw1chYYeWj+qFv3ZZic
         633YwIC/xGZ8YUufw/n14aRWQHKHl9mv8zsizHuo3QKfoOoDmXOGHcXb8b6eC1G88uT5
         R2EzLBjalpwcH5/4zbymHE2aGsJ5LYu+3bi4xERIwMYTIUK/Hr4aork0TQtEMa/cEGan
         GUjoYvLBntTEZhNhpTE5PrSHQw87xRk4mOpCg83icdiafcTfKR2eH9XxJc+Nv71hiWr3
         /cnTZkQqepl1NzAjv6ze7VVWzWiZfV+kECbHO+K6OJtLlUlCfIlOOgwXn9rKxIQzAL7J
         3RHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687786028; x=1690378028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kSZHpIGj9wwkIa9hVVPRK76zK+0CMnJhqGyhyWSAmH0=;
        b=hkjQ42s4edw5wDL3Tpm4vZStqp8y+l1nW9NLRLw9qTdewS2WNsKZQjsOONyi0UqK5j
         1yGjxUQm3WIxgw9VW6jqvgHmjpRrIU5tokj3pk3ww7db9sDMSLnafDf/3hCWyL9DHl8F
         RvESeVih3rMnGJ71GxDEkilMHTD6CRAMfzoYE282KnmvS573P15DmuhDqk7g3G8aYqZH
         JIX/hXMtKC+lI5TlCRKxKv8rws1KnerdkHwcTqqJwZTeRM2bagNUjV4P688qI4Lk/Hd5
         xNopGslvWL0KKH227OUXCsP9j1NAKlB3ikac3Gre709J4DE9Rp0rm2uF3nRH9SeX1Cfe
         ol0g==
X-Gm-Message-State: AC+VfDz0nPhZsXKkA0Fn2CFn6wfP7EgTnRaHnctq5eUmkBn5H3JK0GOp
        PnoZ5wXzLYE3GUGDlph7v6R58I9qH7K5WLVI2QWg6g==
X-Google-Smtp-Source: ACHHUZ7tqs35ui6sqUKq3bHPizstRYS1nwRSk/Hqeqy7U1a2le2mFRC6yXGJ+/38BAUVTwK+xygXVymA05bBPBNXUHI=
X-Received: by 2002:a05:6e02:1b09:b0:33b:5343:c1d6 with SMTP id
 i9-20020a056e021b0900b0033b5343c1d6mr346378ilv.21.1687786028373; Mon, 26 Jun
 2023 06:27:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230626100107.4102329-1-imagedong@tencent.com>
In-Reply-To: <20230626100107.4102329-1-imagedong@tencent.com>
From:   Eric Dumazet <edumazet@google.com>
Date:   Mon, 26 Jun 2023 15:26:57 +0200
Message-ID: <CANn89iKHfAWj_e6aqWiNQJfe2LOeaX3-Grx3w0LpxoKH9i86Cg@mail.gmail.com>
Subject: Re: [PATCH net-next] net: tcp: support to probe tcp receiver OOM
To:     menglong8.dong@gmail.com
Cc:     ncardwell@google.com, davem@davemloft.net, kuba@kernel.org,
        pabeni@redhat.com, corbet@lwn.net, dsahern@kernel.org,
        kuniyu@amazon.com, morleyd@google.com, imagedong@tencent.com,
        mfreemon@cloudflare.com, mubashirq@google.com,
        netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 26, 2023 at 12:01=E2=80=AFPM <menglong8.dong@gmail.com> wrote:
>
> From: Menglong Dong <imagedong@tencent.com>
>
> For now, skb will be dropped directly if rmem schedule fails, which means
> tcp_try_rmem_schedule() returns an error. This can happen on following
> cases:
>
> 1. The total memory allocated for TCP protocol is up to tcp_mem[2], and
>    the receive queue of the tcp socket is not empty.
> 2. The receive buffer of the tcp socket is full, which can happen on smal=
l
>    packet cases.
>
> If the user hangs and doesn't take away the packet in the receive queue
> with recv() or read() for a long time, the sender will keep
> retransmitting until timeout, and the tcp connection will break.
>
> In order to handle such case, we introduce the tcp protocol OOM detection
> in following steps, as Neal Cardwell suggested:

net-next is closed.

I think I suggested something much simpler, and not intrusive like your pat=
ch.
(Your patch adds code in the fast path, and yet another sysctl)

If we can not queue an incoming packet because we are under memory stress,
simply send an ACK with WIN 0
