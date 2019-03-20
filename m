Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B768C7D04D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 20 Mar 2019 20:55:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbfCTUzU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 20 Mar 2019 16:55:20 -0400
Received: from mail-yw1-f67.google.com ([209.85.161.67]:34616 "EHLO
        mail-yw1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726497AbfCTUzU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Mar 2019 16:55:20 -0400
Received: by mail-yw1-f67.google.com with SMTP id x129so3181109ywc.1
        for <linux-doc@vger.kernel.org>; Wed, 20 Mar 2019 13:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QQYLVXkrs82mdvyVr+o8qJgCSfJ2t/bxI7yFaYhe2ug=;
        b=UlM3Ag0sHjKm6b60Xzruo36+UDlJMrcULXCsz153tfTpIzb5RNHWobPLHgqI/mhWmy
         nAzG2b60WzKXMmT44qvypKs/MRK3dAvTvsH7FaGR2TvLZdw4/xJW8HsjT5RsKvT2l114
         IxT/BWtMIDwxGR3Rmfw37IsijmQCBbzByTYNMnfL5Pqrmqbt0ycHo6hbZZnw/ciMk73x
         cPcXJLfScHgpDqcmjbfZuTV1rp0MyTLNKhI28W8pS3bGyOp6RhItnuEcuUJOy2Kdykwv
         PxWIWOxISeF3vhf5selrKImaCqn1ve35lBZip8IjabpLC+gzrspIs30WY8hjdR6M7M8X
         2FsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QQYLVXkrs82mdvyVr+o8qJgCSfJ2t/bxI7yFaYhe2ug=;
        b=gX/3VDB2Icy2bth57ne5SmnpUm7kbwSXUlmTTrkKU7UJqj+YVp+fBk2eEplrv2xQIm
         wZGjA0sfkBC2fSUeis1P+b3jd0fCC3B+ZH+z+hj/Chr0w6HEJa+kLsP1pxfUmhg8XtXf
         5gPg6ZfeY017d0CNAnq2UXopIXZnpri8OVXV7bMsUXlrkAxIjbGZJEaArebcOQoUKq8j
         uU5YBTI4Sc3ZZyM3F7p6E5Cx8iUS6Nu+zozw0R4P02XUBdQ9Qk2bkjbdYxYJd1Cu0Y3c
         ajdD7CShROsacm/MHsyMMgDPc2eB9h4WI31cmpRq36JQMvh+P8AjaoH/Fgr1GGlXe71D
         L+pw==
X-Gm-Message-State: APjAAAWChhuSiHhOfkCTLhOFwwc0ZhK5KWo/LoXRChz0oTmTT3bfKzC8
        U9Z/4Apn3VKNG8+KjssncwvMXA==
X-Google-Smtp-Source: APXvYqyIbRSYuOZ+T6cPUs3nMP69qxZ/A1CkgW2QQVmoCqQ+qIU4OgICrzlh/aj/ZsVwMkaKM+QPbw==
X-Received: by 2002:a81:2c85:: with SMTP id s127mr107964yws.255.1553115319248;
        Wed, 20 Mar 2019 13:55:19 -0700 (PDT)
Received: from localhost ([2620:10d:c091:200::2:b52c])
        by smtp.gmail.com with ESMTPSA id j15sm1001794ywa.7.2019.03.20.13.55.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Mar 2019 13:55:18 -0700 (PDT)
Date:   Wed, 20 Mar 2019 16:55:17 -0400
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     Suren Baghdasaryan <surenb@google.com>
Cc:     gregkh@linuxfoundation.org, tj@kernel.org, lizefan@huawei.com,
        axboe@kernel.dk, dennis@kernel.org, dennisszhou@gmail.com,
        mingo@redhat.com, peterz@infradead.org, akpm@linux-foundation.org,
        corbet@lwn.net, cgroups@vger.kernel.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-team@android.com
Subject: Re: [PATCH v6 2/7] psi: make psi_enable static
Message-ID: <20190320205517.GA19382@cmpxchg.org>
References: <20190319235619.260832-1-surenb@google.com>
 <20190319235619.260832-3-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190319235619.260832-3-surenb@google.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 19, 2019 at 04:56:14PM -0700, Suren Baghdasaryan wrote:
> psi_enable is not used outside of psi.c, make it static.
> 
> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
