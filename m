Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8C49A7D08A
	for <lwn-linux-doc@archive.lwn.net>; Thu,  1 Nov 2018 02:58:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727065AbeKAL7n (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 1 Nov 2018 07:59:43 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:46545 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbeKAL7n (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Nov 2018 07:59:43 -0400
Received: by mail-io1-f67.google.com with SMTP id y22-v6so11242551ioj.13
        for <linux-doc@vger.kernel.org>; Wed, 31 Oct 2018 19:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QOSxRggcjUksRsOCf6mfNAeYLRROOH7cdOzQ/0UZTUk=;
        b=HJVMfI+jP8qwJ+T5gXrMmsDmI+ofJOL1Zc7zim6jzTGGjBzvvmdaAUYNxAcOCyoCZy
         l2BbePFTLM8Xe7YOYDtJVOQBYIZquZv0DLCEil4aRxYlAUlkJQ9UBUU4/DZysgJ5+GCR
         pRUeNr2la3NA+fWqclBbCtByJkyXS7UBZ8WCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QOSxRggcjUksRsOCf6mfNAeYLRROOH7cdOzQ/0UZTUk=;
        b=f2DaaIHfyXlkLVzaJcq+CKYAtE6FR8Pi0GGBYzbirfRj6qKDRtVUNnXknJFoFjs9j1
         AtWeYTIQqQDGXAp/vBIHaPn9S8YenZ4muvT1Oomr4+WX0zY3ni9PcXfIlm5URKZzmn09
         C6hrHbWO2Bs/N5vEuOpbBNHqMtGU1dq/OytkTKSuP7qC8aav/QMHptwAyAqqYt+loFy0
         TtrBhTmn8/Tg2KGKnJdyO2A0ZLOSXlUqyIO541ya/BPeRXGpBeh2tTAFF2qmAuQhH5Vc
         Q17ozAxJL+iseB1unE86nH0ed3pl0s5Qfdh1LZjvTW81halmuZLKrjqp5FM0xTry2bCC
         FT2Q==
X-Gm-Message-State: AGRZ1gK6tfYCORHoPYa2P0oaNeGrbtopMFfjPXZvGjplULgfj28cj0fe
        X5qSZs8/1hd9sDwA2yODuw/+yy7owmAta5gqaaOGwmCnoB47Fg==
X-Google-Smtp-Source: AJdET5eZA+CWKB3xMB0hzxG9LyRzNKdrWtn4v/9O4XdnjqqJTf5GvP/0beC1RDChfnU77Yt0UhEG+fBV1EhpsBA/Ruc=
X-Received: by 2002:a6b:acc5:: with SMTP id v188-v6mr4363558ioe.66.1541041122644;
 Wed, 31 Oct 2018 19:58:42 -0700 (PDT)
MIME-Version: 1.0
References: <20181024013132.115907-1-dbasehore@chromium.org> <20181024013132.115907-3-dbasehore@chromium.org>
In-Reply-To: <20181024013132.115907-3-dbasehore@chromium.org>
From:   "dbasehore ." <dbasehore@chromium.org>
Date:   Wed, 31 Oct 2018 19:58:31 -0700
Message-ID: <CAGAzgsp-tuSAThRGPtGM98opK0pJ5OfmxB9tx+9VBuxT6rz3cA@mail.gmail.com>
Subject: Re: [PATCH 2/6] clk: fix clk_calc_subtree compute duplications
To:     linux-kernel <linux-kernel@vger.kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-doc@vger.kernel.org,
        sboyd@kernel.org, Michael Turquette <mturquette@baylibre.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        aisheng.dong@nxp.com, mchehab+samsung@kernel.org,
        Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 23, 2018 at 6:31 PM Derek Basehore <dbasehore@chromium.org> wrote:
>
> clk_calc_subtree was called at every step up the clk tree in
> clk_calc_new_rates. Since it recursively calls itself for its
> children, this means it would be called once on each clk for each
> step above the top clk is.
>
> This fixes this by breaking the subtree calculation into two parts.
> The first part recalcs the rate for each child of the parent clk in
> clk_calc_new_rates. This part is not recursive itself. The second part
> recursively calls a new clk_calc_subtree on the clk_core that was
> passed into clk_set_rate.
>
> Signed-off-by: Derek Basehore <dbasehore@chromium.org>
> ---
>  drivers/clk/clk.c | 30 ++++++++++++++++++++----------
>  1 file changed, 20 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 95d818f5edb2..61de8ad3e4cf 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1717,11 +1717,19 @@ static int __clk_speculate_rates(struct clk_core *core,
>         return ret;
>  }
>
> -static void clk_calc_subtree(struct clk_core *core, unsigned long new_rate,
> -                            struct clk_core *new_parent, u8 p_index)
> +static void clk_calc_subtree(struct clk_core *core)
>  {
>         struct clk_core *child;
>
> +       hlist_for_each_entry(child, &core->children, child_node) {
> +               child->new_rate = clk_recalc(child, core->new_rate);
> +               clk_calc_subtree(child);
> +       }
> +}
> +
> +static void clk_set_change(struct clk_core *core, unsigned long new_rate,
> +                          struct clk_core *new_parent, u8 p_index)
> +{
>         core->new_rate = new_rate;
>         core->new_parent = new_parent;
>         core->new_parent_index = p_index;
> @@ -1729,11 +1737,6 @@ static void clk_calc_subtree(struct clk_core *core, unsigned long new_rate,
>         core->new_child = NULL;
>         if (new_parent && new_parent != core->parent)
>                 new_parent->new_child = core;
> -
> -       hlist_for_each_entry(child, &core->children, child_node) {
> -               child->new_rate = clk_recalc(child, new_rate);
> -               clk_calc_subtree(child, child->new_rate, NULL, 0);
> -       }
>  }
>
>  /*
> @@ -1744,7 +1747,7 @@ static struct clk_core *clk_calc_new_rates(struct clk_core *core,
>                                            unsigned long rate)
>  {
>         struct clk_core *top = core;
> -       struct clk_core *old_parent, *parent;
> +       struct clk_core *old_parent, *parent, *child;
>         unsigned long best_parent_rate = 0;
>         unsigned long new_rate;
>         unsigned long min_rate;
> @@ -1791,6 +1794,8 @@ static struct clk_core *clk_calc_new_rates(struct clk_core *core,
>                 /* pass-through clock with adjustable parent */
>                 top = clk_calc_new_rates(parent, rate);
>                 new_rate = parent->new_rate;
> +               hlist_for_each_entry(child, &parent->children, child_node)
> +                       child->new_rate = clk_recalc(child, new_rate);
>                 goto out;
>         }
>
> @@ -1813,11 +1818,14 @@ static struct clk_core *clk_calc_new_rates(struct clk_core *core,
>         }
>
>         if ((core->flags & CLK_SET_RATE_PARENT) && parent &&
> -           best_parent_rate != parent->rate)
> +           best_parent_rate != parent->rate) {
>                 top = clk_calc_new_rates(parent, best_parent_rate);
> +               hlist_for_each_entry(child, &parent->children, child_node)
> +                       child->new_rate = clk_recalc(child, parent->new_rate);
> +       }
>
>  out:
> -       clk_calc_subtree(core, new_rate, parent, p_index);
> +       clk_set_change(core, new_rate, parent, p_index);
>
>         return top;
>  }
> @@ -2018,6 +2026,8 @@ static int clk_core_set_rate_nolock(struct clk_core *core,
>         if (ret)
>                 return ret;
>
> +       clk_calc_subtree(core);

This should be:
hlist_for_each_entry(child, core->new_parent? core->new_parent :
core->parent, child_node)
  clk_calc_subtree(child);

> +
>         /* notify that we are about to change rates */
>         fail_clk = clk_propagate_rate_change(top, PRE_RATE_CHANGE);
>         if (fail_clk) {
> --
> 2.19.1.568.g152ad8e336-goog
>
