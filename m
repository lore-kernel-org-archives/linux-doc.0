Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E47C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 31 Mar 2022 17:31:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231202AbiCaRdH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 31 Mar 2022 13:33:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231163AbiCaRdG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 Mar 2022 13:33:06 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 650FE1275F4
        for <linux-doc@vger.kernel.org>; Thu, 31 Mar 2022 10:31:17 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id c15so690530ljr.9
        for <linux-doc@vger.kernel.org>; Thu, 31 Mar 2022 10:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=37DeCDWlzdqkrXbAxfAuhXVMiTsGHz0hz+oO3LlsSAk=;
        b=OpXbfuoWXGtoVCxlYREjKa12nC/ZS5c6WIcrnkI8eccbmu5/uLBWGYimttqpYS8VW3
         +7YGiaqEFrS3FpnuX2EDtUfr5SLVwwJS16vOz9O1xs7VQoRsqwXQVyTm2DHS+HBbUKJW
         JcnKmGiKnrrFpcQsKy0swpAqSluMvhVusfDjp7x4US+WiiiWR7htYGSSYN9BMjK+PNzB
         3bDKkdDzBq8iD1v2ploXFNsOGBgurGnmJmFODojEuOx7h5IJv9a3ZyGps5XW+zm3ZwP3
         IyNp8IubOAJdKp98Y8byqVMwum46U2PVLc0kWpI3Dx2X+rTq5WlWvdzZTZ10/09brYbh
         5/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=37DeCDWlzdqkrXbAxfAuhXVMiTsGHz0hz+oO3LlsSAk=;
        b=ooetc2Rt3zBh4ETQTHfyQRiUe+GMTtJmvkZ3KZjB3ccs55oXtXod0jK59OMfUAJqTq
         PXVJ692cJOqmJx3LXalNiXUNER+Manugp3uflNOtIPqqjONOXqBXZ1Xy6DwryBidrwoG
         nIzhzKLwB6n+qnaMSaUum0B+uPIU/Pm5Ly6EJIJqz9QZrXvE+bi3TY/ED0hbaY7MiZlb
         jBYgCzfVZhUgwGYskHj95F/KC2uDyPfIjz3m2MsdbpbJW9FRibkeErzRy4U/0MSK7Rgg
         aty9jRT4k1q9OofyKs32brVLQXbiiWuyMTe2bGu86EM7GOfLluP76GRPcpucOoWXKSSk
         6k+A==
X-Gm-Message-State: AOAM532XWDlL0AxpfmHl/tmgt/t/EcBpbKAMbdq9DHAevi1IASAxDUUB
        5sM0Br4aCo7VzlGfJ4rngqsMXv1L4kZZ19cEkTXF5Q==
X-Google-Smtp-Source: ABdhPJyIrADojlxnjoJbjHABCl+RY1oRMepIxM5nb9mo2vXqxPk9ksIqJg+9gS8ogRsiwQgdyPv54GWhmXZP85nX5oI=
X-Received: by 2002:a05:651c:1508:b0:249:b843:208f with SMTP id
 e8-20020a05651c150800b00249b843208fmr11115015ljf.239.1648747874376; Thu, 31
 Mar 2022 10:31:14 -0700 (PDT)
MIME-Version: 1.0
References: <164847778869.3060675.8115416881394543419.stgit@devnote2>
 <CAKwvOdmAYQZtzGudBjmiRZNjT+VixTdNbJmYmxc7-gQNCsHfrA@mail.gmail.com> <20220331104531.81d0edf9a85a4f69020a9f13@kernel.org>
In-Reply-To: <20220331104531.81d0edf9a85a4f69020a9f13@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 31 Mar 2022 10:31:02 -0700
Message-ID: <CAKwvOdmbMPBOGvcZNURK6qMx8gm7dGFiWmtX_yXheEqQ8CNLsA@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] bootconfig: Support embedding a bootconfig in
 kernel for non initrd boot
To:     Masami Hiramatsu <mhiramat@kernel.org>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Padmanabha Srinivasaiah <treasure4paddy@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 30, 2022 at 6:45 PM Masami Hiramatsu <mhiramat@kernel.org> wrote:
>
> Hi Nick,
>
> On Wed, 30 Mar 2022 11:04:50 -0700
> Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> >
> > Any chance we can use
> >
> > CFLAGS_REMOVE_<file>.o := $(CC_FLAGS_LTO)
> >
> > a la
> > commit d2dcd3e37475 ("x86, cpu: disable LTO for cpu.c")
>
> Hm, this looks good to me. Let me confirm that works.
> (Does this mean the bootconfig.o will be compiled to elf binary?)

I know we went with Masahiro's suggestion, which is clever and better,
but to answer this question; yes, under LTO, the linker can link
together inputs that are a mix of ELF object files (basically, no LTO
optimizations) with LLVM IR (w/ LTO optimizations between such files).
-- 
Thanks,
~Nick Desaulniers
