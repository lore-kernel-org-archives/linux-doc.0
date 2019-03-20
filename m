Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D93C37D04D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 20 Mar 2019 20:57:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727551AbfCTU52 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 20 Mar 2019 16:57:28 -0400
Received: from mail-yw1-f67.google.com ([209.85.161.67]:44470 "EHLO
        mail-yw1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727543AbfCTU52 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Mar 2019 16:57:28 -0400
Received: by mail-yw1-f67.google.com with SMTP id c4so3131328ywa.11
        for <linux-doc@vger.kernel.org>; Wed, 20 Mar 2019 13:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7TKyPat2diHfhv30jcYBziI63YFmk+7ZB7yCGURrsOk=;
        b=n/tRt29629ySiX3AtuVlLNum1FJJFphZldMMdvbBJx3fBa56guOATGv7CDMkOuBIjc
         lzEk19RcZMpmyKktO8DEh7EwfhTBzl7o9eU0Dnrr5jS4Aaxpqsgj8GpD9CobgAurX7Lm
         jTxmvqZHeXYvEMnn0BCfStSfCjOKIrILFOF43AXJGjAl3Tx/DKnYj2mDeAG4or7XFeZx
         ToNeHbOIFyEwmFGYilxIy66E3+V0mVcRKqxsVdDKARJBx8Lv5Pno2YySaSBM8WEB6JSY
         Zey6IfsC58wGD+Wb1AoP1n+c6OLPw6xLrTGc2fFbfv5kfQaLcwxo95kPNMrGXjaf287S
         FLhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7TKyPat2diHfhv30jcYBziI63YFmk+7ZB7yCGURrsOk=;
        b=s2E9sq31EDeHAJeEoUX0XS0B67yg8whrGkKrYoHYO+X8tqFm3k2yquatkG2bvQBzus
         SXxkTZ96EhZgGrbEv1Ned64FIeOpHSZ4ocCNJmzkiy/+BaFZ9EOMvyxSP/+ddwp6kh/o
         10NRcAsk6OgqxpbH4YBQ5dU1J5JcPpaCmuYcEjnaCkLPekQgK742LiCWL66c4cEPRtkC
         TsYFnoCedkgHiEemdp9uhrgm29vuGzT11usN7pn/lEwCyJDNnCR1H+2Ff2/vwFonrXFk
         yaa3yW5VjGMCIYJasB9fO1+xFc2rFmWmo3HMkxZVWYw46vz/+5h2xypBxsrWNVOwfzGF
         qkow==
X-Gm-Message-State: APjAAAW5JHKJ+Dosu2PN39VlFDqdNCdxzqAXt2oSXlXgxzjEIchHwuxI
        Hcbd4T4NglB8qwPLN5NGA9WyMw==
X-Google-Smtp-Source: APXvYqwOKUtGkLTUXQ0H0uuntHFrKcjih1M7U3TDMxpi3QF4joDAtykhux/4NWNJEPzjdQNr2cYchQ==
X-Received: by 2002:a81:5d8b:: with SMTP id r133mr110177ywb.361.1553115447491;
        Wed, 20 Mar 2019 13:57:27 -0700 (PDT)
Received: from localhost ([2620:10d:c091:200::2:b52c])
        by smtp.gmail.com with ESMTPSA id x12sm1578123ywj.76.2019.03.20.13.57.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Mar 2019 13:57:26 -0700 (PDT)
Date:   Wed, 20 Mar 2019 16:57:25 -0400
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     Suren Baghdasaryan <surenb@google.com>
Cc:     gregkh@linuxfoundation.org, tj@kernel.org, lizefan@huawei.com,
        axboe@kernel.dk, dennis@kernel.org, dennisszhou@gmail.com,
        mingo@redhat.com, peterz@infradead.org, akpm@linux-foundation.org,
        corbet@lwn.net, cgroups@vger.kernel.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-team@android.com
Subject: Re: [PATCH v6 3/7] psi: rename psi fields in preparation for psi
 trigger addition
Message-ID: <20190320205725.GB19382@cmpxchg.org>
References: <20190319235619.260832-1-surenb@google.com>
 <20190319235619.260832-4-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190319235619.260832-4-surenb@google.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 19, 2019 at 04:56:15PM -0700, Suren Baghdasaryan wrote:
> Renaming psi_group structure member fields used for calculating psi totals
> and averages for clear distinction between them and trigger-related fields
> that will be added next.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
