Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B20C352A1
	for <linux-doc@archiver.kernel.org>; Sat,  3 Dec 2022 13:40:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbiLCNkL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 3 Dec 2022 08:40:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbiLCNkK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 3 Dec 2022 08:40:10 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B05401D667
        for <linux-doc@vger.kernel.org>; Sat,  3 Dec 2022 05:40:09 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id u12so11019774wrr.11
        for <linux-doc@vger.kernel.org>; Sat, 03 Dec 2022 05:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=neBCVgIui0MRdgHsRXnX/gsXlEtzYrqSiZ1/TzCSAcY=;
        b=l6FNyLYnI3GuO5fA5OIS8w79IjgZYgT//MfiO05nu6YPvKzy3wdhX/PIgj3YUcJO4I
         fRVyn4LvFBLjnPpTe2MduSe5unRwV7Ug7v7yGCQDQnH3IEv0zJXOVMn/fGD5drKxGAM2
         ZaBN6JijhvfLkTWQ5SpkPtHGxmZHoMj8blG1Aljb7mySB4AmTB11dzrWrTH9V8Fc625v
         AJARQMY9Za9z1vCOkm9vIbjhNWHFi3TXAfcFyMcPyMONLHgTNWuDZoBkOQkCkMXZK/66
         a6W+donev60NDaCtACROom0Ue/2KakuMPXCvZitFPgLDrjp6VHLnQDDVoNXULecdSeRq
         8wQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=neBCVgIui0MRdgHsRXnX/gsXlEtzYrqSiZ1/TzCSAcY=;
        b=6ThZIKMb7yprXp02hKV4wcxlN6Ikt6gTRoIcktWW8RvXtVgIrJx5p7XiDzryJfAoPP
         Bcb+H0DcTYzMpepE5kqIw9G9IgN1MQzoMTHMSjRB02ty+EKs+cXXr6bC6LcFycnZEIQ7
         jNvo2llKAniVhx0RIwUuwB9GjACaKiwSo2x+z1YpBwYn8Lf/Okhgs4HsbAVj4pV/CDMA
         GgKGk7+2OGeZynPRgohbFjeoSmEKc6zCsEUhbnVQUeXU328IPJr00KZ48Cyx5EV3Hg3Y
         BGzswVmDDW7k8MSWMVSf6ZNli39A08UgK5dYZqhT0DSf4Fx5O+I8OsxSuDWWWjyVbJGV
         CDEQ==
X-Gm-Message-State: ANoB5pkqLB744PAdKnrkplOnBAvjUIq2soXREKNJWlU3k/8UoFn6VagM
        X9Pdn3g3Cm3OxR3S0ZIkimSUgg==
X-Google-Smtp-Source: AA0mqf4PPHh8ibGHSSDf7vrOYSCKWB8RkZYhV46iHsXidUKAf2L6K7OtGzChXJDgNmESZOFg4dsCeg==
X-Received: by 2002:a5d:4d8f:0:b0:242:1121:54b7 with SMTP id b15-20020a5d4d8f000000b00242112154b7mr20012728wru.687.1670074808314;
        Sat, 03 Dec 2022 05:40:08 -0800 (PST)
Received: from airbuntu (host86-130-134-87.range86-130.btcentralplus.com. [86.130.134.87])
        by smtp.gmail.com with ESMTPSA id p33-20020a05600c1da100b003d070e45574sm12228577wms.11.2022.12.03.05.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 05:40:07 -0800 (PST)
Date:   Sat, 3 Dec 2022 13:40:06 +0000
From:   Qais Yousef <qyousef@layalina.io>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Ingo Molnar <mingo@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Xuewen Yan <xuewen.yan94@gmail.com>, Wei Wang <wvw@google.com>,
        Jonathan JMChen <Jonathan.JMChen@mediatek.com>,
        Hank <han.lin@mediatek.com>, Paul Bone <pbone@mozilla.com>
Subject: Re: [PATCH v2] Documentation: sched: Add a new sched-util-clamp.rst
Message-ID: <20221203134006.lj6uicaeo55npoq4@airbuntu>
References: <20221127142657.1649347-1-qyousef@layalina.io>
 <87cz976pwn.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87cz976pwn.fsf@meer.lwn.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/28/22 08:48, Jonathan Corbet wrote:
> Qais Yousef <qyousef@layalina.io> writes:
> 
> > The new util clamp feature needs a document explaining what it is and
> > how to use it. The new document hopefully covers everything one needs to
> > know about uclamp.
> >
> > Signed-off-by: Qais Yousef <qais.yousef@arm.com>
> > Signed-off-by: Qais Yousef (Google) <qyousef@layalina.io>
> > ---
> >
> > Changes in v2:
> >
> > 	* Address various style comments from Bagas
> 
> Just a handful of nits - this looks like a good addition to our
> documentation, thanks.

Thanks a lot Jonathan! I've taken all your comments into account. Thanks for
having a look and hopefully it wasn't a bad read!


Cheers

--
Qais Yousef
