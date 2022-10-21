Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D3F1C43219
	for <linux-doc@archiver.kernel.org>; Fri, 21 Oct 2022 11:57:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbiJUL5d (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 Oct 2022 07:57:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230203AbiJUL5a (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Oct 2022 07:57:30 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C66BC263951
        for <linux-doc@vger.kernel.org>; Fri, 21 Oct 2022 04:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666353449; x=1697889449;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=/S5sbckmBratQj0/GUalMmZBADiH48Uig1Bx5YjGDE0=;
  b=FpO/bPHq1uqizHLlNJGuTK3Bpc+Uy15mJXQ3D4fWwCSpzwKXCBa+ZhMu
   k+pcpH4CbCPbls/8WY4YvOvKe1uDwtvMxNsksWj/J92rlQ9EQwZVWrT0j
   rGm3LOuPI5abmIoojHd1zCgzv5whVoNmFIT/3efMigYmeVjXHNCOtPiQp
   woiBF3P0WKK/DXCke6s6QsVbajwI1cMxJRS9MbkfR0W8C9ylgfgIgdRrX
   q8jSeY+hjkW/u8PtCcrZIyUKaGKIc92m2+0qctqcVmcwimEA2HW5Eujud
   JRfRErCEWvUT/YSxBRQ7aVwEqGQRvJOvw0cFYM1Dh7Zzm6bDeW6/r7iKG
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="369033706"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; 
   d="scan'208";a="369033706"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2022 04:57:28 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="773010716"
X-IronPort-AV: E=Sophos;i="5.95,200,1661842800"; 
   d="scan'208";a="773010716"
Received: from mkwapuli-mobl.ger.corp.intel.com (HELO [10.213.29.238]) ([10.213.29.238])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2022 04:57:23 -0700
Message-ID: <babed2a4-5d8d-1c2b-d8f3-7db123bf134b@linux.intel.com>
Date:   Fri, 21 Oct 2022 13:57:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v5 07/10] gna: add GNA_COMPUTE ioctl
Content-Language: en-US
From:   Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
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
 <f72f1d2d-b0cc-6130-05d6-4ec5f5c9d914@linux.intel.com>
In-Reply-To: <f72f1d2d-b0cc-6130-05d6-4ec5f5c9d914@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 10/21/2022 1:52 PM, Maciej Kwapulinski wrote:
> On 10/21/2022 11:30 AM, Linus Walleij wrote:
>> Hi Maciej,
> Hi Walleij

oo sorry,  hi Linus

I should say


