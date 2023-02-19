Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A36EC64ED6
	for <linux-doc@archiver.kernel.org>; Sun, 19 Feb 2023 20:48:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231565AbjBSUsX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 19 Feb 2023 15:48:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231561AbjBSUsW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 19 Feb 2023 15:48:22 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72FCBD52F
        for <linux-doc@vger.kernel.org>; Sun, 19 Feb 2023 12:48:21 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id k2so1434836plh.12
        for <linux-doc@vger.kernel.org>; Sun, 19 Feb 2023 12:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=T6ogOI5fy9kZcGmbOh8R1Tnmx877fgaJfUkyo2bbhz4=;
        b=O64JFYurCY6KM6mSXnFI/bvhb4Oa7RXnSdm6ui3KUo5AtmBeggaByaOWdeJ5bmXsLd
         9PqYTDu9rTXfXM2IcL8/n66U5zPD/np1Bp/SfCRphnXkKuduPyIRKvgOESVi+YFCt4cz
         R+rhrvpGrzmZSwcUHRZykq8tc4/RtynnmgL9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6ogOI5fy9kZcGmbOh8R1Tnmx877fgaJfUkyo2bbhz4=;
        b=3sDHpOwnWB+Ys+BVxkEwMsYzMLe0aLLWb2goR1uJDp8sDCCqQy5Bc7N+haM67aicEW
         arNpPa2iEPj3gyUyKKkhMs4+bA93YYUO9xqsIh4BfX0hMNfxxH5TcignFBw7VeMNJJy2
         1HOOFxASsZCQxnh/4f6mxlFvm5EiLGUlT/LxzC9kEWRZlJ1dp52h8TQjNXlngdnTo0ic
         hC+x/BktR0loOSq8M9IOuOwXyUynAqwicTiy6RDfZzDsaKjueZSyv+rrnARKUYHZwPJS
         mYSfWL1QIXfmdYEYNTtJDhHRJOwAYy3zQ0/z0eYD1QpPL1CMjruGK5P1vT6sRVkiAryX
         Hdwg==
X-Gm-Message-State: AO0yUKWF6BoBGTBd4/uk3rs59x9gNhWLg09bYiPkMikT8e7mHOUaPrhD
        Ak/7m4Y+BAIWiIHxq5ogbGWztA==
X-Google-Smtp-Source: AK7set9AJDoPz3P8WrcTJKnVtGvdAn9cKTBx7QRH7COR7s96aLWXshdttfPlfDlbwFpcAoS0d+P3Rg==
X-Received: by 2002:a17:90b:2243:b0:234:b03:5a70 with SMTP id hk3-20020a17090b224300b002340b035a70mr2120176pjb.35.1676839700900;
        Sun, 19 Feb 2023 12:48:20 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d13-20020a17090ae28d00b00233e52b7797sm941662pjz.44.2023.02.19.12.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 12:48:20 -0800 (PST)
Message-ID: <63f28b14.170a0220.8cbeb.12e3@mx.google.com>
X-Google-Original-Message-ID: <202302191248.@keescook>
Date:   Sun, 19 Feb 2023 12:48:19 -0800
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
        david@redhat.com, debug@rivosinc.com
Subject: Re: [PATCH v6 38/41] x86/fpu: Add helper for initing features
References: <20230218211433.26859-1-rick.p.edgecombe@intel.com>
 <20230218211433.26859-39-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230218211433.26859-39-rick.p.edgecombe@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Feb 18, 2023 at 01:14:30PM -0800, Rick Edgecombe wrote:
> If an xfeature is saved in a buffer, the xfeature's bit will be set in
> xsave->header.xfeatures. The CPU may opt to not save the xfeature if it
> is in it's init state. In this case the xfeature buffer address cannot
> be retrieved with get_xsave_addr().
> 
> Future patches will need to handle the case of writing to an xfeature
> that may not be saved. So provide helpers to init an xfeature in an
> xsave buffer.
> 
> This could of course be done directly by reaching into the xsave buffer,
> however this would not be robust against future changes to optimize the
> xsave buffer by compacting it. In that case the xsave buffer would need
> to be re-arranged as well. So the logic properly belongs encapsulated
> in a helper where the logic can be unified.
> 
> Tested-by: Pengfei Xu <pengfei.xu@intel.com>
> Tested-by: John Allen <john.allen@amd.com>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
