Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4C34C433E0
	for <linux-doc@archiver.kernel.org>; Thu, 18 Mar 2021 05:55:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC0AC64F0C
	for <linux-doc@archiver.kernel.org>; Thu, 18 Mar 2021 05:55:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbhCRFzH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 18 Mar 2021 01:55:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbhCRFyg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Mar 2021 01:54:36 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE0B5C06175F
        for <linux-doc@vger.kernel.org>; Wed, 17 Mar 2021 22:54:35 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id l1so735970plg.12
        for <linux-doc@vger.kernel.org>; Wed, 17 Mar 2021 22:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rJROOKajOtciafbi5yKM+xYoRKUUdF2HFDVh5pjYjDc=;
        b=V3a61EFeK8DCdYgpexeyYbDeJ6iJDfdbxjAeD7lChv/gRGorl33DJ3BMUviRPySs58
         DqijCIGczHsOaQVQTiwCTUbFxa8OJ6lH/P01tnCJpz/Gr5aQL2Nif/8XBHB5io4qZOGI
         LQyqTdOAUqrjefaJTahNsu8cRz7TQMUn4rLa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rJROOKajOtciafbi5yKM+xYoRKUUdF2HFDVh5pjYjDc=;
        b=I94BJELT1QmQjKsv4+Wk1wvgE4pgWQCtAgsngH43a20MEBbWIhDv6JicJJkS6tP7Nt
         iX7OiUCcgcgzZuTJZb92hq44cOPZRAouN6UkTwQF7AeODnJ2nduGvTLQh3P7iW6SyoVQ
         e/LKuuQxXXyrFwcZh1cRJJohOoASDqrkhWDs6gUDNfYRVNNnJeA2a30BWRw1zzXsDlY+
         mmr1WjXm/aZaLyxi+FJDffoQ9FYnRWSEaNzWpbCWn4boOuGpKMTXGh65gqaiBK14TR2C
         4uZ/H/05Pb8We5YeFHCO3LkGlm1DsgCHw7zREJ67A913eQTrzNxnqIbN0VYaRZ7dY5rM
         OJzQ==
X-Gm-Message-State: AOAM532dD7JsEdpRNBx5GcqvZw1IBGBFgS3WkMQp9nfTQsv2M3GispLL
        sLbfXm96YHtlv2jIhTMt63AYew==
X-Google-Smtp-Source: ABdhPJyfFKA4Cehmeh/BMzSXGkh4TwwBYXL3HOfY3RvVilv2kLybdPLaFSKBIWTPt29ZHHbUQvDtrA==
X-Received: by 2002:a17:90a:5284:: with SMTP id w4mr2464303pjh.29.1616046875626;
        Wed, 17 Mar 2021 22:54:35 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y24sm884896pfn.213.2021.03.17.22.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 22:54:35 -0700 (PDT)
Date:   Wed, 17 Mar 2021 22:54:34 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Kalesh Singh <kaleshsingh@google.com>
Cc:     jannh@google.com, jeffv@google.com, surenb@google.com,
        minchan@kernel.org, hridya@google.com, rdunlap@infradead.org,
        christian.koenig@amd.com, willy@infradead.org,
        viro@zeniv.linux.org.uk, kernel-team@android.com,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Alexey Gladkov <gladkov.alexey@gmail.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Michel Lespinasse <walken@google.com>,
        Bernd Edlinger <bernd.edlinger@hotmail.de>,
        Andrei Vagin <avagin@gmail.com>, Helge Deller <deller@gmx.de>,
        James Morris <jamorris@linux.microsoft.com>,
        Serge Hallyn <serge@hallyn.com>, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [RESEND PATCH v6 2/2] procfs/dmabuf: Add inode number to
 /proc/*/fdinfo
Message-ID: <202103172254.478DE154@keescook>
References: <20210308170651.919148-1-kaleshsingh@google.com>
 <20210308170651.919148-2-kaleshsingh@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210308170651.919148-2-kaleshsingh@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 08, 2021 at 05:06:41PM +0000, Kalesh Singh wrote:
> And 'ino' field to /proc/<pid>/fdinfo/<FD> and
> /proc/<pid>/task/<tid>/fdinfo/<FD>.
> 
> The inode numbers can be used to uniquely identify DMA buffers
> in user space and avoids a dependency on /proc/<pid>/fd/* when
> accounting per-process DMA buffer sizes.
> 
> Signed-off-by: Kalesh Singh <kaleshsingh@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
