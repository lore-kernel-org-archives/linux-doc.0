Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36118C433FE
	for <linux-doc@archiver.kernel.org>; Mon,  3 Oct 2022 18:24:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229922AbiJCSYP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 Oct 2022 14:24:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbiJCSYO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Oct 2022 14:24:14 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B904422F1
        for <linux-doc@vger.kernel.org>; Mon,  3 Oct 2022 11:24:10 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id q99-20020a17090a1b6c00b0020ac0368d64so1359336pjq.3
        for <linux-doc@vger.kernel.org>; Mon, 03 Oct 2022 11:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=wwu9lS4IvfCeN8Phj9REKX62enam27neFFF0OO9ppKE=;
        b=lKYqWl6A7r7Sr3/E8BW6VSg1cqafipTQuK3eeQGyiGtbferERJ1wgzXHmp//KGEi2u
         8h9uWTewlGL3XnZ5UgKRaznBiAGYZQBq50XP0umLoU6PolD2t32jNaRYebTAta7cD5AD
         ZPlpGlvp8IeKDGNn/JAOTfP3n9rQeemlrq1uE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=wwu9lS4IvfCeN8Phj9REKX62enam27neFFF0OO9ppKE=;
        b=QNJtxgKAmaEg4jyUhlcleVOnFZskyrpLu0H8tj+eUUcL3mkt75hQ/auACsHyORCHZ5
         ciK0syhwETmHqFP8QvPqPBVSydZit++hw+Qs70mR+8wJn4zA0U7v9o1nchhtu+Kuyd25
         QVO7Qg6++25765gT6DD2xx4PKlUyaJRhK5gT+J2XdITGc0YUL93h5yfTxk6VEiiWL8JY
         FnYALUUmdWNNfiV3fnxdNiOw+2fy2C6Zo6hA/snIv32VIEbDe9ifPPL3D5fZl8h7k/VU
         m07Xim5SIClpl0Vdk5A/BD/X1HAny4OthGdGpmqchd+O/cxtei0prQw33OuJRVgvjFuj
         VgoQ==
X-Gm-Message-State: ACrzQf2fa7b0lWXOEsd79i2rdMru1M2jnrv8WyVexh9+laFnMWXO81Dy
        APfeB+3mYEErlZDQVdw1C4ky9g==
X-Google-Smtp-Source: AMsMyM48Fs8gaQUQGBbjWpok2lFT9yYn1cXchH8flHZ8xyiWHgOGJ7sBj0XqkcvhSLNZbKtef4o3rg==
X-Received: by 2002:a17:902:b589:b0:179:f8c5:7212 with SMTP id a9-20020a170902b58900b00179f8c57212mr23373642pls.174.1664821449445;
        Mon, 03 Oct 2022 11:24:09 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y1-20020a626401000000b0053e8f4a10c1sm7717403pfb.217.2022.10.03.11.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 11:24:08 -0700 (PDT)
Date:   Mon, 3 Oct 2022 11:24:07 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc:     x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@kernel.org>,
        Balbir Singh <bsingharora@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H . J . Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V . Shankar" <ravi.v.shankar@intel.com>,
        Weijiang Yang <weijiang.yang@intel.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        joao.moreira@intel.com, John Allen <john.allen@amd.com>,
        kcc@google.com, eranian@google.com, rppt@kernel.org,
        jamorris@linux.microsoft.com, dethoma@microsoft.com,
        Yu-cheng Yu <yu-cheng.yu@intel.com>
Subject: Re: [PATCH v2 17/39] mm: Fixup places that call pte_mkwrite()
 directly
Message-ID: <202210031124.81D807B6B@keescook>
References: <20220929222936.14584-1-rick.p.edgecombe@intel.com>
 <20220929222936.14584-18-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220929222936.14584-18-rick.p.edgecombe@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 29, 2022 at 03:29:14PM -0700, Rick Edgecombe wrote:
> From: Yu-cheng Yu <yu-cheng.yu@intel.com>
> 
> With the introduction of shadow stack memory there are two ways a pte can
> be writable: regular writable memory and shadow stack memory.
> 
> In past patches, maybe_mkwrite() has been updated to apply pte_mkwrite()
> or pte_mkwrite_shstk() depending on the VMA flag. This covers most cases
> where a PTE is made writable. However, there are places where pte_mkwrite()
> is called directly and the logic should now also create a shadow stack PTE
> in the case of a shadow stack VMA.
> 
>  - do_anonymous_page() and migrate_vma_insert_page() check VM_WRITE
>    directly and call pte_mkwrite(), which is the same as maybe_mkwrite()
>    in logic and intention. Just change them to maybe_mkwrite().
> 
>  - When userfaultfd is creating a PTE after userspace handles the fault
>    it calls pte_mkwrite() directly. Teach it about pte_mkwrite_shstk()
> 
> In other cases where pte_mkwrite() is called directly, the VMA will not
> be VM_SHADOW_STACK, and so shadow stack memory should not be created.
>  - In the case of pte_savedwrite(), shadow stack VMA's are excluded.
>  - In the case of the "dirty_accountable" optimization in mprotect(),
>    shadow stack VMA's won't be VM_SHARED, so it is not nessary.
> 
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
