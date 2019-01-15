Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7CCE57D08A
	for <lwn-linux-doc@archive.lwn.net>; Tue, 15 Jan 2019 15:14:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729481AbfAOPOF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 15 Jan 2019 10:14:05 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39407 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729052AbfAOPOF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Jan 2019 10:14:05 -0500
Received: by mail-pg1-f195.google.com with SMTP id w6so1358918pgl.6
        for <linux-doc@vger.kernel.org>; Tue, 15 Jan 2019 07:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gvcrVGBeH/udJyWosupO807MtSU2G9zk8J/wtcc9hNQ=;
        b=G4Z1KGcmqM2IFk4lXQfYRs8zq4UhXeKEg9JARVEHm/y+BwrSMaDmbZmZL6YvP5Q4Jt
         ZsVxtq2KMwHzUbf461SKdO1Zqi5+V7OUaGciPheNzMI29/N2oCGrqx94whTdnwIQUuaD
         PZsIFr+yHA1VHranAdQ4u+2hBQFhIYqdBkMHabMdW8Slu77fcce6Zq7acgYB6fyYYCW5
         LqGClrJqLO37/5Wam6qFUta9tNAgB06aUQEwk4ILfKZaD025O1ygOgeOrUmMk1jWTgmx
         vdh2PGiMZ+cVuU5ewXiqmW6pC8xr0cryx/9FN1w856rRDarMvwlghuAWxl0A6JBMQ5vk
         sqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gvcrVGBeH/udJyWosupO807MtSU2G9zk8J/wtcc9hNQ=;
        b=YeWY73M9EU4fsP0xSdaeOd/ke3LeWrWgYWr5S1hENE3ULiLXEKgvdQOtXRsYdwPy1l
         de9TSBoAkX61VwZvG+B/w9wsPauelOv4Oc58/gpWeYz11QteGqJ8vRT67GcYYv8zvlF2
         rL5A2JbKcmsBQ2nhBhb6R9YLuEPUcwk8n7mIaozgH7jQ4iMZBSCaIHJaaws5VQwU/ioS
         up/3U3KC49qStIxo33jeCoZCWO1ud0tokfMioEyFu1vpmEUcV/STSqsh/xZQYFT2IOaO
         iLKiDUk59lBOWqftziCM87vwnlGrVGpPgKK9bW+YS4c2RD282UVs3rSAxlgR/3Xk0dyo
         jwsw==
X-Gm-Message-State: AJcUukd4Bwc5MkhUWqJE23RKK1IY//WAAO3mJaT4asJE8CM/nc//43An
        efybfzBHQsS5uNhV1/ENbMzmow==
X-Google-Smtp-Source: ALg8bN7jTTWWN/jexkjN5sA/X9p/yvWobH7kp3RCv9odiyQ5mO83HWT+XvwAp+1Ow6srNcIN46DQkg==
X-Received: by 2002:a63:dd15:: with SMTP id t21mr4064496pgg.347.1547565243921;
        Tue, 15 Jan 2019 07:14:03 -0800 (PST)
Received: from ziepe.ca (S010614cc2056d97f.ed.shawcable.net. [174.3.196.123])
        by smtp.gmail.com with ESMTPSA id b7sm5394855pfa.52.2019.01.15.07.14.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Jan 2019 07:14:03 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1gjQPi-0005ut-9t; Tue, 15 Jan 2019 08:14:02 -0700
Date:   Tue, 15 Jan 2019 08:14:02 -0700
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Joel Nider <joeln@il.ibm.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Leon Romanovsky <leon@kernel.org>,
        Doug Ledford <dledford@redhat.com>,
        Mike Rapoport <rppt@linux.ibm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] docs-rst: Convert user verbs doc to rst
Message-ID: <20190115151402.GA22045@ziepe.ca>
References: <1547547991-5314-1-git-send-email-joeln@il.ibm.com>
 <1547547991-5314-2-git-send-email-joeln@il.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1547547991-5314-2-git-send-email-joeln@il.ibm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jan 15, 2019 at 12:26:30PM +0200, Joel Nider wrote:
> Move user_verbs from infiniband to userspace while changing the
> format. Replace the existing Documentation/infiniband/user_verbs.txt
> with Documentation/userspace-api/user_verbs.rst. No substantial changes
> to the content - just some minor reformatting to have the rendering
> come out nicely.
> 
> Since this documents a userspace API, its home should be with the
> other userspace API docs.
> 
> This is in preparation for updating the content in a subsequent
> patch.
> 
> Signed-off-by: Joel Nider <joeln@il.ibm.com>
> ---
>  Documentation/infiniband/user_verbs.txt    | 69 -----------------------------
>  Documentation/userspace-api/index.rst      |  1 +
>  Documentation/userspace-api/user_verbs.rst | 70 ++++++++++++++++++++++++++++++
>  3 files changed, 71 insertions(+), 69 deletions(-)
>  delete mode 100644 Documentation/infiniband/user_verbs.txt
>  create mode 100644 Documentation/userspace-api/user_verbs.rst

Need to update MAINTAINERS for the new file.. Maybe call this
rdma_user_verbs.rst as we could also have rdma_umad, rdma_cm, etc
 
Jason
