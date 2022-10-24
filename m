Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9CD3C38A2D
	for <linux-doc@archiver.kernel.org>; Mon, 24 Oct 2022 15:27:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbiJXP1A (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 24 Oct 2022 11:27:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231444AbiJXP0m (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 Oct 2022 11:26:42 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C620192D9E
        for <linux-doc@vger.kernel.org>; Mon, 24 Oct 2022 07:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666620737; x=1698156737;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=5BWA8HtybYDBAXbKOH3eLjQIvuuPCuZpDFuivt4pCmU=;
  b=WCSTKHg3bHxFs2yGIjwYEM8wZt3depQSLeX3vNkkerYBrUkFpXxqGdk4
   fxH6BcSaI+LeoLgLEl9LV8Utiq7a3oDOw1/H79oZi1Y5fk/chd71ugAg+
   yIzHZ1g7I/Ms9G1yiih1M1EcoVUylbo0JwQssYlH1oF14Q4X+aaVsyQev
   hF1WbuYYmGXbhoV75k8qN0AtSObB1HzaBRbh4DkOILMbz4hTLdSSXpd94
   M/vdxo74moT0qIjbTNz58I2Dqwiy1NW+x2n6gxNpKws90XzOSP6mNxRxo
   M047XgtaN060mxb0GwEzQZQ1H+qZRHJFtMNDRSg3lVXlezQFgqGYaHj9u
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="309105086"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; 
   d="scan'208";a="309105086"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2022 06:40:30 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="662433420"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; 
   d="scan'208";a="662433420"
Received: from mkwapuli-mobl.ger.corp.intel.com (HELO [10.213.4.149]) ([10.213.4.149])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2022 06:40:25 -0700
Message-ID: <2a1b07af-81b1-4ed7-b3e2-3e9b98191137@linux.intel.com>
Date:   Mon, 24 Oct 2022 15:40:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v5 01/10] gna: add PCI driver module
Content-Language: en-US
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Olof Johansson <olof@lixom.net>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
        Tomasz Jankowski <tomasz1.jankowski@intel.com>,
        Jianxun Zhang <jianxun.zhang@linux.intel.com>
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
 <20221020175334.1820519-2-maciej.kwapulinski@linux.intel.com>
 <Y1IeJplXNHM+VvCJ@kroah.com>
From:   Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
In-Reply-To: <Y1IeJplXNHM+VvCJ@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 10/21/2022 6:20 AM, Greg Kroah-Hartman wrote:
> On Thu, Oct 20, 2022 at 07:53:25PM +0200, Maciej Kwapulinski wrote:
>> Add a new PCI driver for Intel(R) Gaussian & Neural Accelerator
> Please drop all of the (R) stuff in here, and in the Kconfig file and in
> the .c files.  If your lawyers insist on it, please point them at me and
> I will be glad to discuss it with them.
>
>>  Documentation/gpu/drivers.rst    |  1 +
>>  Documentation/gpu/gna.rst        | 64 ++++++++++++++++++++++++++++++++
> Why not just put the tiny documentation file in the .c code itself?
> That way it stays up to date and might actually be noticed?
>
>> --- /dev/null
>> +++ b/drivers/gpu/drm/gna/Kconfig
>> @@ -0,0 +1,12 @@
>> +#
>> +# Intel(R) Gaussian & Neural Accelerator (Intel(R) GNA)
> Again, drop the (R) stuff.
>
> And no SPDX line?
>
>> +#
>> +
>> +config DRM_GNA
>> +	tristate "Intel(R) Gaussian & Neural Accelerator (Intel(R) GNA)"
>> +	depends on X86 && PCI
> Why is this x86 only?  Please let it build on other arches.
>
>> +	help
>> +	  This option enables the Intel(R) Gaussian & Neural Accelerator
>> +	  (Intel(R) GNA) driver: gna
>> +	  Information about functionality is in
>> +	  Documentation/gpu/gna.rst
> See, you changed this from the first v5 version you sent :(

actually I've sent patch v4 (once) and patch v5 (once).  according to change log in cover letter:

·v4->v5:$
·-·indentation·fixed·in·drivers/gpu/drm/gna/Kconfig$

>
> Also, this needs a lot more information, including the module name that
> will be built and you can drop the documentation line.
>
>> diff --git a/drivers/gpu/drm/gna/gna_device.c b/drivers/gpu/drm/gna/gna_device.c
>> new file mode 100644
>> index 000000000000..960b4341c18e
>> --- /dev/null
>> +++ b/drivers/gpu/drm/gna/gna_device.c
>> @@ -0,0 +1,8 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +// Copyright(c) 2017-2022 Intel Corporation
>> +
>> +#include <linux/module.h>
>> +
>> +MODULE_AUTHOR("Intel Corporation");
>> +MODULE_DESCRIPTION("Intel(R) Gaussian & Neural Accelerator (Intel(R) GNA) Driver");
>> +MODULE_LICENSE("GPL");
> No, that's not ok.  Don't add a file that does nothing.  Only add it
> when you need it.
well, it provides metadata
>
>
>> diff --git a/drivers/gpu/drm/gna/gna_device.h b/drivers/gpu/drm/gna/gna_device.h
>> new file mode 100644
>> index 000000000000..4cc92f27765a
>> --- /dev/null
>> +++ b/drivers/gpu/drm/gna/gna_device.h
>> @@ -0,0 +1,9 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/* Copyright(c) 2017-2022 Intel Corporation */
>> +
>> +#ifndef __GNA_DEVICE_H__
>> +#define __GNA_DEVICE_H__
>> +
>> +#define DRIVER_NAME		"gna"
> This can be KBUILD_MODNAME and then the file isn't needed at all.
>
>> +
>> +#endif /* __GNA_DEVICE_H__ */
>> diff --git a/drivers/gpu/drm/gna/gna_pci.c b/drivers/gpu/drm/gna/gna_pci.c
>> new file mode 100644
>> index 000000000000..6bd00c66f3a7
>> --- /dev/null
>> +++ b/drivers/gpu/drm/gna/gna_pci.c
>> @@ -0,0 +1,32 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +// Copyright(c) 2017-2022 Intel Corporation
>> +
>> +#include <linux/module.h>
>> +#include <linux/pci.h>
>> +
>> +#include "gna_device.h"
>> +#include "gna_pci.h"
>> +
>> +int gna_pci_probe(struct pci_dev *pcidev, const struct pci_device_id *pci_id)
>> +{
>> +	int err;
>> +
>> +	err = pcim_enable_device(pcidev);
>> +	if (err)
>> +		return err;
>> +
>> +	err = pcim_iomap_regions(pcidev, BIT(0), pci_name(pcidev));
>> +	if (err)
>> +		return err;
>> +
>> +	pci_set_master(pcidev);
>> +
>> +	return 0;
>> +}
>> +
>> +static struct pci_driver gna_pci_driver = {
>> +	.name = DRIVER_NAME,
>> +	.probe = gna_pci_probe,
>> +};
>> +
>> +module_pci_driver(gna_pci_driver);
>> diff --git a/drivers/gpu/drm/gna/gna_pci.h b/drivers/gpu/drm/gna/gna_pci.h
>> new file mode 100644
>> index 000000000000..b651fa2e6ea1
>> --- /dev/null
>> +++ b/drivers/gpu/drm/gna/gna_pci.h
>> @@ -0,0 +1,12 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/* Copyright(c) 2017-2022 Intel Corporation */
>> +
>> +#ifndef __GNA_PCI_H__
>> +#define __GNA_PCI_H__
>> +
>> +struct pci_device_id;
>> +struct pci_dev;
>> +
>> +int gna_pci_probe(struct pci_dev *dev, const struct pci_device_id *id);
> This is not exported, nor should it be, so you do not need it in the .h
> file.
>
> This whole patch can be one .c file, not this mess of tiny ones.

I just wanted to have file's final render from very beginning.


