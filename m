Return-Path: <SRS0=NPh6=6V=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B017BC47257
	for <linux-doc@archiver.kernel.org>; Thu,  7 May 2020 17:51:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 91C5F21835
	for <linux-doc@archiver.kernel.org>; Thu,  7 May 2020 17:51:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RrVQQPSN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727993AbgEGRvf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 7 May 2020 13:51:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726514AbgEGRvf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 May 2020 13:51:35 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04477C05BD0A
        for <linux-doc@vger.kernel.org>; Thu,  7 May 2020 10:51:35 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id y25so3353325pfn.5
        for <linux-doc@vger.kernel.org>; Thu, 07 May 2020 10:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6nsicqHKSLR08n1R+IXV8HH61Ez1sWv3K0CdRq6A4rw=;
        b=RrVQQPSNEjwXxIpxHMpeXgb/6SFvXrlHUGtWgKRpooc/AMiY7CyxeneurgMVsZo8T4
         rLft7rAMLxvk81jduk4p1OvVy7Ds+6FdlCoFjF4obUTG7NUio/81dR/EkXL7urAWPtiF
         OM+VRspJQyc+7FPnIWrzi3cHthVRonjBAFiOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6nsicqHKSLR08n1R+IXV8HH61Ez1sWv3K0CdRq6A4rw=;
        b=gOVzsGUhZCWKqxhNAGanLDXcRNbm8m3uBboqIgt0w7VyvDyrxNcDWpNJGSW6s8r2KR
         3udLRlVml7WWzb7sJBSTLXHs05EjbcSt+N3SVm+pZHloTv5a5mn5pbBo6JbsfbIeCr1s
         KSexyxyl0M7qekHbUuylAKP83GMpgFmX7gStwIPM6I1NsFlf21tE8OIVKpNOwBGstEMR
         kEb93snwdJa94gk3yw/Tc2FKhSKUiST+HTyVCgaTrKK/DnNHY8p6sHYMV+uojSkwkcgZ
         Oiijyq8vabPP1sm/nW02wKVwby6bSaLNE+2G1NaqXDdyDuZW+f6x2jJiPR1wPrEppIv1
         wPBw==
X-Gm-Message-State: AGi0Pua612xWx068KCN7JQRJjoQ293z1sJITHof4fG6g/ELQLH8AlAy8
        24G2AVwmzfrwVVLrL2lC6aGCJg==
X-Google-Smtp-Source: APiQypJrg795r4p3dlKKs5p5tJSGEr5TXh4b/RDvjDLBZG4ZsffQBKKTjPJNE6l8z2s2P5ajyKYDOw==
X-Received: by 2002:aa7:9dc7:: with SMTP id g7mr15195629pfq.291.1588873894492;
        Thu, 07 May 2020 10:51:34 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id g25sm5314837pfo.150.2020.05.07.10.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 10:51:33 -0700 (PDT)
Date:   Thu, 7 May 2020 10:51:32 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Anthony Yznaga <anthony.yznaga@oracle.com>
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        willy@infradead.org, corbet@lwn.net, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        rppt@linux.ibm.com, akpm@linux-foundation.org, hughd@google.com,
        ebiederm@xmission.com, masahiroy@kernel.org, ardb@kernel.org,
        ndesaulniers@google.com, dima@golovin.in, daniel.kiper@oracle.com,
        nivedita@alum.mit.edu, rafael.j.wysocki@intel.com,
        dan.j.williams@intel.com, zhenzhong.duan@oracle.com,
        jroedel@suse.de, bhe@redhat.com, guro@fb.com,
        Thomas.Lendacky@amd.com, andriy.shevchenko@linux.intel.com,
        hannes@cmpxchg.org, minchan@kernel.org, mhocko@kernel.org,
        ying.huang@intel.com, yang.shi@linux.alibaba.com,
        gustavo@embeddedor.com, ziqian.lzq@antfin.com,
        vdavydov.dev@gmail.com, jason.zeng@intel.com, kevin.tian@intel.com,
        zhiyuan.lv@intel.com, lei.l.li@intel.com, paul.c.lai@intel.com,
        ashok.raj@intel.com, linux-fsdevel@vger.kernel.org,
        linux-doc@vger.kernel.org, kexec@lists.infradead.org
Subject: Re: [RFC 21/43] x86/KASLR: PKRAM: support physical kaslr
Message-ID: <202005071049.2D0939137D@keescook>
References: <1588812129-8596-1-git-send-email-anthony.yznaga@oracle.com>
 <1588812129-8596-22-git-send-email-anthony.yznaga@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588812129-8596-22-git-send-email-anthony.yznaga@oracle.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 06, 2020 at 05:41:47PM -0700, Anthony Yznaga wrote:
> Avoid regions of memory that contain preserved pages when computing
> slots used to select where to put the decompressed kernel.

This is changing the slot-walking code instead of updating
mem_avoid_overlap() -- that's where the check for a "reserved" memory
area should live.

For example, this is how both mem_avoid_memmap() and the setup_data
memory areas are handled.

Is there a reason mem_avoid_overlap() can't be used here?

-- 
Kees Cook
