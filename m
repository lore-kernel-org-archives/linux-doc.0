Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BA5DC433F5
	for <linux-doc@archiver.kernel.org>; Tue, 26 Apr 2022 20:33:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355067AbiDZUg1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 Apr 2022 16:36:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355018AbiDZUgS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Apr 2022 16:36:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 41F011A8C0E
        for <linux-doc@vger.kernel.org>; Tue, 26 Apr 2022 13:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651005183;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=qJupZ9EKBhCX8US4p7GIAW6BSuQyT3fJWSWGs492ld4=;
        b=XRghbmOtv73zpJl3Ez76GQSI3MdzswbE96Ikcw+PZLeJFEW+OTQLjfX+KHoI2rI0Fng60W
        6LX0D1rVpirqE8mj920zZkkO15/n9kaze6u8pc//D8bKwF1YdyYy8rgyaFbWQWGBhIuy06
        gKWRYpQ2C1IaZ8YuZfGP1BksunWk314=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-214-ga2hYL72PSqCgYY9RocnLw-1; Tue, 26 Apr 2022 16:33:01 -0400
X-MC-Unique: ga2hYL72PSqCgYY9RocnLw-1
Received: by mail-io1-f72.google.com with SMTP id o9-20020a0566022e0900b00654b599b1eeso15275610iow.21
        for <linux-doc@vger.kernel.org>; Tue, 26 Apr 2022 13:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qJupZ9EKBhCX8US4p7GIAW6BSuQyT3fJWSWGs492ld4=;
        b=WDey2Xg68Z4HaHYNJgT5dDSzs5wG/jvGI+hT6/Jxann2gPUCBl8pqHnRoqD73Jgb8a
         +XScCExgPszMfadRz2t9BZO6s4NbvQuPYNpn3qga6j4MJ72EGkSAaLVW7CFfGwLF39XS
         hYPR6JrUyWizG3kBpNKMj86EGbLYMI3EXN738Dc9z7tpFrtXZf3gJbZ81//ze+7Dyoms
         PhSE5kQM5E5xgmbJsKebHgOT7SVhSMBbaQKOX1eoHrt9SF78cST/0CIOcK04+I4Xr7Zd
         Q1Gbfc2w7PMF19n7bhMu1qDkh5IgzyZjyRtt8kZP+ZS08xOVjhHz8C2ghsVirbuwL4JL
         fWFA==
X-Gm-Message-State: AOAM533o0yu/He5rmCnYLWxMX71CZY/ZP0VoXK1xBqO5X3ES8U7ygR6n
        CL2q12j6k25XA/5G+hsE/9Iww5b/H6Rshn09yxIAStCp9MID9o0eWiffN/XBdDMOZ/zxR8+koj1
        ZJKhjkXcbBJKQkJfxifNy
X-Received: by 2002:a05:6638:1487:b0:328:6e36:39e4 with SMTP id j7-20020a056638148700b003286e3639e4mr10263031jak.202.1651005181058;
        Tue, 26 Apr 2022 13:33:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxv3DOWZkK6AhpbIXCeFJ2/lY2z7CXm1JNRmILCaRK5MqEyMqTOfcKl6cB6RwB1JoqOHBf6sQ==
X-Received: by 2002:a05:6638:1487:b0:328:6e36:39e4 with SMTP id j7-20020a056638148700b003286e3639e4mr10263012jak.202.1651005180758;
        Tue, 26 Apr 2022 13:33:00 -0700 (PDT)
Received: from xz-m1.local (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
        by smtp.gmail.com with ESMTPSA id x186-20020a6bc7c3000000b00648deae6630sm10449855iof.54.2022.04.26.13.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 13:33:00 -0700 (PDT)
Date:   Tue, 26 Apr 2022 16:32:58 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Axel Rasmussen <axelrasmussen@google.com>
Cc:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Charan Teja Reddy <charante@codeaurora.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "Dmitry V . Levin" <ldv@altlinux.org>,
        Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>,
        Hugh Dickins <hughd@google.com>, Jan Kara <jack@suse.cz>,
        Jonathan Corbet <corbet@lwn.net>,
        Mel Gorman <mgorman@techsingularity.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Mike Rapoport <rppt@kernel.org>, Nadav Amit <namit@vmware.com>,
        Shuah Khan <shuah@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        zhangyi <yi.zhang@huawei.com>, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 2/6] userfaultfd: add /dev/userfaultfd for fine
 grained access control
Message-ID: <YmhW+mOuQUWsByj4@xz-m1.local>
References: <20220422212945.2227722-1-axelrasmussen@google.com>
 <20220422212945.2227722-3-axelrasmussen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220422212945.2227722-3-axelrasmussen@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Axel,

On Fri, Apr 22, 2022 at 02:29:41PM -0700, Axel Rasmussen wrote:
> @@ -65,6 +66,8 @@ struct userfaultfd_ctx {
>  	unsigned int flags;
>  	/* features requested from the userspace */
>  	unsigned int features;
> +	/* whether or not to handle kernel faults */
> +	bool handle_kernel_faults;

Could you help explain why we need this bool?  I failed to figure out
myself on the difference against "!(ctx->flags & UFFD_USER_MODE_ONLY)".

Thanks,

-- 
Peter Xu

