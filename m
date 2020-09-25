Return-Path: <SRS0=pZ1j=DC=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C70D2C4727E
	for <linux-doc@archiver.kernel.org>; Fri, 25 Sep 2020 23:46:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8225120878
	for <linux-doc@archiver.kernel.org>; Fri, 25 Sep 2020 23:46:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DZxvGcbC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729535AbgIYXqs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 25 Sep 2020 19:46:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729424AbgIYXqs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Sep 2020 19:46:48 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 225D4C0613D3
        for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2020 16:46:48 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id f18so4734321pfa.10
        for <linux-doc@vger.kernel.org>; Fri, 25 Sep 2020 16:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HpFQhrcK5tTLpxHok0d7YfneEXCwBPCYjtbmDqMgkHs=;
        b=DZxvGcbCxH6vr1ajOYyWWuYAL4y5DWR6ExkCNQGiXwqV0Gv3O4b3i0dNxC7s+zZclN
         pO91uUpvMHRqVi9PhkSJMILdLqsZWhZ7smbN2OaYA7ttENhUdVsNkUAN2aXKssThr55q
         HX0rG+q/pPv26SBN7hYcYV7wWTfFFwO5V/WtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HpFQhrcK5tTLpxHok0d7YfneEXCwBPCYjtbmDqMgkHs=;
        b=rmhdUv96GJTJWzwqlb0fZb28b3V/hSV7YQtDE12mMxoZUI3OZJ2lkgK+w7kD71pUrS
         hFUyYuOCp9gN9550nKNoSkdRAYJF1oXsnZC9Vb6n3Skqt+742GiDRD5YSP3B6OGj2MUc
         jsUs2xTflCETQWgpDEUEqwApGHNfOM6QiCcBDRJPeatxaxD0D/HK8rrNaAZgRKnnYYS3
         GgAXiCZ73VHuf7DjbYMua9SBFKUjX93VvqJEwzpqvtHDr8dXbtnjEqFGTzWiviub26xs
         KvSM/UIC8BQd0SiCyhRbHZdF2FHZ/NH8r4h09BtJOIh27dgbbxhSVVSP83fF0M1H28ys
         3maA==
X-Gm-Message-State: AOAM530PiF7TUDXW7V7AhaGL4+Q5OsbD6Orzi7RY7phuF3mPXWMHMyI7
        C35FrBCk7Waz5K+o4UvTmSRr6g==
X-Google-Smtp-Source: ABdhPJwq99F00rfpytlVAljspyCw6wbr6M3oTKSGKGkGqOsBbC4I1Y/0khozD6K1OFK7zTzkVp+y4w==
X-Received: by 2002:aa7:96bb:0:b029:142:440c:6ebc with SMTP id g27-20020aa796bb0000b0290142440c6ebcmr907038pfk.22.1601077607710;
        Fri, 25 Sep 2020 16:46:47 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f12sm261436pjm.5.2020.09.25.16.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 16:46:46 -0700 (PDT)
Date:   Fri, 25 Sep 2020 16:46:45 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Shuah Khan <shuah@kernel.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Hangbin Liu <liuhangbin@gmail.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>, Tim.Bird@sony.com,
        lkft-triage@lists.linaro.org,
        Anders Roxell <anders.roxell@linaro.org>,
        Justin Cook <justin.cook@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [PATCHv5 kselftest next] selftests/run_kselftest.sh: make each
 test individually selectable
Message-ID: <202009251646.43B045E0@keescook>
References: <20200914021758.420874-1-liuhangbin@gmail.com/>
 <20200914022227.437143-1-liuhangbin@gmail.com>
 <CA+G9fYvT6Mw2BamoiVyw=wLUqD-3LB2oaDqcuabOyWfFxEN1qg@mail.gmail.com>
 <202009251414.15274C0@keescook>
 <f375a87d-7ba3-f97f-b39a-06b61f80c552@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f375a87d-7ba3-f97f-b39a-06b61f80c552@linuxfoundation.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Sep 25, 2020 at 05:06:02PM -0600, Shuah Khan wrote:
> On 9/25/20 3:16 PM, Kees Cook wrote:
> > On Fri, Sep 25, 2020 at 01:51:53PM +0530, Naresh Kamboju wrote:
> > > On Mon, 14 Sep 2020 at 07:53, Hangbin Liu <liuhangbin@gmail.com> wrote:
> > > > 
> > > > Currently, after generating run_kselftest.sh, there is no way to choose
> > > > which test we could run. All the tests are listed together and we have
> > > > to run all every time. This patch enhanced the run_kselftest.sh to make
> > > > the tests individually selectable. e.g.
> > > > 
> > > >    $ ./run_kselftest.sh -t "bpf size timers"
> > > 
> > > My test run break on linux next
> > > 
> > > ./run_kselftest.sh: line 1331: syntax error near unexpected token `)'
> > > ./run_kselftest.sh: line 1331: `-e -s | --summary )
> > > logfile=$BASE_DIR/output.log; cat /dev/null > $logfile; shift ;;'
> > 
> > Yes, please revert this patch. The resulting script is completely
> > trashed:
> > 
> 
> Thank you both. Now reverted.

I've sent an alternative that I think should do nicely. It will work
well with LAVA as well.

-- 
Kees Cook
