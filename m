Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CD0297D2EE
	for <lwn-linux-doc@archive.lwn.net>; Thu, 16 Aug 2018 19:02:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726103AbeHPWDI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 16 Aug 2018 18:03:08 -0400
Received: from mail-pl0-f68.google.com ([209.85.160.68]:35105 "EHLO
        mail-pl0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbeHPWDH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Aug 2018 18:03:07 -0400
Received: by mail-pl0-f68.google.com with SMTP id g1-v6so2533860plo.2
        for <linux-doc@vger.kernel.org>; Thu, 16 Aug 2018 12:02:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=djKNDuekVLyr38epOlSq3wP9TgAafepG8mJSzmhFlTs=;
        b=F5CAjSLEbVRFJ5X9QqbkMlmCPvOTdft/EHYOhATa9Hh9cCj97ruSF8wQW5dV99tmTt
         dhon4+R0eV4dDTcRYI8JYkoDGizD4JAwI4V0HHp2L31i7IRitpGlcyVmH3ilUjBoLE+8
         QdAdZVZUpMlHjczUkC/XMIuVA87Bvpmgq6JVV0cpQQlC4ybWvXpHmt8WoXp51zijhM0m
         Bby/jY7fzGAjPh4IkzlHyevsVkS5AEDARh6nIcV4uJbVFk81HPDcFAQt887wxuVOPtBS
         UnzcGf6ebD24Zvt1YaXcikn0Qew7uhl/J2kZeiO7lx6nJY7pqoiGydEUkfZIi/vglVL9
         GCcA==
X-Gm-Message-State: AOUpUlH+WucSPVl+mw7qhRLugzPsoZY+pUe/zaHHeXyIKdnR29xEu9Cm
        2ugwDYlkSAkyTlo3FzTs1P9QcQ==
X-Google-Smtp-Source: AA+uWPzz6G/NTEkB/NDEr1esqdp6Uw5+fRFXNHYnSgDjULur8o5mRI57Mxydu7/bgvOocFs70j6i/g==
X-Received: by 2002:a17:902:b28:: with SMTP id 37-v6mr30031666plq.337.1534446174013;
        Thu, 16 Aug 2018 12:02:54 -0700 (PDT)
Received: from localhost ([207.114.172.147])
        by smtp.gmail.com with ESMTPSA id l27-v6sm41537pfi.180.2018.08.16.12.02.53
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Aug 2018 12:02:53 -0700 (PDT)
Date:   Thu, 16 Aug 2018 12:02:52 -0700
From:   Moritz Fischer <mdf@kernel.org>
To:     Alan Tull <atull@kernel.org>
Cc:     Moritz Fischer <mdf@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org, linux-fpga@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 7/8] docs: fpga: document fpga manager flags
Message-ID: <20180816190252.GB3932@archbook>
References: <20180814191526.3247-1-atull@kernel.org>
 <20180814191526.3247-8-atull@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180814191526.3247-8-atull@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Alan,

On Tue, Aug 14, 2018 at 02:15:25PM -0500, Alan Tull wrote:
> Add flags #defines to kerneldoc documentation in a
> useful place.
> 
> Signed-off-by: Alan Tull <atull@kernel.org>
> ---
>  Documentation/driver-api/fpga/fpga-mgr.rst |  5 +++++
>  include/linux/fpga/fpga-mgr.h              | 18 ++++++++++++------
>  2 files changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/driver-api/fpga/fpga-mgr.rst b/Documentation/driver-api/fpga/fpga-mgr.rst
> index 431556d..db8885e 100644
> --- a/Documentation/driver-api/fpga/fpga-mgr.rst
> +++ b/Documentation/driver-api/fpga/fpga-mgr.rst
> @@ -183,6 +183,11 @@ API for implementing a new FPGA Manager driver
>  API for programming an FPGA
>  ---------------------------
>  
> +FPGA Manager flags
> +
> +.. kernel-doc:: include/linux/fpga/fpga-mgr.h
> +   :doc: FPGA Manager flags
> +
>  .. kernel-doc:: include/linux/fpga/fpga-mgr.h
>     :functions: fpga_image_info
>  
> diff --git a/include/linux/fpga/fpga-mgr.h b/include/linux/fpga/fpga-mgr.h
> index 1ca02ce..777c502 100644
> --- a/include/linux/fpga/fpga-mgr.h
> +++ b/include/linux/fpga/fpga-mgr.h
> @@ -53,12 +53,18 @@ enum fpga_mgr_states {
>  	FPGA_MGR_STATE_OPERATING,
>  };
>  
> -/*
> - * FPGA Manager flags
> - * FPGA_MGR_PARTIAL_RECONFIG: do partial reconfiguration if supported
> - * FPGA_MGR_EXTERNAL_CONFIG: FPGA has been configured prior to Linux booting
> - * FPGA_MGR_BITSTREAM_LSB_FIRST: SPI bitstream bit order is LSB first

We are actually missing the ENCRYPTED flag here, can you add that while
we're at it? I must've forgotten to add that back then ... derp.

> - * FPGA_MGR_COMPRESSED_BITSTREAM: FPGA bitstream is compressed
> +/**
> + * DOC: FPGA Manager flags
> + *
> + * Flags used in the &fpga_image_info->flags field
> + *
> + * %FPGA_MGR_PARTIAL_RECONFIG: do partial reconfiguration if supported
> + *
> + * %FPGA_MGR_EXTERNAL_CONFIG: FPGA has been configured prior to Linux booting
> + *
> + * %FPGA_MGR_BITSTREAM_LSB_FIRST: SPI bitstream bit order is LSB first
> + *
> + * %FPGA_MGR_COMPRESSED_BITSTREAM: FPGA bitstream is compressed
>   */
>  #define FPGA_MGR_PARTIAL_RECONFIG	BIT(0)
>  #define FPGA_MGR_EXTERNAL_CONFIG	BIT(1)
> -- 
> 2.7.4
> 

Thanks,
Moritz
