Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F1B7C47088
	for <linux-doc@archiver.kernel.org>; Sat,  3 Dec 2022 02:20:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234893AbiLCCUR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Dec 2022 21:20:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234697AbiLCCUQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Dec 2022 21:20:16 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D808CC35BD
        for <linux-doc@vger.kernel.org>; Fri,  2 Dec 2022 18:20:13 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id p24so6248147plw.1
        for <linux-doc@vger.kernel.org>; Fri, 02 Dec 2022 18:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uWTcrQs76OXnN9lbgVOglSiDBLgPYobcjd4cqmFFNh0=;
        b=br0isiwIge4UTmUJvBAJu/hBvPA1Lr+Q6aU07D4VkWEjqVthAO51+vJImZ1FrZHRdD
         VwddOLnbJ/XU9t7ILuN1HA+G47+zvC5AQpnHVRuGKqkY67gReiKKFP9GgZqMko0YcNtw
         ClxdvdHcude27V4L/cMq4ecvT54mwZxIkLN4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWTcrQs76OXnN9lbgVOglSiDBLgPYobcjd4cqmFFNh0=;
        b=NakFnlKaP4tWPiXnqDM4xnm6b/ZH/QCpzQPgSkgIvDwklxm7MJqxD6Q6Aw5dEQbce/
         BswV1ffhB3E4nUQXU6Y1AXYcLkAXdS7wBmWzYT0Rt9R3CKgtLsJwlUNt9Y7nNBWld9qP
         7x/n3hnc/gxtb0QiJmWZKNt5LdXQRXhObbmyQ8D7/CkhGTSlvot8xg7RujcWLX5hwA9I
         +vVCXH/4kW8ZYLasbwqFLS2wDOoGHzvsBSj5uTK/Nv7K+O9umYmgDzQXn8PutROlnu+8
         O3rxU/UYghcE66f7GGgcCkt02h5xBIhoU68yJnVuNL+WjRQvjEeNT+SEhH/CHYPfx+p7
         AmWw==
X-Gm-Message-State: ANoB5pkFg2SpaPdbYAdfBEcqLt6fcLt2Smjyss2QF7P/xbeu2vIjihQv
        0Mb6hHnrR5ApWFwysxKwj5Pung==
X-Google-Smtp-Source: AA0mqf5I/xkYCiW+AL4KD543i0yq8zicOFbYEE9zrRwPsqNnGgfsCRnMQokLFlIn+NMdh7ZPPB+0Rg==
X-Received: by 2002:a17:902:ef44:b0:185:40ca:68b8 with SMTP id e4-20020a170902ef4400b0018540ca68b8mr56029977plx.16.1670034013379;
        Fri, 02 Dec 2022 18:20:13 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id p2-20020a622902000000b0056e8eb09d58sm5891712pfp.170.2022.12.02.18.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 18:20:12 -0800 (PST)
Date:   Fri, 2 Dec 2022 18:20:12 -0800
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
Subject: Re: [PATCH v4 01/39] Documentation/x86: Add CET shadow stack
 description
Message-ID: <202212021820.AD41327@keescook>
References: <20221203003606.6838-1-rick.p.edgecombe@intel.com>
 <20221203003606.6838-2-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221203003606.6838-2-rick.p.edgecombe@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Dec 02, 2022 at 04:35:28PM -0800, Rick Edgecombe wrote:
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
