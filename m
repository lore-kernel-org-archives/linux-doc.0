Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C888C61DB3
	for <linux-doc@archiver.kernel.org>; Thu, 12 Jan 2023 21:41:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240314AbjALVlI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 Jan 2023 16:41:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240399AbjALVkj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Jan 2023 16:40:39 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EE9F60876
        for <linux-doc@vger.kernel.org>; Thu, 12 Jan 2023 13:32:14 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id gz9-20020a17090b0ec900b002290bda1b07so98788pjb.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Jan 2023 13:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oYWg76MlT465qYm5zxxJzeCoJpElzxW7j04ayS6Gkfo=;
        b=IxiMGx32/xjZAc1vwPbmnRqZseYpKs2kN4m4itm5HGK3gKjlx8IhN5F2dfpUDi3iV7
         iSx3o+T6ODNt+TyxQ0rvSPsx3EzwOynXeDSBh3AphQQKVyyo6PMuFaGmE2jXLEODpxG8
         B2NzXkP7cHc5a2GZHWMAemd7B0Ne7wvlMFizo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oYWg76MlT465qYm5zxxJzeCoJpElzxW7j04ayS6Gkfo=;
        b=QX8zub5x8t6s1NjIqQKW2g8PQz3Pt7K5dWFdj1Cwk4gKM+z1u1J4LSmez7OZ6bmPB2
         RDcr5GRNnhgKQqtFP9SJJmcqDTCxrxC7Rsd3QSEkV/I9wC1T4LQKOWxDzAt33nfm8rxK
         5LnNUDbsp+VRIEgW3q0sYS4CLcM7xzgob3uyyN1qwPkT8kDpWIKRK2eEi6JZfG69gOlp
         xdvOFvMagHdtxwKZa5DIj9JhDBaegd70lpioM2Xuv7e8I28ZQHm69+uwe5+1xNOEhNGS
         3VvfqoZtRIyALk5fM2p+P04QcGgIOM9NX+ID8XrCd43EZy/xS0k+N+OEf6+QoxvBLeV3
         mJZA==
X-Gm-Message-State: AFqh2kplJRFKgbDarHNcbpWhIAhsMD5Uqm77zElc3m2vkqreYgVR3ACO
        rQGH4R5y5ZbHtI5aIRfB0ejkOQ==
X-Google-Smtp-Source: AMrXdXtjOihZr3A+kApmyR1KJIPIcvqN7dphaaqD7LoNbiTIX8M4rVl8rzsIWN1VGtw5eAq6PNm0Og==
X-Received: by 2002:a17:90a:65c5:b0:226:5900:f2f4 with SMTP id i5-20020a17090a65c500b002265900f2f4mr9009536pjs.4.1673559133836;
        Thu, 12 Jan 2023 13:32:13 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id l15-20020a17090a72cf00b002192529a692sm13272431pjk.9.2023.01.12.13.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 13:32:13 -0800 (PST)
Date:   Thu, 12 Jan 2023 13:32:12 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Sohil Mehta <sohil.mehta@intel.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tony Luck <tony.luck@intel.com>,
        Ravi V Shankar <ravi.v.shankar@intel.com>,
        linux-kernel@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH] x86/vsyscall: Fix documentation to reflect the default
 mode
Message-ID: <202301121332.1305BA2A@keescook>
References: <20230111193211.1987047-1-sohil.mehta@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230111193211.1987047-1-sohil.mehta@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 11, 2023 at 07:32:11PM +0000, Sohil Mehta wrote:
> The default vsyscall mode has been updated from emulate to xonly for a
> while. Update the kernel-parameters doc to reflect that.
> 
> Fixes: 625b7b7f79c6 ("x86/vsyscall: Change the default vsyscall mode to xonly")
> Cc: Andy Lutomirski <luto@kernel.org>
> Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
