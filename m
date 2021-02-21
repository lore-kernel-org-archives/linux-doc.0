Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BAF9C433E0
	for <linux-doc@archiver.kernel.org>; Sun, 21 Feb 2021 18:17:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42CEC64EE6
	for <linux-doc@archiver.kernel.org>; Sun, 21 Feb 2021 18:17:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229966AbhBUSRe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 21 Feb 2021 13:17:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229926AbhBUSRe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 21 Feb 2021 13:17:34 -0500
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B291EC061574
        for <linux-doc@vger.kernel.org>; Sun, 21 Feb 2021 10:16:53 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id h16so7728331qth.11
        for <linux-doc@vger.kernel.org>; Sun, 21 Feb 2021 10:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5NYMReaC/3VKX2bMJQY6DX529QwUJU7ppUvprzC4HA0=;
        b=j+B3GX2DtJkYaS+8vMWDKjPiD6rKnZKBk24JCiqLkcvyzcnKyuO0qxJA1zbWO8p69T
         +5X6eTYt/Vf9xXnvGvRUNgO/QS7JuSdl98XIFVAhhVSlo5JDjOHko7Y3h8nFpP4aA1Dl
         6GoOJx6ELkoNRypwLhbgrqlErMockDnxAF8fncdiQkOSQBphPcDgJxk9Selkd63/AeEV
         0T0qMrXt6Y7i2gbnzzsCpeQdcqbuDl+bKVRb4RcSZggebJFTIeKiwoi3CAi3DkulbstK
         FygtxNtoIIB3a5htIFJKvIdRHBcyLjZEmH6MxC/WED5gAH62YTOhJ3wqqVKsgHFUCswf
         lINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5NYMReaC/3VKX2bMJQY6DX529QwUJU7ppUvprzC4HA0=;
        b=rSesbF2eXnWaR/OXT6DskmFEoPP4oxmwTc9kv0o6fZHaKY0zN3yvXzH3V/S3vKVRKL
         +lsYQePcb2pUTnmClhRVqSbFC9J4TBzUGdxxCzDbrS5Nc2lHQrpOSdaz7hgs6GrzD6Zn
         9UzriLPN6dTk3IFFAa8LZPBI4WWlUMXNdnMbolVj9kHs4hSSpOXL6mF7Jh3AUXkDOEjN
         3vQ78sNwObdEG3DgoF4ZoBWvF+eeMEUHoMZwSDI0TH28d16SF82+xVfuothwPv/6zJqC
         16bxQh8nS1n+SV/NCJE4GSLdhvK2KzKhJ1q5sfi8q0MWB6dfy7iUNuBygzDEhrLmDhAF
         21jg==
X-Gm-Message-State: AOAM533Uumo+wVTmSqcgmQHycMO8LhpiFIffgHczu57FHymsCoM1u8gb
        BLvBe1tIqJl/f0qkEZN5m4A=
X-Google-Smtp-Source: ABdhPJzucCSrhziikWbcB3QyXGFmDbhl4/sgzdlSOp5aVdb+xdZ4Fqgp1pkVslhw8nv0OBVdkSE51Q==
X-Received: by 2002:ac8:4744:: with SMTP id k4mr17444567qtp.348.1613931412839;
        Sun, 21 Feb 2021 10:16:52 -0800 (PST)
Received: from debian-vm ([189.120.76.30])
        by smtp.gmail.com with ESMTPSA id m8sm7774420qkm.58.2021.02.21.10.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Feb 2021 10:16:52 -0800 (PST)
From:   Igor <igormtorrente@gmail.com>
X-Google-Original-From: Igor <igor>
Date:   Sun, 21 Feb 2021 15:16:49 -0300
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Igor <igormtorrente@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: About the .txt docs files
Message-ID: <YDKjkTYz3NyqW2qk@debian-vm>
References: <YDGRUCzcVskYYrVv@debian-vm>
 <7929a6a1-65b0-a057-b351-23326981ad5d@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7929a6a1-65b0-a057-b351-23326981ad5d@infradead.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Feb 20, 2021 at 03:07:06PM -0800, Randy Dunlap wrote:
> Hi,
> 
> Yes, it's good to ask.
> 
> On 2/20/21 2:46 PM, Igor wrote:
> > Hi everyone,
> > 
> > I was converting the memory-barrier.txt to .rst so it can be properly
> > displayed alongside the rest of the documentation that is already
> > converted to .rst.
> > 
> > After I started, I realize that is better to ask if is desirable for
> > these files to be converted in the first place.
> > 
> > So, that is my question, from the files in the following list there
> > any that would be desirable for the conversion?
> > 
> > memory-barriers.txt
> > atomic_t.txt
> > atomic_bitops.txt
> 
> For the atomic files, my understanding is that the owners don't
> want to have them converted to .rst files.
> That could easily be true of memory-barriers.txt as well.
>

Ohhh, ok then.

> 
> > admin-guide/spkguide.txt
> > filesystems/dax.txt
> > filesystems/path-lookup.txt
> 
> 
> thanks.
> -- 
> ~Randy
> 

Thanks Randy!
