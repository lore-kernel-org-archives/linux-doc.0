Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9364C4332F
	for <linux-doc@archiver.kernel.org>; Thu, 20 Oct 2022 16:14:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbiJTQOS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Oct 2022 12:14:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229876AbiJTQOQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Oct 2022 12:14:16 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AB105A8C1
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 09:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666282455; x=1697818455;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Obl3XRsotPNVfSb3YBRLJ82NaOc1BT0Rdom2xZ2f5D8=;
  b=W8GLf4vZdI7loIrGmRTVKJVm14IPcPh/0HOOH7fKBjgU08dAIUSK8jBF
   SUa7xdJGV7Y8QHUedHgX7Tx07OD+Uf2yRWqF0zDC9dYvFDIVuoDie448c
   PhX3bHTNv71HycMzldGn5G3MNt/iylyr0kSyT1QnSS5sxETMsZ7DA0yrT
   o4ViOmNIFpeF3oZL609PSOEfKoEb0bIi80bqj7RzPyJ6IpxGJBHvc9Zo5
   mp7lsbhBymEAheVDUkAb9gyV99/or76kzMwae/l1eMGEEQC/q32YDlKun
   n0/ntCZhPpnwlqv2OwseIL0/RTBv1NqNsO8UP/wDRWLp+LKJNvZFIvtxO
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="308439226"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; 
   d="scan'208";a="308439226"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 09:12:01 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="734938986"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; 
   d="scan'208";a="734938986"
Received: from mkwapuli-mobl.ger.corp.intel.com (HELO [10.213.28.120]) ([10.213.28.120])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 09:11:53 -0700
Message-ID: <f3e777c5-c61c-4820-83dd-9bc33932e9c8@linux.intel.com>
Date:   Thu, 20 Oct 2022 18:11:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v4 01/10] gna: add PCI driver module
Content-Language: en-US
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
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
        Jianxun Zhang <jianxun.zhang@linux.intel.com>,
        maciej.kwapulinski@linux.intel.com
References: <20221020133525.1810728-1-maciej.kwapulinski@intel.com>
 <20221020133525.1810728-2-maciej.kwapulinski@intel.com>
 <Y1FcCDhWiQG2p3wW@kroah.com>
From:   Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
In-Reply-To: <Y1FcCDhWiQG2p3wW@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 10/20/2022 4:32 PM, Greg Kroah-Hartman wrote:
> On Thu, Oct 20, 2022 at 03:35:16PM +0200, Kwapulinski, Maciej wrote:
>> Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wiadomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiekolwiek przegladanie lub rozpowszechnianie jest zabronione.
>> This e-mail and any attachments may contain confidential material for the sole use of the intended recipient(s). If you are not the intended recipient, please contact the sender and delete all copies; any review or distribution by others is strictly prohibited.
> This ensures that we can not do anything with these patches.
>
> Now deleted.
>
> greg k-h


indeed,

sorry about that. When I'm done with smtp server footer I'll send 'PATCH v5' unless you have other suggestion for best practice in this case.

