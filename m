Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92808ECAAA1
	for <linux-doc@archiver.kernel.org>; Mon, 24 Oct 2022 14:46:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231809AbiJXOqA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 24 Oct 2022 10:46:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234121AbiJXOp0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 Oct 2022 10:45:26 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A605EFC1CB
        for <linux-doc@vger.kernel.org>; Mon, 24 Oct 2022 06:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666617745; x=1698153745;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bNuW7y/nj78n2mi90mRlpoh+xVlYoAISeFpKjMT825o=;
  b=d1mfkuVrMny8rIT7O96sjY1KfucTT6MRHnpKgXg8r7rLMEQr+j2LlpS4
   FcdrVSXr9L0hzxu/bXYj9OWae3kgPhfiTR15TVf+jJ1AksUYDkx+a+dPA
   pBOxMECzbZb1EndR6vK40SmdRsueeCA7UorBQhxQ6BV390gQAR15OCbaM
   vTheLHYvcXSzQY0eu10uz6L5nhfXgmxDFVNRKFGAi0LAGqWsb7DmNDl9s
   5oNieBfyF59n2dcAJutjiLJaoRVMs+WmUcia0W+z6O1uecY/1iNHPML9h
   ZnI1/gioCO4YEMoMzjW9cHYPX6sWLsSLpyq9Uh30JbP07uX4+p+KCN7Oa
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="393730161"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; 
   d="scan'208";a="393730161"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2022 06:22:23 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="736407795"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; 
   d="scan'208";a="736407795"
Received: from mkwapuli-mobl.ger.corp.intel.com (HELO [10.213.4.149]) ([10.213.4.149])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2022 06:22:19 -0700
Message-ID: <abd57af0-644f-15f9-6650-648e7449f4dd@linux.intel.com>
Date:   Mon, 24 Oct 2022 15:21:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v5 00/10] Driver of Intel(R) Gaussian & Neural Accelerator
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
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
 <Y1IdWVSgWhHZJ78X@kroah.com>
Content-Language: en-US
From:   Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
In-Reply-To: <Y1IdWVSgWhHZJ78X@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 10/21/2022 6:17 AM, Greg Kroah-Hartman wrote:
> On Thu, Oct 20, 2022 at 07:53:24PM +0200, Maciej Kwapulinski wrote:
>> Dear kernel maintainers,
> <snip>
>
> This really is v6, not v5, right?  Why send 2 v5 out?
>
> greg k-h


what do you mean?

