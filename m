Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E675C433FE
	for <linux-doc@archiver.kernel.org>; Wed, 20 Oct 2021 16:11:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1063C6139E
	for <linux-doc@archiver.kernel.org>; Wed, 20 Oct 2021 16:11:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231299AbhJTQNy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Oct 2021 12:13:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231297AbhJTQNx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Oct 2021 12:13:53 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EC6DC06161C
        for <linux-doc@vger.kernel.org>; Wed, 20 Oct 2021 09:11:39 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id t5-20020a17090a4e4500b001a0a284fcc2so866406pjl.2
        for <linux-doc@vger.kernel.org>; Wed, 20 Oct 2021 09:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ag+GDBPpay2LLVEOcsq5SOiTi6gV4/I9D3ibJJFrk1A=;
        b=UPvgsF/KSmvVLsT058wiAnaMCJJnIK5jUpt/Vbdo/c3R5ZHZayk6RFGfriajB8akct
         8rdsPUNMPNbNXCUU4KiauB4L9vrv+VgpELyMVKdtieIeGJCsBbZUCPkBQpubgwvmKG68
         hkU/jFxrQ8FJ8TaybVmO3Ss01Bwo6pMD9cdBwgHbg6FO/GvnKJ9GdPGlvXnWr/yEHZxL
         /BNdki9qHTrm3+leXF7NMMH2b/ti/uB/B+LSk/hYBgO1Tl1tyLPafYBXbEP+OJ3WFmuN
         CusBF6lh00zHbGVA4Sn1x5vxSoUglZJ9CJlK+mctEz5pPjNU33HMMM5jdgG8pRvtpVYL
         p/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ag+GDBPpay2LLVEOcsq5SOiTi6gV4/I9D3ibJJFrk1A=;
        b=B5O4RsM/FuC72Hg4BAfy1JkYILpmQjeqmuFNSXC8IF+KhmggBpMEN0SDSaMYLXkt0z
         rBdwjCkeTTWkegGnhtjdyTrDD2tzl0lDAQ6LhAtXdsOIFRSXFL/UClIN4fY5iR8XFO8U
         CkyudLZq/YuEa1TnvtEattWtJFuwiEn3UXcAU21t1jzRXl6kDnL7evrn8SAxyS+clgrK
         hCfHYkaREYc6MhcZyLYuy7L/HQHSOOQQRIli7Jr5clj4Rb+nzF/fc1d7ytYzAOYldgyY
         UZgoXa+zI7Amq15Ii7nodRAVHgPQaco0Qigz7B2UKwaeBravo3JHa7NIJkjKUkK+7NDk
         zDKw==
X-Gm-Message-State: AOAM532j/kMtzObTYXOfbjeLcaei+VgIMca9muz54dEQwdODDMAvoifu
        pbAkSg/X5HVwEyW7ZABT3J+rGjf9Jw6/hktFNcq/ng==
X-Google-Smtp-Source: ABdhPJxPWFiW4Nv0ConuWF0vhgfFeaHp7MhK+3Zfg9bGWnTXAq8ZL74lmZwVMbkKZX3y2+T1A0k/sJRFEnW+cYPGaxQ=
X-Received: by 2002:a17:902:6ac4:b0:13f:52e1:8840 with SMTP id
 i4-20020a1709026ac400b0013f52e18840mr2577plt.15.1634746298265; Wed, 20 Oct
 2021 09:11:38 -0700 (PDT)
MIME-Version: 1.0
References: <20211020013153.4106001-1-kaleshsingh@google.com>
 <20211020013153.4106001-4-kaleshsingh@google.com> <20211020114805.3fbb7d94@gandalf.local.home>
In-Reply-To: <20211020114805.3fbb7d94@gandalf.local.home>
From:   Kalesh Singh <kaleshsingh@google.com>
Date:   Wed, 20 Oct 2021 09:11:27 -0700
Message-ID: <CAC_TJvfsF9BF2wfGck1icX_Ya7dLWO+hOBA5cR56PPr0Dn9D9Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] tracing: Fix operator precedence for hist triggers expression
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Suren Baghdasaryan <surenb@google.com>,
        Hridya Valsaraju <hridya@google.com>,
        Namhyung Kim <namhyung@kernel.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Tom Zanussi <zanussi@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 20, 2021 at 8:48 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Tue, 19 Oct 2021 18:31:40 -0700
> Kalesh Singh <kaleshsingh@google.com> wrote:
>
> > @@ -2391,60 +2460,61 @@ static int check_expr_operands(struct trace_array *tr,
> >  static struct hist_field *parse_expr(struct hist_trigger_data *hist_data,
> >                                    struct trace_event_file *file,
> >                                    char *str, unsigned long flags,
> > -                                  char *var_name, unsigned int level)
> > +                                  char *var_name, unsigned int *n_subexprs)
> >  {
> >       struct hist_field *operand1 = NULL, *operand2 = NULL, *expr = NULL;
> >       unsigned long operand_flags;
> >       int field_op, ret = -EINVAL;
> >       char *sep, *operand1_str;
> >
> > -     if (level > 3) {
> > +     if (*n_subexprs > 3) {
>
> Why limit the sub expressions, and not just keep the limit of the level of
> recursion. We allow 3 levels of recursion, but we could have more than 3
> sub expressions.

The main reason for this is that it's predictable behavior form the
user's perspective. Before this patch the recursion always walked down
a single branch so limiting by level worked out the same as limiting
by sub expressions and is in line with the error the user would see
("Too many sub-expressions (3 max)"). Now that we take multiple paths
in the recursion, using the level to reflect the number of
sub-expressions would lead to only seeing the error in some of the
cases (Sometimes we allow 4, 5, 6 sub-expressions depending on how
balanced the tree is, and sometimes we error out on 4 - when the tree
is list-like). Limiting by sub-expression keeps this consistent
(always error out if we have more than 3 sub-expressions) and is in
line with the previous behavior.

- Kalesh

>
>
> If we have:  a * b + c / d - e * f / h
>
> It would break down into:
>               -
>        +            /
>    *       /     *     h
>  a   b   c  d  e  f
>
>
> Which I believe is 6 "sub expressions", but never goes more than three deep
> in recursion:
>
>    "a * b + c / d - e * f / h"
>
> Step 1:
>
>   op = "-"
>   operand1 = "a * b + c / d"
>   operand2 = "e * f / h"
>
> Process operand1: (recursion level 1)
>
>   op = "+"
>   operand1a = "a * b"
>   operand2a = "c / d"
>
> Process operand1a: (recursion level 2)
>
>   op = "*"
>   operand1b = "a"
>   operand2b = "b"
>
> return;
>
> Process operand1b: (recursion level 2)
>
>   op = "/"
>   operand1b = "c"
>   operand2b = "d"
>
> return;
>
> return;
>
> Process operand2: (recursion level 1)
>
>   op = "/"
>   operand1c = "e * f"
>   operand2c = "h"
>
> Process operand1c: (recursion level 2)
>
>   op = "*"
>   operand1c = "e"
>   operand2c = "f"
>
> return;
>
> return;
>
>
>
> > +
> > +     /* LHS of string is an expression e.g. a+b in a+b+c */
> > +     operand1 = parse_expr(hist_data, file, operand1_str, operand_flags, NULL, n_subexprs);
> >       if (IS_ERR(operand1)) {
> >               ret = PTR_ERR(operand1);
> >               operand1 = NULL;
>
> I wonder if we should look for optimizations, in case of operand1 and
> operand2 are both constants?
>
> Just perform the function, and convert it into a constant as well.
>
> -- Steve
