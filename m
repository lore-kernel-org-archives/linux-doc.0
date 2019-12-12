Return-Path: <SRS0=cTBG=2C=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C416DC43603
	for <linux-doc@archiver.kernel.org>; Thu, 12 Dec 2019 21:32:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 91EE82253D
	for <linux-doc@archiver.kernel.org>; Thu, 12 Dec 2019 21:32:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hPUHH8bU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731087AbfLLVcJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 Dec 2019 16:32:09 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:46107 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731076AbfLLVcI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Dec 2019 16:32:08 -0500
Received: by mail-pj1-f67.google.com with SMTP id z21so57916pjq.13
        for <linux-doc@vger.kernel.org>; Thu, 12 Dec 2019 13:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rdnrKmYHg3rqlYKrPyGNdA80VNXD4QHBqrQKSlfqXu4=;
        b=hPUHH8bUVCGxkRby3K/7Nthk2Eps/0oLgx09HgklkKuHZt+nffawHoFzA160FeMZIl
         pxvMCwIGVTZFsAamVeAAB3svzSIw1PmpwkyRsN+IFB6ytzDghbzuzS1ZX5HX4v6/0M7W
         psdmalKL81H4zc5kH8biWKnN3noOXLfM7L63dwUgf8kKe3tGy1fiYLO6Y59Zkxkz7EVb
         cpqGJNIc2hXAHkSFU7vx+L4Vp5aZEe67iSRAWpVmWstsaa014SUvC39LP6u03lCvfhRK
         kxXrsE+bqum2sTOHsoDzKDn3kToTTgvLTvF1Go/gbOvQDextuuwGSVt/SMfzTX9tssML
         Ft3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rdnrKmYHg3rqlYKrPyGNdA80VNXD4QHBqrQKSlfqXu4=;
        b=BzVCqAxI3XLzppc+/BhmsV04V64kgQPyyOfxFB0GREFmESAwH6coCAX37gH+IbzNhG
         Y9nP5N3id+CjO90y4hCiD4731sBS4E1nnUeodOghAazMGWSFA1iGZ9WDj920pNk78mDs
         cXgiP5mpf/wL9MoSpv7MkL9nDi2qt0WcBQshzDT5F2z2WL1yFaX4F2GF/LUTWol8rVz1
         DVY9hjzmbn+NrFkyDInjltkDohWgfMpr3IByBwnIbN7vTS6Yz7IaSOu41g2d/jSh5+Ws
         9mKXztB1nRSRfuV42CdkyVzk4B9sWk34fLe8CtSHXKtB2QgKiUm6InpcxCRAnRCXFl0H
         d1ng==
X-Gm-Message-State: APjAAAXAZnAjREz6VAf51aHUi3YhTJfw8/PkWJ65SITLODdavFG5AbWi
        9EAocCBy7QFGZOKqJfTRQ1xRjesVWA+iDLBiwM5pZA==
X-Google-Smtp-Source: APXvYqzwOznHvwcAzPlPgFG7b7H85IVLuyJJkOiOiEbk8Mj2lKz9dvNEnegmIADQ/vEUPC6bM+R3OBz8Ae3hFTbHraY=
X-Received: by 2002:a17:90a:c390:: with SMTP id h16mr12563660pjt.131.1576186327744;
 Thu, 12 Dec 2019 13:32:07 -0800 (PST)
MIME-Version: 1.0
References: <20191212022711.10062-1-sjpark@amazon.de>
In-Reply-To: <20191212022711.10062-1-sjpark@amazon.de>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Thu, 12 Dec 2019 13:31:56 -0800
Message-ID: <CAFd5g46HjimaZB+_TJdy627p_jrBOrdav6+qDa4i_t4Kzmy8rQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] Fix nits in the kunit
To:     SeongJae Park <sj38.park@gmail.com>
Cc:     shuah <shuah@kernel.org>, SeongJae Park <sjpark@amazon.com>,
        Jonathan Corbet <corbet@lwn.net>,
        KUnit Development <kunit-dev@googlegroups.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>, SeongJae Park <sjpark@amazon.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Dec 11, 2019 at 6:27 PM SeongJae Park <sj38.park@gmail.com> wrote:
>
> This patchset contains trivial fixes for the kunit documentations and
> the wrapper python scripts.
>
>
> Baseline
> --------
>
> This patchset is based on 'kselftest/fixes' branch of
> linux-kselftest[1].  A complete tree is available at my repo:
> https://github.com/sjp38/linux/tree/kunit_fix/20191205_v6

Everything looks good to me. Shuah, feel free to pick this up at your
convenience.

SeongJae, Thanks for all your hard work on this. I really appreciate it!
