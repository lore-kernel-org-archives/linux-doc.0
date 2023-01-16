Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52645C54EBE
	for <linux-doc@archiver.kernel.org>; Mon, 16 Jan 2023 22:59:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234684AbjAPW70 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 16 Jan 2023 17:59:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232546AbjAPW7Z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 Jan 2023 17:59:25 -0500
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BF14279A1
        for <linux-doc@vger.kernel.org>; Mon, 16 Jan 2023 14:59:24 -0800 (PST)
Received: by mail-vs1-xe2b.google.com with SMTP id k6so21571506vsk.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Jan 2023 14:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pefoley.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TkkUsEwrv+2V9UAHItUrpPV5yAcwmN1K3z1/Xa1wp6E=;
        b=tyMlUO/0N8JvtANZ1CLULHkwFOdKsVBmpUJrC08l4nBSMtzxpeUDERdEnwK8NazxID
         BvAoZLWrBu3UdOrtdUVn0c2cISJ5ycAjPpeDmD18CI6OXEHy2MBETYfaCeNpZKVL4ijW
         EiVecOBpmfyAz2BPXQHnyG5JudZ3azjRf5oVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TkkUsEwrv+2V9UAHItUrpPV5yAcwmN1K3z1/Xa1wp6E=;
        b=JNN7gN9fQmd2Hfc+SXw9s+eDRiLhemTp6Tlb2cbfNCQF/GoAypkmmt3lP80Ftnkjwa
         KLQmhLea1fJdRC+TsK/W+elygolpEcdWnwD3DF3WAVcBL+4jb6yZy31SU+YITG9yJ84n
         vF1rmlp4/OVAEWA3/kxW1Kf+GLO6K5ISn6AcVBJud5UKMsmpmkY5CQ0ufItczd70olhr
         C4m5V84fbdBuJBoNwkEV0LR6dU2/c36GDEZZplwKXPAZpBvT3jm/0ABm7K9cjVVmJssg
         bdFCNOTI5GjZYnrqtFxKhL8qUCMbIMaHy8/bbwqpPMjguhcT39XJfXfco5UOVlvW6oW0
         x1Ow==
X-Gm-Message-State: AFqh2kp1Pr03hJo8a8Nko+Q5wMDlfJsH6XP4t0zFQd/D7hlz1WrSTNio
        7C+cEVrfy2bxkwOeN5BHAlQmvwBXh6iPqp3D31aKIg==
X-Google-Smtp-Source: AMrXdXvA8PZ8QYiuV/L2cjM9k+hmb8K6qRjhicgMlm4cPEd+X43ILlUiG9cotA74flgCqnociuRuiGlDpg/kn/Wl4ZI=
X-Received: by 2002:a67:e9ca:0:b0:3d3:d06a:3229 with SMTP id
 q10-20020a67e9ca000000b003d3d06a3229mr80529vso.28.1673909962980; Mon, 16 Jan
 2023 14:59:22 -0800 (PST)
MIME-Version: 1.0
References: <20230114-doc-v1-1-efec2689e423@pefoley.com> <87edrxgk25.fsf@meer.lwn.net>
 <CAOFdcFNKJacBVtrV-hJyUu6hKBVFaKdpA84cZ6WGnZ=ZGnb4kQ@mail.gmail.com> <cb1333e8-0e0b-2e3a-f5e1-553d2722be82@infradead.org>
In-Reply-To: <cb1333e8-0e0b-2e3a-f5e1-553d2722be82@infradead.org>
From:   Peter Foley <pefoley2@pefoley.com>
Date:   Mon, 16 Jan 2023 14:59:12 -0800
Message-ID: <CAOFdcFPY7=BqhQ7D17j-ER3dW6HyMXE8Ba7HpT_+hRZVnBXYvQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: Avoid duplicate Kconfig inclusion
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Jan 15, 2023 at 4:55 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Since b1663d7e3a7961 puts the Documentation/Kconfig just after
> lib/Kconfig.debug, there's not much difference in its location in a
> *config menu, but I would rather see it separated (independent) from
> lib/Kconfig.debug because I think that it would make any future changes
> easier.
>
> Also, b1663d7e3a7961 came first. :)
>

Fair enough, sent a v2 with the top-level include kept and the Kernel
hacking one removed.
