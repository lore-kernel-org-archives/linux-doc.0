Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5232C433FE
	for <linux-doc@archiver.kernel.org>; Tue,  5 Oct 2021 16:11:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8CAF961503
	for <linux-doc@archiver.kernel.org>; Tue,  5 Oct 2021 16:11:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236392AbhJEQNB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 5 Oct 2021 12:13:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236358AbhJEQM7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Oct 2021 12:12:59 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6780DC061762
        for <linux-doc@vger.kernel.org>; Tue,  5 Oct 2021 09:11:08 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id q7-20020a17090a2e0700b001a01027dd88so776885pjd.1
        for <linux-doc@vger.kernel.org>; Tue, 05 Oct 2021 09:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LOQoums2EVgJDxJo+caJ0kHdjSP5vLtw5iCXa+UR1B0=;
        b=FypNWYbB1OUHmHme2fLHqshWLMEfZo0TgfixcHklBKdzNYhBI9EwwXtHFSnEn4+8RA
         m/HvKEH6fGbfV/AdonziylF2dhzW9VLKJRWnHA0XH7B/wTM2rC9tYdO9X8TkBrhT8Euy
         WrJjmkjkVmFRJd9FA8HIFO6EsDSLqvI/YOgmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LOQoums2EVgJDxJo+caJ0kHdjSP5vLtw5iCXa+UR1B0=;
        b=YsEYpvxsMiVMBlWW/6fKAyeUSNI5gfImCNUBeRY/DkSPzfv3HZMPUfoNfdcrG/oB4C
         +Vn/can1/JnbvgJgabQPXPgQAhobDEhSlY0xIBcUmW7ds7RAfrYnXJ9wu+31yZYByZRl
         ZLUPbymonF5kZErY86F5AslJFfb5PF65Yb16oq81SJn8nuDFLOjpt2YT9wBdCi/1JWqH
         +woF98TPcXI7LMh3MKJgq2y0LSWuIddsChKMfML8tkNuGc501KPZRCUf1FQTvurrB6KB
         qsm+st7eZeaivRqhpCwlWa81kYKXaph1PjSSGm4m8fWmUHTihIfMzyyzUyBEGY1omtIb
         tgyg==
X-Gm-Message-State: AOAM531wEHEAkUfGfDs9/4pCaAzt8YSx+dj5smY6lPfNGimkGs8Ybs5j
        OioiT1FqVX1rXWKSWhhVtd03LQ==
X-Google-Smtp-Source: ABdhPJykuN5cLw2duFymZQgkXUxSiuquHuVEzLDtXdM75l71AU3pXVHx/RxwefjBcJdz6mZkTL+TlA==
X-Received: by 2002:a17:902:e544:b0:13e:e863:6cd2 with SMTP id n4-20020a170902e54400b0013ee8636cd2mr2901204plf.41.1633450267896;
        Tue, 05 Oct 2021 09:11:07 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c18sm17294235pge.69.2021.10.05.09.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 09:11:07 -0700 (PDT)
Date:   Tue, 5 Oct 2021 09:11:06 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Luis Chamberlain <mcgrof@kernel.org>
Cc:     tj@kernel.org, gregkh@linuxfoundation.org,
        akpm@linux-foundation.org, minchan@kernel.org, jeyu@kernel.org,
        shuah@kernel.org, bvanassche@acm.org, dan.j.williams@intel.com,
        joe@perches.com, tglx@linutronix.de, rostedt@goodmis.org,
        linux-spdx@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        Goldwyn Rodrigues <rgoldwyn@suse.com>,
        Kuno Woudt <kuno@frob.nl>,
        Richard Fontana <fontana@sharpeleven.org>,
        copyleft-next@lists.fedorahosted.org,
        Ciaran Farrell <Ciaran.Farrell@suse.com>,
        Christopher De Nicolo <Christopher.DeNicolo@suse.com>,
        Christoph Hellwig <hch@lst.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [PATCH v8 02/12] testing: use the copyleft-next-0.3.1 SPDX tag
Message-ID: <202110050909.739BF8A09@keescook>
References: <20210927163805.808907-1-mcgrof@kernel.org>
 <20210927163805.808907-3-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210927163805.808907-3-mcgrof@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Sep 27, 2021 at 09:37:55AM -0700, Luis Chamberlain wrote:
> Two selftests drivers exist under the copyleft-next license.
> These drivers were added prior to SPDX practice taking full swing
> in the kernel. Now that we have an SPDX tag for copylef-next-0.3.1
> documented, embrace it and remove the boiler plate.
> 
> Cc: Goldwyn Rodrigues <rgoldwyn@suse.com>
> Cc: Kuno Woudt <kuno@frob.nl>
> Cc: Richard Fontana <fontana@sharpeleven.org>
> Cc: copyleft-next@lists.fedorahosted.org
> Cc: Ciaran Farrell <Ciaran.Farrell@suse.com>
> Cc: Christopher De Nicolo <Christopher.DeNicolo@suse.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Thorsten Leemhuis <linux@leemhuis.info>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>

You're the primary author, and it cleans up boilerplate, so LGTM.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
