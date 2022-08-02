Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33BC2C00140
	for <linux-doc@archiver.kernel.org>; Tue,  2 Aug 2022 17:09:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231877AbiHBRJ4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 2 Aug 2022 13:09:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230218AbiHBRJz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Aug 2022 13:09:55 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC4273AE4C
        for <linux-doc@vger.kernel.org>; Tue,  2 Aug 2022 10:09:53 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id y11so11169324qvn.3
        for <linux-doc@vger.kernel.org>; Tue, 02 Aug 2022 10:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=K9kEd2GPyCLccFvieYdAFisgtz04Q+n9mP7468SvJiY=;
        b=UBJRjzHxcQ0IqTf/Q1+Zfvr6T8kYy0ryJicFBsczPkuPf3ir2NPfb17F4aqq0wc3ta
         LWckoUkU+hsO+iqA8avS/mpqxGRr+gGUvON4M9wcD0gZxjGfWVdhxzJWGzJVgHOv1dAL
         prZQd3uukKks9AmWOHKO+gF/OTW2tf8+mL4BI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=K9kEd2GPyCLccFvieYdAFisgtz04Q+n9mP7468SvJiY=;
        b=NXrfFEbj3NOGo5PtloVVNnLtO4Rbg3RgYmmH4c5YME2G6tXCDJzdp/iH818F1STp9Y
         NA9xG40FVNxcC7gLUaTMmpCr6Npea5fGbxoZXyKj5BaFnxs2x5lOWkGXPbAkb3nyreSd
         d9PsO1E9Ci/mTLIgnwp41y3Q5Fc67kK5Y5Jmb71S2JVGam44ntK7+C8FJZzCOnt5Z1Mf
         qNso6lsZW/k6uUEpCjuotgxh1urdBdRHGDIoD/RgLFXqyiVfcKgK6+ksPGRKIWYy3vtC
         BfO1BNBtOdWzKB56lH8GAqRqMQ6eAfIzaiSZoCfD7mftAVRr3zScXJFiWghYslIbjXFs
         NJ8Q==
X-Gm-Message-State: ACgBeo21RIVq1PmsFqAtbN1tEtgUktuDIHopz20/gMKm7kNdd9cBy59f
        /s/NPa7T4zwnt8p1XGUmliBJqQ==
X-Google-Smtp-Source: AA6agR7eM3+Gbg5TiO3WTJi++AGoF3I0zAKD7cvf9rBlDvf6omVmi8ylchUBe7S4Ysrt8kYJXcwgVw==
X-Received: by 2002:a05:6214:20a2:b0:476:9071:2e60 with SMTP id 2-20020a05621420a200b0047690712e60mr9234833qvd.110.1659460192878;
        Tue, 02 Aug 2022 10:09:52 -0700 (PDT)
Received: from nitro.local (host-142-67-156-76.public.eastlink.ca. [142.67.156.76])
        by smtp.gmail.com with ESMTPSA id x29-20020a05620a0b5d00b006b5652edb93sm10776025qkg.48.2022.08.02.10.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 10:09:52 -0700 (PDT)
Date:   Tue, 2 Aug 2022 13:09:50 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v1 5/5] maintainer-pgp-guide: minor wording tweaks
Message-ID: <20220802170950.l4xs6r5c6nfqlop5@nitro.local>
References: <20220727-docs-pgp-guide-v1-0-c48fb06cb9af@linuxfoundation.org>
 <20220727-docs-pgp-guide-v1-5-c48fb06cb9af@linuxfoundation.org>
 <7107b5c5-d392-db1f-d5cb-6cae638c0b31@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7107b5c5-d392-db1f-d5cb-6cae638c0b31@infradead.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jul 29, 2022 at 03:55:45PM -0700, Randy Dunlap wrote:
> >  The files in our home directory are not as well protected as we like to
> > -think.  They can be leaked or stolen via many different means:
> > +think. They can be leaked or stolen via many different means:
> 
> One or 2 spaces after a period is one of the things that we historically
> don't care about (can go either way).

Hm... I didn't know that applied within the context of a single file. Anyway,
I'm happy to drop this change -- pretty sure it's only there because my vim is
configured to replace ".  " with ". " on "gq" operations.

-K
