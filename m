Return-Path: <SRS0=ITMb=BY=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC33C433E1
	for <linux-doc@archiver.kernel.org>; Fri, 14 Aug 2020 23:28:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7861820768
	for <linux-doc@archiver.kernel.org>; Fri, 14 Aug 2020 23:28:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="GWnwwLId"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726795AbgHNX2L (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 14 Aug 2020 19:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbgHNX2J (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Aug 2020 19:28:09 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B9AAC061385
        for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2020 16:28:08 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id t6so5259721pgq.1
        for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2020 16:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=uDkX0jG6u13wLhugyTid2FyPD+CUWlJE65vd4J+hUuw=;
        b=GWnwwLIdAFGEDXFeo2yD3ifqHgwalpmQsg7oitKTawOaVSkQN9B9eteO/d/u3Wf4Sb
         B8o7PRI6zuf7D5P1dlkreJJmHCj5olVu6edVI5FIm4uXjlveqplTumDedOgQV/FpvvGw
         /UqtfIjCxUoS24ZT/dQpUBhdlPhy8T8EgeT2vlocIgYJnYlZsILAwredAYNdC7nh8ldb
         +/h4cGY/7y29H9U7Mk6IjbwRR+IWPes4hTYugNvo0+HMRM9XBVk0l03NlnnedjyCPyEN
         tZI+4WwebAKO/X6XmYPC9bL+0sOKVac0gjZhD2fTPUXR7m9c2ZXykXJUqJbcUmyUcpeh
         WVAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=uDkX0jG6u13wLhugyTid2FyPD+CUWlJE65vd4J+hUuw=;
        b=LG25hAjrXtFKRVPGjBqI9W3xCVjuxFNGvNnGE9X764ip7qd2pNgjVMzXQrA3XKdeKl
         FHC/m1FbR2vH5lYas192XHXB8M5zYy3ItcQLVsmcZIo6zxgWYf+tSK2rTT7JzHW3QK86
         FKFaB/zjRbHp1ev7bhjsDxm5K0OR/XhZuOPq4BLeZJhfuL7H/2FqSkRPyVDdVrDabTJv
         0yqVKqQAlNVHxuDiHZOtLaP4L+LTyY5/hCgUdtYQnpyLWtCqxGEbMDIIL79Pt5riGb3x
         WB7sbeEQyiYW/sRto8fRxqg1DNZ/j+UKnKWUmp1z3nthseXYv8y3ip7L8RyMEiKDU1Kh
         WplA==
X-Gm-Message-State: AOAM533epszrYX9dDZ4B5hpNnC2lCNVezFZNygmkXwiE2AfprJOstKWs
        8GSUT0suJNLQ0+RfTkU+d9hkmlaOEMoAPg==
X-Google-Smtp-Source: ABdhPJxcX6ReXOv8BVKzzWJYJ/a0XOACfPkpgTE/NLWhN+slsY92V6w9PARQjE5WUAOMqkHa3SnQuw==
X-Received: by 2002:a65:6205:: with SMTP id d5mr3063739pgv.432.1597447688010;
        Fri, 14 Aug 2020 16:28:08 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id r91sm9245816pja.56.2020.08.14.16.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2020 16:28:07 -0700 (PDT)
Date:   Fri, 14 Aug 2020 16:28:07 -0700 (PDT)
X-Google-Original-Date: Fri, 14 Aug 2020 16:28:04 PDT (-0700)
Subject:     Re: [PATCH]  Documentation/features: refresh RISC-V arch support files
In-Reply-To: <20200814232245.lmwdkla7zx22vtls@distanz.ch>
CC:     corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     tklauser@distanz.ch
Message-ID: <mhng-99e80cc6-a887-407f-ad22-6ef4552f382e@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 14 Aug 2020 16:22:45 PDT (-0700), tklauser@distanz.ch wrote:
> On 2020-08-15 at 00:38:52 +0200, Palmer Dabbelt <palmer@dabbelt.com> wrote:
> [...]
>> Thanks.  I've put this on fixes.  Unless there are any issues I'll be sending
>> out a PR tomorrow.
>
> Jonathan already applied the patch to the linux-doc tree [1] and
> it made it into Linus' tree [2] in the meantime.
>
> [1] https://lore.kernel.org/linux-doc/20200811103940.0a9229b9@lwn.net/
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f30c3ff3f0e8305d6c1a210df6d588a13333b8f7
>
> Thanks

Thanks -- I thought that's how these went in, but I didn't see anything.  I
must have just missed it.
