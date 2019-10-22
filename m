Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D29FB7D90F
	for <lwn-linux-doc@archive.lwn.net>; Tue, 22 Oct 2019 18:41:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732630AbfJVSlL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 22 Oct 2019 14:41:11 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:42546 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731436AbfJVSlL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Oct 2019 14:41:11 -0400
Received: by mail-qt1-f193.google.com with SMTP id w14so28272885qto.9
        for <linux-doc@vger.kernel.org>; Tue, 22 Oct 2019 11:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bF9K7Bd9BrzzMLmMrrO2HSAwcPu6dNqSFJ59SdGCcdc=;
        b=hUqrSk3F2J3Z8zY9lRzqLgcqiBlMJq/h0fGcZwZg2lGeEi1NZ6pmv7rS5TI8fveK0c
         p6Yl+F1AkuwmmT0uOR/eE6hhn3OOlAaQNZlXGuaJ+82hcuzay99N9bCLFpiqVepSDlyC
         aGhR2902V9sufLYEzDqPMzxj0wd4SeSxBLOlOyz1LlhAa5ue0YVhL2BYxim3uJ8gtPmS
         l/dRThDyTcBvW870OvDN2BlB+LNwUwbCTy4wucgbxrrP+yigmC348hZUW6hrC6/WBBEQ
         P+iB/GaYuq2qZaaQ+P9qnH3Rymsrdsa9bua1g/ZsxVfKsjQlLCGht70yJJcd4q6Qr4b0
         rBZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bF9K7Bd9BrzzMLmMrrO2HSAwcPu6dNqSFJ59SdGCcdc=;
        b=n05lu7Imrrl/j4OCcu8/OaFoEhLFFdlFNgwh93a19NlaOsjuiN4w3gd1e1q8bOKJAj
         qNqmRwPvFTZI2ANxVdejiwGIljoSTj/lebsBk+ZOQjGCXodWSOk/OfMku6/DHfqMNzgZ
         pzt1A6pP5XKP77JbsDiuwdExbIz+497MUlyN9hNSKdcj5RX18mreLFFZXZiPD89T0nIT
         W4jZQKzuSTtEZfkcDAD1uJv595nADXCpp8pEbtAYQ1d0uAgSYMQzcvqbAtaSN/nBfyY8
         rfmLk1lyMsHGP83RE6u//TJmDvAN5N20FmDK+BUZ7Zmtx+M/NRnGtf/je8ybDq7vhvGQ
         XJsw==
X-Gm-Message-State: APjAAAVdRIVgArdI6Nxi6moGjeAuVpduhW2zSHV86PdGKFj4fNUZdAGA
        pzdybB27lFHzycxPB1liFkNVQQ==
X-Google-Smtp-Source: APXvYqxad1u6C2e/cv+Tm8SJFBvz8Mt1xEFYtc9Wnpqiik7XQlAmUbuOzEjnbzLmSEm8ikvwXQ0TEw==
X-Received: by 2002:ac8:6f27:: with SMTP id i7mr4994566qtv.359.1571769670432;
        Tue, 22 Oct 2019 11:41:10 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.180])
        by smtp.gmail.com with ESMTPSA id a190sm11028340qkf.118.2019.10.22.11.41.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2019 11:41:09 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1iMz5h-0002GS-Er; Tue, 22 Oct 2019 15:41:09 -0300
Date:   Tue, 22 Oct 2019 15:41:09 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     rd.dunlab@gmail.com, Max Gurtovoy <maxg@mellanox.com>
Cc:     linux-rdma@vger.kernel.org, Doug Ledford <dledford@redhat.com>,
        linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 00/12] infiniband kernel-doc fixes & driver-api/ chapter
Message-ID: <20191022184109.GA2155@ziepe.ca>
References: <20191010035239.532908118@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191010035239.532908118@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 09, 2019 at 08:52:39PM -0700, rd.dunlab@gmail.com wrote:
> 
> This patch series cleans up lots of kernel-doc in drivers/infiniband/
> and then adds an infiniband.rst file.
> 
> It also changes a few instances of non-exported functions from kernel-doc
> notation back to non-kernel-doc comments.
> 
> There are still a few kernel-doc and Sphinx warnings that I don't know how
> to resolve:
> 
>   ../drivers/infiniband/ulp/iser/iscsi_iser.h:401: warning: Function parameter or member 'all_list' not described in 'iser_fr_desc'
>   ../drivers/infiniband/ulp/iser/iscsi_iser.h:415: warning: Function parameter or member 'all_list' not described in 'iser_fr_pool'

Maybe Max can help?

>   ../drivers/infiniband/core/verbs.c:2510: WARNING: Unexpected indentation.
>   ../drivers/infiniband/core/verbs.c:2512: WARNING: Block quote ends without a blank line; unexpected unindent.
>   ../drivers/infiniband/core/verbs.c:2544: WARNING: Unexpected indentation.

I don't know what to make of these either.

Anyhow, it is an overall improvement, so I applied everything but

[05/12] infiniband: fix ulp/opa_vnic/opa_vnic_encap.h kernel-doc notation

pending some discussion.

Thanks,
Jason
