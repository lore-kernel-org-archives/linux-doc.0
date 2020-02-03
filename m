Return-Path: <SRS0=Qg7B=3X=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D095C3524D
	for <linux-doc@archiver.kernel.org>; Mon,  3 Feb 2020 13:26:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 63DD42086A
	for <linux-doc@archiver.kernel.org>; Mon,  3 Feb 2020 13:26:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov-name.20150623.gappssmtp.com header.i=@shutemov-name.20150623.gappssmtp.com header.b="Qvgtk33f"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727479AbgBCN0R (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 Feb 2020 08:26:17 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:47042 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727347AbgBCN0Q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Feb 2020 08:26:16 -0500
Received: by mail-lj1-f195.google.com with SMTP id x14so14566299ljd.13
        for <linux-doc@vger.kernel.org>; Mon, 03 Feb 2020 05:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/c8JqFBoF+Wyv0y7vjPLE9bVpeDasBR2S69E+7r2TtY=;
        b=Qvgtk33ftlbcsS5ozma4SkqBFwKXe/etS4q98w1ik72KUgLvZCb5LF6bX9en+6X9bo
         RZkuxEhczs1LHPUxff5YONZLAinu2abSX1x8hd1YrVMhXhSPB6YnCGS2IgB7n4ZvycwY
         4guibrya0uJJxVpAXyYDoHuuVBQYz+s5yLsNWj8sly+tVIODbFFekbsty1PMf0QzYhud
         yGJvBqTV33CGmK5iIJ6dNPJY9ofEyM3bweM9PnVwm793arTmLHxyQ5c99wp2YWiXJHjo
         fRwKRyBoSNe9NapKkTYXp8GqbEXUwRw4pFOvGuL+bWN/i5mbQ7e2xKkp1bS2QFcw0bFF
         p4Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/c8JqFBoF+Wyv0y7vjPLE9bVpeDasBR2S69E+7r2TtY=;
        b=e82rxYMIl/6MaB6m01zgad8p0OoeembN6RacwOYTDlSjrb98G12EcjkHzHpusx0Udu
         NnWtQ3KtTDqakGKtZHJXh9py+1JZmuPDVYcyzg+wbILGzKcZmIAe4mbTSID1FYJgd83K
         LUXRDV07/yQk9mBuY1A4lUMsBawVlyjFstxRkIQ13bzFoZgm5jY+prFqtvLnveo+gE3U
         Z/Fo9cZeL+zJ5PTAXy3oIiguVu6mXk07vNix1zXaKUP/0YTO6eqAfHK7je0iI4Qv76hH
         aiDe4oiobHAkdM/eM4wzWfaXkGFSp+cPBcZbSbXmSxHQzsqF1eLXSp7aRqyLbX3uG3BC
         lG7Q==
X-Gm-Message-State: APjAAAW4qhrtWHWE6pkRbZZiEXaEOmFk5OEhVCog02rDQTeyC76+nJAq
        i5qZZ7zxkCgR4ZyqwXY9J654mg==
X-Google-Smtp-Source: APXvYqyAwd06U5sHJ6RJuXAzdAU4K5P7qW3PVQBSvKIMhVgDvbt0mabo67VXojbyegXmFIr9BORhmw==
X-Received: by 2002:a05:651c:1bb:: with SMTP id c27mr14397156ljn.277.1580736374697;
        Mon, 03 Feb 2020 05:26:14 -0800 (PST)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id m24sm11753539ljb.81.2020.02.03.05.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 05:26:13 -0800 (PST)
Received: by box.localdomain (Postfix, from userid 1000)
        id A788C100DC8; Mon,  3 Feb 2020 16:26:26 +0300 (+03)
Date:   Mon, 3 Feb 2020 16:26:26 +0300
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Christoph Hellwig <hch@infradead.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Dave Chinner <david@fromorbit.com>,
        Ira Weiny <ira.weiny@intel.com>, Jan Kara <jack@suse.cz>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Jonathan Corbet <corbet@lwn.net>,
        =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
        Michal Hocko <mhocko@suse.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Shuah Khan <shuah@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Matthew Wilcox <willy@infradead.org>,
        linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-rdma@vger.kernel.org,
        linux-mm@kvack.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 06/12] mm/gup: require FOLL_GET for
 get_user_pages_fast()
Message-ID: <20200203132626.ckkozepykxmqxf6a@box>
References: <20200201034029.4063170-1-jhubbard@nvidia.com>
 <20200201034029.4063170-7-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200201034029.4063170-7-jhubbard@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jan 31, 2020 at 07:40:23PM -0800, John Hubbard wrote:
> Internal to mm/gup.c, require that get_user_pages_fast()
> and __get_user_pages_fast() identify themselves, by setting
> FOLL_GET. This is required in order to be able to make decisions
> based on "FOLL_PIN, or FOLL_GET, or both or neither are set", in
> upcoming patches.
> 
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

-- 
 Kirill A. Shutemov
