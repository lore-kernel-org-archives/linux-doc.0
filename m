Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B50C64E7B
	for <linux-doc@archiver.kernel.org>; Mon, 30 Nov 2020 19:40:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F3532076E
	for <linux-doc@archiver.kernel.org>; Mon, 30 Nov 2020 19:40:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J/bqOdKx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728156AbgK3TkU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 30 Nov 2020 14:40:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729963AbgK3TkU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Nov 2020 14:40:20 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A66BCC061A47
        for <linux-doc@vger.kernel.org>; Mon, 30 Nov 2020 11:39:11 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id o24so19800150ljj.6
        for <linux-doc@vger.kernel.org>; Mon, 30 Nov 2020 11:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0+kKX0kuteZmVrkELKmO38aHUCQfmtksSV+RNnpLrBU=;
        b=J/bqOdKxRj6v313iPonX/IikdbWpTlowHmo/2YfKookREQFK4kMLQ8QiA2iHZ6s6hl
         1iD9XEmJitK7+FqMZe21RtqW2tbK64eSNxhNMJQC5Nt/DZyxLElOjrWUqcfp7AU1xxl9
         xPPPszWhrBash8DYZBc4GgMPxNcNzsz9Yn0MdTTqGdJKpEOXkv4+g61plZbdJ7IfXQ3e
         AtuxK9Ap3PCYyiaf7JVuSka96p0kGVmafDZo4hhLAdFXTIQ7T6sSY6gQZg9dEe/QLoPB
         VVuXdQsI9RjgoRMIqT31lf35pKiKvRTnZpHOT7SqIOU7yBIuYLjepszfGWRpOfHvJgga
         hTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0+kKX0kuteZmVrkELKmO38aHUCQfmtksSV+RNnpLrBU=;
        b=QBQMZ43aRvL9z2jZ998CGZMfXixzIDA6pLjZTmzM6hx6JIfxKv2mxcuy+zzYNBwYUu
         IvMDyMCNNPB9+iD86FGRePmp+mCS7qoGaH3hHgxjkBOH6AQ3KFizbckRInNQMZuTx5zm
         if+9Hf+Jq3sKHRYdia2Xr6Ra9jxnHrwhyhWnA81vp8j9iAq6a5snW3y7PAvQiK2ocYtT
         YW3i12kHS7Ft2/QLIqTtqYNUdjPzUMdAdKnQF/R3eTPSrS1R1zW85rurbgvJVwQk2+Ck
         nuPiTNs5sncEIN+4a2xahn/H/UTFjm0oIgg+3LeYACCiLLNDw/RluKFkAKyfsYNePD5K
         ayQA==
X-Gm-Message-State: AOAM530qRy5opq8Apti6bHE7B4uLwsDLoOYFL2N+vWpE+3N/fnOCi1xj
        xKFCqsW9mhHLp4kvbqGpy4r8Es2X+Hz0Utct5lZj2w==
X-Google-Smtp-Source: ABdhPJzl5GtwHh8u58PsVhPmQyulqAyzFwl6ovo793j64B4rhBzRkF7NsGtFUrbp/zwQ0qfPVs4EW+p+yUBEmTmH7QY=
X-Received: by 2002:a05:651c:1292:: with SMTP id 18mr10179147ljc.334.1606765149900;
 Mon, 30 Nov 2020 11:39:09 -0800 (PST)
MIME-Version: 1.0
References: <20201110162211.9207-2-yu-cheng.yu@intel.com> <20201130182641.29812-1-ndesaulniers@google.com>
 <4fad528b-e467-f96d-b7fb-9484fd975886@intel.com>
In-Reply-To: <4fad528b-e467-f96d-b7fb-9484fd975886@intel.com>
From:   =?UTF-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>
Date:   Mon, 30 Nov 2020 11:38:58 -0800
Message-ID: <CAFP8O3LjdP69_T1Ve-zZjvg7+v8xV1mh9Wk8zm4LpAsE2PG58Q@mail.gmail.com>
Subject: Re: [PATCH v15 01/26] Documentation/x86: Add CET description
To:     "Yu, Yu-cheng" <yu-cheng.yu@intel.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Dave P Martin <Dave.Martin@arm.com>,
        Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
        bsingharora@gmail.com, Jonathan Corbet <corbet@lwn.net>,
        dave.hansen@linux.intel.com, esyr@redhat.com,
        Florian Weimer <fweimer@redhat.com>, gorcunov@gmail.com,
        "H.J. Lu" <hjl.tools@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>,
        jannh@google.com, Kees Cook <keescook@chromium.org>,
        linux-api@vger.kernel.org, linux-arch <linux-arch@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
        luto@kernel.org, mike.kravetz@oracle.com,
        Ingo Molnar <mingo@redhat.com>, nadav.amit@gmail.com,
        oleg@redhat.com, pavel@ucw.cz, pengfei.xu@intel.com,
        Peter Zijlstra <peterz@infradead.org>,
        ravi.v.shankar@intel.com, Randy Dunlap <rdunlap@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        vedvyas.shanbhogue@intel.com, weijiang.yang@intel.com,
        X86 ML <x86@kernel.org>, Luis Lozano <llozano@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        erich.keane@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Nov 30, 2020 at 10:34 AM Yu, Yu-cheng <yu-cheng.yu@intel.com> wrote=
:
>
> On 11/30/2020 10:26 AM, Nick Desaulniers wrote:
> > (In response to https://lore.kernel.org/lkml/20201110162211.9207-2-yu-c=
heng.yu@intel.com/)
> >
> >> These need to be enabled to build a CET-enabled kernel, and Binutils v=
2.31
> >> and GCC v8.1 or later are required to build a CET kernel.
> >
> > What about LLVM? Surely CrOS might be of interest to ship this on (we s=
hip the
> > equivalent for aarch64 on Android).
> >
>
> I have not built with LLVM, but think it probably will work as well.  I
> will test it.
>
> >> An application's CET capability is marked in its ELF header and can be
> >> verified from the following command output, in the NT_GNU_PROPERTY_TYP=
E_0
> >> field:
> >>
> >>      readelf -n <application> | grep SHSTK
> >>          properties: x86 feature: IBT, SHSTK
> >
> > Same for llvm-readelf.
> >
>
> I will add that to the document.
>
> Thanks,
> Yu-cheng

The baseline LLVM version is 10.0.1, which is good enough for  clang
-fcf-protection=3Dfull, llvm-readelf -n, LLD's .note.gnu.property
handling (the LLD option is `-z force-ibt`, though)


--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
