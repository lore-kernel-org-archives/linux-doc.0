Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5BBAC761A6
	for <linux-doc@archiver.kernel.org>; Thu,  6 Apr 2023 14:16:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239095AbjDFOQk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 Apr 2023 10:16:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239050AbjDFOQh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Apr 2023 10:16:37 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92FA88A45
        for <linux-doc@vger.kernel.org>; Thu,  6 Apr 2023 07:16:23 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id h3so11387927qtu.1
        for <linux-doc@vger.kernel.org>; Thu, 06 Apr 2023 07:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20210112.gappssmtp.com; s=20210112; t=1680790582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/keXUwxyyyhEmE55ekm1FOCQVlxKlIBEPyFrxNy9+U8=;
        b=yMgxS62CvuVWs51H3j8VhZZqIn+Cxgamg4MbN38plY1EHsc+48o/I2AU+AL+IrLGyb
         2FQPJBrBUfPODEdPgg3Cs8bERKQ8L0drmuknQiejJ1OX5SgINjFOVIRScBqH+2G6tfKz
         UO9iQ4OkJCRftY92TR3n8hbAi45WxIx43oy9C9NVUE94NNJhL9wVyWMOBI+kGQXkMxWp
         pFvXpOOfzOVXCB6GmFyiFM9LrIUUQCFvrbgkT4nVWvY6y043YqaOrSy095TBohrzhtDh
         4pjKCjdLwRPqUL1UDC7+YaUp7gjIrS2XXSvQH+FO30nS9mfbWYHaorWMJK8x2hMP8vV2
         DZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680790582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/keXUwxyyyhEmE55ekm1FOCQVlxKlIBEPyFrxNy9+U8=;
        b=o2BfPXc+2SyG5Fm+rcrC3pvQ+16jFvRmcL/ajE9hbKGXSjdCmVpCmsocGmoqM6L7Dv
         k1PBQjIIGcrU0ypbtfzZJZKpmYY6JYXRdu7DnY1NsQPsvLDW/Zqxp/+kM00VH2UUQktx
         cLo67nxA/0Xg3YjNh5aBvKlyogUfUn4jXoJJ4SnD2XGxIaDdgptT/MALZIuhi+wimV8G
         N5H3PaxdfkNv4bHE+UiFHVB8NEn+7j/n1ZtLHSf5D+WesJ0Gqpo9quTYbPK7vywgsZpl
         4ZKezGLlL4+nO8KrTgvg4QEoJW5JXC6uiokAeGLuHPWwWIrXZt5DnP8SPkspm4Gtxrf4
         jMyA==
X-Gm-Message-State: AAQBX9dNd9Xq6c5tYR3xrr/8kaZccCn2mpDCayZtvEWeyydv08lpXati
        NAUs81jhyhi85hfCwKbi0dMjFQ==
X-Google-Smtp-Source: AKy350aHGbMuHwfg10eLISdaNmwzT6KQ08KKQI4+CJ4NG36CU3mo9lXcmtYbtUWWQpn3yduoT2tNeg==
X-Received: by 2002:a05:622a:118d:b0:3b9:b2ba:9b3d with SMTP id m13-20020a05622a118d00b003b9b2ba9b3dmr11399480qtk.54.1680790582613;
        Thu, 06 Apr 2023 07:16:22 -0700 (PDT)
Received: from localhost (2603-7000-0c01-2716-8f57-5681-ccd3-4a2e.res6.spectrum.com. [2603:7000:c01:2716:8f57:5681:ccd3:4a2e])
        by smtp.gmail.com with ESMTPSA id d7-20020ac85347000000b003e3982a6f2bsm450114qto.18.2023.04.06.07.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 07:16:22 -0700 (PDT)
Date:   Thu, 6 Apr 2023 10:16:19 -0400
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     David Hildenbrand <david@redhat.com>
Cc:     Stefan Roesch <shr@devkernel.io>, kernel-team@fb.com,
        linux-mm@kvack.org, riel@surriel.com, mhocko@suse.com,
        linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
        akpm@linux-foundation.org, Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH v4 2/3] mm: add new KSM process and sysfs knobs
Message-ID: <20230406141619.GB35884@cmpxchg.org>
References: <20230310182851.2579138-1-shr@devkernel.io>
 <20230310182851.2579138-3-shr@devkernel.io>
 <ce494e5a-3540-d6ad-4e9c-0bb49c7e1e1b@redhat.com>
 <qvqw8rf6uicf.fsf@dev0134.prn3.facebook.com>
 <e7a930f6-feba-29a4-7c48-ae7d8108c7dc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7a930f6-feba-29a4-7c48-ae7d8108c7dc@redhat.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 06, 2023 at 03:23:11PM +0200, David Hildenbrand wrote:
> > > 
> > > Often, when you have to start making a list of things that a patch does, it
> > > might make sense to split some of the items into separate patches such that you
> > > can avoid lists and just explain in list-free text how the pieces in the patch
> > > fit together.
> > > 
> > > I'd suggest splitting this patch into logical pieces. For example, separating
> > > the general profit calculation/exposure from the per-mm profit and the per-mm
> > > ksm type indication.
> > > 
> > 
> > Originally these were individual patches. If I recall correctly Johannes
> > Weiner wanted them as one patch. I can certainly split them again.
> 
> That's why I remember that v1 contained more patches :)
> 
> Again, just my opinion on patches that require a description in form of a
> list ...

My concern was the initial splitting of patch 1. I found it easier to
review with the new prctl() being one logical change, and fully
implemented in one go. The changelog is still in the form of a list,
but it essentially enumerates diff hunks that make up the interface.

No objection to splitting out the multiple sysfs knobs, though!

The strategy I usually follow is this:

1. Split out changes based on user-visible behavior (new prctl(), new
   sysfs knob)

2. Extract changes made along the way that have stand-alone value in
   existing code (bug fixes, simplifying/documenting tricky sections,
   cleanups).

3. Split out noisy prep work such as renames and refactors that make
   the user-visible functional changes more difficult to understand.

and then order the series into sections 2, 3, and 1.
