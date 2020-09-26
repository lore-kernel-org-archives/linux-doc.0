Return-Path: <SRS0=ljnh=DD=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76128C4741F
	for <linux-doc@archiver.kernel.org>; Sat, 26 Sep 2020 16:22:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 308312177B
	for <linux-doc@archiver.kernel.org>; Sat, 26 Sep 2020 16:22:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Isi2jLYX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729634AbgIZQWt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 26 Sep 2020 12:22:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729810AbgIZQWt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 26 Sep 2020 12:22:49 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51317C0613D5
        for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2020 09:22:49 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id d6so5792789pfn.9
        for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2020 09:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=56nCuRUirvF7dXeR3ek+2dKjHsN+uDHepkMc5x/GUbI=;
        b=Isi2jLYXO6Dg8qyvVuPVHRyByy5BJbI/6gQ7oyreYCwo3hF2HZWbgFd+OR7hRce1fZ
         2U/ZQbjFTvRuIeCm/BU9DG+iLYnBeO1MwXQ0sQdx/BPZPYKSow2g5lkv8xfIdoh/h6P+
         yYMV58dnKIat08n/3yoDRx3fvWRtDiWeJp814=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=56nCuRUirvF7dXeR3ek+2dKjHsN+uDHepkMc5x/GUbI=;
        b=C5eAZabUZCUBIjRuSaQc5TSHtaDFGLOROkk7Au+FprL9GIjXJevDuA3JNwj+wBiIAd
         gpLStB8+mOd0R8R/fm8VdzJTuKfn7gaf1NedywtfaMkHJIaC5XzgvHChrGTNkrX7MBlQ
         vHAG2NgAw7L44q0WfWGtem3bzumrLByvYNOnAiCP8btvNT0XmM1hUV+vikE4In0VtEwP
         zMjmwwb3satYptbsVpkd0ycul3WMMj5bN0EGV+4DuGtpXbOfrJuvCOAwvsy+XYIx8whM
         kUUr9hJ3Ro1SJiGKak+JBUBSbx+AC+IsNdeEoGUWvBIEC7yX7prjVG1PXFwT/keqcGUA
         nS3g==
X-Gm-Message-State: AOAM533MWU4MomHNVt8frfumIM/nMmOxq5KLzXU6cL9eKRkqfP2NB2q/
        wE1pm2v/BynuZrO72zltTvEg3VC3ErcI46Et
X-Google-Smtp-Source: ABdhPJz7HHjVeWBhAtMxjtcOjPKebh0qtmEHXOfr7MHXU6sFu9+pz+tyh0OJt8n2B09hRbUf6d5KgA==
X-Received: by 2002:a65:6883:: with SMTP id e3mr585170pgt.250.1601137368721;
        Sat, 26 Sep 2020 09:22:48 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id g4sm5156438pgj.15.2020.09.26.09.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 09:22:47 -0700 (PDT)
Date:   Sat, 26 Sep 2020 09:22:46 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     corbet@lwn.net, gregkh@linuxfoundation.org, shuah@kernel.org,
        rafael@kernel.org, johannes@sipsolutions.net, lenb@kernel.org,
        james.morse@arm.com, tony.luck@intel.com, bp@alien8.de,
        arve@android.com, tkjos@android.com, maco@android.com,
        joel@joelfernandes.org, christian@brauner.io, hridya@google.com,
        surenb@google.com, minyard@acm.org, arnd@arndb.de,
        mchehab@kernel.org, rric@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-acpi@vger.kernel.org, devel@driverdev.osuosl.org,
        openipmi-developer@lists.sourceforge.net,
        linux-edac@vger.kernel.org
Subject: Re: [PATCH 00/11] Introduce Simple atomic and non-atomic counters
Message-ID: <202009260920.DC9C2743@keescook>
References: <cover.1601073127.git.skhan@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1601073127.git.skhan@linuxfoundation.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Sep 25, 2020 at 05:47:14PM -0600, Shuah Khan wrote:
> This patch series is a result of discussion at the refcount_t BOF
> the Linux Plumbers Conference. In this discussion, we identified
> a need for looking closely and investigating atomic_t usages in
> the kernel when it is used strictly as a counter without it
> controlling object lifetimes and state changes.

BTW, I realized the KSPP issue tracker hadn't broken this task out of
the refcount_t conversion issue[1] into a separate issue, so I've created
it now: https://github.com/KSPP/linux/issues/106

-Kees

[1] https://github.com/KSPP/linux/issues/104

-- 
Kees Cook
