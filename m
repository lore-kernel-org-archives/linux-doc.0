Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29EC3C433E6
	for <linux-doc@archiver.kernel.org>; Tue, 16 Feb 2021 17:49:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 053EF64E28
	for <linux-doc@archiver.kernel.org>; Tue, 16 Feb 2021 17:49:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230520AbhBPRtv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 16 Feb 2021 12:49:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231255AbhBPRto (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Feb 2021 12:49:44 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD531C061574;
        Tue, 16 Feb 2021 09:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=Ecy3ORG/TtPYsNSmM3ZmPtvz/O2yoEZ77T6UXCpnGlY=; b=nZf55ZMmfRXf9JjKNjvQfLcr1J
        7AJwdIetb9UWTZx6gZwXNV144IhYJsoWD11301lUomfHbCLJfFd3/sW6JfVEXlSMoGkG9tA8lands
        wdE/GzQxGiNeIs2CI7VdkJ+BagCNWaRFGSkDuzhxm5JqotK1AjxSkx8v1xaGjY3PITPGeqxHu3nAq
        004vyH0i/klPaHehflm7ulhl0/5oXLRO0DPkMcO1kNEKWsWKFQ77WRYJTz0KzKCymSDHVWBtcUjJl
        XxHExMdZ87VrO9aNGSI1VtDfwMKZ47WtecqdeNaGco0GWtrmYumTlnN9hG+1ak/68TCS1cabJgXwX
        pM+gW/4Q==;
Received: from [2601:1c0:6280:3f0::b669]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1lC4Su-0002pQ-HT; Tue, 16 Feb 2021 17:48:49 +0000
Subject: Re: [PATCH v1 01/12] gna: add driver module
To:     Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Tomasz Jankowski <tomasz1.jankowski@intel.com>,
        Savo Novakovic <savox.novakovic@intel.com>,
        Jianxun Zhang <jianxun.zhang@linux.intel.com>
References: <20210216160525.5028-1-maciej.kwapulinski@linux.intel.com>
 <20210216160525.5028-2-maciej.kwapulinski@linux.intel.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3ded75ec-d623-289a-07f6-549b7576d550@infradead.org>
Date:   Tue, 16 Feb 2021 09:48:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210216160525.5028-2-maciej.kwapulinski@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi--

On 2/16/21 8:05 AM, Maciej Kwapulinski wrote:
> diff --git a/Documentation/misc-devices/gna.rst b/Documentation/misc-devices/gna.rst
> new file mode 100644
> index 000000000000..ed3d5a89271d
> --- /dev/null
> +++ b/Documentation/misc-devices/gna.rst
> @@ -0,0 +1,48 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +=====================================================
> +Intel(R) Gaussian & Neural Accelerator (Intel(R) GNA)
> +=====================================================
> +
> +Acronyms
> +--------
> +GNA	- Gaussian & Neural Accelerator
> +GMM	- Gaussian Mixer Model
> +CNN	- Convolutional Neural Network
> +RNN	- Recurrent Neural Networks
> +DNN	- Deep Neural Networks
> +
> +Introduction
> +------------
> +The Intel(R) GNA is an Internal PCI fixed device available on several Intel platforms/SoCs.

                          internal

> +Feature set depends on the Intel Chipset SKU.

                                    chipset

> +
> +Intel(R) GNA provides hardware accelerated computation for GMMs and Neural Networks.
> +It supports several layer types: affine, recurrent, and convolutional among others.
> +Hardware also provides helper layer types for copying and transposing matrices.
> +
> +Linux Driver
> +------------
> +Intel(R) GNA driver is a pci driver as Intel(R) GNA is a PCI device.

                            PCI
although that entire sentence seems to be unneeded IMO.

> +The driver also registers a character device to expose file operations via dev node.
> +
> +The driver probes/removes PCI device, implements file operations, handles runtime
> +power management, and interacts with hardware through MMIO registers.
> +
> +Multiple processes can independently file many requests to the driver. These requests are
> +processed in a FIFO manner. The hardware can process one request at a time by using a FIFO
> +queue.
> +
> +IOCTL
> +-----
> +Intel(R) GNA driver controls the device through IOCTL interfaces.
> +Following IOCTL commands are supported:
> +  GNA_IOCTL_PARAM_GET gets driver and device capabilities.
> +
> +  GNA_IOCTL_MEMORY_MAP lock user pages and GNA MMU setups for DMA transfer.

                          locks

> +
> +  GNA_IOCTL_MEMORY_UNMAP unlocks user pages and releases GNA MMU structures.
> +
> +  GNA_IOCTL_COMPUTE submits a request to the device queue.
> +
> +  GNA_IOCTL_WAIT blocks and waits on the submitted request.


-- 
~Randy

