Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F2F0C77B73
	for <linux-doc@archiver.kernel.org>; Fri, 26 May 2023 16:16:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237400AbjEZQQE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 26 May 2023 12:16:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237386AbjEZQQC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 May 2023 12:16:02 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DDAFA4
        for <linux-doc@vger.kernel.org>; Fri, 26 May 2023 09:16:01 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6af6ec3df42so1027813a34.2
        for <linux-doc@vger.kernel.org>; Fri, 26 May 2023 09:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bitbyteword.org; s=google; t=1685117761; x=1687709761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDlTDGbuKA41l4lwuGymi6rlTXSveie0ey6DiI9icGU=;
        b=Euf4o/Ygy5/YJmgSUbCtF0/jd8I0XGXo124m4zSjqOcCspN+5euc9GO9amwQ8qbRRS
         KTj1qRcNdtrAt/qeRlywDd3rnPFwtUZvDNb3x+srvwIFThIeJlCKlnZjzir9tjhIIlgf
         Rx6dM8+nmjie2qXwVg03inZ5RXO4KVQSiK0QgPdtd+YYVEF/1MIAey999UPFNUvTPaew
         0ne+Y/jdf59V/UQeTU1n4j9DOhPrT9ZHjOUalbwj4EO2DEJn7+Lqie1H01c79WyyLHqT
         griEAuUytczKujqalE+3++1zozEHsZ8ztxkSnKmj3Yn9RmpzyoKcQxKBLSSqqK4hs4tC
         ywog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685117761; x=1687709761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yDlTDGbuKA41l4lwuGymi6rlTXSveie0ey6DiI9icGU=;
        b=MiYndjx6fg6sl4DpJzXNh6RNP6tcj1JBEnx+kDMjYDj8/SzaAKiGGFr6AA2x/Imgaf
         BEo/RXtxdcyvfeoS6u3EIVAusWYPC2VYQEpNjQlKTOxa8+8/qzIr8ewxD112AutBxhu+
         VsTMERVlRZTa54JUWhRrAzERzYVwXmn7ZPsNcaLslsQufGoCNsSP5arIGzbeOWhKBkhw
         oLyW/qkK6/CFXHWGKAGpJpu4iNigZUMroMTkGSDtZlY7rdLalNofM0Cz73WEnmN9Lxoh
         TBjlOQ4c1hO1MXFEvlgnSnddNWu8RcmMvViDm7vp5F0qmXgOrZvXvdYWgjOqhYejaIUx
         4t/A==
X-Gm-Message-State: AC+VfDxbvMvT3bJddEmOuDmhDGmF6rKwASJA1y7yOD7Bj+6S04f6wdNF
        BHOukxKVD5NjEbOd7s61CD/EnaKCzVmEa4Y+c2Htxw==
X-Google-Smtp-Source: ACHHUZ4h1so23xGA2B3TC0WeilISx3hYkfkFiojRcVtTpd4y89tXJ9rmMtaDQ2e0iM3blS1V6Cdu7cPRH4w+bvXB/ZA=
X-Received: by 2002:a9d:6ad3:0:b0:6af:7818:add2 with SMTP id
 m19-20020a9d6ad3000000b006af7818add2mr1056477otq.37.1685117760931; Fri, 26
 May 2023 09:16:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230526145519.2282062-1-vineeth@bitbyteword.org>
 <20230526172959.5440b9dd@nowhere> <CAO7JXPgLFgXANqXY7L-YLbijxJCOgUKmd8nUQizb62JorOXGhA@mail.gmail.com>
 <CAO7JXPit6snFM2oW-uSs-mtbmKr9wpbX2exqAUF0iAiaAO6hOg@mail.gmail.com>
In-Reply-To: <CAO7JXPit6snFM2oW-uSs-mtbmKr9wpbX2exqAUF0iAiaAO6hOg@mail.gmail.com>
From:   Vineeth Remanan Pillai <vineeth@bitbyteword.org>
Date:   Fri, 26 May 2023 12:15:50 -0400
Message-ID: <CAO7JXPgf9ffVQ3n9iD8-1abuDSAZHWAZmz56BmM68uJZ7uy+Uw@mail.gmail.com>
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

On Fri, May 26, 2023 at 11:58=E2=80=AFAM Vineeth Remanan Pillai
<vineeth@bitbyteword.org> wrote:
>
> > > ...But I think this is wrong (should be "Umax - ...", not "1 - ...").
> > > I think patch 2/2 has the same issue.
> > >
> > Oops sorry, I missed this. Will send the fixed patch as a
> > reply to the original v4.
> >
> On looking again, I think the description is correct. That line
> mentions the actual m-GRUB equation from the paper. And then the
> comment explains why we use Umax(because of limiting the bandwidth
> to RT capacity).
>
Ahh my bad again :-(, I was looking at the commit message. I see the
issue in the code comment now.

I have just sent the fix as a reply to the initial patch. I shall send a
v5 if needed. Please let me know.

Thanks,
Vineeth
