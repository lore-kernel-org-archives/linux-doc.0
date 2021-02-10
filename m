Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C2D8C433DB
	for <linux-doc@archiver.kernel.org>; Wed, 10 Feb 2021 19:36:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D681164E35
	for <linux-doc@archiver.kernel.org>; Wed, 10 Feb 2021 19:36:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232311AbhBJTgS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 10 Feb 2021 14:36:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232046AbhBJTfw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Feb 2021 14:35:52 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45EF9C061756
        for <linux-doc@vger.kernel.org>; Wed, 10 Feb 2021 11:35:03 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id k13so1922206pfh.13
        for <linux-doc@vger.kernel.org>; Wed, 10 Feb 2021 11:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lVugRE6fF0oJTBQd7d0RHKP3QOjg3imenXxdGjYCNio=;
        b=FOurCcBoEOTC173g8WpQOh8MpvMQlo/WlTwQI/cXieTsGgI0OsJU6jFdMuPewnsA8x
         N+Lu45EOVe6MZGpC4MeQO9562gudu7ifC8x9TKKAd7WGRrJKzSki8Id6v4RZ3j9MW3T3
         T3kC9Rjk7f1qpSc/LzUtjVX0oVYUJoOrnsQ4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lVugRE6fF0oJTBQd7d0RHKP3QOjg3imenXxdGjYCNio=;
        b=kCq3v525T3hG1HYoY+ePUkCOo4jStWlTLlV4dRHhby8ZQKEPiiR9gVY0Tne/4QoDK0
         2cMmL2HBji4YRfB6V2Moi9eFOjYcJr6PwhKbyrzTw708yDn+ZajWFFAg6CNWWgl6aV8s
         0Z9A8n4LkCPJySicqHaOzFkbN3/BQJ5VFc6mVFVNzaJXt+tInRZgkoi0gql3jo2siKDo
         qgMOTrbIXZq3RzXWwtcuryWniaU0AvntcI4UrlVa4U2HRkT2yBVEpELGlCrvo6FdUAUT
         PUKZGdyIg7hh7cAQEBvWzA9LkaGGZMf622L8UyhPhINhUNyaIB3YoZC/YVZJb2EKq9h1
         nb6w==
X-Gm-Message-State: AOAM531LidVrn7SUPLRQUnKGaIpVlxC9lBhl1qmKYvTWxO9rJ2Xa/Wfn
        lWGeNy4/Qs9nFhCBN74uvWSlYQ==
X-Google-Smtp-Source: ABdhPJyw/brekoVah28J4DYypOu+xfbWlmLb9xtdz4+0cBteusjYuV6Y5OvqRl1eOPZCqvkxSdOONQ==
X-Received: by 2002:a62:8445:0:b029:1c1:c862:8fc4 with SMTP id k66-20020a6284450000b02901c1c8628fc4mr4506463pfd.77.1612985702870;
        Wed, 10 Feb 2021 11:35:02 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u127sm3234989pfb.180.2021.02.10.11.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 11:35:02 -0800 (PST)
Date:   Wed, 10 Feb 2021 11:35:01 -0800
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
        Pengfei Xu <pengfei.xu@intel.com>, haitao.huang@intel.com,
        Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v20 07/25] x86/mm: Remove _PAGE_DIRTY from kernel RO pages
Message-ID: <202102101134.72F7495@keescook>
References: <20210210175703.12492-1-yu-cheng.yu@intel.com>
 <20210210175703.12492-8-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210210175703.12492-8-yu-cheng.yu@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 10, 2021 at 09:56:45AM -0800, Yu-cheng Yu wrote:
> The x86 family of processors do not directly create read-only and Dirty
> PTEs.  These PTEs are created by software.  One such case is that kernel
> read-only pages are historically setup as Dirty.
> 
> New processors that support Shadow Stack regard read-only and Dirty PTEs as
> shadow stack pages.  This results in ambiguity between shadow stack and
> kernel read-only pages.  To resolve this, removed Dirty from kernel read-
> only pages.
> 
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
