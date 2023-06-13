Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C388DC7EE2E
	for <linux-doc@archiver.kernel.org>; Tue, 13 Jun 2023 01:35:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbjFMBfL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 12 Jun 2023 21:35:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232529AbjFMBfH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 12 Jun 2023 21:35:07 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C0321718
        for <linux-doc@vger.kernel.org>; Mon, 12 Jun 2023 18:35:06 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-51458187be1so8661089a12.2
        for <linux-doc@vger.kernel.org>; Mon, 12 Jun 2023 18:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1686620104; x=1689212104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tYiTdDH+VW2jwUSsmDMc3DKz+ntmwZ8u/+J88WoZGfI=;
        b=ambXlW0XMIYxQFXv22XTNeiEACeUC9RB9Us77m7gxOF5eAewtad4grJVT9DfJN7D7I
         WJPJCwaY5v2512DurA8HoYSegbR1Wch1Nj/wwk1NdFQJm7l9eGYKrbXvuvg0Biqfxvn5
         12vmQiLzcQlyq+BlaJgzXi+Bj3dDrvLB4BgRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686620104; x=1689212104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYiTdDH+VW2jwUSsmDMc3DKz+ntmwZ8u/+J88WoZGfI=;
        b=Mzi89qgSghuEu/wgub4WiIPwFYk3SElsjCe4bxz1pogvdfnOXe1mD4TuPjBhZoO6bm
         DvmkojmrKhBKV31Z2EiyLGz467Z9ydUULxfWkvwJKLid3CL/yJib0L+1oJXj9LS58uXL
         qWMY6cOdAzCWqLgttKZI4oNQ/V39H/QFo+w0EhZnRhvlDyj2bqcRMHg+kCLkqCep7pIv
         RTKNKJeOqPY1yNVvB+CmXW59R5Tarr7jtDyc1CpGsV52Md8iXHJOxxnpGT1nnRYCporh
         usjuOP0G6NHPG7hAxGeo2E/s0XE8dr19AzbYbPWe3z4Z66CHc/rRjJhG+3sqcwCVD9hB
         3ydg==
X-Gm-Message-State: AC+VfDxJDJRlfTE6zFwT6AjGyxRpGyHFqQrifUdYRnM3XmzLTnPIvLm9
        KoQJMl83XtYzk+9UYengD92Zuj860Dh31Az2YV/cuBMW
X-Google-Smtp-Source: ACHHUZ6aYuENtY+N1MWtRfnHmc09Uvv4VKD7xBP9xL69Xw1M8XUeKkK/xaBd4Ym3VbSq2NN4vskJ0Q==
X-Received: by 2002:a17:907:1ca9:b0:982:3d5e:3242 with SMTP id nb41-20020a1709071ca900b009823d5e3242mr506187ejc.62.1686620104525;
        Mon, 12 Jun 2023 18:35:04 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id w23-20020a1709064a1700b00978723f594bsm5836574eju.101.2023.06.12.18.35.02
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 18:35:02 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-51458187be1so8661052a12.2
        for <linux-doc@vger.kernel.org>; Mon, 12 Jun 2023 18:35:02 -0700 (PDT)
X-Received: by 2002:a05:6402:31f3:b0:514:9e61:e7b8 with SMTP id
 dy19-20020a05640231f300b005149e61e7b8mr5620947edb.40.1686620102024; Mon, 12
 Jun 2023 18:35:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230613001108.3040476-1-rick.p.edgecombe@intel.com>
In-Reply-To: <20230613001108.3040476-1-rick.p.edgecombe@intel.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 12 Jun 2023 18:34:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh0UNRn96k3XLh2AYOo0iz1k_Qk-rQXv8kYjXkKBzUMWA@mail.gmail.com>
Message-ID: <CAHk-=wh0UNRn96k3XLh2AYOo0iz1k_Qk-rQXv8kYjXkKBzUMWA@mail.gmail.com>
Subject: Re: [PATCH v9 00/42] Shadow stacks for userspace
To:     Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc:     x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@kernel.org>,
        Balbir Singh <bsingharora@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H . J . Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Weijiang Yang <weijiang.yang@intel.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        John Allen <john.allen@amd.com>, kcc@google.com,
        eranian@google.com, rppt@kernel.org, jamorris@linux.microsoft.com,
        dethoma@microsoft.com, akpm@linux-foundation.org,
        Andrew.Cooper3@citrix.com, christina.schimpe@intel.com,
        david@redhat.com, debug@rivosinc.com, szabolcs.nagy@arm.com,
        broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 12, 2023 at 5:14=E2=80=AFPM Rick Edgecombe
<rick.p.edgecombe@intel.com> wrote:
>
> This series implements Shadow Stacks for userspace using x86's Control-fl=
ow
> Enforcement Technology (CET).

Do you have this in a git tree somewhere? For series with this many
patches, I find it easier to just do a "git fetch" and "gitk
..FETCH_HEAD" these days, and then reply by email on anything I find.

That's partly because it makes it really easy to zoom in on some
particular area (eg "let's look at just mm/ and the generic include
files")

                  Linus
