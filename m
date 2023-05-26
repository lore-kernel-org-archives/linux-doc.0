Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 889A0C7EE23
	for <linux-doc@archiver.kernel.org>; Fri, 26 May 2023 14:54:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237425AbjEZOyZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 26 May 2023 10:54:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243955AbjEZOyW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 May 2023 10:54:22 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C910BD8
        for <linux-doc@vger.kernel.org>; Fri, 26 May 2023 07:54:20 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-39831cb47fbso579345b6e.1
        for <linux-doc@vger.kernel.org>; Fri, 26 May 2023 07:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bitbyteword.org; s=google; t=1685112860; x=1687704860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+56fY/5+2HGaZ2hqcCU8ZKhJQzE36DT9siXObgPb4sI=;
        b=SEtT0oQS+/fYOqtyGxZV+9T8fQAcpAAz8D+5UIIbdwLy/e03Eyw650js8GGTl99QJ7
         S0QPylmP8Wawzc7usyDjLPFQnn5/VjVEAh6PBarGE2G7wYHQKXKws8jQAcS/4IGZXdw+
         6aIly0yimW2hgXTW9xL2SrEzt6xKhitlAIhCfg2pOl3fH2tKoIJhUuaDqvookoNEMUvK
         WidId6TRRPEjDugBLtT5ErJyIKExi96NJb28feeEJrPBGitxjFvnqvACWjXHxndQjx/q
         ojOqiAwdZS8FoyvDjIrwE9g1dmCNZmD/FzGFo+3iIaUmZhwmgUbQc5sM6Z2zyHdGl5lx
         mzeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685112860; x=1687704860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+56fY/5+2HGaZ2hqcCU8ZKhJQzE36DT9siXObgPb4sI=;
        b=ktLcl1q/EsH0SK/KPRMgiWxlWeiTpVcuffd4PLBlHzQghKa9BEbohrKLkpjWoLhehm
         kxPnHmIC5oPkCre1KYGDxnpeyIehNg2u0ly3jOEZJN0np1CNSMnHGb06fprgV57d1sI9
         nDhkxsdOR3FxslWMra01c7zaOYu0TNUh0e6GJC+9htKHHFd2gdccZKKUii7pVvquXnGx
         oP38d3YoDJxWRk9mj3eCdhq7RlihBjSNWDybc4GjqfqnoSnrnWaIAcKh+NNWZ/ocNVHy
         lP+Arb2NCTcE1OYP0uzGk5S87CvtIQ3OYquyhPoinqURv6uY5lcYaZ8hSFBD61kY/Nup
         QYlw==
X-Gm-Message-State: AC+VfDwqKrHafnbWFqoLT2EAkJJRqmp6JfYTDkmKMnjlXVAFsKblGYrN
        335HPfGRalrjvFdKNzGZz6VqoyAIq6QPLS204UUl1Q==
X-Google-Smtp-Source: ACHHUZ7FFbPzPwjbPfj3GZk2NOBKYF3PNOSEy2uYN47Ub556uDf5WyWkrw7cf99AoSP72AUFgwbl7zPejSPPx3uLT2g=
X-Received: by 2002:a05:6808:7c2:b0:398:10ad:e83e with SMTP id
 f2-20020a05680807c200b0039810ade83emr1068039oij.1.1685112859881; Fri, 26 May
 2023 07:54:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230515025716.316888-1-vineeth@bitbyteword.org>
 <20230515025716.316888-3-vineeth@bitbyteword.org> <20230515100616.33ba5dd9@luca64>
 <CAO7JXPgq8V5yHM6F2+iXf4XJ9cyT30Hn4ot5b2k7srjsaPc3JQ@mail.gmail.com>
 <20230516093729.0771938c@luca64> <CAO7JXPh5uLV4QjAEi6bJXfAGSsZ=XsnCyzrvKS8m35BGbRPYJw@mail.gmail.com>
 <20230519115621.2b3f75e2@luca64> <20230519121804.6c85a3ed@luca64>
 <CAO7JXPhZPvzVRyL87qNT5VnaVOf=0wrRftFB-Rjx-vJc3JUMog@mail.gmail.com>
 <20230520115857.3838a7ea@nowhere> <CAO7JXPgXi8q02HBeBR_RLWmODd9uQBH_UMCYgVQwbf+FX=Qxkg@mail.gmail.com>
 <20230523225831.60d75b38@nowhere> <CAO7JXPihFGX5Dop=ox3YDQ=8aQbzZ-ka_1h3hT1G46vsbxpzNw@mail.gmail.com>
In-Reply-To: <CAO7JXPihFGX5Dop=ox3YDQ=8aQbzZ-ka_1h3hT1G46vsbxpzNw@mail.gmail.com>
From:   Vineeth Remanan Pillai <vineeth@bitbyteword.org>
Date:   Fri, 26 May 2023 10:54:09 -0400
Message-ID: <CAO7JXPhDCzJOvanKG=04wU3Q=C6GRW=+t2Zq6GmuQvfutjE8PA@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] sched/deadline: Fix reclaim inaccuracy with SMP
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
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Luca,

On Tue, May 23, 2023 at 10:11=E2=80=AFPM Vineeth Remanan Pillai
<vineeth@bitbyteword.org> wrote:
>
> Hi Luca,
>
> [...]
>
> Will send it out tomorrow after a bit more testing.
>
Sorry for the delay. I was trying to fix the inaccuracy when normal
and SCHED_FLAG_RECLAIM tasks are present. Its a bit complicated than
I initially thought as Umax_reclaim and Uextra needs to be computed
at the root domain level and this would mean more locking. I have a
patch ready but I think I need to do more testing to understand the
performance implications and it is better to batch it as a separate
series.

So, I am just sending out the GRUB equation fix which is tested well
and I am confident about. Will send out rest of the fixes later as
a separate series.

Thanks,
Vineeth
