Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.2 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01AFEC433F5
	for <linux-doc@archiver.kernel.org>; Wed, 15 Sep 2021 17:04:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D729861246
	for <linux-doc@archiver.kernel.org>; Wed, 15 Sep 2021 17:04:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbhIORGP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Sep 2021 13:06:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbhIORGP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Sep 2021 13:06:15 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BABAC061764
        for <linux-doc@vger.kernel.org>; Wed, 15 Sep 2021 10:04:56 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id b18so6186468lfb.1
        for <linux-doc@vger.kernel.org>; Wed, 15 Sep 2021 10:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QiL7YfwCSR7LokE5J56usk6i2TFHnfpVhu2pbczR/rY=;
        b=YjgBRMW6BxNZ9RQ3OrB64PcgAbpzCvURuVzS2ChPGQ9FOfcjAuiJ7nOYupy9eB316J
         1NZt9Ps0lkvdwH0tDss0B+Lg5rtk1l4NTDZwUiJsDF4T3zxmRk1zqgBcgsBqAFfdu7/5
         6l9Ztk6P9WF+a8hA1jgJj9VOxjhHhOx9y4kPo54MY7fqix74AHRoTUQ1EDWkE0j4G377
         2uJ8qxBYEA1cW8jAd8iVorR13sx3cItzUFzoj07UXEzzHRNn6hyAlkBex7PDCLU8gQSA
         vhVIZn+mQpAee7wuK8C4+KrKqs7KOrVZN55UAlWSX2/Z/zzfWt1i78uNilaLmN6eLC4B
         yUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QiL7YfwCSR7LokE5J56usk6i2TFHnfpVhu2pbczR/rY=;
        b=FtdyiNTaRzoBv9j/GMBu1O0kqftM+XnubEHnrK+BZQiunTY480jIqkqzX1sr+hmRfT
         n1u31KzLsUA9cNiwCI9XYIZqw1k3RjDXhFR1rsap+vCm16Q8PzpN87gnfwxw3ACHlc2M
         A3TKagIMpYBJN/j/cvhCfJwyJd29B7spWHW4vLLg5J3HRnqZHp/Y2hmJacqVUbbH2ZXM
         bHHr4XiJHEteY3QtAToHpI+jgud09SmfHaVeJr0Vy1izMAHqLrLiFwEBatE4/i4hCssO
         PJMlsGXieajC6w7iOb2mXLqM2cwENoCUMInsDBIjVoDJj0HohT0gYbLc1UguuapsP5rZ
         oOKA==
X-Gm-Message-State: AOAM533zJUre9Gbgc8shlix6+kMXBMQcyENyYOQDWuy/5aKnnNwF4tFJ
        OpaV7ZFY05EYBk4kBKYq4u8FkAT0+eF0YO8YfQKSWw==
X-Google-Smtp-Source: ABdhPJyPOjV0ZpbMt3W6lj6EoQRoL7MRqeIFJLX3H5JfFbprdhI8dXfa7UQ0YFUHuvKQmtzNEFB6m5Zf2bMrT45EqbM=
X-Received: by 2002:ac2:5fb2:: with SMTP id s18mr730787lfe.580.1631725493981;
 Wed, 15 Sep 2021 10:04:53 -0700 (PDT)
MIME-Version: 1.0
References: <3834f917d50a6f19402e179e917ef6a9dde5f64a.1631671936.git.brookxu@tencent.com>
In-Reply-To: <3834f917d50a6f19402e179e917ef6a9dde5f64a.1631671936.git.brookxu@tencent.com>
From:   Vipin Sharma <vipinsh@google.com>
Date:   Wed, 15 Sep 2021 10:04:18 -0700
Message-ID: <CAHVum0d657HeoSyXS9RGW8YHkwJFmvLQ6ebwYy_wVnR0gM8uPQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] misc_cgroup: introduce misc.events to count failures
To:     brookxu <brookxu.cn@gmail.com>
Cc:     tj@kernel.org, lizefan.x@bytedance.com, hannes@cmpxchg.org,
        mkoutny@suse.com, corbet@lwn.net, linux-kernel@vger.kernel.org,
        cgroups@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 14, 2021 at 7:18 PM brookxu <brookxu.cn@gmail.com> wrote:
>
> From: Chunguang Xu <brookxu@tencent.com>
>
> Introduce misc.events to make it easier for us to understand
> the pressure of resources. Currently only the 'max' event is
> implemented, which indicates the times the resource is about
> to exceeds the max limit.
>
> Signed-off-by: Chunguang Xu <brookxu@tencent.com>
> ---
>
> v3: remove misc.events.local.
> v2: remove cgroup v1 files.
>
>  include/linux/misc_cgroup.h |  5 +++++
>  kernel/cgroup/misc.c        | 24 ++++++++++++++++++++++++
>  2 files changed, 29 insertions(+)
>
> diff --git a/include/linux/misc_cgroup.h b/include/linux/misc_cgroup.h
> index da2367e..091f2d2 100644
> --- a/include/linux/misc_cgroup.h
> +++ b/include/linux/misc_cgroup.h
> @@ -36,6 +36,7 @@ enum misc_res_type {
>  struct misc_res {
>         unsigned long max;
>         atomic_long_t usage;
> +       atomic_long_t events;
>         bool failed;
>  };
>
> @@ -46,6 +47,10 @@ struct misc_res {
>   */
>  struct misc_cg {
>         struct cgroup_subsys_state css;
> +
> +       /* misc.events */
> +       struct cgroup_file events_file;
> +
>         struct misc_res res[MISC_CG_RES_TYPES];
>  };
>
> diff --git a/kernel/cgroup/misc.c b/kernel/cgroup/misc.c
> index ec02d96..4b2b492 100644
> --- a/kernel/cgroup/misc.c
> +++ b/kernel/cgroup/misc.c
> @@ -171,6 +171,11 @@ int misc_cg_try_charge(enum misc_res_type type, struct misc_cg *cg,
>         return 0;
>
>  err_charge:
> +       for (j = i; j; j = parent_misc(j)) {
> +               atomic_long_inc(&j->res[type].events);
> +               cgroup_file_notify(&j->events_file);
> +       }
> +
>         for (j = cg; j != i; j = parent_misc(j))
>                 misc_cg_cancel_charge(type, j, amount);
>         misc_cg_cancel_charge(type, i, amount);
> @@ -335,6 +340,19 @@ static int misc_cg_capacity_show(struct seq_file *sf, void *v)
>         return 0;
>  }
>
> +static int misc_events_show(struct seq_file *sf, void *v)
> +{
> +       struct misc_cg *cg = css_misc(seq_css(sf));
> +       unsigned long events, i;
> +
> +       for (i = 0; i < MISC_CG_RES_TYPES; i++) {
> +               events = atomic_long_read(&cg->res[i].events);
> +               if (READ_ONCE(misc_res_capacity[i]) || events)
> +                       seq_printf(sf, "%s.max %lu\n", misc_res_name[i], events);
> +       }
> +       return 0;
> +}
> +
>  /* Misc cgroup interface files */
>  static struct cftype misc_cg_files[] = {
>         {
> @@ -353,6 +371,12 @@ static int misc_cg_capacity_show(struct seq_file *sf, void *v)
>                 .seq_show = misc_cg_capacity_show,
>                 .flags = CFTYPE_ONLY_ON_ROOT,
>         },
> +       {
> +               .name = "events",
> +               .flags = CFTYPE_NOT_ON_ROOT,
> +               .file_offset = offsetof(struct misc_cg, events_file),
> +               .seq_show = misc_events_show,
> +       },
>         {}
>  };
>
> --
> 1.8.3.1
>

Reviewed-by: Vipin Sharma <vipinsh@google.com>
