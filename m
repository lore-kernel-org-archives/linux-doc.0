Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D889C2FC14
	for <linux-doc@archiver.kernel.org>; Thu, 17 Aug 2023 03:46:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347915AbjHQDpa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Aug 2023 23:45:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347894AbjHQDov (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Aug 2023 23:44:51 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F045726A5
        for <linux-doc@vger.kernel.org>; Wed, 16 Aug 2023 20:44:48 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-68872cadc7cso1733154b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 16 Aug 2023 20:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692243888; x=1692848688;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZoxuOOOPCYR3t9kZOgenEGYkSAziR5agcDn1+0l1D/g=;
        b=B/J9fB4fcigGxOQotv7KYzsjvjQMoeIpTwIjWuQQw8P+/Pi98sK76cvGOJKHp5e2Og
         V+z1uc1hGBTK+1pcOvLpkka95uzRAaf8vQROOzfk+q7bnbYSrBi6U61Gm+y1eTe0epDW
         8gfx29U3+I++WkX3n6Zs6dGWrvxcS0KFDh3no=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692243888; x=1692848688;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZoxuOOOPCYR3t9kZOgenEGYkSAziR5agcDn1+0l1D/g=;
        b=ABjDBwaIJWw1e+4FwKpJkegzn2RdqUgnBHN5nG7p886Sp+arj9ly+Xjsgs//aCHpLo
         CPhDyqPm9dDayiuE3ABHecJxSOiumXFiS7N9EoiqbD3ultLLPnn33kkFpn1Ss5Zw4XfV
         hWQSS8xzSdtrFSICi16CpegKnq2bYoR19kb+GEh9g6Hpz5CBsNg9XC+biaAmd5/C1sn6
         UuObGb3a1fDKaVK+fAsL3a0Dbmd19rXReWgslqbnZ9BfGLE3p77LKU/Qtx5cw4+YR9CS
         NywKu33msrxPbC5ub0JqqxonlHAbcN0LECwQ+ywr7iiisuho/ZeXy5SVAFHJbw29otPM
         G4Hg==
X-Gm-Message-State: AOJu0Ywt4miIoTKMVt5beUJZU3YXRL9J4rwI2EH5affci6CSs2OQWWDn
        MR0Kv5FPvueAHvQJw//jwhBei2OwMkdnkB++AD8=
X-Google-Smtp-Source: AGHT+IEDbX0HaCKbcWjeHvsVDLzdj7CvE3sivY202/QqGMIWkgUJKlySIY0cLQQcGqu8OZ+N0vPa6w==
X-Received: by 2002:a05:6300:808c:b0:133:b3a9:90d with SMTP id ap12-20020a056300808c00b00133b3a9090dmr3767651pzc.36.1692243888390;
        Wed, 16 Aug 2023 20:44:48 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:fba0:de48:e2d6:bcf2])
        by smtp.gmail.com with ESMTPSA id c23-20020aa78e17000000b006883561b421sm6191564pfr.162.2023.08.16.20.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 20:44:47 -0700 (PDT)
Date:   Thu, 17 Aug 2023 12:44:43 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Jonathan Corbet <corbet@lwn.net>,
        Tomasz Figa <tfiga@chromium.org>, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC][PATCH] kconfig: introduce listunknownconfig
Message-ID: <20230817034443.GF681074@google.com>
References: <20230817012007.131868-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817012007.131868-1-senozhatsky@chromium.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On (23/08/17 10:19), Sergey Senozhatsky wrote:
> The listunknownconfig option reads old .config and lists
> all unrecognized symbols. This is especially useful for
> continuous kernel uprevs when some symbols can be either
> removed or renamed between kernel releases (which can go
> unnoticed otherwise).
> 
> A recent real-life example of such a symbol rename
> that quietly disabled some drivers after kernel uprev
> is MFD_RK808 rename.
> 
> Example:
> Suppose old .config has the following two options which
> were removed from the recent kernel:
> 
> $ cat .config
> CONFIG_DISABLE_BUGS=y

Uh, I see what happened there. The correct output is

    $ cat .config
     CONFIG_DISABLE_BUGS=y
     # CONFIG_ENABLE_WINAPI is not set
