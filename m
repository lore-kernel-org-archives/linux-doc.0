Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41F7CC38142
	for <linux-doc@archiver.kernel.org>; Fri, 20 Jan 2023 00:40:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbjATAko (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 19 Jan 2023 19:40:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbjATAkn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Jan 2023 19:40:43 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B20F47E4B8
        for <linux-doc@vger.kernel.org>; Thu, 19 Jan 2023 16:40:41 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id z1-20020a17090a66c100b00226f05b9595so3476308pjl.0
        for <linux-doc@vger.kernel.org>; Thu, 19 Jan 2023 16:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sFVdIvvzo/ETapZbTHnKoiKfHn/j96E5/5giRSCHT/Q=;
        b=b7i2+RwK9hPdPhRuhNwQDc5ekeYQ8BuSoHBwLqngASebWmuy1HGgZjKn8Azys5ZfMV
         VfY+8xr7v9QZDNwxb3DJ+OX78vZBg5b/ispDLD6iHYuVIg+vZmOqUM+Uu+YQENkVD3K8
         GbDXNoen7J2f2I7aybB8nIa6N522nKxhQkenk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFVdIvvzo/ETapZbTHnKoiKfHn/j96E5/5giRSCHT/Q=;
        b=uQA/zrja6/iUXxviRnsX3w8NMoTvHVXnufLJiPJ4G18AtkOtrv9gqt6aiGxe1OJWvC
         eQK1GBHupKz75TniMmDPLK/JEfDxmv7ybki+/i1TDSUXZDhYJOnB67RlNrsroG7qAh2B
         4FhVm5yVJHErWL0+FrD5FbbEIoOBYSsMePreLb8mYnz7MFiqvl5VgEkbiPhus7xFwU6g
         YvPRiyLFhi+QKT21612kfZzuLwjWdjqOHVHsako8nxYh+teJZj5Zg8KbOh1KDOSWyk1i
         InoGr3HppFrsGo+LuHGUUSFfbBDsVwv8GcXNVd/jojWhmLAvYM8XLVkxtP/HqtYb1nkF
         utuA==
X-Gm-Message-State: AFqh2kqgjvfkNWT2CE4OQCFVFI8ywCw0ZYiQzmR9mqLY8tnOeUu4fySr
        4j8K08aBjNI9iW02/cuByPExPg==
X-Google-Smtp-Source: AMrXdXv7pylFHOs3hcd85th2qDd1Mgc6nRCCmWLDNzyscDG+u+mxW82jHU3aLqsYpfnAU/bDqdra8g==
X-Received: by 2002:a05:6a21:99a7:b0:b2:5cf9:817b with SMTP id ve39-20020a056a2199a700b000b25cf9817bmr18329080pzb.5.1674175241235;
        Thu, 19 Jan 2023 16:40:41 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t25-20020a62d159000000b0056bd1bf4243sm9814718pfl.53.2023.01.19.16.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 16:40:40 -0800 (PST)
Date:   Thu, 19 Jan 2023 16:40:40 -0800
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
        Weijiang Yang <weijiang.yang@intel.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        John Allen <john.allen@amd.com>, kcc@google.com,
        eranian@google.com, rppt@kernel.org, jamorris@linux.microsoft.com,
        dethoma@microsoft.com, akpm@linux-foundation.org,
        Andrew.Cooper3@citrix.com, christina.schimpe@intel.com,
        Yu-cheng Yu <yu-cheng.yu@intel.com>
Subject: Re: [PATCH v5 02/39] x86/shstk: Add Kconfig option for shadow stack
Message-ID: <202301191640.DE1E4D3@keescook>
References: <20230119212317.8324-1-rick.p.edgecombe@intel.com>
 <20230119212317.8324-3-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119212317.8324-3-rick.p.edgecombe@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 19, 2023 at 01:22:40PM -0800, Rick Edgecombe wrote:
> From: Yu-cheng Yu <yu-cheng.yu@intel.com>
> 
> Shadow stack provides protection for applications against function return
> address corruption. It is active when the processor supports it, the
> kernel has CONFIG_X86_SHADOW_STACK enabled, and the application is built
> for the feature. This is only implemented for the 64-bit kernel. When it
> is enabled, legacy non-shadow stack applications continue to work, but
> without protection.
> 
> Since there is another feature that utilizes CET (Kernel IBT) that will
> share implementation with shadow stacks, create CONFIG_CET to signify
> that at least one CET feature is configured.
> 
> Tested-by: Pengfei Xu <pengfei.xu@intel.com>
> Tested-by: John Allen <john.allen@amd.com>
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
