Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 444DB7D099
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 Jan 2019 21:42:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727395AbfAGVmX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 Jan 2019 16:42:23 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:33650 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727236AbfAGVmW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Jan 2019 16:42:22 -0500
Received: by mail-vs1-f66.google.com with SMTP id p74so1229423vsc.0
        for <linux-doc@vger.kernel.org>; Mon, 07 Jan 2019 13:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hS2gSuvP5ACAtJN0YLQzxg50f6d7JdKFNF6Mv5pVdRc=;
        b=BVEZhsTr7Kv3or/6ZyOwbwq6pvKwoZolGI/lgCHlldXD0uEJ20RyOeDuJKjiuFzaug
         t6SZ4ZCKE5+eJUTUIRDouV+xN4nF1Wasg2TxN8bAtF3lHI738dcu+6soQ2/KZJr3Vt9y
         3Ss/T6KKFbSm9bK0yoOMeLon/LFXYHKb2B+no=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hS2gSuvP5ACAtJN0YLQzxg50f6d7JdKFNF6Mv5pVdRc=;
        b=tWFQibOF6GXHf/sKyOMrIh3sJCdyVpkJsXXjir2cNTYlBdktdLCPs10yss3NpLv6/D
         dpPqYczqg/gwKn2RM22gn6Is9cxD94FrYvwQhSxpYsYJTpTytms7R+4UZqomm+JZF2ha
         v04TZkJUW2Rq/5rgjelzNaWHzEtx9q2cDEjcfP/KbLvBeaF9KpXQh1m/KJZSfAzyoKUC
         6b92xPfPj72v3xzrtdEUFfPARSmBLvwHwYKEIPsEp2s+lZXhIjjxOtI6/o1TDple0Ndq
         DVa994H7VZsdg5iqglIDO0kmstAazedHw/pqfR2V3Tkk+dF1l6iUrWLbWVQSfKGTxHK2
         cz/A==
X-Gm-Message-State: AA+aEWYw/TVmIS9UObZ8IZCoyFWG2UOkNllUovbYHs4lCs//onqxs1Ku
        1cASk6WbDLedS9QSVxD67B1TLxsntOM=
X-Google-Smtp-Source: ALg8bN5+hyMsZ7SGRRCaka9CB+DoS6glddA0B3vJPQVP7pB5t8ALopUjPtIMSpVxBcSf+DrpA3s/cQ==
X-Received: by 2002:a67:382:: with SMTP id 124mr25180750vsd.201.1546897340948;
        Mon, 07 Jan 2019 13:42:20 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id t13sm15775867uao.19.2019.01.07.13.42.19
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Jan 2019 13:42:19 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id h128so421684vkg.11
        for <linux-doc@vger.kernel.org>; Mon, 07 Jan 2019 13:42:19 -0800 (PST)
X-Received: by 2002:a1f:298e:: with SMTP id p136mr23091757vkp.40.1546897338734;
 Mon, 07 Jan 2019 13:42:18 -0800 (PST)
MIME-Version: 1.0
References: <1546873978-27797-1-git-send-email-longman@redhat.com> <1546873978-27797-2-git-send-email-longman@redhat.com>
In-Reply-To: <1546873978-27797-2-git-send-email-longman@redhat.com>
From:   Kees Cook <keescook@chromium.org>
Date:   Mon, 7 Jan 2019 13:42:07 -0800
X-Gmail-Original-Message-ID: <CAGXu5jL_jMM4PaPcrptc-sFA2X0QZM=upr5hqHFXnSkhvqPHLA@mail.gmail.com>
Message-ID: <CAGXu5jL_jMM4PaPcrptc-sFA2X0QZM=upr5hqHFXnSkhvqPHLA@mail.gmail.com>
Subject: Re: [PATCH 1/2] /proc/stat: Extract irqs counting code into show_stat_irqs()
To:     Waiman Long <longman@redhat.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Miklos Szeredi <miklos@szeredi.hu>,
        Daniel Colascione <dancol@google.com>,
        Dave Chinner <david@fromorbit.com>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jan 7, 2019 at 7:13 AM Waiman Long <longman@redhat.com> wrote:
>
> The code that generates the "intr" line of /proc/stat is now moved
> from show_stat() into a new function - show_stat_irqs(). There is no
> functional change.
>
> Signed-off-by: Waiman Long <longman@redhat.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  fs/proc/stat.c | 39 +++++++++++++++++++++++++++++----------
>  1 file changed, 29 insertions(+), 10 deletions(-)
>
> diff --git a/fs/proc/stat.c b/fs/proc/stat.c
> index 535eda7..4b06f1b 100644
> --- a/fs/proc/stat.c
> +++ b/fs/proc/stat.c
> @@ -79,12 +79,38 @@ static u64 get_iowait_time(int cpu)
>
>  #endif
>
> +static u64 compute_stat_irqs_sum(void)
> +{
> +       int i;
> +       u64 sum = 0;
> +
> +       for_each_possible_cpu(i) {
> +               sum += kstat_cpu_irqs_sum(i);
> +               sum += arch_irq_stat_cpu(i);
> +       }
> +       sum += arch_irq_stat();
> +       return sum;
> +}
> +
> +/*
> + * Print out the "intr" line of /proc/stat.
> + */
> +static void show_stat_irqs(struct seq_file *p)
> +{
> +       int i;
> +
> +       seq_put_decimal_ull(p, "intr ", compute_stat_irqs_sum());
> +       for_each_irq_nr(i)
> +               seq_put_decimal_ull(p, " ", kstat_irqs_usr(i));
> +
> +       seq_putc(p, '\n');
> +}
> +
>  static int show_stat(struct seq_file *p, void *v)
>  {
>         int i, j;
>         u64 user, nice, system, idle, iowait, irq, softirq, steal;
>         u64 guest, guest_nice;
> -       u64 sum = 0;
>         u64 sum_softirq = 0;
>         unsigned int per_softirq_sums[NR_SOFTIRQS] = {0};
>         struct timespec64 boottime;
> @@ -105,8 +131,6 @@ static int show_stat(struct seq_file *p, void *v)
>                 steal += kcpustat_cpu(i).cpustat[CPUTIME_STEAL];
>                 guest += kcpustat_cpu(i).cpustat[CPUTIME_GUEST];
>                 guest_nice += kcpustat_cpu(i).cpustat[CPUTIME_GUEST_NICE];
> -               sum += kstat_cpu_irqs_sum(i);
> -               sum += arch_irq_stat_cpu(i);
>
>                 for (j = 0; j < NR_SOFTIRQS; j++) {
>                         unsigned int softirq_stat = kstat_softirqs_cpu(j, i);
> @@ -115,7 +139,6 @@ static int show_stat(struct seq_file *p, void *v)
>                         sum_softirq += softirq_stat;
>                 }
>         }
> -       sum += arch_irq_stat();
>
>         seq_put_decimal_ull(p, "cpu  ", nsec_to_clock_t(user));
>         seq_put_decimal_ull(p, " ", nsec_to_clock_t(nice));
> @@ -154,14 +177,10 @@ static int show_stat(struct seq_file *p, void *v)
>                 seq_put_decimal_ull(p, " ", nsec_to_clock_t(guest_nice));
>                 seq_putc(p, '\n');
>         }
> -       seq_put_decimal_ull(p, "intr ", (unsigned long long)sum);
> -
> -       /* sum again ? it could be updated? */
> -       for_each_irq_nr(j)
> -               seq_put_decimal_ull(p, " ", kstat_irqs_usr(j));
> +       show_stat_irqs(p);
>
>         seq_printf(p,
> -               "\nctxt %llu\n"
> +               "ctxt %llu\n"
>                 "btime %llu\n"
>                 "processes %lu\n"
>                 "procs_running %lu\n"
> --
> 1.8.3.1
>


-- 
Kees Cook
