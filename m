Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC63EB64DC
	for <linux-doc@archiver.kernel.org>; Mon, 17 Jul 2023 16:47:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230319AbjGQQrL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 Jul 2023 12:47:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbjGQQrK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Jul 2023 12:47:10 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70932D1
        for <linux-doc@vger.kernel.org>; Mon, 17 Jul 2023 09:47:09 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-401d1d967beso7731cf.0
        for <linux-doc@vger.kernel.org>; Mon, 17 Jul 2023 09:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689612428; x=1692204428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+e3D526DKZcQ2/LAze/ywkjnh9HvcdhsT43CIzyhYY=;
        b=7e7AHSmKQjlPgGKaHQMt+n0aS+VVfmzs90QReaDQ30pWE3QbgvP4dlI/Eq6qWlom3Q
         tgsW7dq6VqsVnuMLzpC8HXpF6wS+Il45ekw6QnKdbZGn73Q7eC8/Yh5eD4nvIwav25k0
         YwOK6reB2bI0Y0MYUtSJ/3wNBcYbxZjtYl77R6rmYbgESIxXVNYbIJp4/9xZco/ph3Z3
         1xDkRJ7QPr6Fa+6zMY8s8mkIcRogUQTKMcJ07Y8d5d7u/ReENB0jfz9bAFol9ZrdAaHu
         0buWWeiD1Cvhwv2tcdjUP+4ZnYf/SgoRf9Rv7C8mTDJ9tYZGgzFtOaxKX7CzP9FWFygB
         24gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689612428; x=1692204428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3+e3D526DKZcQ2/LAze/ywkjnh9HvcdhsT43CIzyhYY=;
        b=PVuZJ4cspKE291sQOoyESZ7+jMeCcg0KN3t9ZN0Vtejv6jEhY24DejGfT2dV/3kmz/
         uDDUu6wBO+mZ4iI66N8ChgNaH2TNycmOB/BKCi0ReO4wObyyySK23tH/LOqMaNRf9+NQ
         LkjgMOiJlcWobq4XkcDIQv7VD79aosBVMisyJ5YGNBlddWWi/wieNcL3dkZMdVJSbGqX
         sacz23F2wo6l5BJ1zNsr14+95r79mgiEBUSlqsxtIq1dV6ueKX7EH51udFTfKmsulidg
         7l/KUPTBXyTRMpYe5akOO5P2Y15WQf9+qB+KodY5gSkw6XpRq3IlmYM+VbZil5438l6j
         kMVQ==
X-Gm-Message-State: ABy/qLbVu6d0pwyGzRPKVE52kELwNHUt/y1qiPOSuVtjxwKP2BIcOkxR
        xA+XBulp50/p/qn1tP7ySEBz81kiP0YSkACpYBQ5NQ==
X-Google-Smtp-Source: APBJJlGQHhjBTJOyR4ALML7m1VsuAIj3b+ZyvPRhX6Gs6PxHm6xVz7ix159HwbDQ9XiLkj/CyDwHvjJeQtoFD0rzAw0=
X-Received: by 2002:ac8:5b44:0:b0:403:96e3:4745 with SMTP id
 n4-20020ac85b44000000b0040396e34745mr1459522qtw.20.1689612428412; Mon, 17 Jul
 2023 09:47:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230713112404.2022373-1-imagedong@tencent.com>
In-Reply-To: <20230713112404.2022373-1-imagedong@tencent.com>
From:   Eric Dumazet <edumazet@google.com>
Date:   Mon, 17 Jul 2023 18:46:57 +0200
Message-ID: <CANn89iJMzChaDsB+bPAuCEDUHVApsYs8KtD3oEC+oU_Qvi1KvQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: tcp: support to probe tcp receiver OOM
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

On Thu, Jul 13, 2023 at 1:24=E2=80=AFPM <menglong8.dong@gmail.com> wrote:
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
>

For the record, I dislike this patch. I am not sure what Neal had in mind.

I suggested instead to send an ACK RWIN 0, whenever we were under
extreme memory pressure,
and we only could queue one skb in the receive queue.

For details, look at the points we call sk_forced_mem_schedule().
This would be a matter of refactoring code around it, in tcp_data_queue()

The patch would be much simpler. Nothing changed at the sender side :/
