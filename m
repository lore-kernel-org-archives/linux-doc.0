Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E1E4C4338F
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jul 2021 07:52:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BE3060F02
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jul 2021 07:52:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233619AbhGWHLZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Jul 2021 03:11:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233381AbhGWHLY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Jul 2021 03:11:24 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2BD0C061757
        for <linux-doc@vger.kernel.org>; Fri, 23 Jul 2021 00:51:58 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id u9-20020a17090a1f09b029017554809f35so7785623pja.5
        for <linux-doc@vger.kernel.org>; Fri, 23 Jul 2021 00:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci-edu.20150623.gappssmtp.com; s=20150623;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=sewiVqfCdDKeM5KOKdNiPR0Yi0yPPcBXb2mMryQ18y0=;
        b=X5FOeetCaIMQo/gTiToOal0qFTrCErlOod0/uzjpqq1LatR3mWTEbCaIvFqH2zBlyu
         mVPSgQg3h1/vhb8tKXOckCQYPfZX4zAW9XmorVmuSHCUwRGc+UWtoy2VdV/cDTCVQpow
         HjFL+1plbVQGPFN0hM3ra4AxRHMOfzU9i2NrQz/+vdj/bK5yBTqWuEDgEZzbM3o/GXLG
         hQvMWNBCz6sg8Kb4J1Dnkt3ELWuoJRH1CalZLFRXTy7/8o+Q4PcPQGlTTCjqltCw79WW
         wa1toEfmB2aot11ZB3gBrA/77KYGcyzZXkSo57rwErYJBhEkE3e2NYV5li0OWH2pp96Z
         Sc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=sewiVqfCdDKeM5KOKdNiPR0Yi0yPPcBXb2mMryQ18y0=;
        b=Lp271g0KRlewkVdlJvyQgtJ4GPJ8yopFID0UFKlp5mpuSKPJPUaXstHAOThS+HC/K6
         qaTFwPpRRbtmR/RIXJqPJQdQ6tf3+fJ9eZM8LQ+cSVNJajGZGC+WGa7RCFTsS+p47wGE
         lm1ObPz2uS7RTGfeCgC7yv3Tt6nPCRzWUe151dXgSEo7buSAgNYLzy6zBujzcqcrOYx9
         gGsij1soZap1h/EzEEZLTosdw8mQNSBnuE5nJ8Bw/TywEpjYTKpsv/QFo9hhBiAiPa4a
         K4VfPS3QCnmkXzysZa8MKpeCu8iiamwyrhbtZwN9GEmuSjiv45wEhgleRILpu7uHpswP
         ubNw==
X-Gm-Message-State: AOAM531KUr5AhzkrlopLUjzEXp/gK3RocX/mTfo51ITCO26/kb7bg5Nm
        LSgaB3rH5CkQZKtLwuTrIGfCag==
X-Google-Smtp-Source: ABdhPJyjsTbhz9tefhd5WV3X3j5AfJzZgkJRAgbdolCArl8oVXdBfKh2ifpUPAXCRCyUWAPh23w9yw==
X-Received: by 2002:a17:90a:ad8a:: with SMTP id s10mr3494335pjq.11.1627026718239;
        Fri, 23 Jul 2021 00:51:58 -0700 (PDT)
Received: from [192.168.1.3] ([183.98.43.105])
        by smtp.gmail.com with ESMTPSA id f30sm2607909pgl.48.2021.07.23.00.51.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Jul 2021 00:51:57 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH v34 00/13] Introduce Data Access MONitor (DAMON)
From:   Dongjoo Seo <dseo3@uci.edu>
In-Reply-To: <YPpwCS4CpGtJTy9t@kroah.com>
Date:   Fri, 23 Jul 2021 16:51:45 +0900
Cc:     SeongJae Park <sj38.park@gmail.com>,
        "Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>,
        acme@kernel.org, akpm@linux-foundation.org,
        alexander.shishkin@linux.intel.com, amit@kernel.org,
        benh@kernel.crashing.org, brendanhiggins@google.com,
        corbet@lwn.net, david@redhat.com, dwmw@amazon.com,
        elver@google.com, fan.du@intel.com, foersleo@amazon.de,
        gthelen@google.com, guoju.fgj@alibaba-inc.com, jgowans@amazon.com,
        joe@perches.com, linux-damon@amazon.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, mgorman@suse.de,
        mheyne@amazon.de, minchan@kernel.org, mingo@redhat.com,
        namhyung@kernel.org, peterz@infradead.org, riel@surriel.com,
        rientjes@google.com, rostedt@goodmis.org, rppt@kernel.org,
        shakeelb@google.com, shuah@kernel.org, sieberf@amazon.com,
        sjpark@amazon.de, snu@zelle79.org, vbabka@suse.cz,
        vdavydov.dev@gmail.com, zgf574564920@gmail.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <B0D5F589-1F50-4970-BEA7-9C213E6D9947@uci.edu>
References: <2E16FC36-18B4-4F92-86AE-51249CCDB1A4@uci.edu>
 <YPpq4u+b/UzAE/3u@kroah.com> <23F9BFF6-51B0-4EF7-AF2F-278F89D310C3@uci.edu>
 <YPpwCS4CpGtJTy9t@kroah.com>
To:     Greg KH <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



> On Jul 23, 2021, at 4:30 PM, Greg KH <gregkh@linuxfoundation.org> =
wrote:
>=20
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?
> A: Top-posting.
> Q: What is the most annoying thing in e-mail?
>=20
> A: No.
> Q: Should I include quotations after my reply?
> http://daringfireball.net/2007/07/on_top
>=20

Sorry for the bad format email.
Thank you for your information. It really helps me with further mailing.

> On Fri, Jul 23, 2021 at 04:16:27PM +0900, Dongjoo Seo wrote:
>> Thank you for your comment!.
>>=20
>> It has been a long time since Nvidia ended supporting the new kernel
>> version on tx2 boards, but for researchers, this set of boards (tx2,
>> px2, agx) is a very attractive candidate to use.
>=20
> But why are you stuck at a known-buggy and insecure kernel version?  I
> would work on fixing that first, before worrying about new features.

I need a board that has a GPU in my work.
However, Nvidia=E2=80=99s driver source code is not open-source.
I thought it would be easier to use the old compatible kernel with this =
tool than to use the Nvidia driver with one major version different =
kernel.

Thanks again for your advice on emailing!
Best
Dongjoo Seo=
