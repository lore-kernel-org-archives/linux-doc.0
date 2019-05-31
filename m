Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_DKIMWL_WL_HIGH autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 473377D2EF
	for <lwn-linux-doc@archive.lwn.net>; Fri, 31 May 2019 02:23:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbfEaCXg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 30 May 2019 22:23:36 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:40694 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726487AbfEaCXg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 May 2019 22:23:36 -0400
Received: by mail-pg1-f193.google.com with SMTP id d30so3107486pgm.7
        for <linux-doc@vger.kernel.org>; Thu, 30 May 2019 19:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=C6kCdn+CvKS1nx6udU5A4u9LPwYaTnkxAuO1T3SqJb0=;
        b=RbyceLt5l0FuwnDm8jJY+ZlgmLAa1lkUjeAdnioFpi5EHrxP/7AvLtYI9ugBMgxbLa
         6lcSFslkR1yZ6H/ucNwXO7h5H7GPK8jNPGFrbC3y8bAdiL0TWu19nAGzO89I15a0VEdH
         ZHoRRCeo8WYucIwyjDPdjqmDFVf3aVYTXTg6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=C6kCdn+CvKS1nx6udU5A4u9LPwYaTnkxAuO1T3SqJb0=;
        b=qbqjs5v6oChqd00n3b1MXuz21MRxBxwZ5VPi+IghQ4duufSf/FpvfwwDkVOvnn76xs
         8ets/Dhmc7jB1/ViOihergIZFHEkVrbBpaMQRmf1APHmBxhIXQz5lzUR/YKsj+UFM4Un
         DppDd9Mf0cMAaK0nchbhRe/cSoAlbUgXk6fJqLUseekIBdyHvSWQ0Mnhy4R1ujgQT15T
         fpVpPdXU5FLcinn4S80crdwtkfQsYruFuceWL2uEqj0VVRVaseWDklzhouprPKULAi9F
         PmCdIsd9elSl9SsIfI5SKgCV9HFj34NviwmhCwN4IyAAj7ieqAYBjGTgILR1E8O56DK1
         3G5g==
X-Gm-Message-State: APjAAAWn17TcS0f+vSrpq26l6TB8TVPI0f0saBFPaAOdabdVN4NRdeFd
        nh2S5AyvondDICslXuaLh9BiigQaLAI=
X-Google-Smtp-Source: APXvYqx3IdjF23o571rKzjuuUngXx8sryXUJU2cxqnWXPGAGAL9ufdzda0B0QTkjF04dJPmbn28G4A==
X-Received: by 2002:a17:90a:2ec2:: with SMTP id h2mr4402798pjs.119.1559269416094;
        Thu, 30 May 2019 19:23:36 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x24sm3775458pjq.27.2019.05.30.19.23.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 May 2019 19:23:35 -0700 (PDT)
Date:   Thu, 30 May 2019 19:23:34 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Ke Wu <mikewu@google.com>
Cc:     James Morris <jmorris@namei.org>, Jonathan Corbet <corbet@lwn.net>,
        "Serge E. Hallyn" <serge@hallyn.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [PATCH v2] Allow to exclude specific file types in LoadPin
Message-ID: <201905301921.AE6D8D1@keescook>
References: <20190529224350.6460-1-mikewu@google.com>
 <20190530192208.99773-1-mikewu@google.com>
 <alpine.LRH.2.21.1905310611190.26428@namei.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.21.1905310611190.26428@namei.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, May 31, 2019 at 06:11:44AM +1000, James Morris wrote:
> On Thu, 30 May 2019, Ke Wu wrote:
> 
> > Linux kernel already provide MODULE_SIG and KEXEC_VERIFY_SIG to
> > make sure loaded kernel module and kernel image are trusted. This
> > patch adds a kernel command line option "loadpin.exclude" which
> > allows to exclude specific file types from LoadPin. This is useful
> > when people want to use different mechanisms to verify module and
> > kernel image while still use LoadPin to protect the integrity of
> > other files kernel loads.
> > 
> > Signed-off-by: Ke Wu <mikewu@google.com>
> > ---
> > Changelog since v1:
> > - Mark ignore_read_file_id with __ro_after_init.
> > - Mark parse_exclude() with __init.
> > - Use ARRAY_SIZE(ignore_read_file_id) instead of READING_MAX_ID.
> 
> Looks good!
> 
> Reviewed-by: James Morris <jamorris@linux.microsoft.com>

Thanks! Applied to my for-next/loadpin branch at
git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git
and should be visible in linux-next in a few days.

-- 
Kees Cook
