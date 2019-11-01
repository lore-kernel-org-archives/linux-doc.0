Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 200047D923
	for <lwn-linux-doc@archive.lwn.net>; Fri,  1 Nov 2019 14:49:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727562AbfKAOts (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 1 Nov 2019 10:49:48 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:46132 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727555AbfKAOtq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Nov 2019 10:49:46 -0400
Received: by mail-il1-f195.google.com with SMTP id m16so8850333iln.13
        for <linux-doc@vger.kernel.org>; Fri, 01 Nov 2019 07:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OvG/qWeSbh1TxLgtmArlVNDYsoALFmkQsSm7UaGBE/U=;
        b=I8fTjuu/6Ne32KB3TzlkLHNc34FVVQHy/sTVoKvVYeIrGIs/zEWpPkdT4X2FTYZjfJ
         UM4GFAou96icNjK1AVI5vEOtitRVjbXgZfqaanuntVF/vhTirkZT/9E+CWJUq7E2TQj0
         StXEuMWcR5zlKYK8R7EGKhYIJ+Gb4ciY1IEMBuLWPRJg6NDyeWhuiAg3JUaKBbPDkQbL
         sElozNdk4t7DFMJr/2GTc4DXhCqAVsopLQpS5jb3DWebvxakkqFHF/FpNq1kpaMflaeM
         i/d5Nr3Kf7lOCXzSXk2CZXk0I+pfGJSDm0die6SS7xUqTydNbrFVI18tKwuFsQOAi/MB
         kf9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OvG/qWeSbh1TxLgtmArlVNDYsoALFmkQsSm7UaGBE/U=;
        b=sTnEJpbzTcMGzdXmEZOgWqZMR5qQuf9tVYnp/3q5u1Y+wB3Y1khqu/SLeDuCXVdpQo
         a0s7oUJ6TxoobWwt0joey7GrbvvyDVjeHtCzA/f5Btp5yIazTCOc7NNBnt2HVrW/FkI9
         wdyPxnKmTd/KVqzOCVx3N2ldjN3eEjuCkXtYYXSNnFWpjTexUfgkErbjEPGxpfY6/N4K
         ZbFnkqTCpCqUN9eE0o9x/Wg3XcCvBUGEXdWd/z39jm2Wu/Qecy0hwlc5DI6iObfYuOM+
         mobnY1Xyi5W9eBmJbK3YDN0orPL4QPIVLQ2JqoJdhjF/0rZtb21CJqAsshTaj3EpusMV
         1VnQ==
X-Gm-Message-State: APjAAAUAzykIFoKjx76u5eIbGfeU6Is1bC3Hct0u/uFpQg/LPSLf5zu/
        TRCWrafSMulWRgqylzR8erb+Ew==
X-Google-Smtp-Source: APXvYqxr+bs1ScRWYKeCxmeXCSlj6Q4Lr6KXKYyS2zYjKblHkVBUMc7IPKJ+YzvkERiHaP9xr0/5Lg==
X-Received: by 2002:a92:5d8f:: with SMTP id e15mr13331860ilg.173.1572619783709;
        Fri, 01 Nov 2019 07:49:43 -0700 (PDT)
Received: from [192.168.1.159] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id f73sm1107827ild.59.2019.11.01.07.49.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 01 Nov 2019 07:49:42 -0700 (PDT)
Subject: Re: [PATCH 10/19] fs/io_uring: set FOLL_PIN via pin_user_pages()
To:     John Hubbard <jhubbard@nvidia.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        Alex Williamson <alex.williamson@redhat.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
        Christoph Hellwig <hch@infradead.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dave Chinner <david@fromorbit.com>,
        David Airlie <airlied@linux.ie>,
        "David S . Miller" <davem@davemloft.net>,
        Ira Weiny <ira.weiny@intel.com>, Jan Kara <jack@suse.cz>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Jonathan Corbet <corbet@lwn.net>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Magnus Karlsson <magnus.karlsson@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michal Hocko <mhocko@suse.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Paul Mackerras <paulus@samba.org>,
        Shuah Khan <shuah@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>, bpf@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kvm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-media@vger.kernel.org, linux-rdma@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org,
        linux-mm@kvack.org, LKML <linux-kernel@vger.kernel.org>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
 <20191030224930.3990755-11-jhubbard@nvidia.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <979ba2a3-ee04-fb12-204d-1b68c7b6e141@kernel.dk>
Date:   Fri, 1 Nov 2019 08:49:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191030224930.3990755-11-jhubbard@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/30/19 4:49 PM, John Hubbard wrote:
> Convert fs/io_uring to use the new pin_user_pages() call, which sets
> FOLL_PIN. Setting FOLL_PIN is now required for code that requires
> tracking of pinned pages, and therefore for any code that calls
> put_user_page().

Reviewed-by: Jens Axboe <axboe@kernel.dk>

-- 
Jens Axboe

