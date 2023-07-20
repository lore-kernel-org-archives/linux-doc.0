Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4289FEB64DA
	for <linux-doc@archiver.kernel.org>; Thu, 20 Jul 2023 20:59:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbjGTU7o (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Jul 2023 16:59:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229821AbjGTU7m (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Jul 2023 16:59:42 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5059D2D62
        for <linux-doc@vger.kernel.org>; Thu, 20 Jul 2023 13:59:09 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-346258cf060so35995ab.0
        for <linux-doc@vger.kernel.org>; Thu, 20 Jul 2023 13:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689886748; x=1690491548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DwZ5fXf8YtsT6+X1dt0HNi/DCNDf4xsCXWX4xprI2rw=;
        b=0tIvtBuLDGSc3J8LfcEzF3fWH2Po4Y6IfPf/u1bpSpAeHdEUr5qW/54AqEsUjRFE2r
         GHNTBEO6YRDgawyM4F7CGCHU616uETV86Qyr55dx/nol0vauyTUfSI+OgnwNKwpJCuU2
         C61nnSSa/B56qL4aiGipoLm8VrHLaQTmxwnCsYXLcuWzwUzAEaHFRdaHurql6Ihc2fio
         xu7pv+askxPkKnCnbvVuG7IR8WLLzGg+5+xiWR3kKTsXMLUgw8g/zJYwxp1in5kaj7xH
         4Lk9WHGa6k15Cif6z5/EZYZdhcakLgJxWhXFha2XbNwoUMKRfoeO9Zze+VnHMaCdVFGm
         pgew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689886748; x=1690491548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DwZ5fXf8YtsT6+X1dt0HNi/DCNDf4xsCXWX4xprI2rw=;
        b=RUF65sqFyb0Bg51TiAra+BnEzAlAt3I6YZ9QoR7ynfgDW/RUyxHb+ab+VntWlBS2kK
         TLkBJ7CaNOeGSLFm7N8tEnpkFwTLOXyseWSbEZOFxCCsdnvSZH8gHSHrTvX0Y94ffBzB
         xzdpbBf+eNPNGcX18NG9mDfPZE5Mj6tgkcNIRuY4ZRay55Io40xALwk2kSIav2gax/I6
         WnSLLYjmGOxTzJf59pRH2JrE4TNZYX4Y5IAvth6jAjgjWGhojcZjKFWk+/Y4Z0ikKVoA
         sx2pcYVfY2KKDBHrUAj6PEapno3G1EUgPj49hf/0UqJMAYrBzAp7FE3ahR17apUYgafm
         zpwg==
X-Gm-Message-State: ABy/qLZ9KfIEP1+4QKkO62ZACuUxgPk++KJ5EgeDcVHD60XVjsbRrTPW
        bGDlx96e34+J5rah5N6LR8fqVnNRKD1paOwV1DJwPg==
X-Google-Smtp-Source: APBJJlEUJUtr2UHyBrENVzCQMi/MMfsg04kTIDa0DRLRTCfX8QZGwQ0UBo2yaVjKFMr8ia4N8qYiGUrFrP2cIEsi3JQ=
X-Received: by 2002:a05:6e02:12cf:b0:346:5a8b:545e with SMTP id
 i15-20020a056e0212cf00b003465a8b545emr71141ilm.14.1689886747689; Thu, 20 Jul
 2023 13:59:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230720194727.67022-1-kim.phillips@amd.com>
In-Reply-To: <20230720194727.67022-1-kim.phillips@amd.com>
From:   Jim Mattson <jmattson@google.com>
Date:   Thu, 20 Jul 2023 13:58:56 -0700
Message-ID: <CALMp9eTBWWcApb50432zZEGg+PMCzUELaZvdkzYngNSrriimWA@mail.gmail.com>
Subject: Re: [PATCH] x86/cpu: Enable STIBP if Automatic IBRS is enabled
To:     Kim Phillips <kim.phillips@amd.com>
Cc:     x86@kernel.org, Tom Lendacky <thomas.lendacky@amd.com>,
        Borislav Petkov <bp@alien8.de>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Joao Martins <joao.m.martins@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        David Woodhouse <dwmw@amazon.co.uk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Juergen Gross <jgross@suse.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Tony Luck <tony.luck@intel.com>,
        Alexey Kardashevskiy <aik@amd.com>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 20, 2023 at 12:48=E2=80=AFPM Kim Phillips <kim.phillips@amd.com=
> wrote:
>
> Unlike Intel's Enhanced IBRS feature, AMD's Automatic IBRS does not
> provide protection to processes running at CPL3/user mode [1].
>
> Explicitly enable STIBP to protect against cross-thread CPL3
> branch target injections on systems with Automatic IBRS enabled.

Is there any performance penalty to enabling STIBP + AUTOIBRS, aside
from the lost sharing? Or does this just effectively tag the branch
prediction information with thread ID?
