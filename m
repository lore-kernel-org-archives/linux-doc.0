Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1FDBC7D2EE
	for <lwn-linux-doc@archive.lwn.net>; Mon, 20 Aug 2018 21:57:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbeHUBPM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 20 Aug 2018 21:15:12 -0400
Received: from mail-io0-f196.google.com ([209.85.223.196]:44293 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726595AbeHUBPM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Aug 2018 21:15:12 -0400
Received: by mail-io0-f196.google.com with SMTP id l8-v6so3299676ioj.11;
        Mon, 20 Aug 2018 14:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Gl33k97BUwkXIrCvuQ2jGEC7utAyDxQrbvuON2olo0c=;
        b=ZP7y5iZEdsZKz48vFAH/yuYE2E15/TdJGruA5uD5QwDGLFTEyD9+3/CDp4jkqhMIOx
         L21eIWWytLLWZQY/t0vRF6eOiOO41twm3LfNqWJrryVkrCUbVwkqzRZvDAw9Xs13YkJX
         ALYFcHth7zrRNI9nS/iLGGwZPWZpnUEDBgRD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Gl33k97BUwkXIrCvuQ2jGEC7utAyDxQrbvuON2olo0c=;
        b=awSTIrnQKaiwXhhoC+RfB26WKTcir53iqF/yJlG1KIuFmgmuqXOGwhysCE2DE0MQV/
         lZ/teWXhua7A3weZHAG/guEGR/sAlWHpcBsFAu6tq2JdauWAUvqj38Vog3fsTyXq9i7D
         UKKJwaRTlRjffr7ybHKmjEj3Al1cemD66lfRmJznnWYk+Ygl5Y5uxPlBKjGI8juvRBPQ
         AHuMKbnp94mquuMqDz67Ae6Q6MsLXdE5L14zMR30WVLpFhoHYWPYlbfNuqoTqbmVWw9c
         LaU2I6gNqiNxmACNeIfMTG8bqZrhwrBo+t3RS3891tFFCBiQjoDFxjwr+5dfwz9+pGB9
         H+gw==
X-Gm-Message-State: AOUpUlEfd8UcP457jvT9Q3BCZ04FjPhU8Gq/LNbL2MAIzOXhk/jLrLya
        9nSm4sRFbYHLOGQgC+NHve08IiFKSvSu9e1Fdynf/ilk
X-Google-Smtp-Source: AA+uWPzdxwpNIAr0YgOkSg332bFl591A84BNLxhJLU7VMmofv57XWqt3hNuTdxBIYr/T+mf67ZcYx4STCvHMvl0sgG8=
X-Received: by 2002:a6b:7a08:: with SMTP id h8-v6mr36286440iom.238.1534802270316;
 Mon, 20 Aug 2018 14:57:50 -0700 (PDT)
MIME-Version: 1.0
References: <20180820203705.16212-1-andi@firstfloor.org> <20180820203705.16212-2-andi@firstfloor.org>
In-Reply-To: <20180820203705.16212-2-andi@firstfloor.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 20 Aug 2018 14:57:39 -0700
Message-ID: <CA+55aFyo_MFz2Qg3pEbLMf3zhvAQbpZf3mQf98bTRJx28drbeQ@mail.gmail.com>
Subject: Re: [PATCH] x86/mm: Simplify p[g4um]d_page() macros
To:     Andi Kleen <andi@firstfloor.org>
Cc:     stable <stable@vger.kernel.org>, Andi Kleen <ak@linux.intel.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Alexander Potapenko <glider@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Andrew Lutomirski <luto@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
        Brijesh Singh <brijesh.singh@amd.com>,
        Dave Young <dyoung@redhat.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Larry Woodman <lwoodman@redhat.com>,
        Matt Fleming <matt@codeblueprint.co.uk>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
        Rik van Riel <riel@redhat.com>,
        Toshi Kani <toshi.kani@hpe.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        KVM list <kvm@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-efi <linux-efi@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Aug 20, 2018 at 1:37 PM Andi Kleen <andi@firstfloor.org> wrote:
>
> From: Andi Kleen <ak@linux.intel.com>
>
> Create a pgd_pfn() macro similar to the p[4um]d_pfn() macros and then
> use the p[g4um]d_pfn() macros in the p[g4um]d_page() macros instead of
> duplicating the code.

When doing backports, _please_ explicitly specify which commit this is
upstream too.

Also, the original upstream patch is credited to Tom Lendacky.

Or is there something I'm not seeing, and this is different from
commit fd7e315988b7 ("x86/mm: Simplify p[g4um]d_page() macros")?

               Linus
