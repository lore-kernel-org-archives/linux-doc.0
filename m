Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 49C6B7D043
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Jun 2018 16:24:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932596AbeFGQYS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Jun 2018 12:24:18 -0400
Received: from mail-wr0-f193.google.com ([209.85.128.193]:40056 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753373AbeFGQYR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Jun 2018 12:24:17 -0400
Received: by mail-wr0-f193.google.com with SMTP id l41-v6so10480773wre.7
        for <linux-doc@vger.kernel.org>; Thu, 07 Jun 2018 09:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YzZMET5ITA4C5FM/Jlp0Cq66m2LLOOU87w3BEMwQ7lA=;
        b=jQnaZWKLkn4LVU+VAIZxhcbFqtb6eH1oH6Knpt31ma5bwJWcILnvN1N5Zrbw5bN2jd
         HHDDI402uLH0PR/91qydpHRUWkGobfWWI+VJlnRgJEvFAuuThe5BFu+Xr9/OFq5h5IHi
         3Rv1E0PX7C0bzSp89Uhe0cv3yrcRGvWdwfaYLEG6J1rzFJJT/Rx4BfOhGJdkAbGFTwez
         iW3dk1M0iwfAYwdQHrn/y3ixzeq299m4sY99ZRP6V5lL9Ejky+cFC98mo2lMuu7v5eqd
         qwIRoJ7FPKFHHWvXus/oGa1m/TpHWKnmFbxnwhoKB20UyYSmut7ICB+P63OxSCjD9aVA
         73Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YzZMET5ITA4C5FM/Jlp0Cq66m2LLOOU87w3BEMwQ7lA=;
        b=s+TEWH8k0MBvClZRSA5FwJuH8y5uijJIwy2fW/AtogIQx5y6F/FsaLvpFXiMRsSA1u
         W/1fz9fCCGeNQ/FKufH7Z36OJDec/AooZvcOSK6oCqZTaLMz2I/2aZdA3HRQ6z1XqFNd
         L9/cKGU3vqHXqVkqgBPeyCS4y8lcIapauuRw0YZHIpOBKQPxrz2zS3247/ndUFdabmv9
         j2Iub8EsjLpTTSX8ERdDJouije4sZcMBVTdmt5yE6/GWkQBS3XZhqjcJURVQYopwDyMB
         TtVPi47rhO/C3MrAl6WfaNTxpRTPSk4MJX70/GRUtZA6AZTIs4OlEuxhNjWqDmKQRrOt
         oiqg==
X-Gm-Message-State: APt69E3PjWmhprM+BQTCSJV49fd+yXAjZzvr/G2gMoYuMgD13h+1ZI+L
        UA1RctGWyaGKEMAtIM6WsUDoYBATEIOewGch+8hJjg==
X-Google-Smtp-Source: ADUXVKJHJwjfi6EBhMlHHI6HHlfXeWl3nerZb/RjehsgeSilBC90gAK9qfegX3KogMDUdi4rJJpzMxi9Ep8iY7hz/w4=
X-Received: by 2002:adf:b445:: with SMTP id v5-v6mr2210625wrd.67.1528388655645;
 Thu, 07 Jun 2018 09:24:15 -0700 (PDT)
MIME-Version: 1.0
References: <20180607143705.3531-1-yu-cheng.yu@intel.com> <20180607143705.3531-7-yu-cheng.yu@intel.com>
In-Reply-To: <20180607143705.3531-7-yu-cheng.yu@intel.com>
From:   Andy Lutomirski <luto@amacapital.net>
Date:   Thu, 7 Jun 2018 09:24:03 -0700
Message-ID: <CALCETrVa8MtxP9iqYkZLnetaQiN4UaWb=jGz1+rLsCuETHKydg@mail.gmail.com>
Subject: Re: [PATCH 6/9] x86/mm: Introduce ptep_set_wrprotect_flush and
 related functions
To:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
        Linux-MM <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>, X86 ML <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. J. Lu" <hjl.tools@gmail.com>,
        "Shanbhogue, Vedvyas" <vedvyas.shanbhogue@intel.com>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Oleg Nesterov <oleg@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
        mike.kravetz@oracle.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 7, 2018 at 7:40 AM Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:
>
> The function ptep_set_wrprotect()/huge_ptep_set_wrprotect() is
> used by copy_page_range()/copy_hugetlb_page_range() to copy
> PTEs.
>
> On x86, when the shadow stack is enabled, only a shadow stack
> PTE has the read-only and _PAGE_DIRTY_HW combination.  Upon
> making a dirty PTE read-only, we move its _PAGE_DIRTY_HW to
> _PAGE_DIRTY_SW.
>
> When ptep_set_wrprotect() moves _PAGE_DIRTY_HW to _PAGE_DIRTY_SW,
> if the PTE is writable and the mm is shared, another task could
> race to set _PAGE_DIRTY_HW again.
>
> Introduce ptep_set_wrprotect_flush(), pmdp_set_wrprotect_flush(),
> and huge_ptep_set_wrprotect_flush() to make sure this does not
> happen.
>

This patch adds flushes where they didn't previously exist.

> +static inline void ptep_set_wrprotect_flush(struct vm_area_struct *vma,
> +                                           unsigned long addr, pte_t *ptep)
> +{
> +       bool rw;
> +
> +       rw = test_and_clear_bit(_PAGE_BIT_RW, (unsigned long *)&ptep->pte);
> +       if (IS_ENABLED(CONFIG_X86_INTEL_SHADOW_STACK_USER)) {
> +               struct mm_struct *mm = vma->vm_mm;
> +               pte_t pte;
> +
> +               if (rw && (atomic_read(&mm->mm_users) > 1))
> +                       pte = ptep_clear_flush(vma, addr, ptep);

Why are you clearing the pte?

> -#define __HAVE_ARCH_PMDP_SET_WRPROTECT
> -static inline void pmdp_set_wrprotect(struct mm_struct *mm,
> -                                     unsigned long addr, pmd_t *pmdp)
> +#define __HAVE_ARCH_HUGE_PTEP_SET_WRPROTECT_FLUSH
> +static inline void huge_ptep_set_wrprotect_flush(struct vm_area_struct *vma,
> +                                                unsigned long addr, pte_t *ptep)
>  {
> -       clear_bit(_PAGE_BIT_RW, (unsigned long *)pmdp);
> +       ptep_set_wrprotect_flush(vma, addr, ptep);

Maybe I'm just missing something, but you're changed the semantics of
this function significantly.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
