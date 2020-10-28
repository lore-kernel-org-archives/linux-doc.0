Return-Path: <SRS0=KUUv=ED=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC9CC4363A
	for <linux-doc@archiver.kernel.org>; Wed, 28 Oct 2020 23:14:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1EA720759
	for <linux-doc@archiver.kernel.org>; Wed, 28 Oct 2020 23:14:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore-com.20150623.gappssmtp.com header.i=@paul-moore-com.20150623.gappssmtp.com header.b="xGxWf1sY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390212AbgJ1XOh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Oct 2020 19:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730263AbgJ1XOg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Oct 2020 19:14:36 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1295C0613CF
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2020 16:14:35 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id 23so1050336ljv.7
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2020 16:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uP/JEghnSGmj7e6AesSlvrZCV6WUBdPW7UyUOd9YPjI=;
        b=xGxWf1sYuQimA8Pb3JOW0Wj0BHMIJCwn1gMWtOQy75nP6RaEoOq5C/GkmXVi7pHKQj
         JQ7bvUzAW0JZrXHMEn6KLifhrkFXf/U+agkeQOIAgrfBy0MRN1A7wsUEVG/59kaV8fJG
         BuzwSFP8yoA5JQmdAV/2ctelQ4BILa1EQC4ju8/13mBjAWU+WvL2gkKqqiBJHgwYWfLt
         JdZRj5Gs/OERhjmHPr+eDxQN87UPieTnau6amvhohFijsraX4+FiMqA24NPddFbiG83O
         DEN322EhEyA2xNoTK71H29NH8ZgHWk8I0D6k3VymVMJP3jgQ2rL9e825nsEH+EaHXORU
         oI3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uP/JEghnSGmj7e6AesSlvrZCV6WUBdPW7UyUOd9YPjI=;
        b=g2FQLlKgtmXyFAfkBQOoZbUxwmBPhRY0vFNGKeEvG6PZ83jUk+S8AT6G9RklYKw2wV
         M5Dg3bFFZViD5iXHt2ACDr2JjtybQBT5QF9f8LWuHqiFLL7zFQyf3aVokpKODj3XAdND
         qTclihV1WU5s3ReyF1aVJfJc1BvOYiMa7aMYBsgF4B6A0YZCzyRux3q+W8dgLwiNKJvO
         f9xZeqsFxu4Fa9At9V9D3ET6mhxyAwBteHKNDcX0DSZZ/z8A5gRWLu1nELRbqkTx3T1K
         01mBXQP48CIdGQkNr598kCyUjLY2M3kqILJ3QD7DfsnJTRbKV/OokPuBRLcRtlzhjQkV
         uCgQ==
X-Gm-Message-State: AOAM531yDtW3PXqaI+boli+T4bqjfNfZ5MmcBPrIPkw0XkWq/TzLA5E8
        lHmbZ9v2PhjpPW2W3HrNM+kpTpM0GIooJzLz6u8jhGtJjg==
X-Google-Smtp-Source: ABdhPJxy3tTKM5QLQXt5ygim35ZXlLtmSNyEsb2Vs87VSTGD8dpJf1fiQCjE/MH+lUa0LAsHp33dW1sarczD6VGn2D8=
X-Received: by 2002:a17:906:25cc:: with SMTP id n12mr4949548ejb.488.1603846795601;
 Tue, 27 Oct 2020 17:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
 <8c04d5c5d0144019c2c38d7c3f31061d6b35d360.1603469755.git.mchehab+huawei@kernel.org>
 <CAHC9VhQ88cuU-0QdpYJyJZE3FU-3graP=N9n9eiG4Kj2tDbiBQ@mail.gmail.com> <20201025233820.7f946e1c@coco.lan>
In-Reply-To: <20201025233820.7f946e1c@coco.lan>
From:   Paul Moore <paul@paul-moore.com>
Date:   Tue, 27 Oct 2020 20:59:44 -0400
Message-ID: <CAHC9VhTZtTXO8Woo_cCdBbg9Nq5A-vBdoOJo7gNUk+RRNBbeaw@mail.gmail.com>
Subject: Re: [PATCH v3 51/56] audit: fix a kernel-doc markup
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Eric Paris <eparis@redhat.com>, linux-audit@redhat.com,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Oct 25, 2020 at 6:38 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
> Em Sun, 25 Oct 2020 18:10:44 -0400
> Paul Moore <paul@paul-moore.com> escreveu:
>
> > On Fri, Oct 23, 2020 at 12:33 PM Mauro Carvalho Chehab
> > <mchehab+huawei@kernel.org> wrote:
> > >
> > > typo:
> > >         kauditd_print_skb -> kauditd_printk_skb
> > >
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > ---
> > >  kernel/audit.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > Looks good to me, nice catch.  Would you like me to pull this into the
> > audit tree or are you intending this to get pulled in as part of the
> > larger patchset somewhere else?
>
> Feel free to apply it directly via audit tree.

I just merged it into audit/next, you should see it shortly.  Thanks!

-- 
paul moore
www.paul-moore.com
