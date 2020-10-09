Return-Path: <SRS0=YNrp=DQ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF4BC433DF
	for <linux-doc@archiver.kernel.org>; Fri,  9 Oct 2020 18:00:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1BEDD22277
	for <linux-doc@archiver.kernel.org>; Fri,  9 Oct 2020 18:00:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LNi1SKK6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731392AbgJISA5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Oct 2020 14:00:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730110AbgJISA5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Oct 2020 14:00:57 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BF32C0613D5
        for <linux-doc@vger.kernel.org>; Fri,  9 Oct 2020 11:00:57 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id u24so7822871pgi.1
        for <linux-doc@vger.kernel.org>; Fri, 09 Oct 2020 11:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=O9DeNfGtICXdSR5fMF3uxBj8llIMlwvh5++n6DPD1NQ=;
        b=LNi1SKK6Xz0Ui1DpFu+MzFvSO+5SC9UcJ+bDYYds1O2bQss4jaPUCy8Pcisk8JeAR7
         2pr3m00T+iBZ70OKhG3qne17xLaUjoJmAnb0la7XsJsETjAlzbjH5Ao4CAlRbaiUXN9q
         tj7rVI4emXl01pB0do08uo3+SgDGSB6d0rhA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=O9DeNfGtICXdSR5fMF3uxBj8llIMlwvh5++n6DPD1NQ=;
        b=o/LMRQGEKBr4NAJF3991hXIVmuE79cQ0XKgIdhFiZjvjxLH0i23L1KkFyKLc/mgdTa
         lZOd2PnA7gebYEg6Or1MFwflC+33HVmnHoabYk96XNwkXJDg6z8FgxN1CNu0GhLxAjE7
         5Xz7eumyvrdmvvbeHSiuN3xzClg76h2iqwEZo7kaZuu1A44EBArXTL7VDTxIKgfjnSzR
         UejkAy/iIO8sBlx47hvhfDWhiG0VuDN/p0RQMSl52HvZUW8XMfSSEuSxtgIPbXn3VIH3
         NgY1ISEecBf1CjEf7wQnVRuJp8DLpDjKWaKPu/kq1ownpVOdwnWMylvcXSWWuhuasZC4
         quEw==
X-Gm-Message-State: AOAM533KN4bZHXYD3uwR/sgHQ9JLPb0HJ/WZd1MtYRl7DcnY6/1xjBD0
        uXVH3DNGpM3eYxwA6/ztZb9z8w==
X-Google-Smtp-Source: ABdhPJy6T/ZuzZpYG66+gogxlz7cBmM928ppbl+iWfviaU1v/1ivieeoj2WBNr1sj2yt1SNBrY9CTg==
X-Received: by 2002:a17:90a:840b:: with SMTP id j11mr5729347pjn.5.1602266457053;
        Fri, 09 Oct 2020 11:00:57 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d12sm11098085pgd.93.2020.10.09.11.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 11:00:55 -0700 (PDT)
Date:   Fri, 9 Oct 2020 11:00:54 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     corbet@lwn.net, gregkh@linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/11] counters: Introduce counter_atomic* counters
Message-ID: <202010091100.9327D918@keescook>
References: <cover.1602209970.git.skhan@linuxfoundation.org>
 <baede266cc0c69da61142b467ff386c6b31a70b7.1602209970.git.skhan@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <baede266cc0c69da61142b467ff386c6b31a70b7.1602209970.git.skhan@linuxfoundation.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Oct 09, 2020 at 09:55:56AM -0600, Shuah Khan wrote:
> Introduce Simple atomic counters.
> 
> There are a number of atomic_t usages in the kernel where atomic_t api
> is used strictly for counting and not for managing object lifetime. In
> some cases, atomic_t might not even be needed.
> 
> The purpose of these counters is to clearly differentiate atomic_t
> counters from atomic_t usages that guard object lifetimes, hence prone
> to overflow and underflow errors. It allows tools that scan for underflow
> and overflow on atomic_t usages to detect overflow and underflows to scan
> just the cases that are prone to errors.
> 
> Simple atomic counters api provides interfaces for simple atomic counters
> that just count, and don't guard resource lifetimes. The interfaces are
> built on top of atomic_t api, providing a smaller subset of atomic_t
> interfaces necessary to support simple counters.
> 
> Counter wraps around to INT_MIN when it overflows and should not be used
> to guard resource lifetimes, device usage and open counts that control
> state changes, and pm states. Overflowing to INT_MIN is consistent with
> the atomic_t api, which it is built on top of.
> 
> Using counter_atomic* to guard lifetimes could lead to use-after free
> when it overflows and undefined behavior when used to manage state
> changes and device usage/open states.
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
