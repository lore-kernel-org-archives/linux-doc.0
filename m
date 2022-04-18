Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D5BAC433F5
	for <linux-doc@archiver.kernel.org>; Mon, 18 Apr 2022 21:30:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbiDRVcp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 18 Apr 2022 17:32:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiDRVco (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Apr 2022 17:32:44 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33D212CCAE
        for <linux-doc@vger.kernel.org>; Mon, 18 Apr 2022 14:29:56 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id z99so18898758ede.5
        for <linux-doc@vger.kernel.org>; Mon, 18 Apr 2022 14:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/7LTWo0OPBrGCZjHYoN1cmnPJEUpa4jNozIjdW1Tjhc=;
        b=En4TB4U44B8KkvJ/oE6YRz8ktzHBFO2hSHQvrSQgM/I7HmDnWkoLceq8ho8OUiCv3e
         E5mWA0s4dFFlcwHdf18d6P/398+fXbLU3vorFjZjmSoyICv0siRicj2wlfEcXsi8nUG4
         u4gsxmjXMnIZAbFF7qKRl5GlhpeDJFS3t/aU6rEG16IG8yrQAJyfN/O33LGJ0qPLd94C
         UpWhiPZuaHS5uRDRVMLeteofq3HLTT6BrnUzikZt50XLXM3bo5xrBZKWfXGjc/48H6Be
         do5u0dX1oc4P60EgwzwKUeCUA/BRmcYkAID84Hidmcdxag7E4TNazut9vePsJXPnefVw
         S6sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/7LTWo0OPBrGCZjHYoN1cmnPJEUpa4jNozIjdW1Tjhc=;
        b=aRWhgOAAcQ5Ft4OdM6LQBEnOVhXwVtIkIu4LgYkcQwTlNrIkXNY4t/gGIWrjQeInmr
         0gzITxQcddop42WHhJPq55GNlvQOiNvHhVjbEs08rwtum8u8Qb+0L4pd+WLaVIaIjWe6
         rwfVYzC/Ur6yce+146PkhIkp5mE+xLTOIcc3F/PP61u3lVFbKO7aQmaUC3RfMSgXbHs5
         nJgwLHlSlnmVwT55tkHtAEgD9eRQeDufeFGcIX9yBvZM5BLk0/ZyS7giIgbVksf63V0L
         CXAiCQq02Uzr/XcmYvjcVQFLOJRmP1k6xsVhcllhVNfJ3jMEZjQnPn9EZIneUDULXSZ5
         ZnqA==
X-Gm-Message-State: AOAM5320kxmAlZHfprGynr/A2ZRghA4ttGPspervRsAfyCm3YqlubW2X
        9XYBFP63q4Va/7cc5EYjxUrVYbE47oteuu3fYtDk3w==
X-Google-Smtp-Source: ABdhPJyV9fmS+hwdvvRUN2r//PwngZikr7xomDByGbznu+vO3elnnfiwHQRO9t3F2pz2zrmStYKSa7R9cdyG24KOkxQ=
X-Received: by 2002:a05:6402:1e8b:b0:41c:59f6:2c26 with SMTP id
 f11-20020a0564021e8b00b0041c59f62c26mr14349493edf.156.1650317394544; Mon, 18
 Apr 2022 14:29:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220417102807.10b91497ed@19d04f311a0a9de>
In-Reply-To: <20220417102807.10b91497ed@19d04f311a0a9de>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Mon, 18 Apr 2022 17:29:43 -0400
Message-ID: <CAFd5g46iNr_EnQ1zQGiXk34mND8-Xo3vTykpgKfbr-8_e5OOCw@mail.gmail.com>
Subject: Re: [PATCH] Documentation: kunit: change complete_and_exit to kthread_complete_and_exit
To:     Andreas-Christian Hagau <ach@hagau.se>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Apr 17, 2022 at 4:37 AM Andreas-Christian Hagau <ach@hagau.se> wrote:
>
> Commit cead18552660 ("exit: Rename complete_and_exit to
> kthread_complete_and_exit") renamed complete_and_exit to
> kthread_complete_and_exit.
>
> Signed-off-by: Andreas-Christian Hagau <ach@hagau.se>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
