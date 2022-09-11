Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EED02C6FA86
	for <linux-doc@archiver.kernel.org>; Sun, 11 Sep 2022 20:43:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbiIKUnQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 11 Sep 2022 16:43:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbiIKUnO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 11 Sep 2022 16:43:14 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81304222AF
        for <linux-doc@vger.kernel.org>; Sun, 11 Sep 2022 13:43:12 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id q21so10072268edc.9
        for <linux-doc@vger.kernel.org>; Sun, 11 Sep 2022 13:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=lSSgE6qKNsM5nRSZIZrwkAPBKl3L+uuKrmU0F7pD7HY=;
        b=JPDXpPqvckmhgM18iZ464Ra4GB/SbxdXoB7mEFnkbkwW0BRaAxrNtroPGl5mUT2WBd
         pvwfk74PBiUKM3805865m1rO90BYGGTb6OfQMgoWFTvGGKxz7e1J59pXHUMb90uqIGVq
         DvczbtudWRonTOXp0egQqyMlPi3QFxL2LC3I9HxD8oKSiT/VZByKkCnkKkwmDqdP/2lj
         jSI9jTQmMP8PcfjfMBcWc7SQ7xf+70+2cVLkZq9xRKkmN8oNLab6YKRdUP9uqKgEZWb+
         ueuuFbB+qY5K5T90Y7pJ7YbxEYirSPrYgAljQnXnSb1mbHnpaKONiixAd8OxhKnuaiWN
         DSXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=lSSgE6qKNsM5nRSZIZrwkAPBKl3L+uuKrmU0F7pD7HY=;
        b=F4HdZc2tqwyUGZ+WnRb9faiMOf6kAMQ2A6AgW0pTMUj2a3XWuIGyrHuMIS73dbKNKS
         VUabt80d8z29iHbhupCrGa3FwTo5vt0MiePHVoDKdy9m/Peuw/rzrT//v3G00cEC+aF+
         tArFsNtv/KIrLejhdcVfdGcREfQCyzqR3psO3T/2qhWLLxBR6OMirSi5OS8hjkPAEGDS
         PpqfdjIURq5ZX7StxY1Er6qXF+KfBGDvucbc4fo/4HUQXpRIzH7ElgvVeANT2WraN3I7
         fqkVRtp0+mug5Mu8Ow40xVADlQRwrGuoKPfxcZivHNtNA2wmsv9JmKrRXhWqrVGXXJ93
         GxAw==
X-Gm-Message-State: ACgBeo0Z/uxN6u3ccCdPsrHkEu+sJP8/0VO2j5ZZtO+O0QAQfBPzQzyd
        MkYUXBOMP7CPJ6nVlD/4a+HwjFuKTwoOx4ktk3t/Tg==
X-Google-Smtp-Source: AA6agR6XNXb6iXZAgJVLktD2yTU+LhSGDNL4w1b9CIbVMQlDxN1dXvmNUnGzMKm9uOJ76P7qbjXjKF0Dd53Kd+70owY=
X-Received: by 2002:a05:6402:5249:b0:451:67ff:f02 with SMTP id
 t9-20020a056402524900b0045167ff0f02mr5735975edd.227.1662928990454; Sun, 11
 Sep 2022 13:43:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220911095923.3614387-1-pasha.tatashin@soleen.com>
 <20220911095923.3614387-3-pasha.tatashin@soleen.com> <Yx4IEvkmAlcTIP6v@casper.infradead.org>
In-Reply-To: <Yx4IEvkmAlcTIP6v@casper.infradead.org>
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
Date:   Sun, 11 Sep 2022 16:42:34 -0400
Message-ID: <CA+CK2bD5ae0oUefiGMAzxun4-rJhqUdfJqbzcCkZM_Uek-KTxQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] mm/page_table_check: Do WARN_ON instead of BUG_ON by default
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-mm <linux-mm@kvack.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Rick Edgecombe <rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Sep 11, 2022 at 12:08 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Sun, Sep 11, 2022 at 09:59:22AM +0000, Pasha Tatashin wrote:
> > Currently, page_table_check when detects errors panics kernel. Instead,
> > print a warning, and panic only when specifically requested via kernel
> > parameter:
> >
> >       page_table_check=panic
>
> Why are the page table checks so special that they deserve their own
> command line parameter?  Why shouldn't this be controlled by the usual
> panic_on_warn option?

page_table_check can be used as a security feature preventing false
page sharing between address spaces. For example, at Google we want it
to keep enabled on production systems, yet we do not want to enable
panic_on_warn as it would cause panics for many other reasons which
are security unrelated.

Pasha
