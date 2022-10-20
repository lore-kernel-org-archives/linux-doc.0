Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B49BAC433FE
	for <linux-doc@archiver.kernel.org>; Thu, 20 Oct 2022 18:11:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbiJTSLS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Oct 2022 14:11:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230211AbiJTSLE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Oct 2022 14:11:04 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68BF51217DD
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 11:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666289454; x=1697825454;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ll9VpcmSRSS3DIgxTB+BtrbvfZxh0/dVfygp8On4h6g=;
  b=cBzXQZukoKZdh0hBGD7M7gtKQWfSktvILWe/L/jIU44cF9L7sjFGDegn
   nwhnRKLbsLVei1K1JvcsBr0GyV6tYaNalkkC+WFMzqcUrzjCJaqwr52xl
   FgV3PEihIxMzFL5ws73hL06Hr2YUPnETVyTWwT6+u1nSfhixRhEBtECvf
   mYaEF9S2HJhRFt2fCJFAxH6KHmiz/nXbjuvQla38Yztk+gJLbmRmNJZeL
   YvjPQRsls19STJMOtMIENq6rpDeyM3+evxg7ITMjeTAI8pU05sGCqWHVM
   5KGR7pJK+u8AlJPq39cZZ2jsnT4YUgN6jl1kvjVmMUbXepfEsa64PE1GO
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="287197811"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; 
   d="scan'208";a="287197811"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 11:10:27 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="629982135"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; 
   d="scan'208";a="629982135"
Received: from mkwapuli-mobl.ger.corp.intel.com (HELO [10.213.28.120]) ([10.213.28.120])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 11:10:21 -0700
Message-ID: <788ba9fe-534e-8fc9-aa40-c7a1217d0fb1@linux.intel.com>
Date:   Thu, 20 Oct 2022 20:10:18 +0200
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
 <f3e777c5-c61c-4820-83dd-9bc33932e9c8@linux.intel.com>
 <Y1GMwP1OUlhwAp03@kroah.com>
From:   Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
In-Reply-To: <Y1GMwP1OUlhwAp03@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 10/20/2022 8:00 PM, Greg Kroah-Hartman wrote:
> On Thu, Oct 20, 2022 at 06:11:49PM +0200, Maciej Kwapulinski wrote:
>> On 10/20/2022 4:32 PM, Greg Kroah-Hartman wrote:
>>> On Thu, Oct 20, 2022 at 03:35:16PM +0200, Kwapulinski, Maciej wrote:
>>>> Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wiadomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiekolwiek przegladanie lub rozpowszechnianie jest zabronione.
>>>> This e-mail and any attachments may contain confidential material for the sole use of the intended recipient(s). If you are not the intended recipient, please contact the sender and delete all copies; any review or distribution by others is strictly prohibited.
>>> This ensures that we can not do anything with these patches.
>>>
>>> Now deleted.
>>>
>>> greg k-h
>>
>> indeed,
>>
>> sorry about that. When I'm done with smtp server footer I'll send 'PATCH v5' unless you have other suggestion for best practice in this case.
> I am not even allowed to look at any of this at the moment with that
> footer.  Actually I wasn't even supposed to tell you this, I should have
> been forced to just delete it and move on to contributions that don't
> have legal entraptments in them :(
>
> greg k-h

I understand your point.

I also appreciate that you decided to tell it to me. I didn't receive these footers, so without your note it would be quite difficult to me to 'debug' it.

thank you

