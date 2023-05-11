Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F068C7EE22
	for <linux-doc@archiver.kernel.org>; Thu, 11 May 2023 20:41:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239348AbjEKUlC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 11 May 2023 16:41:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239225AbjEKUk7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 May 2023 16:40:59 -0400
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 883EEBC
        for <linux-doc@vger.kernel.org>; Thu, 11 May 2023 13:40:57 -0700 (PDT)
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-54fd9c0e435so1454000eaf.2
        for <linux-doc@vger.kernel.org>; Thu, 11 May 2023 13:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bitbyteword.org; s=google; t=1683837657; x=1686429657;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HF4n4y/GeCCM6obESYiThOANt4aesbUOtUb4gH3800w=;
        b=hI0rhREHz7mQ0acrixIxJoOcmRpYu/9CgsJ3Qb4xo3NgbEi9So7RMGD6T9eJfTiMBT
         IzbjlEup87w8QCsQPhg/CfXpQWvPuhfWn+tO6qjDh5YejWLKjWnWb3ez3tZ5GVXs5VnL
         kgIwNR1ozUJwPUG2kulmN5CEuXhgDF94WjFhfd/HqvS8K6mIBBstZZ8svcVs/5aUL+FI
         5aZa2ffTOgdRR4q5r0qOUO56KwoYJw77B2e+vrf8II7tC5NltH6lB8S8Hp4cLiKIMS8V
         8WFkD3oIQzkkv4GgLHPwVTIATQnEnKHBHcLq3U9MgLCmT3PWuafmKzv9uDcPrdJteWPP
         YP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683837657; x=1686429657;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HF4n4y/GeCCM6obESYiThOANt4aesbUOtUb4gH3800w=;
        b=Fe/vkNu9q60UFZGm4dkNDd92rfDKLF8Ii7HeNpuX79WapFEGfRXmBbVV5sL/SPrFas
         5A8jaSS6SjRZdrFxIXuTNyZF5S0AdPvSxEsHr03TFQujOMAUvnPxSxmCsVT8/MIPFtAA
         QLzqVhtB5B3W+pPiOwkN4YgKtU2FP+jHviNmvMMvRIm4GrYWNmEUAkgKgD0E1UO5D8H5
         oMVNiXngQPTSZJ0tgaBO6oEkvTgm55Jx98cx6JZaw7DFq37r+bKABz9SdU1sXcev/L/K
         hhctrZKztdBVb8fnJkTF/4VDMZqTy3NMDLcOLQWeHtGmVNO+F8AFKUvhzQFsVodG3oFa
         0yKQ==
X-Gm-Message-State: AC+VfDzBZK+8fG0pCWtg5HfgL+B+IO5/Im8HYvsyuUqo8nvlvU7cliXj
        JIqScNkQJDy827wv2kEh6VG+Iu2//NQph9g973loEg==
X-Google-Smtp-Source: ACHHUZ5Szow/NJ7Cu3BIYjly279f1dMTGKvorFrSpX63B2R+I+6xnjEAWsSFp9WFhylPlNalzeGE0loBWPzSwNY+MpM=
X-Received: by 2002:a4a:ea06:0:b0:54a:65e7:9b51 with SMTP id
 x6-20020a4aea06000000b0054a65e79b51mr5995029ood.8.1683837656891; Thu, 11 May
 2023 13:40:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230508160829.2756405-1-vineeth@bitbyteword.org>
 <20230509132534.09098acc@luca64> <CAO7JXPhrqKWfsp860rRmEenxARi8U2gNMGsOn4m+aKporWwBcg@mail.gmail.com>
 <20230509224829.2fb547fd@nowhere> <20230509225417.61d36733@nowhere>
 <CAO7JXPhk5qbz9kmiu9WuXS+gXCt9+X8pP2c37hd9ChByLmXYjA@mail.gmail.com>
 <20230510090735.68f62cd4@nowhere> <CAO7JXPg03f2YnrmzoGjfHEZZcoN55cU7uVukMw31Bw3x6nnaMw@mail.gmail.com>
 <20230511093711.2be82409@nowhere> <CAO7JXPiKLFLVpqDKoRdu8c2Yd4AJ_2B2UyXJxD3kJAyiJ=n0_Q@mail.gmail.com>
 <20230511220336.05866e80@nowhere>
In-Reply-To: <20230511220336.05866e80@nowhere>
From:   Vineeth Remanan Pillai <vineeth@bitbyteword.org>
Date:   Thu, 11 May 2023 16:40:46 -0400
Message-ID: <CAO7JXPg9K4MA7H63Num8-BHBT-Y=GQ3BnEEvaEMVKmYsXCY7Sg@mail.gmail.com>
Subject: Re: [PATCH 1/2] sched/deadline: accurate reclaim bandwidth for GRUB
To:     luca abeni <luca.abeni@santannapisa.it>
Cc:     Juri Lelli <juri.lelli@redhat.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Valentin Schneider <vschneid@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> >
> > I felt that, since we are using sequential reclaim mentioned in the
> > paper and we isolate all parameters per-cpu(except for extra_bw) we
> > could use the "-dq = -(U/Umax) dt" equation as it was simpler than
> > equation (3).
>
> This is the part I am not sure about...
>
> Maybe the best way to go is to split the patch: first you implement (1)
> (and use div64 to remove the approximation I used), then you implement
> (3) in a second patch.
>
> Finally, if removing the max{} is really needed you can do it in a
> third patch (but I would try to go with Equation 3 before removing the
> max{})
>
Sure, I shall split the patch. Joel also suggested splitting the patch
and I was probably wrong to think that the patch was simple to be a
single patch :-).

Since equation (3) has theoretical backing, I am perfectly fine with
using it for our fix. Will have 2 patches as you suggested.

Will get the v3 out soon..

Thanks,
Vineeth
