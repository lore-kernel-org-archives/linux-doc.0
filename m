Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_DKIMWL_WL_HIGH autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 97BBA7D2EF
	for <lwn-linux-doc@archive.lwn.net>; Tue,  4 Jun 2019 20:10:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbfFDUJy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 4 Jun 2019 16:09:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:50832 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726211AbfFDUJy (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 4 Jun 2019 16:09:54 -0400
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 21ABA2070D;
        Tue,  4 Jun 2019 20:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559678993;
        bh=rsbL/iQgYUm8P310UyHh/V+bI7YMsHKg+pKvWOUOE0o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=t8VVDqEp6rkua7kxWfBtQMgvLtlaYMcv1ZtKfmYg11Ania77yZ9EA0glfMPSGKqeG
         4fdFHQvwJaXwuR+QrJxwJVU2Su6p4WsrOfFS9ZW/c5y9Q1+R0i5BNVoSSPgNN2hLcZ
         FOdvf+aRCMxTSjlm0e0DoSMeFJxihH9IZ4wsZ3j8=
Date:   Tue, 4 Jun 2019 16:09:51 -0400
From:   Sasha Levin <sashal@kernel.org>
To:     Sumit Garg <sumit.garg@linaro.org>
Cc:     peterhuewe@gmx.de,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        jgg@ziepe.ca, corbet@lwn.net,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org, linux-integrity@vger.kernel.org,
        Microsoft Linux Kernel List <linux-kernel@microsoft.com>,
        Thirupathaiah Annapureddy <thiruan@microsoft.com>,
        "Bryan Kelly (CSI)" <bryankel@microsoft.com>,
        tee-dev@lists.linaro.org
Subject: Re: [PATCH v4 1/2] fTPM: firmware TPM running in TEE
Message-ID: <20190604200951.GB29739@sasha-vm>
References: <20190530152758.16628-1-sashal@kernel.org>
 <20190530152758.16628-2-sashal@kernel.org>
 <CAFA6WYM1NrghG9qxUhrm76kopvBx9nmCL9XnRs11ysb2Yr0+Qw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAFA6WYM1NrghG9qxUhrm76kopvBx9nmCL9XnRs11ysb2Yr0+Qw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jun 04, 2019 at 11:45:52AM +0530, Sumit Garg wrote:
>On Thu, 30 May 2019 at 20:58, Sasha Levin <sashal@kernel.org> wrote:
>> +       /* Open context with TEE driver */
>> +       pvt_data->ctx = tee_client_open_context(NULL, ftpm_tee_match, NULL,
>> +                                               NULL);
>> +       if (IS_ERR(pvt_data->ctx)) {
>> +               dev_err(dev, "%s:tee_client_open_context failed\n", __func__);
>
>Is this well tested? I see this misleading error multiple times as
>follows although TEE driver works pretty well.

Yes, this was all functionally tested.

Why is this error message misleading? I'd be happy to fix it.

>Module built with "CONFIG_TCG_FTPM_TEE=y"
>
>[    1.436878] ftpm-tee tpm@0: ftpm_tee_probe:tee_client_open_context failed
>[    1.509471] ftpm-tee tpm@0: ftpm_tee_probe:tee_client_open_context failed
>[    1.517268] ftpm-tee tpm@0: ftpm_tee_probe:tee_client_open_context failed
>[    1.525596] ftpm-tee tpm@0: ftpm_tee_probe:tee_client_open_context failed

Does the TEE have the fTPM implementation and such? Could you provide
details about your testing environment (hardware, fTPM verions, etc)?

--
Thanks,
Sasha
