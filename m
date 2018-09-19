Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 824067D57F
	for <lwn-linux-doc@archive.lwn.net>; Wed, 19 Sep 2018 18:57:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732049AbeITAgU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 19 Sep 2018 20:36:20 -0400
Received: from mail-it0-f41.google.com ([209.85.214.41]:50241 "EHLO
        mail-it0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731821AbeITAgT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Sep 2018 20:36:19 -0400
Received: by mail-it0-f41.google.com with SMTP id j81-v6so9814762ite.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Sep 2018 11:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=NGUGCTwr/PNEC9+Nt6leY0kWT1OlxqT/it/bimgN2ds=;
        b=XJL4E6V6ryycU+Jd/TA3pHRkyxhKTqugF5o19OOt6lGsNnZi6TmdKVwL033r5mMcNP
         O4CaCUyTaoy3Ns7Mi+8Qjxpq8XwvbItO0S7BdOMioCDhOG8MzpDhHNlHlDQPl4aSNF8U
         CxI5SxElmle940pmEhs5z1VpA+UzrRvdu1pi7okCVsaUezs/pN4Pm+Dec7OSNsoXbdSV
         TH5YzGViAv/wVahuFZzF6o3JZ1NsXVO9SrsqngBVHti9wsmaZ4QOmeP1L7lrqpcd+aEV
         gIAQhxKfxKj3TpYQqcE1anj9eoRhA2g3zmWj9hjuRm3FNE4qDHerpbxl7JBllElR/S5y
         0lxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=NGUGCTwr/PNEC9+Nt6leY0kWT1OlxqT/it/bimgN2ds=;
        b=IcdaH/qm+7s/RSklbAB0qsdbONBXF/cwQLmcSiIe+JQNblh91EkH0lTDapqN5SD2lt
         WqiiZ+jsJYQn8WM9FRRbGpRKCzRc1sg7Sudkz2K1Dq6vg1J1P25pPOyQsc0CKCPy2/ZY
         RVjUuPplbgKU7EvWhlJedFD8HnVOCUJDrx7jc9SUQxwfqD5wLsTEmgOsg7w3z0ql3V77
         00RQgCzgcEQ5Nc+qBbI8sUXK3VoLTDeRXgx0sVGDq8OC1WjjYcaJthbU6ZlmsfPwEx2Q
         7n4YuMPcWikM5G1B5dyz0h528rcwRhCVp9IhrB9V1WXpeBV+haQWvL+QuDuu5zaCbyJp
         XSHw==
X-Gm-Message-State: APzg51DAv0A7Tdj+o275jatAB+Ljg9odupDu2FGeMCttaPDqLJPZXEy8
        HOqwy89p8++Y99UxlnQWfEiGm+2LAHFomRTQkV8ddw==
X-Google-Smtp-Source: ANB0VdbDJD+tvPc/h5OVpUgKj7hIWdWtUH4yMYmSuUqNcYWVDivEYDr3FI5crm0skpK5IdMD7IzaxN8qNj9AzMZ4RUo=
X-Received: by 2002:a02:ad14:: with SMTP id s20-v6mr33804961jan.132.1537383423773;
 Wed, 19 Sep 2018 11:57:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:c54e:0:0:0:0:0 with HTTP; Wed, 19 Sep 2018 11:57:03
 -0700 (PDT)
In-Reply-To: <cover.1537383101.git.andreyknvl@google.com>
References: <cover.1537383101.git.andreyknvl@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 19 Sep 2018 20:57:03 +0200
Message-ID: <CAAeHK+xB-4vzQSt-Wznjof7yq-at2PsQNMA9qR0U=H0Uhdan+A@mail.gmail.com>
Subject: Re: [PATCH v8 00/20] kasan: add software tag-based mode for arm64
To:     Andrey Ryabinin <aryabinin@virtuozzo.com>,
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
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-sparse@vger.kernel.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Jann Horn <jannh@google.com>,
        Mark Brand <markbrand@google.com>,
        Chintan Pandya <cpandya@codeaurora.org>,
        Vishwath Mohan <vishwath@google.com>,
        Andrey Konovalov <andreyknvl@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Accidentally marked the series as v8 instead of v7, I hope that is not an issue.
