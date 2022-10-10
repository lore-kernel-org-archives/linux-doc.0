Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBAE8C433FE
	for <linux-doc@archiver.kernel.org>; Mon, 10 Oct 2022 23:16:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbiJJXQP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 Oct 2022 19:16:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229926AbiJJXQO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Oct 2022 19:16:14 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82A2777E8E
        for <linux-doc@vger.kernel.org>; Mon, 10 Oct 2022 16:16:11 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id 13so27873230ejn.3
        for <linux-doc@vger.kernel.org>; Mon, 10 Oct 2022 16:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IKLnyVJ0nNgakFSgUxLr7WhxEeqfhLp9XdGiHhrJ06w=;
        b=Ryi518lVq+timi1Kqu+idgXmjtgi4HCtGXEwjzHDXXl5PQ9749Qk6algii3a0SO5OQ
         W5+ghws/D6+LGX63grCrAsJAZ2X73rWnGpEuNTgF+0sG4sOILzGhkGX1Eatnq4XDuO+X
         4WKk/7sX2kSc1WGM8iPo6ZmmMKzUwbF6T44FNfCuG0gwQwGTs5Cd0CnlMBZ05MB3LQLt
         Z2/G8pNFwZcsBymYsai2ltCRH53PQ0EAi/LOGc4vOAYVbdKHShVKFSmog4D9gs7kJNwO
         DViA4/Du1iDndpYP/18p9ZZjR1R6GgtV0QQVFLT8YhigXRqJo5/XQWzaAym5gYK8HDex
         ABKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IKLnyVJ0nNgakFSgUxLr7WhxEeqfhLp9XdGiHhrJ06w=;
        b=Zsp2AmvQhGsLQTlx/nfIzULF/YfFyqdxznCzpLKYLoI7n78qsPAmogh7TmGPPuYdno
         U257d1feEmjY+M3EbiYdEExI7HOQhQ8F4ws1Zwaiqt5UvDP47Gp7/4IX0pgrkQ8SbJ1L
         h0pqrxrjbtwtqP20x9n6CikEESb/0ALYJ2MNN+5FTw+jH0cSD9H/HoB/2fLgbuKENSYe
         rK3geTaFJV3gIyDmo4kdm1ZKdRrmeR/Kamh6cPrFImkguptmZe9DNzD0XThFBclwHJDG
         V4oy7fuRBj5nJ0YmkyqxKBM8C6g65Cbmv2v9gAIaDihds40IRwwSkXDc1jmi+Q9d1SMs
         z8KA==
X-Gm-Message-State: ACrzQf24DVvdhGIszPB3pCtOW1iLDJXl9Idc1ij+Bu+d+kRCzj3ta0x6
        bo6XIhDDxiIRX/Ieic6XOTBvqHQXYLwLXIi8HRj6vQ==
X-Google-Smtp-Source: AMsMyM5nVE+afZe0F6TrLstl85/eEUpde8vabQOqkBtX4AtcSkFZgO385VJ9f4jwvHK+QMgqc/4r+Z68UcPthxNCAdQ=
X-Received: by 2002:a17:906:5a44:b0:78d:4c17:9856 with SMTP id
 my4-20020a1709065a4400b0078d4c179856mr16889557ejc.477.1665443769407; Mon, 10
 Oct 2022 16:16:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220927131518.30000-1-ojeda@kernel.org> <20220927131518.30000-26-ojeda@kernel.org>
 <Y0BfN1BdVCWssvEu@hirez.programming.kicks-ass.net>
In-Reply-To: <Y0BfN1BdVCWssvEu@hirez.programming.kicks-ass.net>
From:   Sami Tolvanen <samitolvanen@google.com>
Date:   Mon, 10 Oct 2022 16:15:33 -0700
Message-ID: <CABCJKuenkHXtbWOLZ0_isGewxd19qkM7OcLeE2NzM6dSkXS4mQ@mail.gmail.com>
Subject: Re: [PATCH v10 25/27] x86: enable initial Rust support
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, patches@lists.linux.dev,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        David Gow <davidgow@google.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Oct 7, 2022 at 10:18 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Tue, Sep 27, 2022 at 03:14:56PM +0200, Miguel Ojeda wrote:
> > Note that only x86_64 is covered and not all features nor mitigations
> > are handled, but it is enough as a starting point and showcases
> > the basics needed to add Rust support for a new architecture.
>
> Does it fail the build if required options are missing? Specifically are
> things like kCFI and IBT enabled? Silently not handling those will
> result in an unbootable image.

Rust supports IBT with -Z cf-protection=branch, but I don't see this
option being enabled in the kernel yet. Cross-language CFI is going to
require a lot more work though because the type systems are not quite
compatible:

https://github.com/rust-lang/rfcs/pull/3296

Sami
