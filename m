Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9016C0015E
	for <linux-doc@archiver.kernel.org>; Fri, 14 Jul 2023 16:36:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235664AbjGNQgv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 14 Jul 2023 12:36:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235124AbjGNQgt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Jul 2023 12:36:49 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D8752D49
        for <linux-doc@vger.kernel.org>; Fri, 14 Jul 2023 09:36:48 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6687446eaccso2038692b3a.3
        for <linux-doc@vger.kernel.org>; Fri, 14 Jul 2023 09:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689352608; x=1689957408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QQ1uI9q9sU2ZQAZveePTsLb5K8q5kCpO4NQiP7h7UI4=;
        b=okKHAWGl0HU/dDrm6Nylyw0ZW/1JCHS/YMnhiAbqBiwVuC7bV22VAGkf0/nuqrB3uU
         Yf1l+ZCIuKAn94NDuPC1XHoJvcrFPq0jcjOED2EfZtC7m1tuPSxaeoEqhIfjyQqtZNfu
         ++h6EsvmIkc82XsLvzI+3JciPpWTaYKHDf0tbTGqzGIr1ho8NYiRaYeZHRRWhWtJmczL
         wTBb+W3qmkk9UThIjLWQUorLv3HScFA/HrAJGclQDgwHpRU/o3FzuyfIK4JrdszVHwNs
         Z3y+v4PsYLeiInACqeCeScTBn2paFWDP5917TuipB4tZxbxDQW2Gt4DG9rUa37w2czQB
         m9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689352608; x=1689957408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QQ1uI9q9sU2ZQAZveePTsLb5K8q5kCpO4NQiP7h7UI4=;
        b=X/LoUaj7YO5db2zLsUG5EVZFNzNQXpex1iCbBAovNwl3HALlqa7t7PtK1SL6Rpwly6
         9BpDbUyGKO9bLQVlOU5cDIWJ+SfEzJrMT6Klql1zSxOavvVsmeMQjMvy2nEHXEdmuM8Q
         nVrCGs5t769erPqgIwlZzEqgCn1BWa+z3OtdTb209B29YNGJJPxcZiu/N9LWp5dPYrXS
         xxyELKWQc5kaC4O7XBdA6s6zNv3o9Sp9iSbrTrclS2MutuZFh+VE98LJ1sMJu8aFED4b
         NBXr1C6RjjSP/VTU9DYD/sH6PfmHadQNKEyd3/ITK2WUn/64yCHbCDkg+N0jF3eNaciA
         zn0g==
X-Gm-Message-State: ABy/qLat2IAb6JMokivV9yz4KGJsVdcUsjRs9F8fPzIshlNDsQ+6zexP
        ouSMaFBNoLdn45FabC2BCxoq3crWXdAYf+n04+4=
X-Google-Smtp-Source: APBJJlHRd1gLk7JPxHUtTov1qnh114x9KwaDQ/5sltZxt9EHRLviBFeaGdLonEvrSgYBN3Wzgzxgfg==
X-Received: by 2002:a05:6a00:16c4:b0:676:399f:346b with SMTP id l4-20020a056a0016c400b00676399f346bmr6889692pfc.1.1689352607578;
        Fri, 14 Jul 2023 09:36:47 -0700 (PDT)
Received: from ghost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id fm10-20020a056a002f8a00b00640f51801e6sm7373618pfb.159.2023.07.14.09.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 09:36:47 -0700 (PDT)
Date:   Fri, 14 Jul 2023 09:36:45 -0700
From:   Charlie Jenkins <charlie@rivosinc.com>
To:     Conor Dooley <conor@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        paul.walmsley@sifive.com, palmer@rivosinc.com,
        aou@eecs.berkeley.edu, anup@brainfault.org,
        konstantin@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
        mick@ics.forth.gr, jrtc27@jrtc27.com, rdunlap@infradead.org,
        alexghiti@rivosinc.com
Subject: Re: [PATCH v5 0/4] RISC-V: mm: Make SV48 the default address space
Message-ID: <ZLF5nS12R37loA9I@ghost>
References: <20230714001430.75798-1-charlie@rivosinc.com>
 <20230714-hangnail-stinking-60f9725ac0d5@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230714-hangnail-stinking-60f9725ac0d5@spud>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jul 14, 2023 at 12:17:00PM +0100, Conor Dooley wrote:
> On Thu, Jul 13, 2023 at 05:13:59PM -0700, Charlie Jenkins wrote:
> > Make sv48 the default address space for mmap as some applications
> > currently depend on this assumption. Users can now select a
> > desired address space using a non-zero hint address to mmap. Previously,
> > requesting the default address space from mmap by passing zero as the hint
> > address would result in using the largest address space possible. Some
> > applications depend on empty bits in the virtual address space, like Go and
> > Java, so this patch provides more flexibility for application developers.
> 
> The patchwork automation failed to apply this, what is the base for the
> series?

I forgot to pull in the changes to the riscv selftests so the conflict
is in that Makefile. I will send out a v6 with the correct base.

> 
> > 
> > -Charlie
> > 
> > ---
> > v5:
> > - Minor wording change in documentation
> > - Change some parenthesis in arch_get_mmap_ macros
> > - Added case for addr==0 in arch_get_mmap_ because without this, programs would
> >   crash if RLIMIT_STACK was modified before executing the program. This was
> >   tested using the libhugetlbfs tests. 
> > 
> > v4:
> > - Split testcases/document patch into test cases, in-code documentation, and
> >   formal documentation patches
> > - Modified the mmap_base macro to be more legible and better represent memory
> >   layout
> > - Fixed documentation to better reflect the implmentation
> > - Renamed DEFAULT_VA_BITS to MMAP_VA_BITS
> > - Added additional test case for rlimit changes
> > ---
> > 
> > Charlie Jenkins (4):
> >   RISC-V: mm: Restrict address space for sv39,sv48,sv57
> >   RISC-V: mm: Add tests for RISC-V mm
> >   RISC-V: mm: Update pgtable comment documentation
> >   RISC-V: mm: Document mmap changes
> > 
> >  Documentation/riscv/vm-layout.rst             |  22 +++
> >  arch/riscv/include/asm/elf.h                  |   2 +-
> >  arch/riscv/include/asm/pgtable.h              |  20 ++-
> >  arch/riscv/include/asm/processor.h            |  46 +++++-
> >  tools/testing/selftests/riscv/Makefile        |   2 +-
> >  tools/testing/selftests/riscv/mm/.gitignore   |   1 +
> >  tools/testing/selftests/riscv/mm/Makefile     |  21 +++
> >  .../selftests/riscv/mm/testcases/mmap.c       | 133 ++++++++++++++++++
> >  8 files changed, 234 insertions(+), 13 deletions(-)
> >  create mode 100644 tools/testing/selftests/riscv/mm/.gitignore
> >  create mode 100644 tools/testing/selftests/riscv/mm/Makefile
> >  create mode 100644 tools/testing/selftests/riscv/mm/testcases/mmap.c
> > 
> > -- 
> > 2.41.0
> > 


