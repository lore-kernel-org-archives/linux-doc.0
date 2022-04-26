Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6182C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 26 Apr 2022 20:33:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355013AbiDZUgy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 Apr 2022 16:36:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355075AbiDZUg2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Apr 2022 16:36:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EC3371AB8D2
        for <linux-doc@vger.kernel.org>; Tue, 26 Apr 2022 13:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651005193;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Av2XJWYSmxJiVQjp5kZR1hfhT+pdVskMA4VQgdFQOaM=;
        b=WK9VxpmjoLLrOX/Z94nx1NOwSqYuPD0Yy/ZDXQDXPjHYre1pneNPBH0Hauo0Y0QWpGvTMb
        +K4zJNZYPIhpKXbzbgtxr2VRbkT9VR/kKBbD8wAeyRO3uTBOSr+R6v9VOtV+ttKZXF/l0E
        10bXil0mPPSh/OJtaTuyPSU4bMqq85c=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-146-Q9whoHqiOJOC_XConPOH0Q-1; Tue, 26 Apr 2022 16:33:12 -0400
X-MC-Unique: Q9whoHqiOJOC_XConPOH0Q-1
Received: by mail-io1-f69.google.com with SMTP id r17-20020a0566022b9100b00654b99e71dbso36589iov.3
        for <linux-doc@vger.kernel.org>; Tue, 26 Apr 2022 13:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Av2XJWYSmxJiVQjp5kZR1hfhT+pdVskMA4VQgdFQOaM=;
        b=e/ExSn9oW900H5mFOSbWUaS13jKWRFTpspDtApBm/O06uLpIHmdSg5/ly0AqJOm7vQ
         GiWRY9gLbtsZwELoP8jhjgTme9w7QKhd4coZcHyxGtptizUsdSBh4MP5gEE0jIpUIcRT
         sw9f5EO0w/hBXy7QAvnh8WsZ+Y4WxMmvMtyopSvh0fEX+yM4Z4IKJq6J/3iRBiIY4gkz
         tSMg91ZZDYrEFELC08B5S3hfLUZohKcl4fuanjfouRdydFB9cLuF2mwFysEd4jTMWt7M
         v0tTFWX2eWP7Fz+YzcdPxPicC4nSSovHwfw7QbcLWfkZwfwAiGj8cbWPsxxO5RWbpZqb
         lN2g==
X-Gm-Message-State: AOAM533Lzmbg1koFHTf4FG4MMFVRvK9PkFEG5+Tsi+aI5YYOS++5YwgH
        UFJJXa3J4mWUO56BMD6kIuXJ1td9Wyj1rC9nBzqWtai9YYdvgiiYLAhbKc1gdZHwqnUaKbDRaXK
        k3gJUZHKc07uvkoMg+A6j
X-Received: by 2002:a05:6638:272c:b0:32a:f95b:fc77 with SMTP id m44-20020a056638272c00b0032af95bfc77mr4011883jav.179.1651005191544;
        Tue, 26 Apr 2022 13:33:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxd4CFNten6nl0jATzOU1yCBTY6Y58j8Espgob7sbvIFYcRfIXeg+IqFoDNsZPO7cKZaJ3nww==
X-Received: by 2002:a05:6638:272c:b0:32a:f95b:fc77 with SMTP id m44-20020a056638272c00b0032af95bfc77mr4011865jav.179.1651005191365;
        Tue, 26 Apr 2022 13:33:11 -0700 (PDT)
Received: from xz-m1.local (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
        by smtp.gmail.com with ESMTPSA id e18-20020a92d752000000b002cd6dae980fsm8497051ilq.13.2022.04.26.13.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 13:33:11 -0700 (PDT)
Date:   Tue, 26 Apr 2022 16:33:08 -0400
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
Subject: Re: [PATCH v2 1/6] selftests: vm: add hugetlb_shared userfaultfd
 test to run_vmtests.sh
Message-ID: <YmhXBHFrXKT/Jqkd@xz-m1.local>
References: <20220422212945.2227722-1-axelrasmussen@google.com>
 <20220422212945.2227722-2-axelrasmussen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220422212945.2227722-2-axelrasmussen@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 22, 2022 at 02:29:40PM -0700, Axel Rasmussen wrote:
> This not being included was just a simple oversight. There are certain
> features (like minor fault support) which are only enabled on shared
> mappings, so without including hugetlb_shared we actually lose a
> significant amount of test coverage.
> 
> Signed-off-by: Axel Rasmussen <axelrasmussen@google.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

