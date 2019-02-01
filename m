Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A66007D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri,  1 Feb 2019 16:52:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727952AbfBAQwz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 1 Feb 2019 11:52:55 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44994 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727538AbfBAQwz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Feb 2019 11:52:55 -0500
Received: by mail-pl1-f193.google.com with SMTP id p4so209193plq.11
        for <linux-doc@vger.kernel.org>; Fri, 01 Feb 2019 08:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YkRBvGcBP+3ulVllKyK4N4ceLELVNgq7k5uVwtxY4Qo=;
        b=bL06fcxOIVQVkGGWYc7xant1/8s9btSOUcz9w3olNfJr9XGWoOx/sgS55YuQsXfG0E
         YIg/9RbKhChokYWaroldKLevQ3SVyoNYGMbM+2+jKuq6xurot3/xr+mZsGGDTfCsoe9k
         IaBNi+ZHiYiM2e5keXWeGeLfnfgp3C/y9hxOF/sSBA+QzVwPZ0YInJfI3yndtT5yrsXV
         cMkDu4crkCtcIofNWGCUp5Lse/6vpXEF2QoninX/K6lNj0hZTj4TqbZp278y9Ddgws13
         SJ8Fd8rIyPofciKVs4GrYT5XP3BmDZz51m4I0ChpezxXkmlX/Mfsf1M42lbCRs5NOlhL
         /EIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YkRBvGcBP+3ulVllKyK4N4ceLELVNgq7k5uVwtxY4Qo=;
        b=J3NlKx7rSyC3u6atryjEE0D6xlRpQRP9fL3eie2GkWmYsnvuH4Ihg1KiFlqlkIl+NR
         gxbfWo3iWv9HLRLdNNtGT8q4HHIsi6uTq6dSh3/GvB9IqID7AnqmwcZrU4p3jkl8IAnK
         Pak296qk8+dbeVFOEE1oyQaFfH+0EMQCcIDUWJpDOMOjMCP36NkPkJAKAnrzRzWsM6LV
         eKewrzcCAP18AGj6FzuJZzc/lRtCTNv/8KtX91tXgCZP3mNbNCUjiaHUxovEfkX3tbbr
         nm4LTg3QwnNjsNgrXVvkqJZyMkx9sbafdbtPexPh1Bifp9iIW0qrkZDVh3Nah3bBRM+x
         6Ojw==
X-Gm-Message-State: AJcUukcSTKFBtb81AsK4iqv05lG/e/6nJgfR0DL8Uqv2EjyqbFmImgC9
        xlmTxsaMXN+tGbtDORxk++3/5g==
X-Google-Smtp-Source: ALg8bN53YNyiKA1bHx6kuWzAW7hN2F7JgyVAr7KwL4ZTm/UonuzuD5uOkY0srIu+AvcGAFUurPpz+A==
X-Received: by 2002:a17:902:468:: with SMTP id 95mr39943598ple.3.1549039974258;
        Fri, 01 Feb 2019 08:52:54 -0800 (PST)
Received: from ziepe.ca (S010614cc2056d97f.ed.shawcable.net. [174.3.196.123])
        by smtp.gmail.com with ESMTPSA id n68sm14728462pfb.62.2019.02.01.08.52.53
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Feb 2019 08:52:53 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1gpc3g-0003jM-W0; Fri, 01 Feb 2019 09:52:52 -0700
Date:   Fri, 1 Feb 2019 09:52:52 -0700
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Joel Nider <joeln@il.ibm.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Leon Romanovsky <leon@kernel.org>,
        Doug Ledford <dledford@redhat.com>,
        Mike Rapoport <rppt@linux.ibm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] update infiniband uverbs documentation
Message-ID: <20190201165252.GA13002@ziepe.ca>
References: <1548151235-386-1-git-send-email-joeln@il.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1548151235-386-1-git-send-email-joeln@il.ibm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jan 22, 2019 at 12:00:32PM +0200, Joel Nider wrote:
> A small patchset to update the verbs API documentation with some
> information regarding the ioctl syscall. First patch converts the
> file format to ReST, since this is the new preferred format, moves
> the file to Documentation/userspace-api, and updates the index.
> The 2nd patch adds the new content, documenting a bit of the internal
> workings of the kernel side of the API functions. The goal is to make
> it easier for developers unfamiliar with the structure to understand
> what is going on when adding a new function.
> The 3rd patch updates the MAINTAINERS file.
> 
> v3 addresses comments from Jon, Willy and Jason:
>  The location of the new content should be driver-api
>  The location of the old (converted) content should be userspace-api
>  MAINTAINERS file must be updated
> 
> Joel Nider (3):
>   docs-rst: Convert user verbs doc to rst
>   docs-rst: driver-api: Add infiniband interface documentation
>   MAINTAINERS: add new RDMA/Infiniband documentation

Doc folks, what is the feedback on these patches? Should I take
them through the rdma tree?

Thanks,
Jason
