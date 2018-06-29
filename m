Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0DB0F7D072
	for <lwn-linux-doc@archive.lwn.net>; Fri, 29 Jun 2018 14:40:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932131AbeF2OkY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 29 Jun 2018 10:40:24 -0400
Received: from mail-it0-f65.google.com ([209.85.214.65]:50178 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933723AbeF2OkW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Jun 2018 10:40:22 -0400
Received: by mail-it0-f65.google.com with SMTP id u4-v6so3176029itg.0
        for <linux-doc@vger.kernel.org>; Fri, 29 Jun 2018 07:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=q6EyTGd2x9sRvsPPcqRYANFsVkUOYj+D/qstNYmA4GU=;
        b=Nfg9fmC5Oc3STiqhNLuCPCsCEV8+sk42j51g0jVJgX43VIf1koqzKghuvb0+CNMR1q
         yKWoxTDVShV6NQmQ26wU5BwZKCfTH6+h2VCBkUqF7ZCNICFneEHA31+UiQyo/DKbiIdu
         iTRMQJvkPjzQnpIOD5mQ2vPcg+9+fQYNJzp7AoahMNDInPKzLzoqdlYRvLOh7dUh00dx
         dtgPPEkhTP4JhDYsAx4OxWXf7lntECdl2KU1U3TYvLTZUKZH04G8vtKmRBwaRmGWop7b
         9fJP+HAuRHamt1GFufJ9J8Oo2SOL2urTTE6hIk63C+4VKSwlq6TZjMwIv+WVJ2HhX6h0
         qA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=q6EyTGd2x9sRvsPPcqRYANFsVkUOYj+D/qstNYmA4GU=;
        b=GS929vbykHqon0CJNnTLvU5V0FR02xb9MNE9Foj6vRLEFDYEhKOuNucZitogc16NSt
         rmet/e0E+RgyNcGns74DtsDjjISo0inwuzgfzi4ZuTjgy5PPSoasGbhH5nHAZPlAXHwF
         pr8EaehrMeULXIZ19hopYpWXbGSHcIq5ZwwkMvBucCxfz8s0Xe5ufL++KDl8w/Li0/Ph
         aMI6TmWb9bZVMDOjaDYN0KZfSg7kcEcj1qr3+gbiBbIZDNF/tW+9qRJdAvd2exJdARfx
         9HevLhT0Fk7FI2rc9emCjtkqDVGDH3vKt4BBCL8WDr++cjc46ZpjdH2X6lmZ6BXo5EVf
         8EPg==
X-Gm-Message-State: APt69E1SnpgHWX6iRvqlQNB/H3m45eX+xGGvfd+pbY0+ewobPngkXb19
        QJOiOWjWazoNDqO+NATF8FMUzW28RUzP/NQRw7xt+g==
X-Google-Smtp-Source: AAOMgpcGZXKwZnt4M0BS0b7ZRrry0cxeASKbEvg6vo/h3QWgismAKyRZpjNHBiydwrjwA4z/EEciMdb41jKWrn/hWXM=
X-Received: by 2002:a24:b046:: with SMTP id b6-v6mr2142957itj.48.1530283221194;
 Fri, 29 Jun 2018 07:40:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:9082:0:0:0:0:0 with HTTP; Fri, 29 Jun 2018 07:40:20
 -0700 (PDT)
In-Reply-To: <20180629130155.e7ztz5ikxfl352ff@lakrids.cambridge.arm.com>
References: <cover.1530018818.git.andreyknvl@google.com> <20180627160800.3dc7f9ee41c0badbf7342520@linux-foundation.org>
 <CAAeHK+xz552VNpZxgWwU-hbTqF5_F6YVDw3fSv=4OT8mNrqPzg@mail.gmail.com>
 <20180628124039.8a42ab5e2994fb2876ff4f75@linux-foundation.org>
 <CAAeHK+xsBOKghUp9XhpfXGqU=gjSYuy3G2GH14zWNEmaLPy8_w@mail.gmail.com> <20180629130155.e7ztz5ikxfl352ff@lakrids.cambridge.arm.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 29 Jun 2018 16:40:20 +0200
Message-ID: <CAAeHK+zwmOMgP=Om6TKz8V5_4qgFhDfQSA01CBMnhbBWmHe9sQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/17] khwasan: kernel hardware assisted address sanitizer
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Christoph Lameter <cl@linux.com>,
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
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-sparse@vger.kernel.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Jann Horn <jannh@google.com>,
        Mark Brand <markbrand@google.com>,
        Chintan Pandya <cpandya@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 29, 2018 at 3:01 PM, Mark Rutland <mark.rutland@arm.com> wrote:
> On Fri, Jun 29, 2018 at 02:45:08PM +0200, Andrey Konovalov wrote:
>> So with clean kernel after boot we get 40 kb memory usage. With KASAN
>> it is ~120 kb, which is 200% overhead. With KHWASAN it's 50 kb, which
>> is 25% overhead. This should approximately scale to any amounts of
>> used slab memory. For example with 100 mb memory usage we would get
>> +200 mb for KASAN and +25 mb with KHWASAN. (And KASAN also requires
>> quarantine for better use-after-free detection). I can explicitly
>> mention the overhead in %s in the changelog.
>
> Could you elaborate on where that SLAB overhead comes from?
>
> IIUC that's not for the shadow itself (since it's allocated up-front and
> not accounted to SLAB), and that doesn't take into account the
> quarantine, so what's eating that space?

Redzones. KHWASAN doesn't need them since the next slab object is
marked with a different tag (with a high probability) and acts as a
redzone.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
