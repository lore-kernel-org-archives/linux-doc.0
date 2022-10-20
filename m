Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43F82C433FE
	for <linux-doc@archiver.kernel.org>; Thu, 20 Oct 2022 18:02:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbiJTSCX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Oct 2022 14:02:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiJTSA6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Oct 2022 14:00:58 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 934F0DEF24
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 11:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666288801; x=1697824801;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=RI4V85sZifCZcDR0JmjeNLGR0AB66tKV7JAJj1roIKU=;
  b=Ab8wcEnCGSRAUa7nimhW+ei67LzjhkdTYmlSYsR8A5DDec59ia1zentB
   LtNCazHvuaDZpAVpVCQP5tCoy/YJGlVuHz0u1tqTAogimtXSg4NBamOTx
   CI/oIVRXTn0D6YZwVfGnl7z1Ujih3ecaWHWcKTpK31P4yHFz8IklVzSWy
   N3nVub3z6EqZ78JfGE/E0mNvSNJ4NIPijfW35hkNbZRnjWngmasU9M+/f
   v19HpluZ1dcninP+8l5TcLzWeePF9EnRb4AKhiIjaTaNf2k8ZDqtr94iN
   gAhSAgQ8K40ef3xkjYeBfHSnqf2S5DKLHuRHS5Uuu6bAoX4FAhOQd1onQ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="286511335"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; 
   d="scan'208";a="286511335"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 10:59:16 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="719210278"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; 
   d="scan'208";a="719210278"
Received: from mkwapuli-mobl.ger.corp.intel.com (HELO [10.213.28.120]) ([10.213.28.120])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 10:59:11 -0700
Message-ID: <36fdd4c2-6922-146d-da8b-37161b467acb@linux.intel.com>
Date:   Thu, 20 Oct 2022 19:59:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v4 01/10] gna: add PCI driver module
Content-Language: en-US
To:     Matthew Wilcox <willy@infradead.org>,
        "Kwapulinski, Maciej" <maciej.kwapulinski@intel.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
References: <20221020133525.1810728-1-maciej.kwapulinski@intel.com>
 <20221020133525.1810728-2-maciej.kwapulinski@intel.com>
 <Y1FWtqtX7QSafbGt@casper.infradead.org>
From:   Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
In-Reply-To: <Y1FWtqtX7QSafbGt@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 10/20/2022 4:09 PM, Matthew Wilcox wrote:
> On Thu, Oct 20, 2022 at 03:35:16PM +0200, Kwapulinski, Maciej wrote:
>> +++ b/drivers/gpu/drm/gna/Kconfig
>> @@ -0,0 +1,12 @@
>> +#
>> +# Intel(R) Gaussian & Neural Accelerator (Intel(R) GNA)
>> +#
>> +
>> +config DRM_GNA
>> +	tristate "Intel(R) Gaussian & Neural Accelerator (Intel(R) GNA)"
>> +	depends on X86 && PCI
>> +  help
> This is mangled; 'help' should be indented by a tab, not two spaces.


Matthew,

thank you for comment. has just been fixed in v5

