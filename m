Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D4DC07DE59
	for <lwn-linux-doc@archive.lwn.net>; Thu,  6 Sep 2018 18:43:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728947AbeIFXU0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 6 Sep 2018 19:20:26 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45945 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728700AbeIFXU0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Sep 2018 19:20:26 -0400
Received: by mail-pf1-f195.google.com with SMTP id i26-v6so5703930pfo.12
        for <linux-doc@vger.kernel.org>; Thu, 06 Sep 2018 11:43:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jA6lvvJ/PoqJVG5+GJ9mkM1oymchTRZvGp41dY2g0/8=;
        b=s4IePyYW9HVHba7kvhnwnuzJDEbCncivZT9F63USgcoJdSvYhAqewGmz1pV6GLyVLn
         eAELQTsiKDWQggllm/CVPS2Oxq/4emhLKZ5RNnEpAf4XlGeC3RRtzKK9GWY9BSQwqju3
         S9iga9VJF6OSRZeoAna4kbxBx4Cul+fzZxOg3cZOYdbt1Wr87Nfueyjj5MiC6l5zwxiD
         McbJB+ideN0IVFEFvNpqo3xMxg2wY4aI2FTtX30QM7RbhXVmIHyLdTqy5vMiemd2CA//
         lc4ecpJmreddPKWpbKpHbYvS2oqJUbQsJSUmarQ34bR5uGCoSBW+TDgVATHCEfJNhbuI
         dxQw==
X-Gm-Message-State: APzg51CZM7W8Elh2DBLu02vqpp3PLN0ZdVwi9fipIQ3Md+678fMJVV0P
        bjBIgvbqogmh8M0KMrveiKuolw==
X-Google-Smtp-Source: ANB0VdYlFPKKct5E5mziLzE5zCqVofVZJRv9K6/aMgKTYu0OuX51fHf9EHPNFDBskzoHiHSi5VPDTw==
X-Received: by 2002:a63:549:: with SMTP id 70-v6mr4323562pgf.385.1536259420474;
        Thu, 06 Sep 2018 11:43:40 -0700 (PDT)
Received: from localhost ([207.114.172.147])
        by smtp.gmail.com with ESMTPSA id w12-v6sm8202437pfd.110.2018.09.06.11.43.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Sep 2018 11:43:39 -0700 (PDT)
Date:   Thu, 6 Sep 2018 11:43:38 -0700
From:   Moritz Fischer <mdf@kernel.org>
To:     Alan Tull <atull@kernel.org>
Cc:     Moritz Fischer <mdf@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org, linux-fpga@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 6/8] fpga: bridge: fix obvious function documentation
 error
Message-ID: <20180906184338.GD20419@archbook>
References: <20180904212237.3078-1-atull@kernel.org>
 <20180904212237.3078-7-atull@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180904212237.3078-7-atull@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 04, 2018 at 04:22:35PM -0500, Alan Tull wrote:
> fpga_bridge_dev_match() returns a FPGA bridge struct, not a
> FPGA manager struct so s/manager/bridge/.
> 
> Signed-off-by: Alan Tull <atull@kernel.org>
Acked-by: Moritz Fischer <mdf@kernel.org>
> ---
> v2: no change in v2 of patchset
> ---
>  drivers/fpga/fpga-bridge.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/fpga/fpga-bridge.c b/drivers/fpga/fpga-bridge.c
> index c39d35f..7b0071a 100644
> --- a/drivers/fpga/fpga-bridge.c
> +++ b/drivers/fpga/fpga-bridge.c
> @@ -125,7 +125,7 @@ static int fpga_bridge_dev_match(struct device *dev, const void *data)
>   *
>   * Given a device, get an exclusive reference to a fpga bridge.
>   *
> - * Return: fpga manager struct or IS_ERR() condition containing error code.
> + * Return: fpga bridge struct or IS_ERR() condition containing error code.
>   */
>  struct fpga_bridge *fpga_bridge_get(struct device *dev,
>  				    struct fpga_image_info *info)
> -- 
> 2.7.4
> 

Thanks,

Moritz
