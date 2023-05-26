Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EFE7C77B73
	for <linux-doc@archiver.kernel.org>; Fri, 26 May 2023 15:55:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244226AbjEZPz2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 26 May 2023 11:55:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243971AbjEZPz1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 May 2023 11:55:27 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5E42198
        for <linux-doc@vger.kernel.org>; Fri, 26 May 2023 08:55:24 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-19f20f406c0so269467fac.3
        for <linux-doc@vger.kernel.org>; Fri, 26 May 2023 08:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bitbyteword.org; s=google; t=1685116524; x=1687708524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8O2VAHT1Q5P5Pgk50I1J96RI5j3ZSie/eadSrSbFNko=;
        b=jwSC26BizZAjvFIshcFKmupMVqGHlRlnMLfTaQJSuCCf60jdsw02ubmbJYqn1sHmPM
         np3EA8DGAopS00pX3RwwpfFW8jF6ch1WtBvqSWqKJQVVL/mJOJtWE5DFYyj0+beyuxfH
         enC6CA2x8s4D2FIP77sVhGl8frpdAi+hq8TNp4dFakp4EohZd5rqGgANa1aPlgKGIkcn
         tZtMtMOKCptjohex/NhcaW27FGFdwG3xtyVtPSJGWKWBjOOCJjb9FqC+Hj6Tn7+EXPEf
         Tpl41Xm7Xc2gl6IqmQxjheo3Zywnbqc+Ob12sHPzQHsuH79ukA0VKMUMzMqFEyEVOVlT
         TBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685116524; x=1687708524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8O2VAHT1Q5P5Pgk50I1J96RI5j3ZSie/eadSrSbFNko=;
        b=LdwUEttDeSi1CQb24jz0FhsgeMnjaDQRMyCyGa7Xrl6w0RlTd6zBAxKHnjIk/lkGQt
         1hZQii7dCbkffkz+D0mfxdc6C+ZeDCCfte4BBl+sXdG+1kvRygLax+P2C2voc4uMn0/o
         D/4Rmn9SQbU9eIR+GcVpKPqZT7N8jWO6Yc2oLGv5OjhkX8zY4+KdLESnaFpCGFM3A7zn
         7FNcUrZE+GpFfNN06L0fwPEIx7S/Y1mIpH13Egbqok1t3qzg5ytFcJ8QpC2krJ+JkFhg
         2SpZwJem6of+o3BZC8WHCnQJIDDKpSoZzKSpcD5EtNkI8Oc5csAB12N8Jt31asdQSrtx
         s/eA==
X-Gm-Message-State: AC+VfDyuROsbR71KYYugSEN8sp8KPUxvci5dkFlARmpWviBnIX7jF6yX
        TulS1l14vdeYsQmZ+eQEp9atqJwUlgR92ev7G9LmY7HYN05NiRszHwQ=
X-Google-Smtp-Source: ACHHUZ5dwPnfRHYMjjBz/CPMvAN7Myf0ephebY3nmamWZ7lpDLsKegvxqQhUh6bPVxe5amIhiiJGbyzs8kbSld42+Zg=
X-Received: by 2002:a05:6871:40c:b0:19e:b750:f024 with SMTP id
 d12-20020a056871040c00b0019eb750f024mr1072820oag.4.1685116523866; Fri, 26 May
 2023 08:55:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230526145519.2282062-1-vineeth@bitbyteword.org> <20230526172959.5440b9dd@nowhere>
In-Reply-To: <20230526172959.5440b9dd@nowhere>
From:   Vineeth Remanan Pillai <vineeth@bitbyteword.org>
Date:   Fri, 26 May 2023 11:55:13 -0400
Message-ID: <CAO7JXPgLFgXANqXY7L-YLbijxJCOgUKmd8nUQizb62JorOXGhA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] sched/deadline: Fix bandwidth reclaim equation in GRUB
To:     luca abeni <luca.abeni@santannapisa.it>
Cc:     Juri Lelli <juri.lelli@redhat.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        youssefesmat@google.com,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Valentin Schneider <vschneid@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, May 26, 2023 at 11:30=E2=80=AFAM luca abeni <luca.abeni@santannapis=
a.it> wrote:
> [...]
> > + * but as "dq =3D -(max{u, (1 - Uinact - Uextra)} / Umax) dt",
>
> ...But I think this is wrong (should be "Umax - ...", not "1 - ...").
> I think patch 2/2 has the same issue.
>
Oops sorry, I missed this. Will send the fixed patch as a
reply to the original v4.

Thanks,
Vineeth
