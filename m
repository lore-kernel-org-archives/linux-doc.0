Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C169FC0015E
	for <linux-doc@archiver.kernel.org>; Tue,  1 Aug 2023 19:49:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231765AbjHATtH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 1 Aug 2023 15:49:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231416AbjHATtE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Aug 2023 15:49:04 -0400
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EE672114
        for <linux-doc@vger.kernel.org>; Tue,  1 Aug 2023 12:49:02 -0700 (PDT)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1bba9a0da10so42483685ad.2
        for <linux-doc@vger.kernel.org>; Tue, 01 Aug 2023 12:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690919342; x=1691524142;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ymMuGbXslfyJGs4W/pBqFuGxl9xUvy7q5fX4QbBoOtQ=;
        b=CydE6ofDFbki4OoGOG75dPf8HjmzdP4bx8vverzkUAQVtD69mMn7n68FWR8AAp7DXQ
         w+dl1y5zJGShPu6hUhv3xWgs0RLuDKkU1QeFVeAkGndzTQF4ejZ1rYTen/R2bDlQiGdt
         p2JE4NI74wSzCDPayw3C3EPUnZHQ6AwVPX7+Hr/id3ZzAXZ75VD1wArInmjbenyfG79V
         cEByprzGAc4WBhBRZXFreyy3tDtKJhpsG+vPyPTXY7LVerieG5d/K0kioNLl2WhELfBY
         ntCCC/ISdhA9syO12Y1PCPSKi59/fx8iNJKpcw07IuHVOLESRbk7CVIj2E7rNQ0Q4Awv
         rGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690919342; x=1691524142;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ymMuGbXslfyJGs4W/pBqFuGxl9xUvy7q5fX4QbBoOtQ=;
        b=iwpW97cmUpUJl3gzQgrpE8vUWt2p6rmy1yq0Cad+hrygAm6E3CyfzHtOoKHGMNnO6L
         2JIaC4oJt+4XOAexycH7fo+sKP8dzB+85iEiaOL12t7JFrYIdGlR75/yn/lKt1a15i4+
         LmICw8PgiWWCufWtbZBr3AMt9DiQhq1n2H3QkAdYIgJth/IHs1eVXT/A079G1lbWHIey
         I1pAv7QzTiPNtw/sKuDpB9tGmzsxM2O73qMrO2N+ARIvAIlb/lm3qs6gvEe80kXg3Wbi
         jKHoGvYpP7mkP2RZZlQ6LV6ZiZm+CZU8+UMayhsXKgWvYHH2TQfGflQKPdh7zt4wjd4+
         6SKw==
X-Gm-Message-State: ABy/qLZ4y8cM4FSQhAfjUk9LgyWKQDUhBX/WI9vNOFvyAkXa+iMjGzm8
        hpMP1pAiBZYRWC6SM828gI2r04hxRv4=
X-Google-Smtp-Source: APBJJlHzs/CPjAfxg4yY07jd2lFS2uJwEiSQkwxUoufms67SS+axZJeOfATbgdLU+XSQqEOfpNJp/uAu49A=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:f683:b0:1b8:a54c:61ef with SMTP id
 l3-20020a170902f68300b001b8a54c61efmr67559plg.9.1690919341844; Tue, 01 Aug
 2023 12:49:01 -0700 (PDT)
Date:   Tue, 1 Aug 2023 19:49:00 +0000
In-Reply-To: <20230801193750.GA119080@hirez.programming.kicks-ass.net>
Mime-Version: 1.0
References: <20230801083553.8468-1-xin3.li@intel.com> <20230801083553.8468-7-xin3.li@intel.com>
 <ZMlWe5TgS6HM98Mg@google.com> <20230801193750.GA119080@hirez.programming.kicks-ass.net>
Message-ID: <ZMlhrHv1c9P6HQXw@google.com>
Subject: Re: [PATCH RESEND v9 33/36] KVM: VMX: Add VMX_DO_FRED_EVENT_IRQOFF
 for IRQ/NMI handling
From:   Sean Christopherson <seanjc@google.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Xin Li <xin3.li@intel.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
        xen-devel@lists.xenproject.org, Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>,
        Andy Lutomirski <luto@kernel.org>,
        Oleg Nesterov <oleg@redhat.com>,
        Tony Luck <tony.luck@intel.com>,
        "K . Y . Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Kim Phillips <kim.phillips@amd.com>,
        Hyeonggon Yoo <42.hyeyoo@gmail.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
        Babu Moger <babu.moger@amd.com>,
        Jim Mattson <jmattson@google.com>,
        Sandipan Das <sandipan.das@amd.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Daniel Sneddon <daniel.sneddon@linux.intel.com>,
        Breno Leitao <leitao@debian.org>,
        Nikunj A Dadhania <nikunj@amd.com>,
        Brian Gerst <brgerst@gmail.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Alexander Potapenko <glider@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Kees Cook <keescook@chromium.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Ze Gao <zegao2021@gmail.com>, Fei Li <fei1.li@intel.com>,
        Conghui <conghui.chen@intel.com>,
        Ashok Raj <ashok.raj@intel.com>,
        "Jason A . Donenfeld" <Jason@zx2c4.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Jacob Pan <jacob.jun.pan@linux.intel.com>,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Jane Malalane <jane.malalane@citrix.com>,
        David Woodhouse <dwmw@amazon.co.uk>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Yantengsi <siyanteng@loongson.cn>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Sathvika Vasireddy <sv@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Aug 01, 2023, Peter Zijlstra wrote:
> On Tue, Aug 01, 2023 at 07:01:15PM +0000, Sean Christopherson wrote:
> > The spec I have from May 2022 says the NMI bit colocated with CS, not SS.  And
> > the cover letter's suggestion to use a search engine to find the spec ain't
> > exactly helpful, that just gives me the same "May 2022 Revision 3.0" spec.  So
> > either y'all have a spec that I can't find, or this is wrong.
> 
> https://intel.com/sdm
> 
> is a useful shorthand I've recently been told about.

Hallelujah!

> On that page is also "Flexible Return and Event Delivery Specification", when
> clicked it will gift you a FRED v5.0 PDF.

Worked for me, too.  Thanks!
