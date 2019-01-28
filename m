Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9E27D7D099
	for <lwn-linux-doc@archive.lwn.net>; Mon, 28 Jan 2019 21:23:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727408AbfA1VXp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 28 Jan 2019 16:23:45 -0500
Received: from mail-yb1-f196.google.com ([209.85.219.196]:39550 "EHLO
        mail-yb1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726744AbfA1VXp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Jan 2019 16:23:45 -0500
Received: by mail-yb1-f196.google.com with SMTP id s17so7321419ybp.6
        for <linux-doc@vger.kernel.org>; Mon, 28 Jan 2019 13:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=W3oY1xqZBvb5uVdN7aj7A+kp0VAxPGPd9sCt8NgdAbo=;
        b=oqCrtSNo/UoV97OKjZDNJhAd+dZJsc6m2M2jTE79zkINKeitFARxb4Btk8w5wssq7B
         h+qJkgT8Wh5LQornKlqF2y08DevoQTqEGNwy2CWiUjGkRrVvVJfmZ3SrSvhz4AAe9rjf
         xHaOrje31Y2ilUukiJ5d/tYwJbwtfrHeychlWKqsWF5VNa3L9VW5lrOIZJsq4uEhSfCf
         tn2PJXCMjbQDTaDl4HdcjgJG0wAEarpQG6+PSpy/edY/weTfjIP5hvaTy54lHvMxq8Xv
         VF45QjoZG8eyKX/PV5Tl70U01SXO5/FUtnaJFguMeHIHI4f/m63YIb3dKWV8O4AVFqwz
         02Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=W3oY1xqZBvb5uVdN7aj7A+kp0VAxPGPd9sCt8NgdAbo=;
        b=pXiMUlH7KJS45KuC1Ls6iiFSB0d2NTdr7rlqMtpFpow6eem90eDqBvoWw1qZy5SqsO
         q2apmt8K2FyMKqrWOPnN0r5OHAE8jiX62lNMkHMwrNbv9gDfgCyNRKtSLf6pFBQCPnvx
         HXih7SNfKhJYYa+MR2oCC94YbLZcOBi4T/0zQ9Mdx/YUH5zxOkDihOUhGJX+kQYLBz72
         RGChHQtvatwN2gJUmyYVE9d7K9iBAKk3ZkltzV10r5ZY76T2Y41iP9kA6yQ5EsRDX4Rs
         5a6AV2yt10MuOF9vQZjhym2QugiVJ4Ho7mSemoX6zqBmVeVeHvuUpVpYD380kXZQ8mVP
         XjSQ==
X-Gm-Message-State: AHQUAubJyKU+1RyiGaupsdbMDZIfmpCVV5nD/U2u0P9Xd88yyGvtCDgE
        fpQ5EeGTCTZj4FOFdiPAzy8wBw==
X-Google-Smtp-Source: AHgI3IZB91CNTZqNmQFgMEMFhElan15kyh2hIe9x4vrRvLju7Mge2gp6Kdzg5HgJ6mvedeUDgo2Z/Q==
X-Received: by 2002:a25:7d05:: with SMTP id y5mr3034818ybc.439.1548710624260;
        Mon, 28 Jan 2019 13:23:44 -0800 (PST)
Received: from localhost ([199.201.65.134])
        by smtp.gmail.com with ESMTPSA id s185sm26041014yws.69.2019.01.28.13.23.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Jan 2019 13:23:43 -0800 (PST)
Date:   Mon, 28 Jan 2019 16:23:42 -0500
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     Suren Baghdasaryan <surenb@google.com>
Cc:     gregkh@linuxfoundation.org, tj@kernel.org, lizefan@huawei.com,
        axboe@kernel.dk, dennis@kernel.org, dennisszhou@gmail.com,
        mingo@redhat.com, peterz@infradead.org, akpm@linux-foundation.org,
        corbet@lwn.net, cgroups@vger.kernel.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-team@android.com
Subject: Re: [PATCH v3 4/5] psi: rename psi fields in preparation for psi
 trigger addition
Message-ID: <20190128212342.GC1416@cmpxchg.org>
References: <20190124211518.244221-1-surenb@google.com>
 <20190124211518.244221-5-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190124211518.244221-5-surenb@google.com>
User-Agent: Mutt/1.11.2 (2019-01-07)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 24, 2019 at 01:15:17PM -0800, Suren Baghdasaryan wrote:
> Renaming psi_group structure member fields used for calculating psi
> totals and averages for clear distinction between them and trigger-related
> fields that will be added next.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
