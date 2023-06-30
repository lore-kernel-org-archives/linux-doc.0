Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E4CEB64D7
	for <linux-doc@archiver.kernel.org>; Fri, 30 Jun 2023 15:04:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232588AbjF3PEk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Jun 2023 11:04:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230308AbjF3PEh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Jun 2023 11:04:37 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AFFB171E
        for <linux-doc@vger.kernel.org>; Fri, 30 Jun 2023 08:04:36 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-992f6d7c7fbso57126366b.3
        for <linux-doc@vger.kernel.org>; Fri, 30 Jun 2023 08:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688137475; x=1690729475;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/dVLLykZP6WKd+6flq1FWTnG0laFtJyV7E0+T2ohxVg=;
        b=kIrWa0+hYI0FcC7ix0CNBMKmB9xK1fMznCXnzKSiJhDYobHbnTleEgtCTDTgs2VF4W
         mntb35Y8yrLec+xWh8vra3xEesOGbTJtgFXqK1I6blcOohIwFGe96uvZhFnK2vRjfP4p
         PfVt+XRvTDrS08UocxGk8VEg3daMPR+nwkLLD7f4uGV1pf4IARO0O3bZdAvmM3U/wufV
         o+I8dQFv6tiycn97AWClfzTwc1rWUa19dBiVIV2JheREI1kuVHNPmzCaFuCW64N1ltKq
         11AgB6GfhRO/EOCVacZF+B9BOLeoO0RHrv1jOrUcxTJ+E0c8xk4FpTG9wc6eb8pnUhlH
         8hRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688137475; x=1690729475;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/dVLLykZP6WKd+6flq1FWTnG0laFtJyV7E0+T2ohxVg=;
        b=O/DOvGMzyAJ3pxfmYxI6V3KhkwL4L7LRWTGCJEwzDptUt74zIhu2FyDPquo8xk8Onw
         B4AgYZskX1AH59r8ziCsh6sLaNgxUAgjv/lxLMLrmVrWNNmPzGC6ZmhxU/eBJLKDK0pF
         bOkhTuyD64xD6lLoOp4Vtp27dURke9GslFA5YH2+Z+PSEc20XoFuZt2j93IH/0udKi+G
         zxNJuOZm+/wAFTe8dDH6MQRULPfuf39jT6o3YjLD0BTK3BG9bcXSmLyHBw4B5ouN6B0a
         S0tuKHtzaudBJMksvlhqAKJpdiT2aRnsG9gHDGhKjv7LhqC3+0v2afktfTTTGRu5zwCY
         46mA==
X-Gm-Message-State: ABy/qLaJddQXXZ2XEKzXAZpfsMJ8V+eLVLx448kdop2eVp/CwRIYBocG
        8nX2F0LybI0AwBI/ab5ryQaya903w1aoS63yE4Cxpg==
X-Google-Smtp-Source: APBJJlG9kOTBWqQJF3GG7lr98IJMS+YWNbQoJhPlnRsvrOFTNxORvcHSK3F7P7JfUN97vIcVVrfwUKYL4FjGrasKsDU=
X-Received: by 2002:a17:906:3453:b0:98d:cd3e:c193 with SMTP id
 d19-20020a170906345300b0098dcd3ec193mr1979573ejb.46.1688137474742; Fri, 30
 Jun 2023 08:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230629132711.1712536-1-matteorizzo@google.com>
 <20230629132711.1712536-2-matteorizzo@google.com> <87bkgyt8sq.fsf@suse.de>
In-Reply-To: <87bkgyt8sq.fsf@suse.de>
From:   Matteo Rizzo <matteorizzo@google.com>
Date:   Fri, 30 Jun 2023 17:04:23 +0200
Message-ID: <CAHKB1w+DgbZYNL83XFUCPuPvvP6YdgjAZqPc_uG_eHAj71a=6Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] Add a new sysctl to disable io_uring system-wide
To:     Gabriel Krisman Bertazi <krisman@suse.de>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        io-uring@vger.kernel.org, jordyzomer@google.com, evn@google.com,
        poprdi@google.com, corbet@lwn.net, axboe@kernel.dk,
        asml.silence@gmail.com, akpm@linux-foundation.org,
        keescook@chromium.org, rostedt@goodmis.org,
        dave.hansen@linux.intel.com, ribalda@chromium.org,
        chenhuacai@kernel.org, steve@sk2.org, gpiccoli@igalia.com,
        ldufour@linux.ibm.com, bhe@redhat.com, oleksandr@natalenko.name,
        Bart Van Assche <bvanassche@acm.org>, jmoyer@redhat.com,
        Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 29 Jun 2023 at 20:36, Gabriel Krisman Bertazi <krisman@suse.de> wrote:
>
> Thanks for adding the extra level for root-only rings.
>
> The patch looks good to me.
>
> Reviewed-by: Gabriel Krisman Bertazi <krisman@suse.de>

Thanks everyone for the reviews! Unfortunately I forgot the subsystem name
in the commit message. Jann also pointed out to me internally that the
check in io_uring_allowed could race with another process that is trying to
change the sysctl. I will send a v3 that fixes both issues.

Thanks,
--
Matteo
