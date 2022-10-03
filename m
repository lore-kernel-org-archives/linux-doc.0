Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC4DC433FE
	for <linux-doc@archiver.kernel.org>; Mon,  3 Oct 2022 18:12:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbiJCSMA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 Oct 2022 14:12:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230010AbiJCSL4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Oct 2022 14:11:56 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52CE137406
        for <linux-doc@vger.kernel.org>; Mon,  3 Oct 2022 11:11:47 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id l1-20020a17090a72c100b0020a6949a66aso6083746pjk.1
        for <linux-doc@vger.kernel.org>; Mon, 03 Oct 2022 11:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=zRpyaE88IPezVOhw7iDOjlsRbtSXUjPIrXfaa3Vd3zo=;
        b=PWArMU3a7kjBwWCA46WWP4zzfx02BDKVm4Jb2Z339yWHDI+W7ISC2qQN51aA/T1cmp
         4qlyLW4V3YZ9vPNyyr7J2q4Gwp/zmqjoyGzZ+I0HRBmpyvbyNFV3jXd6BlreiAM4z9sc
         3sAwUQEoaOtYanSqbEquaqOPgyq+F9eL1RUcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=zRpyaE88IPezVOhw7iDOjlsRbtSXUjPIrXfaa3Vd3zo=;
        b=QVpOk5clmlBuLx09ZZFcOdDB3Cx2+/XUhKCSHPQkjGX5uYUjijId/gOhnl4mNoi65V
         BOFNd5fV7QLuJUygLGZ9sb9IkM/MlhYlvYIGct5d8lFmMqlCigFOOuTUUv8/PFgfOdd2
         2gWJPiwPnoBr/uK99MrEUzIkhbG/uJT3p2Zrq8sV+djOyBLnph6NoRzNbZbgZvuHIzeS
         /nxc8snLt9QqWdVHD1r/0RYRwjNc/YnulKoWHusi2l4TF6Jrj1bd9azf8NtM8kDbkVAp
         RzjsUcKplGIKkdVRUDkohriSTCS99eFq2x6E4JgWNvpJPJN3yJ8dLjOzX6hig6TRcwOs
         Ooew==
X-Gm-Message-State: ACrzQf2jdCjUxQ29/KmMTksofT97zV7aSLfJhcDZxJWi8XUik3Qnqtxg
        0C5tj05k5eNq0Pfz2xQeU8j/7A==
X-Google-Smtp-Source: AMsMyM5XAU3N6BrociuiRhaNddnUYSLkzWBAzwcCZoX/da8Tx8mE88aWLj364HqDnnvojMSluB2wpg==
X-Received: by 2002:a17:902:e54b:b0:178:75b9:f1e9 with SMTP id n11-20020a170902e54b00b0017875b9f1e9mr23501376plf.104.1664820706785;
        Mon, 03 Oct 2022 11:11:46 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a15-20020a170902b58f00b0017849a2b56asm7513913pls.46.2022.10.03.11.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 11:11:46 -0700 (PDT)
Date:   Mon, 3 Oct 2022 11:11:45 -0700
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
        Yu-cheng Yu <yu-cheng.yu@intel.com>,
        Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v2 13/39] mm: Move VM_UFFD_MINOR_BIT from 37 to 38
Message-ID: <202210031111.01D879A@keescook>
References: <20220929222936.14584-1-rick.p.edgecombe@intel.com>
 <20220929222936.14584-14-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220929222936.14584-14-rick.p.edgecombe@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 29, 2022 at 03:29:10PM -0700, Rick Edgecombe wrote:
> From: Yu-cheng Yu <yu-cheng.yu@intel.com>
> 
> To introduce VM_SHADOW_STACK as VM_HIGH_ARCH_BIT (37), and make all
> VM_HIGH_ARCH_BITs stay together, move VM_UFFD_MINOR_BIT from 37 to 38.
> 
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
