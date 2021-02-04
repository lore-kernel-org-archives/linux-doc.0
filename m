Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A43B8C433E6
	for <linux-doc@archiver.kernel.org>; Thu,  4 Feb 2021 19:54:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71ECE64F45
	for <linux-doc@archiver.kernel.org>; Thu,  4 Feb 2021 19:54:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238312AbhBDTyA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Feb 2021 14:54:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239486AbhBDTwQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Feb 2021 14:52:16 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E62D3C06121E
        for <linux-doc@vger.kernel.org>; Thu,  4 Feb 2021 11:50:17 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id o63so2857181pgo.6
        for <linux-doc@vger.kernel.org>; Thu, 04 Feb 2021 11:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xVfkuBJxoMHahNTAuzjMVwQ5V275LoCHtWLRN4+qRmA=;
        b=SMhMJ0y1hFFkybLoK6RuX6W/uHtQZL/bYx1Vgct5XlRDHsQX7hEStJhU3muUb4fbEv
         hiUTrOqPhcz1pfUb97munHXmjX0c8gXGZ3hYDWbcMqclDY0sjxLOb8ku8yWr5/G0SoNh
         WUrWnsUWQvaHO1lagOpKt+BD5lQaiuCJGoC+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xVfkuBJxoMHahNTAuzjMVwQ5V275LoCHtWLRN4+qRmA=;
        b=AAdgE/BSswos27Y0TqYlpNwx4qoZFDi5ir31YAfgJFhx7W08SzMf/yLQUr23BGavSd
         uVg6uUL5g7FtwyLV+a6cErqUTVzEfSzBdB7HqOlQq5RnKtM87EWDzLGRg+dKfqqgZhwr
         69Oa1HYPQz0yjSSIYIldOsJAU/m6RZFzhW7FdtLXwt8aY3tOcTyrEcIT2jbIJGNezRQs
         U9bHGccctw2LL1/1u26eF4C3FcCyKC/zdeDyBb8KZwNnu8AQDWiRPsnpY5rMojbodO/x
         ET8ZeeVzBzx73JwYfAhyDEWwKmfm5OpgaXL9kHn5xdfNj5Xre0eTS9K5lbRK4n6/kePr
         rAnQ==
X-Gm-Message-State: AOAM532KFLaLONXFKbZVewZ2BA12bfu1eUY8K97Z2IgHQ52y1RNxtdtW
        moWnCTjsiOytuJEF08kc3Nw9DQ==
X-Google-Smtp-Source: ABdhPJzOajMVaIDiSuI0Zs6A72FQUA7Xr4U1otuUXAtASSA9xiRUczq+mdvc5mt1TaWo3NxHiyLjQw==
X-Received: by 2002:a62:7d03:0:b029:1bb:5919:6dec with SMTP id y3-20020a627d030000b02901bb59196decmr766097pfc.76.1612468217541;
        Thu, 04 Feb 2021 11:50:17 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y16sm7231723pfb.83.2021.02.04.11.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 11:50:16 -0800 (PST)
Date:   Thu, 4 Feb 2021 11:50:15 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Cc:     x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
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
        "H.J. Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Weijiang Yang <weijiang.yang@intel.com>,
        Pengfei Xu <pengfei.xu@intel.com>
Subject: Re: [PATCH v19 4/7] x86/cet/ibt: Update ELF header parsing for
 Indirect Branch Tracking
Message-ID: <202102041150.191C2FC@keescook>
References: <20210203225902.479-1-yu-cheng.yu@intel.com>
 <20210203225902.479-5-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210203225902.479-5-yu-cheng.yu@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 03, 2021 at 02:58:59PM -0800, Yu-cheng Yu wrote:
> An ELF file's .note.gnu.property indicates features the file supports.
> The property is parsed at loading time and passed to arch_setup_elf_
> property().  Update it for Indirect Branch Tracking.
> 
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
