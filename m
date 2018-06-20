Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D0DAD7D043
	for <lwn-linux-doc@archive.lwn.net>; Wed, 20 Jun 2018 19:42:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932764AbeFTTl6 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 20 Jun 2018 15:41:58 -0400
Received: from mail-io0-f193.google.com ([209.85.223.193]:32899 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932600AbeFTTls (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Jun 2018 15:41:48 -0400
Received: by mail-io0-f193.google.com with SMTP id d185-v6so840900ioe.0
        for <linux-doc@vger.kernel.org>; Wed, 20 Jun 2018 12:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=zFkkPYA2JYdxQPsfsZNZmw2WT34MpHd7e3Y+OlnJD+I=;
        b=XVKRNa1aWKuAKlVuqCsgcsiqs0EOs3vtm8A7qpsUaSNSlnU5as5A69xg3vF/qhlBhZ
         XZOUic0dYPRJs/Zvod0191xnXi9iBRpt6cW1WNsIhHVtS7xLa3HiHSashG/RRJ9+CZ7+
         qLdUIoPwY/U1L7ZwfDSkvvpeQGVsKjwfJIymte370lOBoipZEquS/+ixghcuWWsFdqXz
         AWf5sqrmaAkpWxD7vWJjyYfTjIj04i64AElDWejIQasz7QOKn/VzPGmxng9PhlvLUqsC
         9EZzsGRzHSVi7bjsZb3R5kyMdpa+97RF8UkLPWFZsKa9KHxqa8Xi+OY8KUrgdCDYHTmm
         +t8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=zFkkPYA2JYdxQPsfsZNZmw2WT34MpHd7e3Y+OlnJD+I=;
        b=n7LVV6MkLTUyCidBGoga1wOmRV+3x/fGOrpad0S4xAQfwxqz1W2dZum4+/Kwth3PCy
         pg0MjLYPNVX12H0DlAYtcUEzNS21RYtdel1prLVie0riHznijcY0UjmI+yHqmiLH+af3
         /AGrZ8dyVPB6sB/oXIybZzG6qryDIjkKJFy39E8X5Jdc+pcg8/Y2NuwKzZCN0p7YeF2w
         ztnCFPbI8LlSWw3JTMjaBVBfYvpfPFILNeh4V+0oJp0swshNpsgcZ1+HVe4GAAOzoOWM
         6WU2ptKheugBxxdzA3z93SI/uMgks8bnMN3K6ZmLcvRALDOi//2s2QB7yUJ44q3bUITc
         hlEQ==
X-Gm-Message-State: APt69E2L6cMfwu+5fEL2Sy/2BYVxmggzntWn2UFGZ03HpmXkayq+g8XV
        PKA/kp15IhGNroHfpSLq0AFgQmtMfWkrSd0FREj44w==
X-Google-Smtp-Source: ADUXVKJB++igNKKy4kMzyYt/RPBMBzF9BKhOMkmz1fT9H2LFrUm0uS4YVbTAqkN50QRQ9Kti7Ob/zr54prsiL3UMvoQ=
X-Received: by 2002:a6b:84e1:: with SMTP id o94-v6mr17990721ioi.119.1529523707600;
 Wed, 20 Jun 2018 12:41:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:9082:0:0:0:0:0 with HTTP; Wed, 20 Jun 2018 12:41:46
 -0700 (PDT)
In-Reply-To: <CAOMZO5BgPaMsmx_3AJvMTKCFjhusfH=kH26U_PQCSD5TcUDA+w@mail.gmail.com>
References: <cover.1529515183.git.andreyknvl@google.com> <f76d3070776e0038eda3cd76d471d1bfeae18480.1529515183.git.andreyknvl@google.com>
 <CAOMZO5BgPaMsmx_3AJvMTKCFjhusfH=kH26U_PQCSD5TcUDA+w@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 20 Jun 2018 21:41:46 +0200
Message-ID: <CAAeHK+zJgSAxiHHfzhrm7N7iey7CbW42WfWvUN+FnZMPP3FXrA@mail.gmail.com>
Subject: Re: [PATCH v3 17/17] kasan: add SPDX-License-Identifier mark to
 source files
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Christoph Lameter <cl@linux.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Dave Martin <dave.martin@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Ingo Molnar <mingo@kernel.org>,
        Paul Lawrence <paullawrence@google.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        kasan-dev <kasan-dev@googlegroups.com>,
        linux-doc@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-sparse@vger.kernel.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Chintan Pandya <cpandya@codeaurora.org>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Jann Horn <jannh@google.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Kostya Serebryany <kcc@google.com>,
        Mark Brand <markbrand@google.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Evgeniy Stepanov <eugenis@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jun 20, 2018 at 9:15 PM, Fabio Estevam <festevam@gmail.com> wrote:
> On Wed, Jun 20, 2018 at 2:40 PM, Andrey Konovalov <andreyknvl@google.com> wrote:
>
>> diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
>> index 6f4f2ebf5f57..3feacd889e24 100644
>> --- a/mm/kasan/kasan.h
>> +++ b/mm/kasan/kasan.h
>> @@ -1,4 +1,4 @@
>> -/* SPDX-License-Identifier: GPL-2.0 */
>> +// SPDX-License-Identifier: GPL-2.0
>
> The original notation is correct: /* */ style is used for header files.

I used mm/slub.c as a reference, which uses //. Bu I can change it to
/* */ in the next version, no problem.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
