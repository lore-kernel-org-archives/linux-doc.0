Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 76F7D7D04D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 17 Apr 2019 17:26:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732110AbfDQR0b (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 17 Apr 2019 13:26:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:39708 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729641AbfDQR0a (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 17 Apr 2019 13:26:30 -0400
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DC931206BA;
        Wed, 17 Apr 2019 17:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1555521990;
        bh=oefqZujA30z4o7uM/+Cm/lpuqknG6U09RqnQclQJtEY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WlCYeDiukabEvrPaR85qY3M5wrZcG0iP1+8pB/77p+Tz/DzrFg5eBaasX+zRxu0Oh
         ocnYkKbm3K8d3UsyPi3/nZ6AbcjsjYQFmKLpxULFmctb33XBlhbgu1/7VCVqCQJW8r
         ZKinNeDF3A546TlZskxwFKG+Xzkkwj39mlaGW2cs=
Date:   Wed, 17 Apr 2019 13:26:28 -0400
From:   Sasha Levin <sashal@kernel.org>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     peterhuewe@gmx.de, jarkko.sakkinen@linux.intel.com, jgg@ziepe.ca,
        corbet@lwn.net, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-kernel@microsoft.com, thiruan@microsoft.com,
        bryankel@microsoft.com
Subject: Re: [PATCH v3 2/2] ftpm: add documentation for ftpm driver
Message-ID: <20190417172628.GF435@sasha-vm>
References: <20190415155636.32748-1-sashal@kernel.org>
 <20190415155636.32748-3-sashal@kernel.org>
 <b2c1b45e-515d-1d91-e3d9-5f9078078cae@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <b2c1b45e-515d-1d91-e3d9-5f9078078cae@metux.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 17, 2019 at 02:23:13PM +0200, Enrico Weigelt, metux IT consult wrote:
>On 15.04.19 17:56, Sasha Levin wrote:
>
>Hi,
>
>> +The driver acts as a thin layer that passes commands to and from a TPM> +implemented in firmware. The driver itself doesn't contain much logic
>and is> +used more like a dumb pipe between firmware and kernel/userspace.
>Is that TPM already used in production or yet an PoC ?
>IOW: can the protocol be changed ?

Sadly no, this is based on something that exists for a few years already
and we're trying to make Linux run on it.

--
Thanks,
Sasha
