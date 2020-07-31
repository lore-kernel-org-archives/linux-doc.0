Return-Path: <SRS0=ADjE=BK=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25050C433E0
	for <linux-doc@archiver.kernel.org>; Fri, 31 Jul 2020 22:02:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E27BC208E4
	for <linux-doc@archiver.kernel.org>; Fri, 31 Jul 2020 22:02:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N3yiD5UX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbgGaWCe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 31 Jul 2020 18:02:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725859AbgGaWCc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 31 Jul 2020 18:02:32 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6D57C06174A
        for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2020 15:02:32 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id u10so8550749plr.7
        for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2020 15:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+oZo/9yW6Oqd3XkygyTtSo/s5WeOAvnnWz6QWKpx224=;
        b=N3yiD5UX+cR8QG4jts4p8h7nRXkfrAJtBC0xtfsVUV82LwaqCgMsXSBhUCwDJcJzbs
         mdahkoCEgT1sDyvHx9Y5FbWfXPDrIz13exeN+T1lkU1vAkeIA0lFp3l5iwgZjcqqHrl/
         PNH02FY7/0pKPEKzsXmiuWhLaGzNca95VHWwE30dAZS3a9FPmFnWI/VZopd3K6amWRj1
         vy6DazkMnzG6LR3qsz9x86pKa/WGzpTTXOjH3gs389randleAtOgHKrTf1OW8Y0DS98q
         YohnolyZJAxVW4w13084HdqFr+oEnqDHSWKur7Pvm8zMukTISaPPp9EyWHw330MCtEgp
         e9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+oZo/9yW6Oqd3XkygyTtSo/s5WeOAvnnWz6QWKpx224=;
        b=fu2CsOxx87VC7XZLe7fphEZSxlT9elcTop3d2UVwbhz4FZhJV8/GjejsP8wfjoGhFs
         5YD0nP70m10SUpD4EHrPgw/RukZTBLMUIfDHMh5YuFj/U2cwXKuKAlhl7ZYScX0V8emb
         1ceRlUDqP8vE8kEIquC3zBIfRXB1AajYztnsTyN9B+etF5iJo4DuXWKjZ6pYugklleLj
         V1IO9eytN4SPtD6ZESWxALuMlBB7E/otkEFR4GzSxMwsbqTKF0Jn9v6Yv8Hv2Nfm1A09
         vCOOQNlGzbtcJoqWIG6z9r++CToDVDWm+H8JFJsx2AzLEFq+0I8Pak0heEi6Zglh1jiJ
         8odg==
X-Gm-Message-State: AOAM532tVAbDqmRMRSmXw2auGzHyrIROFeBd+rM0ApcfNbPCPPRNVGWT
        iu6q68PmtMVSNwseb5aNzgZiqCMiDhC0VUdXyuM/8w==
X-Google-Smtp-Source: ABdhPJxb+RpjHPrJNGDZfqqztRJW/O3fXdm2dXBzLYFHBMbAPCDbg8ExMB3zSjKygRyZPsE3Jd6zAnVmTf8B72/3F5s=
X-Received: by 2002:a17:90a:33d1:: with SMTP id n75mr5066872pjb.217.1596232951079;
 Fri, 31 Jul 2020 15:02:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200702071416.1780522-1-davidgow@google.com>
In-Reply-To: <20200702071416.1780522-1-davidgow@google.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Fri, 31 Jul 2020 15:02:20 -0700
Message-ID: <CAFd5g45-UmaxBoNa9pY7LwOrDsRXN46uCO9JvK_CHNhfYdwS4g@mail.gmail.com>
Subject: Re: [PATCH] Documentation: kunit: Add naming guidelines
To:     David Gow <davidgow@google.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Alan Maguire <alan.maguire@oracle.com>,
        Randy Dunlap <rd.dunlab@gmail.com>,
        "Theodore Ts'o" <tytso@mit.edu>, Tim Bird <Tim.Bird@sony.com>,
        KUnit Development <kunit-dev@googlegroups.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 2, 2020 at 12:14 AM David Gow <davidgow@google.com> wrote:
>
> As discussed in [1], KUnit tests have hitherto not had a particularly
> consistent naming scheme. This adds documentation outlining how tests
> and test suites should be named, including how those names should be
> used in Kconfig entries and filenames.
>
> [1]:
> https://lore.kernel.org/linux-kselftest/202006141005.BA19A9D3@keescook/t/#u
>
> Signed-off-by: David Gow <davidgow@google.com>
> Reviewed-by: Kees Cook <keescook@chromium.org>

Sorry for taking so long on this; nevertheless, looks great!

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
