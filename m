Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B9DA37D087
	for <lwn-linux-doc@archive.lwn.net>; Thu, 11 Oct 2018 20:39:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725913AbeJLEIq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 12 Oct 2018 00:08:46 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:38823 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725824AbeJLEIq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 12 Oct 2018 00:08:46 -0400
Received: by mail-oi1-f194.google.com with SMTP id u197-v6so8176186oif.5
        for <linux-doc@vger.kernel.org>; Thu, 11 Oct 2018 13:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+NaERK3t9jZbwruYt+KRN4CMKJa5ImYF22IDwr1nznw=;
        b=i3BZB1RtGZo5hdf7PWvA4dOZk/fhJBBk32vLvTd5+GzbqHSBaSQAIL+mQ4unxVniio
         16PRaK0Jxyo3KiJJle9dBIvIE1GXUvoBhxFFSU58vppUWrpWLrsC1TqXUqFkZNholw9E
         mdUXiN4Yk6zBxCx/bRZzkwyLMNJwAdTtJDhrWCeATYq9srbvZ/OhF32CGu8wtopdl1lY
         jLZBqm/5hMInID+rqzyxyMOK5gLHRnMiAIzoXHlGZZOipLDxvoZng4fStVa4mQNj5j/W
         4x4hIPDKOOX5pkz33N2ftql/o+0Kq3/F8g4R48YXCWNeZ3nnKXR4A2yRLjBwOMeSODEC
         j8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+NaERK3t9jZbwruYt+KRN4CMKJa5ImYF22IDwr1nznw=;
        b=hVOMroQY/noJuqHbLb2WUcus1nl87lxn3AWemnOjASSDVZ+g9lfJpriUC5WZNphLvA
         MTMC4PF/Ux1l0dlxostx4icBSCo9lvdWF2ifGw7fTXzqx8h/GBF68PynDFAVyeuFM3dC
         4mvOhoLFJB2d9H5ig1hVguVQSYSbiX/iGe11h0JRdPX2CbONPAzWez7Bu0UIWT6XD/AP
         vlgGDwqjEDygJPqNHu3kNf120LoPUUZ6356wQTvnhSJ4ZSCoO5sTMXAMH9DpBccNyMJ7
         B0qz3+zzN0Mfod9NjmRZM8/ajaym7Jff2MvIuun0S3eDw7xfZM1bLqvTETk/5BHsK/Mb
         z4gg==
X-Gm-Message-State: ABuFfojRoB2aLWrkO/1PVNIIKvrloXFoCW9I49OOEGz3b6TR9X9zDRTz
        cA/gfyYCfk3or1fhePSWh+gdqGrOwqBMxk5zcikCUQ==
X-Google-Smtp-Source: ACcGV62LIGnlFhONcnkkngc9Z/V6ZuElp3ECouZgxaPIurUR5siO55nOgxPJndqL9ySAwpjVQFrAD6PLs+aiyDtWjzM=
X-Received: by 2002:aca:bf55:: with SMTP id p82-v6mr1857876oif.39.1539290390243;
 Thu, 11 Oct 2018 13:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <20181011151523.27101-1-yu-cheng.yu@intel.com> <20181011151523.27101-8-yu-cheng.yu@intel.com>
In-Reply-To: <20181011151523.27101-8-yu-cheng.yu@intel.com>
From:   Jann Horn <jannh@google.com>
Date:   Thu, 11 Oct 2018 22:39:24 +0200
Message-ID: <CAG48ez3R7XL8MX_sjff1FFYuARX_58wA_=ACbv2im-XJKR8tvA@mail.gmail.com>
Subject: Re: [PATCH v5 07/27] mm/mmap: Create a guard area between VMAs
To:     yu-cheng.yu@intel.com, Andy Lutomirski <luto@amacapital.net>
Cc:     "the arch/x86 maintainers" <x86@kernel.org>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org, Linux-MM <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Balbir Singh <bsingharora@gmail.com>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>, hjl.tools@gmail.com,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>, rdunlap@infradead.org,
        ravi.v.shankar@intel.com, vedvyas.shanbhogue@intel.com,
        Daniel Micay <danielmicay@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 11, 2018 at 5:20 PM Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:
> Create a guard area between VMAs to detect memory corruption.
[...]
> +config VM_AREA_GUARD
> +       bool "VM area guard"
> +       default n
> +       help
> +         Create a guard area between VM areas so that access beyond
> +         limit can be detected.
> +
>  endmenu

Sorry to bring this up so late, but Daniel Micay pointed out to me
that, given that VMA guards will raise the number of VMAs by
inhibiting vma_merge(), people are more likely to run into
/proc/sys/vm/max_map_count (which limits the number of VMAs to ~65k by
default, and can't easily be raised without risking an overflow of
page->_mapcount on systems with over ~800GiB of RAM, see
https://lore.kernel.org/lkml/20180208021112.GB14918@bombadil.infradead.org/
and replies) with this change.

Playing with glibc's memory allocator, it looks like glibc will use
mmap() for 128KB allocations; so at 65530*128KB=8GB of memory usage in
128KB chunks, an application could run out of VMAs.

People already run into that limit sometimes when mapping files, and
recommend raising it:

https://www.elastic.co/guide/en/elasticsearch/reference/current/vm-max-map-count.html
http://docs.actian.com/vector/4.2/User/Increase_max_map_count_Kernel_Parameter_(Linux).htm
https://www.suse.com/de-de/support/kb/doc/?id=7000830 (they actually
ran into ENOMEM on **munmap**, because you can't split VMAs once the
limit is reached): "A custom application was failing on a SLES server
with ENOMEM errors when attempting to release memory using an munmap
call. This resulted in memory failing to be released, and the system
load and swap use increasing until the SLES machine ultimately crashed
or hung."
https://access.redhat.com/solutions/99913
https://forum.manjaro.org/t/resolved-how-to-set-vm-max-map-count-during-boot/43360

Arguably the proper solution to this would be to raise the default
max_map_count to be much higher; but then that requires fixing the
mapcount overflow.
