Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 66C4F7D90F
	for <lwn-linux-doc@archive.lwn.net>; Tue, 22 Oct 2019 17:52:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727881AbfJVRwS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 22 Oct 2019 13:52:18 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:39854 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731491AbfJVRwR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Oct 2019 13:52:17 -0400
Received: by mail-qk1-f195.google.com with SMTP id 4so17080418qki.6
        for <linux-doc@vger.kernel.org>; Tue, 22 Oct 2019 10:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GYELYeqgb6u2HwVxCCOYQhK7Ymo2hH7WNh8GwwhW5CM=;
        b=bDQW0HlXdjLizbv/Jl5OdFh6mBReWuDjZMe+gCSA3u4RNvV7nN9T2/RM3shr+8xujA
         zZDjiLxyVYJviAFaOUvZF+jPmrtJRTj1u8vQQmfQnj/r2wtyobZYgn7FwQgwMAZUMuE/
         klngz5yv6EfzGEbcf0HlURkIlEHpGdk3X/pFlBhi/lqpOwOjisp6EhjxOaIHtIZIprK1
         2GMo5+zGQIAfrytcfi/V5VjhA6Cgy0bzr3R9lQEM3L21fwO9p/phFbfKqGfbWAveGUb8
         6hQ4moWdcQy6KO+PWUktw6+GAY3OXNRLYx9BY3JqwPpu3NTg3YidMkJlq3osyx7AJHI/
         M+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GYELYeqgb6u2HwVxCCOYQhK7Ymo2hH7WNh8GwwhW5CM=;
        b=WHgp89VOrLOwxkBPSER67isD4God8MEb+ychsdvf553rWUs7xygAQLeh7Dr8Ve/6AX
         ge/jT/llXDGGkqaE6J0RlRZABTquKunWfESeB7tldcbEAgChfss/ncy94tbunq4n0zmp
         x0aQ1PkIXtPWlos+v2AiCWlhJpVlpqh+XG0Z7ISNN0BJTHcBlfj3GxEcyJ4FITckpZKS
         VnVyMKHVxqak3m/c+IkJMxn5kDbG0m/++G90MOiKIhXacnSUjZCopVwvuUdJxA92PaN+
         YUpBdKQgjLgRMA58WpIpHg66CCIsppbRnXos2viZInrzHdZBMsQQTIMalFC65lB+J707
         ELNQ==
X-Gm-Message-State: APjAAAWuhsEfV7RXTQDvnkj07YS+s50yiAZuAO948i1MeZAdVOfmc3U+
        dYqPdWPQ1s68UOZ7of/B/4Cjdg==
X-Google-Smtp-Source: APXvYqz7BrDUSkINRnh21r1LtSQAw+f4VqRc40zrgszfx4KX51bI2hxaxDMXGmHX2qXrGIglup0Ejg==
X-Received: by 2002:a37:7641:: with SMTP id r62mr4225750qkc.496.1571766736887;
        Tue, 22 Oct 2019 10:52:16 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.180])
        by smtp.gmail.com with ESMTPSA id k187sm178903qkb.20.2019.10.22.10.52.16
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Oct 2019 10:52:16 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1iMyKO-0006ui-0C; Tue, 22 Oct 2019 14:52:16 -0300
Date:   Tue, 22 Oct 2019 14:52:15 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     rd.dunlab@gmail.com
Cc:     linux-rdma@vger.kernel.org, Doug Ledford <dledford@redhat.com>,
        linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 05/12] infiniband: fix ulp/opa_vnic/opa_vnic_encap.h
 kernel-doc notation
Message-ID: <20191022175215.GA26528@ziepe.ca>
References: <20191010035239.532908118@gmail.com>
 <20191010035239.890311169@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191010035239.890311169@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 09, 2019 at 08:52:44PM -0700, rd.dunlab@gmail.com wrote:
> Make reserved struct fields "private:" so that they don't need to
> be added to the kernel-doc notation. This removes 24 warnings.

> +++ linux-next-20191009/drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h
> @@ -129,21 +129,31 @@ struct opa_vesw_info {
>  	__be16  fabric_id;
>  	__be16  vesw_id;
>  
> +	/* private: */
>  	u8      rsvd0[6];
> +	/* public: */
>  	__be16  def_port_mask;

This seems overly ugly, is there some other way to handle these
reserved fields? Maybe wire protocol structures shouldn't be kdoc?

Jason
