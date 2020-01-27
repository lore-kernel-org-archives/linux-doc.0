Return-Path: <SRS0=PADw=3Q=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E47C3F68F
	for <linux-doc@archiver.kernel.org>; Mon, 27 Jan 2020 13:00:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 28614214DB
	for <linux-doc@archiver.kernel.org>; Mon, 27 Jan 2020 13:00:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov-name.20150623.gappssmtp.com header.i=@shutemov-name.20150623.gappssmtp.com header.b="VoO+O8ol"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725938AbgA0NAQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 27 Jan 2020 08:00:16 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:33222 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbgA0NAQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Jan 2020 08:00:16 -0500
Received: by mail-lf1-f67.google.com with SMTP id n25so6132618lfl.0
        for <linux-doc@vger.kernel.org>; Mon, 27 Jan 2020 05:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZJNzprftu5dcU/szZB/Ubowobleex8rerW+4xWJyt/M=;
        b=VoO+O8oliDEu27wte/68JQesstuhw1JLi9F499LFmln4kg2fnU80g+Hy939slqwayM
         6X4kQsHF3iGoWNUylpAMzFOkSDlcyP5/xyc0nU7I/ZTTBqifEIlQVkwwEbO747yLu+pJ
         1djgkjWksVX3uhDMrT2nQ3tRFxpQRSNk75/8zCqkaGcvS3EmE66VBYCGeeGKoS8z8VJT
         mKJuWPfApbN4BycDPeyoUqzdZk5e0nyZKMhHLxkO4pkhpTozPbRLOhmheKxVubOO/98R
         Nq34lzm5O1uV00jxqCWfyoHMsxuubjaSAkl9vEG10D5/2xyp98i8Xb+VDazvAENA75Qi
         OF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZJNzprftu5dcU/szZB/Ubowobleex8rerW+4xWJyt/M=;
        b=Th5JsSQtNQdZTJs6qQGsMu6W5aFWQyXzQrwo5D7o64GHsI+NgiaonJeZf8NjLO4qJT
         46aN6LNdctV18dz/zPWljvkE/SgGLyU4ojrzVxKYiisBYOvtZ13nxow3yt+4ajLTWtMA
         2/VAoZlRPMv//MlZfDm7Y9dcQ4xg0+fyu4QwkHbg5C75NDMGQkbphxyDPMnWobFP1M/L
         IZaMenUdUNS1/Ut9E+yKi4NhJU+gHSflYOZk7F3tTMZ+/BnwPWxr6yaURh7L+w8/Pv+0
         ps8rmCyjxxCoJNpEhL/RLg9Y/7hjl25FZ6RXXxZavPi/g5/QDgWUo0CteTlVPqqDmrEo
         3BPg==
X-Gm-Message-State: APjAAAWkvalf1uJUn4SDj007vfhzYFtk+aA78DLU3LNGhDEIZRxa5lA4
        WRI2+YHM2OHFhcGfF29wT+98Dw==
X-Google-Smtp-Source: APXvYqysAoofMf7LQ5awnT1fddVOicFrSd53w1Fmy5Kunrv9ngQonmVjbMl/JL3C6VYXCdPDTAql6w==
X-Received: by 2002:ac2:59dd:: with SMTP id x29mr7959464lfn.95.1580130014394;
        Mon, 27 Jan 2020 05:00:14 -0800 (PST)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id b4sm8138667lfo.48.2020.01.27.05.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2020 05:00:13 -0800 (PST)
Received: by box.localdomain (Postfix, from userid 1000)
        id 5ED20100AD0; Mon, 27 Jan 2020 16:00:20 +0300 (+03)
Date:   Mon, 27 Jan 2020 16:00:20 +0300
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
        Vlastimil Babka <vbabka@suse.cz>, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, linux-mm@kvack.org,
        LKML <linux-kernel@vger.kernel.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: [PATCH 1/3] mm/gup: track FOLL_PIN pages
Message-ID: <20200127130020.4p56lh32twui5563@box>
References: <20200125021115.731629-1-jhubbard@nvidia.com>
 <20200125021115.731629-2-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200125021115.731629-2-jhubbard@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jan 24, 2020 at 06:11:13PM -0800, John Hubbard wrote:
>  12 files changed, 577 insertions(+), 171 deletions(-)

Can we get it split? There's too much going on to give meaningful review.

-- 
 Kirill A. Shutemov
