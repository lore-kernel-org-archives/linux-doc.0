Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 15DDC7D043
	for <lwn-linux-doc@archive.lwn.net>; Fri, 29 Jun 2018 16:36:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S967080AbeF2QgP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 29 Jun 2018 12:36:15 -0400
Received: from mail-io0-f196.google.com ([209.85.223.196]:38011 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967076AbeF2QgM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Jun 2018 12:36:12 -0400
Received: by mail-io0-f196.google.com with SMTP id l19-v6so8996055ioj.5
        for <linux-doc@vger.kernel.org>; Fri, 29 Jun 2018 09:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=ukCGltYwtD7YajTlWIOjEevOj1qICTIHzaLGC+IF44g=;
        b=JeIYMbIX3IAluQh6MhELO7TmAfHyd6W5UTGw3TRp98mmofrXYoYtTUtXjEsX6Ja/lq
         AzFWQLQA9opUNjazc24TrHLOeQqIUBty+fE+AMmdg8MNi5Vb8PFN6M+zWbl2VQqqz7KG
         XqUmwT2Po6HofXqvK2C0KMAsyjjp2HvNqI7CqGGTFPAALmXM/GDAZn7Tjw8qiX5v6D05
         kIFhixws/cWz1KdMi+3IfGVUFdfBUdbfZ3B2vnOmkjv5MiD9YLK21PanXHrDwaRD+IsY
         FH96sKlVbvIL+Uxlidq2LSVZwjAmrtRyptb5HeFJI/vP8FoN07z1OAYievrniflL+eZu
         hnmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=ukCGltYwtD7YajTlWIOjEevOj1qICTIHzaLGC+IF44g=;
        b=OjCv1Uor5N8ROwEv8G5u+53x29f4rWiXABmH35plwXYTf9b464z24r3hJ4JAKJhQuz
         S+8UCx5n0LGgabwvqarNmAMNu56iel+gnlGAfcY4i8BShU/3WVun4L0GXw9Shoskyo62
         eKprczVp4vQXptsgzWUA7EUf7he+eICqc9E/OhAtRVM1xcmBIAh6l8AL00sAe4dk3k8T
         DK6H4Pguwowx0haF2ksSinCGewBNjEMHwzoV7tf408PHJHd3ZPEVKelaBEuxkp+r/HXe
         odzoGdYAWhNADu3GC/nLxRf7w7isKMp0Ve+mTQKf8h1FGpqLorGbJ5s9h/Ezi8xNmVTe
         DmIg==
X-Gm-Message-State: APt69E0kNHN9YFUG8xKeZs56JIFtUNSVoXfWVUWqynszdIJiaXUK+Ctf
        DgXqN7+HSDm5RMcMoXbODQbIL1C8QvST89YuCjZogw==
X-Google-Smtp-Source: AAOMgpe1SW9csFvdGv+80VIVjSOgp82ktPCy4rDxxGN2dKxq3LBu2kI150jfQjseKfH6aCeXYeCHu4NmnWZXjuwGnps=
X-Received: by 2002:a6b:5002:: with SMTP id e2-v6mr13329662iob.31.1530290171709;
 Fri, 29 Jun 2018 09:36:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:9082:0:0:0:0:0 with HTTP; Fri, 29 Jun 2018 09:36:10
 -0700 (PDT)
In-Reply-To: <20180629110709.GA17859@arm.com>
References: <cover.1530018818.git.andreyknvl@google.com> <20180628105057.GA26019@e103592.cambridge.arm.com>
 <CAAeHK+w0T43+h3xqU4a-qutxd-qiEhsvk0eaZpmAn-T0hpaLZQ@mail.gmail.com> <20180629110709.GA17859@arm.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 29 Jun 2018 18:36:10 +0200
Message-ID: <CAAeHK+wHd8B2nhat-Z2Y2=s4NVobPG7vjr2CynjFhqPTwQRepQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/17] khwasan: kernel hardware assisted address sanitizer
To:     Will Deacon <will.deacon@arm.com>
Cc:     Dave Martin <Dave.Martin@arm.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Lameter <cl@linux.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
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
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
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

On Fri, Jun 29, 2018 at 1:07 PM, Will Deacon <will.deacon@arm.com> wrote:
> It might not seen sensible, but we could still be relying on this in the
> kernel and so this change would introduce a regression. I think we need
> a way to identify such pointer usage before these patches can seriously be
> considered for mainline inclusion.

Another point that I have here is that KHWASAN is a debugging tool not
meant to be used in production. We're not trying to change the ABI or
something like that (referring to the other HWASAN patchset). We can
fix up the non obvious places where untagging is needed in a case by
case basis with additional patches when testing reveals it.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
