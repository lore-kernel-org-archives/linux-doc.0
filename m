Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83128C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 25 Nov 2021 17:55:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348388AbhKYR6l (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Nov 2021 12:58:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349581AbhKYR4k (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Nov 2021 12:56:40 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABA62C0613FE
        for <linux-doc@vger.kernel.org>; Thu, 25 Nov 2021 09:41:33 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id r25so28557895edq.7
        for <linux-doc@vger.kernel.org>; Thu, 25 Nov 2021 09:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z2IJ7fkWzT4QzGDzEtLmaHZp2fcDNE6n441j4Jq1TTg=;
        b=h4+g36WEj4z1gI3DDnKk+9MxmbcZ+WG7tK4K27UXXlGc6P83Nt5LvJl0rdPJ41d5+2
         mElVmTmbsyxu+/YXa0m5BLD8hecORHVM0OGuVywAjPtizdkgo/VEYaGsYeQflUwG9z/6
         2a7bFwQq+uAag+i9LUNfT9V0UwMYpb6H6bHjbcY1edN0onoRGksxlvqxikrqLXyDRTip
         5vQ/uTtyej02LeLqTyS/hikgRiDMhAC5sr9KVPS6l13eUbzM/X42nleQAXbraY58C/FR
         9NDnPrkkDp1yVvzXh1497MTnDhkTO9epFf9RMJo6QEWYc+t65IGJisVwk3wplf8L2pKn
         LKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z2IJ7fkWzT4QzGDzEtLmaHZp2fcDNE6n441j4Jq1TTg=;
        b=6qKVpkWzd17j2PazFDal2VwzPIxnR3o/UQVv/qFp9I+EryqeZajl9Mbh4VzV7Fb7S2
         aFOZePoNG4WUjUSFyKjdOWjExs1DBDZaRJoQpXKSAnpGrVy+7o3ciLYx/PbeoajsJf3y
         wKT8YAVivRlL70b94UJb6AFH448hdb5Bd9FluqmdNBwXx1Jow7YiqXV+wi1EQ5A1TDur
         P8SFESADngRkRnilvBu6rgohQZDdvmbvVVMwXeRTWl9b14W2qamG6B7pu8OR802NgxlM
         hWHlAqX8raZWJHnCVJunKwHACYm9+qKX38Lp2d2evl88iopMNJ6MvW11ZJjOlpj76LXl
         nHtg==
X-Gm-Message-State: AOAM532sz7MKCtlJUOQhswfIIHMzXbGcuWCiGuQCtoDujEQk9Q6BPjTY
        bc1YiTpeLHbC8rkj18WwGOyU66zHEBudRa7ToWxnBw==
X-Google-Smtp-Source: ABdhPJx2Xczq06usTJYBRLZW2NTpORn5lYS6y+znDW01RIXU6XSiwOXfkyj3NsclbujgsmMU3faOjVf3+64G3yBL76Y=
X-Received: by 2002:a05:6402:147:: with SMTP id s7mr41127174edu.8.1637862092248;
 Thu, 25 Nov 2021 09:41:32 -0800 (PST)
MIME-Version: 1.0
References: <3cbff170-582b-b6cf-0988-e0d0c9b47505@gmail.com> <3c0ffc75-0e0f-1701-267b-1bedb6481b79@gmail.com>
In-Reply-To: <3c0ffc75-0e0f-1701-267b-1bedb6481b79@gmail.com>
From:   Joel Colledge <joel.colledge@linbit.com>
Date:   Thu, 25 Nov 2021 18:41:21 +0100
Message-ID: <CAGNP_+VoB=_c5f6LO_NQBfWLrLa=APR2Ajk+kt0XGWqCMp9EXw@mail.gmail.com>
Subject: Re: [Drbd-dev] [PATCH] docs: admin-guide/blockdev: Use subgraphs in node-states-8.dot
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Lars Ellenberg <lars.ellenberg@linbit.com>,
        drbd-dev@lists.linbit.com, linux-kernel@vger.kernel.org,
        Philipp Reisner <philipp.reisner@linbit.com>,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thanks for catching this, Akira.

Unfortunately, this fix causes the "node_states" and "peer_states"
graphs to be mixed up. I guess this happens because the same IDs are
used in each subgraph. The graphs should be separate.

On reflection, the digraph node_states can be removed entirely. It is
too basic to contain any useful information. In addition it references
"ioctl_set_state". The ioctl configuration interface for DRBD has long
been removed. In fact, it was never in the upstream version of DRBD.

Best regards,
Joel
