Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEFB0C433F5
	for <linux-doc@archiver.kernel.org>; Fri,  1 Apr 2022 16:19:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354787AbiDAQUp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 1 Apr 2022 12:20:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349158AbiDAQRp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Apr 2022 12:17:45 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AAF81C4B32
        for <linux-doc@vger.kernel.org>; Fri,  1 Apr 2022 08:41:23 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id o13so2656998pgc.12
        for <linux-doc@vger.kernel.org>; Fri, 01 Apr 2022 08:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pqJWbvvbg0qdWklwqs2qhrfKKi69liUYvCt62FUbnWk=;
        b=Fn5jpMZAmMPReAvL0Tyf7tj5rAcmThNhnq1xKoKFkJI0vR0fJhwRbtqFchPRvfX4q1
         ONoUm1fDJi9X/SdotI5xdBPmgeBbrWo8/YaW2ybUubSt1izJy97NcFaxs+dJxWC0WBMf
         6z+iwlN+sbK2nfsp4T5xwzKsl3sE9+883flPy03nnksy67+Yj2ZYN4oSkYQiIHtJaUUH
         6+GoJw85rhIbSF3mvBhZg+VFZFkJaWhhkPhJhHoJqg/NLIlaGVi7lJF460tom7CJNf71
         QLXswXjH3yWTPwjM8DWIfiObLitVJeSiXu0UH1DAOa8qNyI5WVPl/7tgONlEth6eYrLf
         Uwag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pqJWbvvbg0qdWklwqs2qhrfKKi69liUYvCt62FUbnWk=;
        b=oczrah+jYhEX1e4DT9nVmw8pWItwC8fPYDAwTUkDOOaaTkfV/gO40hLVrQ9kLVgRf1
         IiPy9bVtKyiuGZEoAdqbAJ+3rbPBAzi6Jdz1ldNVyFJgoG2uUg+05XQPtirCRlFoaqNX
         LkdmImKAqiSFuiwUquItznDnYi/RL+moACiCWtpkEoQjHqFXTTW7y8VLu1Plbib54NkI
         bnToI/uWLFRmBJGDU8zrz4v+mQkiMmnWo9m8SAdk2xtesGiWc+Hpg+80uVDV8h4txAao
         1QfDfLHqS9emFLpur87XDP2jGFxpgtyAy2wv0EXzB5yzWlliVC2YJqMuL/Ebo7j4QgNw
         7zdA==
X-Gm-Message-State: AOAM533kt9QkA1yZlg1Os8oQCJb7BdUQXMslDGQtrRbVZy7DkyXr7S2K
        MpGARDU1aklr25Ix5757GVuMJhx5OS+YQ17RVra23A==
X-Google-Smtp-Source: ABdhPJxICFXuqj/lX5mtK0KnO7e8FwZzOC70mH0krkoDwxL8TroQr5Ghmg+DK+Zw9WUBYtZMvmLXl8GvFlOCo2bG5as=
X-Received: by 2002:a05:6a00:2392:b0:4fa:dcd2:5bc1 with SMTP id
 f18-20020a056a00239200b004fadcd25bc1mr11451248pfc.8.1648827682692; Fri, 01
 Apr 2022 08:41:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220331084151.2600229-1-yosryahmed@google.com>
 <YkXkA+Oh1Bx33PrU@carbon.dhcp.thefacebook.com> <CAJD7tkZxqWg2NRi=83wSWLiykZBfrP8Kx_C5JWy48=rZoBWoHw@mail.gmail.com>
In-Reply-To: <CAJD7tkZxqWg2NRi=83wSWLiykZBfrP8Kx_C5JWy48=rZoBWoHw@mail.gmail.com>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Fri, 1 Apr 2022 08:41:11 -0700
Message-ID: <CALvZod7TSQ2RdL4iKx5egYOtDvZdGY--T90As_guZK+BoBvAOw@mail.gmail.com>
Subject: Re: [PATCH resend] memcg: introduce per-memcg reclaim interface
To:     Yosry Ahmed <yosryahmed@google.com>
Cc:     Roman Gushchin <roman.gushchin@linux.dev>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Michal Hocko <mhocko@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Rientjes <rientjes@google.com>,
        Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Cgroups <cgroups@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>, Jonathan Corbet <corbet@lwn.net>,
        Yu Zhao <yuzhao@google.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Wei Xu <weixugc@google.com>, Greg Thelen <gthelen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 1, 2022 at 2:16 AM Yosry Ahmed <yosryahmed@google.com> wrote:
>
[...]
> > > +     {
> > > +             .name = "reclaim",
> > > +             .flags = CFTYPE_NOT_ON_ROOT | CFTYPE_NS_DELEGATABLE,
> > > +             .write = memory_reclaim,
> >
> > Btw, why not on root?
>
> I missed the root question in my first reply. I think this was
> originally modeled after the memory.high interface, but I don't know
> if there are other reasons. Shakeel would know better.
>
> AFAIK this should work naturally on root as well, but I think it makes
> more sense then to use a global interface (hopefully introduced soon)?
> I don't have an opinion here let me know what you prefer for v2.

We will follow the psi example which is exposed for root as well as
for system level in procfs but both of these (for memory.reclaim) are
planned as the followup feature.
