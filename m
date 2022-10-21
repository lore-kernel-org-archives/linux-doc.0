Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB12C4332F
	for <linux-doc@archiver.kernel.org>; Fri, 21 Oct 2022 11:53:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbiJULxn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 Oct 2022 07:53:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbiJULxm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Oct 2022 07:53:42 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2C7F24B337
        for <linux-doc@vger.kernel.org>; Fri, 21 Oct 2022 04:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666353221; x=1697889221;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Hs0GVoVBHHzGSrFvFA45eSrPK15Ebn9oBq+vLB4jqQE=;
  b=A/T+RRJ3ApRNb1VZx8vp2ChUvh/neduDoaKlFuAyck65QTWVQn453H4P
   nNRN0AhpI7IEWa1TAdQqVGKzWoDw/sPKBOr1FVfd48rt/V6EKqeSdxtHg
   rQRQF7W+EgdMlYfpBaZjmXML9orREwWqdOOWe6xPXI1/lFrw6T0NpYvod
   YMQ5ldlNi5CzE39ZTLDes+09uv817ZOkYeIl//FYoyfBX7Z6Nm828Cdyx
   2rfRq15lDHGD4FwQBnmHqst5uQji18Vf21ZnXMs9vm/RKzTptTdN+ZOKH
   fsECc2VrFTslciHTie0SJqGkfzwUC4ZwELZAqAxYh62GaatslUlSr5S09
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="287386448"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; 
   d="scan'208";a="287386448"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2022 04:52:49 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="755769717"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; 
   d="scan'208";a="755769717"
Received: from mkwapuli-mobl.ger.corp.intel.com (HELO [10.213.29.238]) ([10.213.29.238])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2022 04:52:44 -0700
Message-ID: <f72f1d2d-b0cc-6130-05d6-4ec5f5c9d914@linux.intel.com>
Date:   Fri, 21 Oct 2022 13:52:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v5 07/10] gna: add GNA_COMPUTE ioctl
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Olof Johansson <olof@lixom.net>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Tomasz Jankowski <tomasz1.jankowski@intel.com>,
        Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
        Anisha Dattatraya Kulkarni 
        <anisha.dattatraya.kulkarni@intel.com>,
        Jianxun Zhang <jianxun.zhang@linux.intel.com>
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
 <20221020175334.1820519-8-maciej.kwapulinski@linux.intel.com>
 <CACRpkdYDYUEx-hWNrUB5cXbH_2oXzRYc2pwn=4u5mivGn14eVw@mail.gmail.com>
From:   Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
In-Reply-To: <CACRpkdYDYUEx-hWNrUB5cXbH_2oXzRYc2pwn=4u5mivGn14eVw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 10/21/2022 11:30 AM, Linus Walleij wrote:
> Hi Maciej,
Hi Walleij
>
> thanks for your patch!
>
> On Thu, Oct 20, 2022 at 7:57 PM Maciej Kwapulinski
> <maciej.kwapulinski@linux.intel.com> wrote:
>
>> From: Tomasz Jankowski <tomasz1.jankowski@intel.com>
>>
>> This is the ioctl context part of score request + "do nothing" work queue
>> implementation. Work queue context actual part will be added by next patch.
>>
>> signed-off-by: Tomasz Jankowski <tomasz1.jankowski@intel.com>
>> Tested-by: Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>
>> Co-developed-by: Anisha Dattatraya Kulkarni <anisha.dattatraya.kulkarni@intel.com>
>> Signed-off-by: Anisha Dattatraya Kulkarni <anisha.dattatraya.kulkarni@intel.com>
>> Co-developed-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
>> Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
>> Co-developed-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
>> Signed-off-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
> This patch start to introduce the actual work processing IIUC.
>
> So there is some funny lingo used here that should be in the commit
> message:
>
> - Patches
> - Processes
> - Scores

patching operation here is in fact the operation of modifying the set of memory cells described by offsets (provided in score request during ioctl) with some values (also provided in the same score request during ioctl). memory cells pointed by offsets belong to memory regions (also being the part of the same score request).

Score requests are put by ioctl to gna_device::request_list FIFO queue and are later processed by gna_device::request_wq work thread one by one. request_wq is the entity that sends requests to GNA device, and just before doing so it 'PATCHES' the memory in a manner described by score request.  request_wq has exclusive access to GNA device.

'Score' is term taken from AI, but from the perspective above, where driver does not (have to) know what is passed to GNA device, maybe we should not use the term 'score' at all. Also, maybe 'patch' should also be renamed on something more agnostic/generic.

