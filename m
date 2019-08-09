Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A81D77D90D
	for <lwn-linux-doc@archive.lwn.net>; Fri,  9 Aug 2019 19:51:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726216AbfHITvw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 9 Aug 2019 15:51:52 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:40687 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726022AbfHITvw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Aug 2019 15:51:52 -0400
Received: by mail-pl1-f193.google.com with SMTP id a93so45295413pla.7
        for <linux-doc@vger.kernel.org>; Fri, 09 Aug 2019 12:51:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UTaxKlCQs2rMVT6dmaq6PY1yYeN42Xa3IY6ykXZ99rU=;
        b=crpKlefmlnpEercEiztphPMdLNVySXjDqAGE76+GSPvihnI5mUb02gWNCzs6FdA0gk
         s6tNPCu63IV2oQPxSW2F+siwWL0QeJPaTaVB+OiRT2SR3iLz6Wi1WWDeZHX5atsNArg1
         NVof1NP5p8HFVNi/8INUIFgZCYB9yz22CDbN/EJ3kk4HxZRvK9wwxIis3dQtyst2pRmn
         neUfOn2WRfLgvegDamAwXNUXqaeeMrBmh20+46/tO3m4tdsgowrxsX6kcHnwXha93hlY
         o1iEyqUgb8tmqrlNvjRwQTZqA40I2rl/7tst9lIfGieESavbw2CxabKy1yBOD9DqsE+2
         jVHQ==
X-Gm-Message-State: APjAAAX0Qc1fvqS5vBSwIZX+3NzJW+ZL2cBssnBpeCqxAlJWfuIY7xIj
        f+/IUebjuUEihftbAF4zLcJOeA==
X-Google-Smtp-Source: APXvYqwJIsjHm9/3r8AONPEu+5ScceQ+yC2jFmx3vHPuhwPESekE53KUkPxX83lynaQO8jTUwealAA==
X-Received: by 2002:a17:902:968c:: with SMTP id n12mr21482416plp.59.1565380311248;
        Fri, 09 Aug 2019 12:51:51 -0700 (PDT)
Received: from localhost ([2601:647:5b80:29f7:1bdd:d748:9a4e:8083])
        by smtp.gmail.com with ESMTPSA id a15sm137192004pfg.102.2019.08.09.12.51.49
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 12:51:50 -0700 (PDT)
Date:   Fri, 9 Aug 2019 12:51:49 -0700
From:   Moritz Fischer <mdf@kernel.org>
To:     Wu Hao <hao.wu@intel.com>
Cc:     gregkh@linuxfoundation.org, mdf@kernel.org,
        linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
        atull@kernel.org
Subject: Re: [PATCH v4 08/12] fpga: dfl: make uinit callback optional
Message-ID: <20190809195149.GA2788@archbox>
References: <1564914022-3710-1-git-send-email-hao.wu@intel.com>
 <1564914022-3710-9-git-send-email-hao.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1564914022-3710-9-git-send-email-hao.wu@intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Aug 04, 2019 at 06:20:18PM +0800, Wu Hao wrote:
> This patch makes uinit callback of sub features optional. With
> this change, people don't need to prepare any empty uinit callback.
> 
> Signed-off-by: Wu Hao <hao.wu@intel.com>
Acked-by: Moritz Fischer <mdf@kernel.org>
> ---
>  drivers/fpga/dfl.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/fpga/dfl.c b/drivers/fpga/dfl.c
> index 87eaef6..c0512af 100644
> --- a/drivers/fpga/dfl.c
> +++ b/drivers/fpga/dfl.c
> @@ -259,7 +259,8 @@ void dfl_fpga_dev_feature_uinit(struct platform_device *pdev)
>  
>  	dfl_fpga_dev_for_each_feature(pdata, feature)
>  		if (feature->ops) {
> -			feature->ops->uinit(pdev, feature);
> +			if (feature->ops->uinit)
> +				feature->ops->uinit(pdev, feature);
>  			feature->ops = NULL;
>  		}
>  }
> -- 
> 1.8.3.1
> 
