Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34397C46467
	for <linux-doc@archiver.kernel.org>; Fri, 20 Jan 2023 01:04:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbjATBEE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 19 Jan 2023 20:04:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjATBEE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Jan 2023 20:04:04 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AA8CA102E
        for <linux-doc@vger.kernel.org>; Thu, 19 Jan 2023 17:04:02 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id e10so2976683pgc.9
        for <linux-doc@vger.kernel.org>; Thu, 19 Jan 2023 17:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RMyK8TWBy/rCRY+f/CELnWHAsbOxEp5tJ/kKh7SlGrE=;
        b=HNvX51O/DEprXKflx7pWqaGjLOmylpOJlGBu4RvAtyIGoWOf8U7lNla8R/lxB/pY7w
         6T9BXQ8lPsUoUa7unGyKu+xDkqDQjSGqhnaebMz/E+vQnvXwkiXITiJCSaQK4OMwelJd
         qDigrbkkGoU7L5umpJREXH5gQODW8jcOSvVTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMyK8TWBy/rCRY+f/CELnWHAsbOxEp5tJ/kKh7SlGrE=;
        b=upWYkmeq+DYwupHUKF/BFfGN+CBe4Lf4lM7GCLGLmx1sC37ythvVjfNNjN6U22zJdd
         vT+z1YfrAOxBnpKvtpTuYepke3dsol6neEeNObMCIEWuOpTc2PGlrUk4gfk5L/GTPxoG
         TNcw5TRA/oWM6aXI2ivEeI1+BD2E+hIFth4/sljSFJkoC0EHpqyOxyYfHuqlJqHzcgpj
         fQyK61lykGk5743967NWoIsmV7JMW0v6rc6seOml0jck05qMSZfM1qHDM5sxT5TYEajj
         luKtEEr4Q8WSPXqyDMKfFk0zttBC2FN3suK4L2kGqXnqDnVYzslOQopCs7UplyiwUsBa
         xXzg==
X-Gm-Message-State: AFqh2komUGd9YBhBBlwzmJUXMpdSR0wTaQ+1Ti9J53vJ+qReMA8TVTdc
        WeyCRmS71tI8zRlJTYNjTucy4Q==
X-Google-Smtp-Source: AMrXdXtTKI2kkFnGFw4R9p4eZUplQk2pOiwojsYgvuPj7O8XWjxV8VJBE5XmixgDIcb3rYne6nRs3A==
X-Received: by 2002:a05:6a00:bc8:b0:58d:97cd:b65a with SMTP id x8-20020a056a000bc800b0058d97cdb65amr13351335pfu.26.1674176642023;
        Thu, 19 Jan 2023 17:04:02 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 134-20020a62148c000000b0056bc30e618dsm24694079pfu.38.2023.01.19.17.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 17:04:01 -0800 (PST)
Date:   Thu, 19 Jan 2023 17:04:00 -0800
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
        Andrew.Cooper3@citrix.com, christina.schimpe@intel.com
Subject: Re: [PATCH v5 26/39] x86: Introduce userspace API for shadow stack
Message-ID: <202301191703.9E24A4E52@keescook>
References: <20230119212317.8324-1-rick.p.edgecombe@intel.com>
 <20230119212317.8324-27-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119212317.8324-27-rick.p.edgecombe@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 19, 2023 at 01:23:04PM -0800, Rick Edgecombe wrote:
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> 
> Add three new arch_prctl() handles:
> 
>  - ARCH_SHSTK_ENABLE/DISABLE enables or disables the specified
>    feature. Returns 0 on success or an error.
> 
>  - ARCH_SHSTK_LOCK prevents future disabling or enabling of the
>    specified feature. Returns 0 on success or an error
> 
> The features are handled per-thread and inherited over fork(2)/clone(2),
> but reset on exec().
> 
> This is preparation patch. It does not implement any features.
> 
> Tested-by: Pengfei Xu <pengfei.xu@intel.com>
> Tested-by: John Allen <john.allen@amd.com>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
