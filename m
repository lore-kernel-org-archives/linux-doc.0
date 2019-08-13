Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 289CB7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Tue, 13 Aug 2019 22:55:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727437AbfHMWzV (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 13 Aug 2019 18:55:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:59264 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727282AbfHMWzV (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Aug 2019 18:55:21 -0400
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E6246217F4
        for <linux-doc@vger.kernel.org>; Tue, 13 Aug 2019 22:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565736921;
        bh=+rrGnvdcanVtNKSBWoGJHi/njpfEfmBbO4E1AUigxgg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ywdw8i9NOLTIIMCBL4r7dwTOGtr9jQVBQm2Nfi4QSKZ5TDuLbpD9BYu+MoNU50rde
         W1tfa4sGxkMsyAhZ8YrFO5xzfxyA9tQ1NJMN+KFszGDWDnu3nYJ5D8+ayQf/onHMht
         XUrwBquLBtXbY8oQ8Evp9cZErtU2KDJXP2HM3BiQ=
Received: by mail-wm1-f53.google.com with SMTP id p74so2919447wme.4
        for <linux-doc@vger.kernel.org>; Tue, 13 Aug 2019 15:55:20 -0700 (PDT)
X-Gm-Message-State: APjAAAW1PXtOmk+Yp9ETWvLUFIXkv1GZ0bUr1bTemJjdFUFte8sse3NZ
        K2e7VPDEBt/pgrXluz1QaWKzVYNafSIZaCqFI+qxGw==
X-Google-Smtp-Source: APXvYqz81rhcDjLrUXa949/jjm55ToItN38xIeCcUB+xCMtSJjaFWmN9F1yAoi+Z2N937R71Fz0pHZpiJ2OikJCF6K0=
X-Received: by 2002:a05:600c:24cf:: with SMTP id 15mr5069335wmu.76.1565736919249;
 Tue, 13 Aug 2019 15:55:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190813205225.12032-1-yu-cheng.yu@intel.com> <20190813205225.12032-16-yu-cheng.yu@intel.com>
In-Reply-To: <20190813205225.12032-16-yu-cheng.yu@intel.com>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Tue, 13 Aug 2019 15:55:07 -0700
X-Gmail-Original-Message-ID: <CALCETrVKbqzivPfUOiGi5efHUpEsfPkNzP0CrmAZzcwUgf7quA@mail.gmail.com>
Message-ID: <CALCETrVKbqzivPfUOiGi5efHUpEsfPkNzP0CrmAZzcwUgf7quA@mail.gmail.com>
Subject: Re: [PATCH v8 15/27] mm: Handle shadow stack page fault
To:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Cc:     X86 ML <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Balbir Singh <bsingharora@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H.J. Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>,
        Dave Martin <Dave.Martin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Aug 13, 2019 at 2:02 PM Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:
>
> When a task does fork(), its shadow stack (SHSTK) must be duplicated
> for the child.  This patch implements a flow similar to copy-on-write
> of an anonymous page, but for SHSTK.
>
> A SHSTK PTE must be RO and dirty.  This dirty bit requirement is used
> to effect the copying.  In copy_one_pte(), clear the dirty bit from a
> SHSTK PTE to cause a page fault upon the next SHSTK access.  At that
> time, fix the PTE and copy/re-use the page.

Is using VM_SHSTK and special-casing all of this really better than
using a special mapping or other pseudo-file-backed VMA and putting
all the magic in the vm_operations?

--Andy
