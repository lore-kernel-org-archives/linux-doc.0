Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFA65C433F5
	for <linux-doc@archiver.kernel.org>; Sat, 26 Mar 2022 20:03:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234860AbiCZUE5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 26 Mar 2022 16:04:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232824AbiCZUE4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 26 Mar 2022 16:04:56 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0102918B7AD
        for <linux-doc@vger.kernel.org>; Sat, 26 Mar 2022 13:03:19 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id g24so14306586lja.7
        for <linux-doc@vger.kernel.org>; Sat, 26 Mar 2022 13:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RdtkPgU1voLQTS9FCim5FFJxxR81mf9841pxK7k3myQ=;
        b=HKBnL7ySerUq68vRo6aQmLshwvFK/rcXIzSMmhlBaamj7BLtH40huPt2ygtyf+Zj+k
         mxfE9j4GpdJ7DBWLyGYLOEN0Yi8Fz6e5YaKsaIVKZK/WwB80kUT2vmwX9GNOHswu5+0u
         5rGv+yW+pbAV+aEzUUH71wFh5tUI3w7e3856s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RdtkPgU1voLQTS9FCim5FFJxxR81mf9841pxK7k3myQ=;
        b=y9p31fAR0FB46Wu7MRDVfOc1lBHSmhyEjxmloIY7Ahsc8BoBuX4Y4OIRtP2pJCOJso
         haNxAEFgio+t8J5koKMRjv3UpnoTMng1EbiyEm8+0jQB1Z6U1T3PE2sbUya9whaY0WB/
         ec/JtdfVv1cmrEJtFqyBG73EMc0O7CvKb+kl/0DjejNFotHhOv5PsOicUaufNAJUxxCm
         Kn9w8GKw/4lNsllVR2afB2J3ebg5e74HOe2U4qUdVSv8rR2j0eRi28AIJDbv7lKNmIBQ
         EQghFrAsdIpfUaMSBbu/8phqVaVZgBEANa1gQ/DL7xeQyuaVVWNJ7LQn/dgWXMe+rCqF
         wfqw==
X-Gm-Message-State: AOAM533VOwM8FglNuAGevG+InyxP+bhK0Yr3IXbY+qxKiL5RlhqYaqZR
        FE7Qi2OQL66TY3i8IwOSoeoGmDFuayNeQSJAAuk=
X-Google-Smtp-Source: ABdhPJx4AgnEP2BmrFGCA6EASoGecRT7Zpy/pk4iRcs+53TMzfNDcXbV840dBnn2yOZstHyG9rDQAw==
X-Received: by 2002:a2e:a693:0:b0:24a:c41a:a3e3 with SMTP id q19-20020a2ea693000000b0024ac41aa3e3mr3533868lje.330.1648324998048;
        Sat, 26 Mar 2022 13:03:18 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b0044a1fdb8e85sm1150439lfb.134.2022.03.26.13.03.17
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Mar 2022 13:03:17 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id m3so18600198lfj.11
        for <linux-doc@vger.kernel.org>; Sat, 26 Mar 2022 13:03:17 -0700 (PDT)
X-Received: by 2002:ac2:4f92:0:b0:448:7eab:c004 with SMTP id
 z18-20020ac24f92000000b004487eabc004mr13322047lfs.27.1648324996731; Sat, 26
 Mar 2022 13:03:16 -0700 (PDT)
MIME-Version: 1.0
References: <87wnghd78t.fsf@meer.lwn.net>
In-Reply-To: <87wnghd78t.fsf@meer.lwn.net>
From:   Linus Torvalds <torvalds@linuxfoundation.org>
Date:   Sat, 26 Mar 2022 13:03:00 -0700
X-Gmail-Original-Message-ID: <CAHk-=whhSE3eaA55qfuT+3hVik2hbixEd=1OY=e66p4hia5Hrw@mail.gmail.com>
Message-ID: <CAHk-=whhSE3eaA55qfuT+3hVik2hbixEd=1OY=e66p4hia5Hrw@mail.gmail.com>
Subject: Re: [PATCH] docs: Add a document on how to fix a messy diffstat
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 25, 2022 at 2:58 PM Jonathan Corbet <corbet@lwn.net> wrote:
>
> [If this passes muster I'll likely toss a version onto LWN as well]

Thanks for doing this, but I think the target audience, not me, should
answer that question.

That said, I think that second link in the commit description is
corrupt somehow, I get "Not found".

Oddly, it seems to be correct in the doc itself. I did not sit down
and compare the random noise in the links side-by-side, though.

            Linus
