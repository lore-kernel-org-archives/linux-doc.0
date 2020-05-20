Return-Path: <SRS0=+Urr=7C=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7B4AC433E0
	for <linux-doc@archiver.kernel.org>; Wed, 20 May 2020 20:17:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8435120823
	for <linux-doc@archiver.kernel.org>; Wed, 20 May 2020 20:17:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EfnCZypm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727776AbgETURd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 May 2020 16:17:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726860AbgETURc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 May 2020 16:17:32 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABD59C061A0E
        for <linux-doc@vger.kernel.org>; Wed, 20 May 2020 13:17:32 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id x5so4785417ioh.6
        for <linux-doc@vger.kernel.org>; Wed, 20 May 2020 13:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VyaSYeCN7SlfNpIcnaBLrvnj4Za8Y5YWee7k0M093LM=;
        b=EfnCZypmdGa8VpCH0ge9lM32x0XwnmHj2izqsNgRTS3I07JG3e/hF4lLCo5kXYO4/g
         GtxgCniYtCnG++FB/8kG6zPSRmFLKhxRqmmq4IdVKeBaftKKpwV9wCZorD+0tHjfkdlf
         iKIaBkXsdUOcUzEbaSjKSZqabgCT3OCAuVYYojsL0oGeaGv8yix5Xa36HevdrmZQA1d3
         oZiCFN22Zq85rpV1iC6H6WuqAmzoFZO6oguZ9pkB1ojjDMsp42z1ILZhpfs69Ar45MbZ
         DEZchCUERGXKZVtVhJ2ntdiyp4CuUJlSp/UEMGtBpuJcdmq5WBjbssYBuRlEU2sLgeuf
         ZmiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VyaSYeCN7SlfNpIcnaBLrvnj4Za8Y5YWee7k0M093LM=;
        b=uWUuI5+B5EAxy0Kfcs9x+lTT0vabyH929o//PT2Z1rEBs5FKXM3ul1/b1COnj7C1oS
         2d6iF5yG2T7MgFw6y4jFvLwjyRrpoKXhZNzM0i35sWUl+4eVzQEjGPWVz8lFqqV7ntH3
         VsjvkKQHt4y3po+Q8Eo/T6XOmlQSWvfSp14gelFaVglcmLpVS4MCDSJ09I8Ly+Bl6xKE
         4xW+1Pl7Paf1ZvX8w+IGLSffF+Pn8Aqa/36Py3WTPGSGU8CH2N0/HJjCGgdfU49USh7Q
         jqLFctyQp/E8HW4yGElcQRiG2m6hm3ER+xgsVRN1RW96L9viFCNQs+quvwcQTvcUb7ee
         JlYQ==
X-Gm-Message-State: AOAM530jWiKO2cPb2duxIMNYvQI4UneQVmJ5/nYg8Q2MhsMj6xcbP6ho
        I5DlMMBhpkFS/qknM3HOuIIcin+xPxJKJy6A5LMC3Q==
X-Google-Smtp-Source: ABdhPJxf5r3SCDgK6PuxVrPSpsHX45TKCMtlgHtmR2oB4Pr8N10SC5JVUCM3UWZi1m7AGto9SCPNRm16+lOlW4mhbLA=
X-Received: by 2002:a5d:8a10:: with SMTP id w16mr4683295iod.95.1590005851709;
 Wed, 20 May 2020 13:17:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200423002632.224776-1-dancol@google.com> <20200423002632.224776-3-dancol@google.com>
 <20200508125054-mutt-send-email-mst@kernel.org> <20200508125314-mutt-send-email-mst@kernel.org>
 <20200520045938.GC26186@redhat.com> <202005200921.2BD5A0ADD@keescook>
 <20200520194804.GJ26186@redhat.com> <20200520195134.GK26186@redhat.com>
In-Reply-To: <20200520195134.GK26186@redhat.com>
From:   Lokesh Gidra <lokeshgidra@google.com>
Date:   Wed, 20 May 2020 13:17:20 -0700
Message-ID: <CA+EESO4wEQz3CMxNLh8mQmTpUHdO+zZbV10zUfYGKEwfRPK2nQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Add a new sysctl knob: unprivileged_userfaultfd_user_mode_only
To:     Andrea Arcangeli <aarcange@redhat.com>,
        Suren Baghdasaryan <surenb@google.com>
Cc:     Kees Cook <keescook@chromium.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Daniel Colascione <dancol@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Mel Gorman <mgorman@techsingularity.net>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Peter Xu <peterx@redhat.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Jerome Glisse <jglisse@redhat.com>, Shaohua Li <shli@fb.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, Tim Murray <timmurray@google.com>,
        Minchan Kim <minchan@google.com>,
        Sandeep Patil <sspatil@google.com>, kernel@android.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Adding the Android kernel team in the discussion.

On Wed, May 20, 2020 at 12:51 PM Andrea Arcangeli <aarcange@redhat.com> wrote:
>
> On Wed, May 20, 2020 at 03:48:04PM -0400, Andrea Arcangeli wrote:
> > The sysctl /proc/sys/kernel/unprivileged_bpf_disabled is already there
>
> Oops I picked the wrong unprivileged_* :) of course I meant:
> /proc/sys/vm/unprivileged_userfaultfd
>
