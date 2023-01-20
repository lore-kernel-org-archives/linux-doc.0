Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6FC3C004D4
	for <linux-doc@archiver.kernel.org>; Fri, 20 Jan 2023 00:38:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbjATAiJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 19 Jan 2023 19:38:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjATAiH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Jan 2023 19:38:07 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7D654A1C5
        for <linux-doc@vger.kernel.org>; Thu, 19 Jan 2023 16:38:05 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id x4so2852225pfj.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Jan 2023 16:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=opKKL6+fhG9H3ZnE4M3C01lHGZFgbl9xi06Tl9DFlxo=;
        b=lIedS74S3tmDvAWKf/pKIZQXH++46nIxIJzGdjRAjE9stYh7oH/dycv4f7V1NWEzz+
         vrpqcWM/ON5ywALOuqyE/K5lI6vcyOGLyyKtmi+HYl9pmLHQgMyOEmPmfOysBJfi7FtE
         sXfBhrRutvpoE0oPKPAf4SqWZz4MHXi555J34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opKKL6+fhG9H3ZnE4M3C01lHGZFgbl9xi06Tl9DFlxo=;
        b=pZnI0uwPxgy32BaYwYjZrnmlSKpnxJ/3RS7/kbTsJU70TKt/QuZSQiMFFl42lmlwCQ
         AU4imwy+6jbd8uM4IWl3r7njKA9hQTmCoDf7vPImZ1+cZAqRNBjQZkLKcfHxF8cnLWCL
         kBjWydyOdly4auoOZzgFaaX8QclnnhajrxjAvkV+v7bbPbPKEB058fstmx5c5aeSjnOb
         crqBR7rt12koavXxIxsbgwyXBdZ18QLnPcXJoJvOotQMlPE6+tpgLkCnvc0RbDYxlT9v
         iHHheahV6HAO5CS/WnQw6Dfl5EDaEyJsXUmBylVI76qQp6XqB4o0/WQNQBlSwC90lynM
         7Fbg==
X-Gm-Message-State: AFqh2kpQKCtBjHJVYr8H5UULlcMguMVrf53kKUscGIR2TxNVLpru+zJ0
        qYNT1a4EEZiMHd340tAJlyOeGg==
X-Google-Smtp-Source: AMrXdXvDaBmAz43jKve14VMT5yvVg1paSSfHL+s3Uhw4JeU7qrDP9f2UUmfnfH3+wY9g4cAEosDVgw==
X-Received: by 2002:a62:aa0c:0:b0:58d:af0c:92f with SMTP id e12-20020a62aa0c000000b0058daf0c092fmr12442131pff.27.1674175085334;
        Thu, 19 Jan 2023 16:38:05 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z19-20020aa79593000000b00582388bd80csm24696882pfj.83.2023.01.19.16.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 16:38:04 -0800 (PST)
Date:   Thu, 19 Jan 2023 16:38:03 -0800
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
Subject: Re: [PATCH v5 01/39] Documentation/x86: Add CET shadow stack
 description
Message-ID: <202301191638.E3E75FEC1D@keescook>
References: <20230119212317.8324-1-rick.p.edgecombe@intel.com>
 <20230119212317.8324-2-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119212317.8324-2-rick.p.edgecombe@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 19, 2023 at 01:22:39PM -0800, Rick Edgecombe wrote:
> From: Yu-cheng Yu <yu-cheng.yu@intel.com>
> 
> Introduce a new document on Control-flow Enforcement Technology (CET).
> 
> Tested-by: Pengfei Xu <pengfei.xu@intel.com>
> Tested-by: John Allen <john.allen@amd.com>
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
