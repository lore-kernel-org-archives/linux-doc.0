Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 762557D90D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 10 Jul 2019 12:14:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727101AbfGJMOE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 10 Jul 2019 08:14:04 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:33403 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727068AbfGJMOD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Jul 2019 08:14:03 -0400
Received: by mail-wm1-f67.google.com with SMTP id h19so4512226wme.0
        for <linux-doc@vger.kernel.org>; Wed, 10 Jul 2019 05:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VIGpiD/b4QvsY5xkdx7aEJIrxrp4vS+C6jbYnop4lsE=;
        b=djB6tFezqr/i8CmI83Ds8pwgO9bKTWl7LzJ4Xkno8saZ+BdnHeBFTyd0v5wYoi1ED/
         0IMAfMZLUWU1E4z+BolmBXOwrR/6Wjkv1mifepGsjFaraQsYkJGQqza0W5Q7Ghtk6F3k
         Wp6d40/xP/qYG5UO8x8zvDhuA7kDmNSTw0cZbecLUSz8udZj/0RCMGNNWQovVjAMEzjd
         OTTOv4RPlHMAoNCsn7PwN0oWMrqSFBW+GxmdlsqjmdKPqMF/x3veVY6hk8bEAT6n0R0T
         p86asswZJimf9zD4DBolzuuOyivx4jIZzz2MLR2mZ2SrZpq4PjP+FQJ1FJzIm13WkfGK
         bwdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VIGpiD/b4QvsY5xkdx7aEJIrxrp4vS+C6jbYnop4lsE=;
        b=oH+caGyArpOP8yRVefl4rU/JrNSQsCECPZfLM+B/FfqgxXhfRfMYVQQhJ64ozSiqYm
         c6pm2zx7g2rgH2KcFgoK548l9e+q8XOs78Jiv6JKXiizjM45NI0c48yRWulBqsHbp3q/
         Rw7UW5cCI35wq7Y0ZNQXnnAMPSm7cNlnDUp7q06R2xkJ6XhxcS6t7mssxWmsD41ojgYu
         uiLoE/fcuuzZliGxJiWePugw5rCtY4/3GwGXntWet51AWXYQRAZ++F05eupyt6R0mZ1S
         PJ9lBF9P+NDPWayxuEcSiisE4ZvOZ+4i9bQMAXccMaucO7d+hpHJYV8FSBN00wafCD0Y
         Zfmg==
X-Gm-Message-State: APjAAAXxovXqwkI1bZOL9BYFVcumDfh9vwRbZOgxfGRrl3Y9LqPztfP7
        B5h9XydyVYTTiY/45bC7lroSRA==
X-Google-Smtp-Source: APXvYqyTB/Y4Qj0MHXp2GOWt42OVm+gtHhNUSrt1QVllGDOab+5Rxb2PRv/VLRP8/UmVfYjXS2aDBA==
X-Received: by 2002:a1c:1a4c:: with SMTP id a73mr5435637wma.109.1562760841772;
        Wed, 10 Jul 2019 05:14:01 -0700 (PDT)
Received: from apalos (athedsl-428434.home.otenet.gr. [79.131.225.144])
        by smtp.gmail.com with ESMTPSA id r21sm4885127wrc.83.2019.07.10.05.13.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jul 2019 05:14:01 -0700 (PDT)
Date:   Wed, 10 Jul 2019 15:13:58 +0300
From:   Ilias Apalodimas <ilias.apalodimas@linaro.org>
To:     Thirupathaiah Annapureddy <thiruan@microsoft.com>
Cc:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Sasha Levin <sashal@kernel.org>,
        "peterhuewe@gmx.de" <peterhuewe@gmx.de>,
        "jgg@ziepe.ca" <jgg@ziepe.ca>, "corbet@lwn.net" <corbet@lwn.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>,
        Microsoft Linux Kernel List <linux-kernel@microsoft.com>,
        "Bryan Kelly (CSI)" <bryankel@microsoft.com>,
        "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
        "sumit.garg@linaro.org" <sumit.garg@linaro.org>,
        "rdunlap@infradead.org" <rdunlap@infradead.org>,
        Joakim Bech <joakim.bech@linaro.org>
Subject: Re: [PATCH v7 1/2] fTPM: firmware TPM running in TEE
Message-ID: <20190710121358.GA12965@apalos>
References: <b688e845ccbe011c54b10043fbc3c0de8f0befc2.camel@linux.intel.com>
 <20190627133004.GA3757@apalos>
 <0893dc429d4c3f3b52d423f9e61c08a5012a7519.camel@linux.intel.com>
 <20190702142109.GA32069@apalos>
 <CY4PR21MB0279B99FB0097309ADE83809BCF80@CY4PR21MB0279.namprd21.prod.outlook.com>
 <20190703065813.GA12724@apalos>
 <CAC_iWjK2F13QxjuvqzqNLx00SiGz_FQ5X=MQxJyDev57bo3=LQ@mail.gmail.com>
 <CY4PR21MB02791B5EF653514DC0223694BCFA0@CY4PR21MB0279.namprd21.prod.outlook.com>
 <20190704181120.GA21445@apalos>
 <CY4PR21MB027937ADCEBF85826FF3516FBCF50@CY4PR21MB0279.namprd21.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CY4PR21MB027937ADCEBF85826FF3516FBCF50@CY4PR21MB0279.namprd21.prod.outlook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Thirupathaiah

Apologies for tha lte reply, i somehow misplaced this mail.

[...]
> > 
> > Please check the previous mail from Sumit. It explains exaclty what's going on.
> > The tl;dr version is that the storage is up only when the supplicant is
> > running.
> 
> I definitely know that OP-TEE can access storage only when the "user mode" supplicant 
> is running :). But fTPM NV storage should have been initialized in 
> in the preboot environment (UEFI/U-boot). 
> 
> It would also be helpful to understand the overall use case/scenario (Measured boot?)you
> are trying to exercise with the fTPM. 

In the future yesm measured boot/ For now it's more like like try running it in
QEMU to demonstrate firmware TPM makes sense and has use cases. 

> 
> I also want to emphasize that this discussion is turning into more of how 
> fTPM gets integrated/enabled in a new HW platform.  
> fTPM is hosted in github and you definitely bring any issues/feature requests there. 
> 

Ok

> 
> > 
> > > If you let me know the HW platform details, I am happy to work with you to
> > enable/integrate
> > > fTPM TA on that HW platform.
> > >
> > Thanks,
> > The hardware i am waiting for for has an eMMC RPMB. In theory the U-Boot
> > supplicant support will be there so i'll be able to test it.
> Can you give me the details of HW so that I can order one for myself? 

It's QEMU for now. We plan on doing something similar in an ST disco board
though.

> Is it one of the 96boards? 

stm32mp157c-dk2 is one of our targets.

> The reason for the ask is that we have not upstreamd u-boot fTPM stack yet, 
> although we have future plans for it. 
> 
> --Thiru
> 

Thanks
/Ilias
