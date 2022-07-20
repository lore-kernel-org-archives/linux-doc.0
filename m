Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1635C43334
	for <linux-doc@archiver.kernel.org>; Wed, 20 Jul 2022 02:32:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237556AbiGTCcl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 Jul 2022 22:32:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237558AbiGTCck (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jul 2022 22:32:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 36B7442AE3
        for <linux-doc@vger.kernel.org>; Tue, 19 Jul 2022 19:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658284359;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3uZbjgFMHeKFjmyd0QEm1xCO2NChsIABolYNiKdJ7Gg=;
        b=jH3wqkkB823V7dNYv7yTI9mJLkuofcW3gCW56Funar+eTn6YmL4dJwshnKWIxeA6IeUnD7
        N1HvmClDjmMKBLxkEAy0qiPBy14JkWz2yi7U60CBSZwOipmFHbRbtXEexkDkt3qOJ2H3w1
        UimgKmYDmXI+rXMtWTbPfZY5I9WC6pY=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-404-C82NJTECMiGVQ3CBcZNyWw-1; Tue, 19 Jul 2022 22:32:35 -0400
X-MC-Unique: C82NJTECMiGVQ3CBcZNyWw-1
Received: by mail-qk1-f199.google.com with SMTP id de4-20020a05620a370400b006a9711bd9f8so13151123qkb.9
        for <linux-doc@vger.kernel.org>; Tue, 19 Jul 2022 19:32:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=3uZbjgFMHeKFjmyd0QEm1xCO2NChsIABolYNiKdJ7Gg=;
        b=7ZE118HlF3sf4nI3SvHUKccV2hnfzcJQYWpQxm82KDiOA9jU06AcqgRfUNc7f+DX26
         yhLAPJ3/VXjcpNq5sfT+NB39b9R7LvSHVUg1cC0YLhSO/CysBjN+jsTaedJf8jy5NT6I
         8medfXavombA2i8g0rV3TcU1dJ4YMgRoHMFA+Ex5YWjqL+0KRy5sDO15eM3erw4/u4nP
         yuhtVhDxUFBq116iTXAxSh4DywGxG3HQJZTpQWB5WVWo/H+4tc0r+Q6OdvJc8xrRSM7T
         ymuaMicwdi2vMms0NuAGqkQ9SnB5w2ftFRO6cowkxgL8tQxWZbdpRD0ocotRBo1Q30c7
         RMqw==
X-Gm-Message-State: AJIora/qoksZrt6XNyK6Mg1vaADLqq6ov+YHA4rAjMFsOPZqvzvjjf9+
        bfmLE3LNBIfunmzRoTBA17/lBTSgBqzckbJydWXNEFn5reHc8hH8U0HMASWXmIVNWD7adCb3foB
        dTrSMiDy16Tx5EzqdvAT4
X-Received: by 2002:a05:6214:e41:b0:473:915c:3efe with SMTP id o1-20020a0562140e4100b00473915c3efemr27335409qvc.10.1658284355259;
        Tue, 19 Jul 2022 19:32:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sqsBhXFhvJemKV/jwgAt84OQwS2X59Z2eXZUwYSIfKumUaM4t252ZCPnvZ1VuTZhBaV0SNdQ==
X-Received: by 2002:a05:6214:e41:b0:473:915c:3efe with SMTP id o1-20020a0562140e4100b00473915c3efemr27335384qvc.10.1658284354992;
        Tue, 19 Jul 2022 19:32:34 -0700 (PDT)
Received: from xz-m1.local (bras-base-aurron9127w-grc-37-74-12-30-48.dsl.bell.ca. [74.12.30.48])
        by smtp.gmail.com with ESMTPSA id s11-20020a05620a0bcb00b006b5c5987ff2sm14701779qki.96.2022.07.19.19.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jul 2022 19:32:34 -0700 (PDT)
Date:   Tue, 19 Jul 2022 22:32:32 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Nadav Amit <namit@vmware.com>
Cc:     Axel Rasmussen <axelrasmussen@google.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "Dmitry V . Levin" <ldv@altlinux.org>,
        Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>,
        Hugh Dickins <hughd@google.com>, Jan Kara <jack@suse.cz>,
        Jonathan Corbet <corbet@lwn.net>,
        Mel Gorman <mgorman@techsingularity.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Mike Rapoport <rppt@kernel.org>, Shuah Khan <shuah@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        zhangyi <yi.zhang@huawei.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>,
        "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v4 2/5] userfaultfd: add /dev/userfaultfd for fine
 grained access control
Message-ID: <YtdpQBrAGJwMnssj@xz-m1.local>
References: <20220719195628.3415852-1-axelrasmussen@google.com>
 <20220719195628.3415852-3-axelrasmussen@google.com>
 <D43534E1-7982-45EE-8B16-2C4687F49E77@vmware.com>
 <CAJHvVcigVqAibm0JODkiR=Pcd3E14xp0NB6acw2q2enwnrnLSA@mail.gmail.com>
 <D8D7C973-1480-4166-86AF-AD179873B2A4@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D8D7C973-1480-4166-86AF-AD179873B2A4@vmware.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jul 19, 2022 at 11:55:21PM +0000, Nadav Amit wrote:
> Anyhow, I do want to clarify a bit about the “cross-process support”
> userfaultfd situation. Basically, you can already get cross-process support
> today, by using calling userfaultfd() on the controlled process and calling
> pidfd_open() from another process. It does work and I do not remember any
> issues that it introduced (in contrast, for instance, to io-uring, that
> would break if you use userfaultfd+iouring+fork today).

Do you mean to base it on pidof_getfd()?

Just want to mention that this will still need collaboration of the target
process as userfaultfd needs to be created explicitly there.  From that POV
it's still more similar to general SCM_RIGHTS trick to pass over the fd but
just to pass it in a different way.

IMHO the core change about having /proc/pid/userfaultfd is skipping that
only last step to create the handle.

-- 
Peter Xu

