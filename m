Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E3FC5519F
	for <linux-doc@archiver.kernel.org>; Fri, 20 Nov 2020 05:03:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B5CE2236F
	for <linux-doc@archiver.kernel.org>; Fri, 20 Nov 2020 05:03:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="JZ+iZhDr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725791AbgKTFCq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 20 Nov 2020 00:02:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:54838 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725562AbgKTFCp (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 20 Nov 2020 00:02:45 -0500
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9F2502242A
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2020 05:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605848564;
        bh=AV4arF6joHpyOzsujwQPuWmRxvPkX+FTXHnctBnhRIw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JZ+iZhDrcYtWo1BNYKl29fyEog5Yas44k42jsVLZbSf9eIfnh1ErEmayxLf8rgDf1
         Om7oDqRvQrWTLMfqbPw+0NXFWavkt1itwxwHe7YIJlttIVzOtARIuFe9IeG3MXYhS0
         46bX+HTejNLbmamlFuGKa8G7eviqVrZ21NHssCMs=
Received: by mail-wr1-f52.google.com with SMTP id p1so8657784wrf.12
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2020 21:02:44 -0800 (PST)
X-Gm-Message-State: AOAM5314r3UW/j8bdP79G25UnL2v5I07Zii/uKC86RXrm5WkkD3K9XlT
        S6d2caF6g7zulJGAU95lAE70Eo2wKa96huuoZuTbgg==
X-Google-Smtp-Source: ABdhPJzLdwTlc0MaXRRiCArrPUVwln9vDm0OGiPBfiIi22SSfbyiOuqhA4ect3jgdRpyPu4nQk7RvVQ6ZX88djfkIrs=
X-Received: by 2002:a5d:49ce:: with SMTP id t14mr13468714wrs.75.1605848563021;
 Thu, 19 Nov 2020 21:02:43 -0800 (PST)
MIME-Version: 1.0
References: <20201119233257.2939-1-chang.seok.bae@intel.com> <20201119233257.2939-23-chang.seok.bae@intel.com>
In-Reply-To: <20201119233257.2939-23-chang.seok.bae@intel.com>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Thu, 19 Nov 2020 21:02:26 -0800
X-Gmail-Original-Message-ID: <CALCETrXBRATBVySDM9f0H-+gD37n7=CsNLWa446eLHi1mjokGw@mail.gmail.com>
Message-ID: <CALCETrXBRATBVySDM9f0H-+gD37n7=CsNLWa446eLHi1mjokGw@mail.gmail.com>
Subject: Re: [PATCH v2 22/22] x86/fpu/xstate: Introduce boot-parameters for
 control some state component support
To:     "Chang S. Bae" <chang.seok.bae@intel.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@suse.de>,
        Andrew Lutomirski <luto@kernel.org>, X86 ML <x86@kernel.org>,
        Len Brown <len.brown@intel.com>,
        Dave Hansen <dave.hansen@intel.com>,
        "Liu, Jing2" <jing2.liu@intel.com>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Nov 19, 2020 at 3:37 PM Chang S. Bae <chang.seok.bae@intel.com> wrote:
>
> Rename XFEATURE_MASK_USER_SUPPORTED to XFEATURE_MASK_USER_ENABLED to
> literally align with new boot-parameters.
>
> "xstate.disable=0x60000" will disable AMX on a system that has AMX compiled
> into XFEATURE_MASK_USER_ENABLED.
>
> "xstate.enable=0x60000" will enable AMX on a system that does NOT have AMX
> compiled into XFEATURE_MASK_USER_ENABLED (assuming the kernel is new enough
> to support this feature).
>

What's the purpose of xstate.enable?  I can't really imagine it's
useful for AMX.  I suppose it could be useful for hypothetical
post-AMX features, but that sounds extremely dangerous.  Intel has
changed its strategy so many times on XSTATE extensibility that I find
it quite hard to believe that supporting unknown states is wise.
