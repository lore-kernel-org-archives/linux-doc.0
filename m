Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B941EC433DB
	for <linux-doc@archiver.kernel.org>; Wed, 31 Mar 2021 07:47:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7FA3A6199A
	for <linux-doc@archiver.kernel.org>; Wed, 31 Mar 2021 07:47:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234088AbhCaHqq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 31 Mar 2021 03:46:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234042AbhCaHqk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 31 Mar 2021 03:46:40 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16C01C061574
        for <linux-doc@vger.kernel.org>; Wed, 31 Mar 2021 00:46:40 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id g38so20169214ybi.12
        for <linux-doc@vger.kernel.org>; Wed, 31 Mar 2021 00:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bzw+Iamq+L8wcNS2TuH2WO84pZPHjJ1C5dF15DavXes=;
        b=ZOdhA7CzBBPNhqiDl9BW6VxbTac4bMFAuCOULAwiiEg1I76dbXiVW7pEFaydDYYZVX
         0+VwlDf98S6L8p8CPaA/AgdwdYPtJjaOrm4oi745W33pv1EjDi40aagYJAIo4sdYNnbR
         GWq8KAtQGijZ2TGbmL3lfH7dsVAxIVgjrm4t3rx+t6zCeqrNI+u5EVQ/HwHBrs/Vtyvf
         IuVqNUg2Kz2J+jenmDS1Gjs6tbxMfq/iDSqbadBQ9sh3YbwdQ+TK+Np6wD0048poV/Y3
         uOO1pjnKLQCReLhPVlfVbxUk8j+YiX/CXd4Y57Sj5o2JaArhn/r5uF0lXXSkZccSRyRi
         qWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bzw+Iamq+L8wcNS2TuH2WO84pZPHjJ1C5dF15DavXes=;
        b=W7ftBbNzNGQrHqaB9W4k801mnUYlcSfwtl+NQQm/WqYW0+vSOrbZszmBUY8dDAIWsd
         fL/wiFqqjm6cjBaHeQhzO+5VdePstHXLaxygBxcqseD/pl9QzgKSVGtm6Ab3kdvEhUE0
         saxfUyzZvOrWGAmZnwOmXPTPqe2n8Y4U36Jn+MdypBOGT95Ck4wyYji8FYhAfyrGajd9
         C9yRAWIam+1G4TQMBUAMtojuAp1qgT53NbWt9BKqKP5m3ZNXUtzCoQfm+vCdj/VDHtt+
         hiZ2417KnCte3S2XmEjt2/MhpS3O4hdpMhTY03NQ58G9GhXGeY1exWhDlsTlEa/WrTT6
         FQDw==
X-Gm-Message-State: AOAM532X46ggJgYrwXE13Tst1A/1CZsNmb2O8oYa1NoKcGcC3yMVAj1c
        fbDYNNWrUiVSg/XwezPnCdi4SRpFRWBa/bz86yt2uw==
X-Google-Smtp-Source: ABdhPJx2IqJ/3Vt2Rx6Eaqve8yugtHCch4r8Ri5ovhSRwM4olGCIdBnWdCUsJJY2p1mhr5Eg67Y+cNogjSABtCZg1LY=
X-Received: by 2002:a5b:ac9:: with SMTP id a9mr2860418ybr.23.1617176799492;
 Wed, 31 Mar 2021 00:46:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210329111648.7969-1-ada@thorsis.com> <20210329111648.7969-3-ada@thorsis.com>
In-Reply-To: <20210329111648.7969-3-ada@thorsis.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 31 Mar 2021 09:46:28 +0200
Message-ID: <CAMpxmJXRz=oqQunQS1HjMuqgWjNAxQ5o0CZiZNnGjZLpuWmPcw@mail.gmail.com>
Subject: Re: [PATCH 2/3] docs: kernel-parameters: Move gpio-mockup for
 alphabetic order
To:     Alexander Dahl <ada@thorsis.com>
Cc:     linux-doc <linux-doc@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 29, 2021 at 1:17 PM Alexander Dahl <ada@thorsis.com> wrote:
>
> Fixes: commit 0f98dd1b27d2 ("gpio/mockup: add virtual gpio device")
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---

Applied, thanks!

Bartosz
