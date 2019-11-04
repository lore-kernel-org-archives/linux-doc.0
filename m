Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D21267D982
	for <lwn-linux-doc@archive.lwn.net>; Mon,  4 Nov 2019 20:33:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729573AbfKDUdM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 4 Nov 2019 15:33:12 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:46849 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729486AbfKDUdL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 4 Nov 2019 15:33:11 -0500
Received: by mail-pf1-f196.google.com with SMTP id 193so11919018pfc.13
        for <linux-doc@vger.kernel.org>; Mon, 04 Nov 2019 12:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=DnK/FIUjtfMpvgjhYJHwDVVqbAfzXMvLjaoAfA8yVt8=;
        b=OY0XB+pnC7EUpHSQ8yqmSdGzuM19l1QV2njz4lt2384NL+vVsTzKuslwpXHwsk0N+I
         dZMVtGQNTBtLEVBnR8gAD9XNgACmQrzJC68sh448rTQlDayrJqeB0M445s6/jf3cT6Pb
         NZZ+pL+6f4BBHH/B3nMcaAYKUkl2AQQnq6f98/RCiuh6DgUl+/f96fWCFaFlkmskNChx
         MZ/7akyfS7PP1xF/9bTh/55R2+Y5DT5rWJm7Cv0RUqBYhuwjKxViCvgW0uYk/xg33Sc/
         xfRMVnNsQczWqMvmGtgK05lodct1STvVjmeasrhxMRgmb3Ko1i8IBBDPrpRAfsUyE3+k
         eHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=DnK/FIUjtfMpvgjhYJHwDVVqbAfzXMvLjaoAfA8yVt8=;
        b=ueSNcnqYfW7ltuMqSFKIftjXwxd+8rH75J173fyfekwgfT9TZz0spKHdAwD/sSm35f
         0HS+ojLXqV+1HMPLxgzCIj0AOQIBhfbhx5ayQHObcOYFgv/4JjpZyUGUNE0tgSHLFlA9
         2TGg+af3x32RBdefN/t0Ow+ZAqx+Bwtbv7YSG5gX+ZepTLJiP4240UF6vMwap5xuSzcF
         X6TIeZPug3Vv2ZqW5kOp6BvEW6p6O4RxpyTbWCfaO6+Qq0wOSn6kZs/HALuVKd0zuCNw
         9s7ZFuU4zcdgT4tw3uxlkQ2j9FOvv8lOmaZVdb2jD8wIJKq8S2A82/jQWKksrcKxgydr
         qNkg==
X-Gm-Message-State: APjAAAWF226+ekNbcMjhIlXBKYxz0OsdG0dq/H3s9qw5SrvZc5U/dyb+
        NA6kLC+wzJUIlQmtoi6JANOZIA==
X-Google-Smtp-Source: APXvYqyhviRnVEE8HSNsRv5kFXmlmiRaKK/VWcjGWZKAhJfF3CiA7Y5Kptgh8pnqs8cZ8TjFJYIjHQ==
X-Received: by 2002:a17:90a:9406:: with SMTP id r6mr1471858pjo.0.1572899590774;
        Mon, 04 Nov 2019 12:33:10 -0800 (PST)
Received: from [2620:15c:17:3:3a5:23a7:5e32:4598] ([2620:15c:17:3:3a5:23a7:5e32:4598])
        by smtp.gmail.com with ESMTPSA id e17sm18228455pfh.121.2019.11.04.12.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 12:33:10 -0800 (PST)
Date:   Mon, 4 Nov 2019 12:33:09 -0800 (PST)
From:   David Rientjes <rientjes@google.com>
X-X-Sender: rientjes@chino.kir.corp.google.com
To:     John Hubbard <jhubbard@nvidia.com>
cc:     Andrew Morton <akpm@linux-foundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Alex Williamson <alex.williamson@redhat.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        =?UTF-8?Q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn.topel@intel.com>,
        Christoph Hellwig <hch@infradead.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dave Chinner <david@fromorbit.com>,
        David Airlie <airlied@linux.ie>,
        "David S . Miller" <davem@davemloft.net>,
        Ira Weiny <ira.weiny@intel.com>, Jan Kara <jack@suse.cz>,
        Jason Gunthorpe <jgg@ziepe.ca>, Jens Axboe <axboe@kernel.dk>,
        Jonathan Corbet <corbet@lwn.net>,
        =?UTF-8?Q?J=C3=A9r=C3=B4me_Glisse?= <jglisse@redhat.com>,
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
Subject: Re: [PATCH v2 05/18] mm/gup: introduce pin_user_pages*() and
 FOLL_PIN
In-Reply-To: <20191103211813.213227-6-jhubbard@nvidia.com>
Message-ID: <alpine.DEB.2.21.1911041231520.74801@chino.kir.corp.google.com>
References: <20191103211813.213227-1-jhubbard@nvidia.com> <20191103211813.213227-6-jhubbard@nvidia.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On Sun, 3 Nov 2019, John Hubbard wrote:

> Introduce pin_user_pages*() variations of get_user_pages*() calls,
> and also pin_longterm_pages*() variations.
> 
> These variants all set FOLL_PIN, which is also introduced, and
> thoroughly documented.
> 
> The pin_longterm*() variants also set FOLL_LONGTERM, in addition
> to FOLL_PIN:
> 
>     pin_user_pages()
>     pin_user_pages_remote()
>     pin_user_pages_fast()
> 
>     pin_longterm_pages()
>     pin_longterm_pages_remote()
>     pin_longterm_pages_fast()
> 
> All pages that are pinned via the above calls, must be unpinned via
> put_user_page().
> 

Hi John,

I'm curious what consideration is given to what pageblock migrate types 
that FOLL_PIN and FOLL_LONGTERM pages originate from, assuming that 
longterm would want to originate from MIGRATE_UNMOVABLE pageblocks for the 
purposes of anti-fragmentation?
