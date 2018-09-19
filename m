Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2E0737D57F
	for <lwn-linux-doc@archive.lwn.net>; Wed, 19 Sep 2018 19:01:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731250AbeITAkp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 19 Sep 2018 20:40:45 -0400
Received: from mail-it0-f67.google.com ([209.85.214.67]:52700 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727675AbeITAkp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Sep 2018 20:40:45 -0400
Received: by mail-it0-f67.google.com with SMTP id h3-v6so9806405ita.2
        for <linux-doc@vger.kernel.org>; Wed, 19 Sep 2018 12:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=qu4vPiYmg/UnqHP0Q+vzdq/rEQYkRGbnznw6rpHYkN4=;
        b=E6aSzJNpEmESKfzw0Aj6O57xDlvj3Kx8u7/opr1B6XIQzJWSke4tmeaC9PCe3W5uBY
         Lb9jNyjFGEG/G3yn+5UjHL7agsKFWiQE3eL+G7F3HQ2QdVErwh5MIRJd9KeB9NdrV+hi
         8QW0aacF7+AX+15uDQg2WbIaIBjYiMoiN/Cj90gqylsP6WjtzRkzsdqElI9QfdU3HyA8
         dD8qAmSKLsjr0EuO3oKsbWKk09IKE87oXjK4lzLr1XRux8h9d2MrxdQfRm9nK+Mq5ZnA
         v3XEGaPUD8gFxss+Kw9kRRvYBvvgC8Ie5m1rg8XkJoIwfWvxiVDmnsqsZe+twytoSAKv
         GfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=qu4vPiYmg/UnqHP0Q+vzdq/rEQYkRGbnznw6rpHYkN4=;
        b=eC++dZTlqAD3kNpC8FBXOvfOBRWdECc8Hpj//hPR7c9EP2hB06mriviY9jZw9jRKgl
         hgeUaOFOml0/k+bsGDxgAgDsXaYLd2ziRpKgZrDMAp+I6GAK1p+m8ydNg/Ap10YPka4N
         cjJSwOuqgR6VsjDkSDO/qEjfhgWn9y2tiOgAq8btpcVQavYZXoF/YVFOhU196HH6arZW
         YPp27CtGb7HVpXk9pRzQCr7j5BL93F964ZVSPcXEdXqRlAdacsUHdmR1dV9ZYb3tqjp1
         JNeH8KqFjfZYj34/CCHu5A7l5DsNTWkvwIUZIZC0moYL48x1ImA2Vm+JCkyhbLDYLqOx
         BPqA==
X-Gm-Message-State: APzg51BZK27840E42BwZ6EVtDEaD+D9/SHRoZF6/NImm32eYQZ46A2Ki
        a7dnp+I3Slhurci5pR78ORU1jWwVM0zLavwgsKc0Kg==
X-Google-Smtp-Source: ANB0VdZNQCYYzV5Z6Z8jq6JasT8rxRk/z4+u5Sr3sSwCl6IlSVRV1HKKLoj4eRO57z3xKgMkbDC9asR5TU3SRBTJqfY=
X-Received: by 2002:a24:5f92:: with SMTP id r140-v6mr21470855itb.95.1537383687953;
 Wed, 19 Sep 2018 12:01:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a02:c54e:0:0:0:0:0 with HTTP; Wed, 19 Sep 2018 12:01:27
 -0700 (PDT)
In-Reply-To: <cover.1537383101.git.andreyknvl@google.com>
References: <cover.1537383101.git.andreyknvl@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 19 Sep 2018 21:01:27 +0200
Message-ID: <CAAeHK+yScE0fN2BsC_xS2TBgW+anunkOLY8P8e17V8vkT+ZKgg@mail.gmail.com>
Subject: Re: [PATCH v8 00/20] kasan: add software tag-based mode for arm64
To:     Andrey Ryabinin <aryabinin@virtuozzo.com>
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
        Andrey Konovalov <andreyknvl@google.com>,
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
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Sep 19, 2018 at 8:54 PM, Andrey Konovalov <andreyknvl@google.com> wrote:
> This patchset adds a new software tag-based mode to KASAN [1].
> (Initially this mode was called KHWASAN, but it got renamed,
>  see the naming rationale at the end of this section).

Andrey, I remember you giving a Reviewed-by to this patchset, but
since there are somewhat significant naming related changes in the
last version, could you take another look? Thanks!
