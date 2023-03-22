Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D613EC6FD1F
	for <linux-doc@archiver.kernel.org>; Wed, 22 Mar 2023 14:16:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231388AbjCVOQD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Mar 2023 10:16:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231137AbjCVOQC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Mar 2023 10:16:02 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F20976424E
        for <linux-doc@vger.kernel.org>; Wed, 22 Mar 2023 07:15:57 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-54184571389so341270787b3.4
        for <linux-doc@vger.kernel.org>; Wed, 22 Mar 2023 07:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20210112.gappssmtp.com; s=20210112; t=1679494557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Whislchss/sFlCFTwP31713E4FxIStQL6qfZ4WUEnIc=;
        b=tzVmChHwG5UdzVVOpXkf2rTQATcV+/+zaZ4pw3uDOzqEhkRt5Ve9ob8pgqEPs/Y1fe
         UTg2YOvzk6LqHz80jJegh3QK/C6Nw5mUFmQRuYQdxN/g06L4n2D8VqGTpKrEwVLXCMyg
         bcLY5fticeZdjLAS82sbu5TBTjdYbbZWwVewaUa46wFZTPzT8Iaeq+jOe9TXtX5fDQhM
         bH0UkD0Bze72U3h9g4fm9xhtBi74DWE9y5/g7HVJ77mStLDJNqI5IlGO35ZFBslvbkdt
         0tnWP6LHWVGlPLgYq0+b9Iy7dVlw0jYqZHf1nX5ZUpvjRTg0T1AmjYqWQfawOzmxCgxb
         Ollg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679494557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Whislchss/sFlCFTwP31713E4FxIStQL6qfZ4WUEnIc=;
        b=KaU2TYB62V8ylEFyO5FlQxUSuPKMzcDjCn+DSp+mDXuglrraJUQcfYPykVJsLz9ThG
         v3inS9nMyJMjfqeq+5ys7BI4/SeaaZc9HSGBgKTvDAooDnj7i8CsuIcF7xnnjzcdR7vs
         SMF2wcv+0Q2Q8n2uucSn5vQT2/TjOHNFdj1vT2H59BJQodPypX9ZMZ/xY1e7lmOZJm3N
         XedioWrTRxxVh30fuZyvk/LW2yDwdlIH0Upe1DGkR/3+mpE9xVaFQ590I48JhbU/LYwP
         yak4j6JofymI+9Z3DOI7z3Vs2oSv1OW5WUWBxG6DZariHuZL0kAbsbHf0J44N/N5YEgr
         f6Tg==
X-Gm-Message-State: AO0yUKVJhYJP8MzTj/EJtrqqRv5YbpXF8EaLLvlojiL3l8RvJcrnWN0s
        ESUYgC/EDZ7VG8JqAEcNyrOudA==
X-Google-Smtp-Source: AK7set867nYOJLPUXEWSXWMJFE/YmBaPwP8V/3k5TMR93AJK29UptcHHOv2RuPaUN5WddwnxgNj1hw==
X-Received: by 2002:a05:7500:5bc3:b0:fb:d3c:28fe with SMTP id ed3-20020a0575005bc300b000fb0d3c28femr62914gab.29.1679494556330;
        Wed, 22 Mar 2023 07:15:56 -0700 (PDT)
Received: from localhost (cpe-174-109-170-245.nc.res.rr.com. [174.109.170.245])
        by smtp.gmail.com with ESMTPSA id f66-20020a37d245000000b00745f3200f54sm11293540qkj.112.2023.03.22.07.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 07:15:55 -0700 (PDT)
Date:   Wed, 22 Mar 2023 10:15:53 -0400
From:   Josef Bacik <josef@toxicpanda.com>
To:     Eric Blake <eblake@redhat.com>
Cc:     linux-block@vger.kernel.org, nbd@other.debian.org,
        philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
        christoph.boehmwalder@linbit.com, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] nbd: s/handle/cookie/
Message-ID: <20230321235250.GA1426669@localhost.localdomain>
References: <20230317202749.419094-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230317202749.419094-1-eblake@redhat.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 17, 2023 at 03:27:44PM -0500, Eric Blake wrote:
> v1 was here: https://lkml.org/lkml/2023/3/10/1162
> since then:
> - split original 1/3 into 1/5 and 5/5
> - new patch 2/5
> - reorder members of anon union
> - always send cookie in network order
> 
> Eric Blake (5):
>   uapi nbd: improve doc links to userspace spec
>   block nbd: send handle in network order
>   uapi nbd: add cookie alias to handle
>   block nbd: use req.cookie instead of req.handle
>   docs nbd: userspace NBD now favors github over sourceforge
> 
>  Documentation/admin-guide/blockdev/nbd.rst |  2 +-
>  drivers/block/nbd.c                        |  6 +++---
>  include/uapi/linux/nbd.h                   | 25 +++++++++++++++++-----
>  3 files changed, 24 insertions(+), 9 deletions(-)
> 
> 
> base-commit: 8d3c682a5e3d9dfc2448ecbb22f4cd48359b9e21

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef
