Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E59717D90C
	for <lwn-linux-doc@archive.lwn.net>; Wed,  3 Jul 2019 06:58:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727004AbfGCG6T (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 3 Jul 2019 02:58:19 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44174 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbfGCG6T (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Jul 2019 02:58:19 -0400
Received: by mail-wr1-f67.google.com with SMTP id b2so138903wrx.11
        for <linux-doc@vger.kernel.org>; Tue, 02 Jul 2019 23:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7NIH8CFjAMNOmJLuHgmNt9jeNJYxR5K2QbGvBFYhPyM=;
        b=zQl30MMYhx8iWYLwIlLcv/0wck1BuceVHDEuRd2T38gMScJknOBuV9dIia/OxTsOne
         UiekeRlnsmdKKem6TxZ7FnAX7OwFWc0t1yboi4SJPCLz0SePEH6zy9YglOjh3zK3As7e
         U5frAhWsfFf2lcvoSrnaeCOKdho5ZmrzWbcbgW31fh6FCLixroxYU/emHdGuqsj8+xZX
         5P1osZUnAolbMmu6Uyw6cMoqYTwq37eWPnCvDjLXvg3hkv/3ZyxqRoBKnIeQlX0NBIub
         hkiOCkOscL99ZtTxTaY2pFPk236kNhq13Et10x2UsdzqorQ3g2R76Mt4H7Vk/6UDLbbZ
         Spmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7NIH8CFjAMNOmJLuHgmNt9jeNJYxR5K2QbGvBFYhPyM=;
        b=mxw6eRpDWbko6iX21WAy5QE/QClzZlNk2pUDwWiy4cQn/6hkb0tiv9asslDEj83W21
         dIs2D8+ugse1NaY92aR62jsZ6CcgyGQFRmbD7wVo8c8faOoGM5UIRazF/k/A2LUILgw3
         mW38z89+8t3mVFEkpTY2RmDBMIQEfWzSXPq87d61dnDrOu2Ja80UMqDUuLuNYC//GiFU
         dU6OKDNGfL8RJejH4U+Ac9OBSuccBdKur/YCZNU1/srPeBtiaD0jHbGGY6gBQa0G3t/0
         jAm9KuYfQC3IWi4Cg4xdhsU138CqzKM6TASrlSoZVPGnE6/e41RjtF1HVDcYnd/mxHAY
         vLzg==
X-Gm-Message-State: APjAAAWUOAc42FWpA41jAAU7UC2Y8lY2V4piOFDDOhdzQUwCyv0vH4yg
        cRs9N87cWHHoqiZPLWjv6YqSYQ==
X-Google-Smtp-Source: APXvYqw/X5rM8ZDYSaQMfFrQjrC5Br42gx2+HjM1yZXBgIo539ABva79LWol9ilB7gBuqGDXalghlQ==
X-Received: by 2002:adf:b748:: with SMTP id n8mr1825265wre.268.1562137096980;
        Tue, 02 Jul 2019 23:58:16 -0700 (PDT)
Received: from apalos (athedsl-428434.home.otenet.gr. [79.131.225.144])
        by smtp.gmail.com with ESMTPSA id g14sm1287678wro.11.2019.07.02.23.58.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2019 23:58:16 -0700 (PDT)
Date:   Wed, 3 Jul 2019 09:58:13 +0300
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
        "rdunlap@infradead.org" <rdunlap@infradead.org>
Subject: Re: [PATCH v7 1/2] fTPM: firmware TPM running in TEE
Message-ID: <20190703065813.GA12724@apalos>
References: <20190625201341.15865-1-sashal@kernel.org>
 <20190625201341.15865-2-sashal@kernel.org>
 <673dd30d03e8ed9825bb46ef21b2efef015f6f2a.camel@linux.intel.com>
 <20190626235653.GL7898@sasha-vm>
 <b688e845ccbe011c54b10043fbc3c0de8f0befc2.camel@linux.intel.com>
 <20190627133004.GA3757@apalos>
 <0893dc429d4c3f3b52d423f9e61c08a5012a7519.camel@linux.intel.com>
 <20190702142109.GA32069@apalos>
 <CY4PR21MB0279B99FB0097309ADE83809BCF80@CY4PR21MB0279.namprd21.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CY4PR21MB0279B99FB0097309ADE83809BCF80@CY4PR21MB0279.namprd21.prod.outlook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Thirupathaiah,
> 
> First of all, Thanks a lot for trying to test the driver. 
> 
np

[...]
> > I managed to do some quick testing in QEMU.
> > Everything works fine when i build this as a module (using IBM's TPM 2.0
> > TSS)
> > 
> > - As module
> > # insmod /lib/modules/5.2.0-rc1/kernel/drivers/char/tpm/tpm_ftpm_tee.ko
> > # getrandom -by 8
> > randomBytes length 8
> > 23 b9 3d c3 90 13 d9 6b
> > 
> > - Built-in
> > # dmesg | grep optee
> > ftpm-tee firmware:optee: ftpm_tee_probe:tee_client_open_session failed,
> > err=ffff0008
> This (0xffff0008) translates to TEE_ERROR_ITEM_NOT_FOUND.
> 
> Where is fTPM TA located in the your test setup? 
> Is it stitched into TEE binary as an EARLY_TA or 
> Is it expected to be loaded during run-time with the help of user mode OP-TEE supplicant?
> 
> My guess is that you are trying to load fTPM TA through user mode OP-TEE supplicant. 
> Can you confirm? 
I tried both

> If that is the true, 
> - In the case of driver built as a module (CONFIG_TCG_FTPM_TEE=m), this is works fine 
> as user mode supplicant is ready. 
> - In the built-in case (CONFIG_TCG_FTPM_TEE=y), 
> This would result in the above error 0xffff0008 as TEE is unable to find fTPM TA. 
Maybe i did something wrong and never noticed it wasn't built as an earlyTA

> 
> The expectation is that fTPM TA is built as an EARLY_TA (in BL32) so that
> U-boot and Linux driver stacks work seamlessly without dependency on supplicant.  
> 
You can add my tested-by tag for the module. I'll go back to testing it as
built-in at some point in real hardware and let you know if i have any issues.

If someone's is interested in the QEMU testing: 
1. compile this https://github.com/jbech-linaro/manifest/blob/ftpm/README.md
2. replace the whole linux kernel on the root-dir with a latest version + fTPM 
char driver
3. Apply a hack on kernel and disable dynamic shm (Need for this depends on 
kernel + op-tee version)

diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
index 1854a3db..7aea8a5 100644
--- a/drivers/tee/optee/core.c
+++ b/drivers/tee/optee/core.c
@@ -588,13 +588,15 @@ static struct optee *optee_probe(struct device_node *np)
        /*
         * Try to use dynamic shared memory if possible
         */
+#if 0
        if (sec_caps & OPTEE_SMC_SEC_CAP_DYNAMIC_SHM)
                pool = optee_config_dyn_shm();
+#endif

        /*
         * If dynamic shared memory is not available or failed - try static one
         */
-       if (IS_ERR(pool) && (sec_caps & OPTEE_SMC_SEC_CAP_HAVE_RESERVED_SHM))
+       if (sec_caps & OPTEE_SMC_SEC_CAP_HAVE_RESERVED_SHM)
                pool = optee_config_shm_memremap(invoke_fn, &memremaped_shm);

        if (IS_ERR(pool))


For the module part:
Tested-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
