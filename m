Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F72EC32773
	for <linux-doc@archiver.kernel.org>; Fri, 19 Aug 2022 14:10:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348949AbiHSOKQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 19 Aug 2022 10:10:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348475AbiHSOKP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 19 Aug 2022 10:10:15 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79861E3C33
        for <linux-doc@vger.kernel.org>; Fri, 19 Aug 2022 07:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660918211; x=1692454211;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mKhPDUTDoJ9xQwLcyUTPNjwK1Ey1pyO43m5PHk29iL0=;
  b=X56B83JgwS5MHIvaqaY2xAwTjtJBi5cp+t/OTkwVbyCS2h1SlZW0p8Yq
   aZydTITtyhH45VkLV8FQWjOr2Bl/WKP+wbpExncuSqjlrhzoBYhAmCDIe
   S6NWQSw0cAE6YgSeg7JTUk//solNrDYe9sKsmr4Y0JzMMR304jdNg+4n3
   PvHNGUKsD9lr/jkh5PNgdA0noOBj0r3vupsrXTngebbaYzQUNHVljkEXC
   pmUvOfZ96A19ss8zzphQ04bSWUjP8frq9NolmNDUCpG7Y5cVEwLCYuPhu
   E9sZrBGzICZIqoDEo7LSgl6P0HND0zglvoCg7Ax8nBjHoWRd/OcLse04l
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="290585852"
X-IronPort-AV: E=Sophos;i="5.93,248,1654585200"; 
   d="scan'208";a="290585852"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2022 07:10:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,248,1654585200"; 
   d="scan'208";a="584669588"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 19 Aug 2022 07:09:58 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oP2hB-0001VJ-2y;
        Fri, 19 Aug 2022 14:09:57 +0000
Date:   Fri, 19 Aug 2022 22:08:57 +0800
From:   kernel test robot <lkp@intel.com>
To:     Wu XiangCheng <bobwxc@email.cn>
Cc:     kbuild-all@lists.01.org,
        Linux Memory Management List <linux-mm@kvack.org>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        linux-doc@vger.kernel.org
Subject: [linux-next:master 2059/2265] htmldocs:
 Documentation/translations/zh_CN/process/5.Posting.rst:197: WARNING:
 undefined label: cn_email_clients (if the link has no caption the label must
 precede a section header)
Message-ID: <202208192207.a0rAM0nj-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Documentation/translations/zh_CN/process/email-clients.rst
tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8755ae45a9e8ae883fa7f4eb0162830c55aacf14
commit: d7aeaebb920f61af0d0a8159865617d6a2d1a2ad [2059/2265] docs/zh_CN: Update zh_CN/process/email-clients.rst to 5.19
reproduce:
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=d7aeaebb920f61af0d0a8159865617d6a2d1a2ad
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout d7aeaebb920f61af0d0a8159865617d6a2d1a2ad
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Documentation/translations/zh_CN/process/5.Posting.rst:197: WARNING: undefined label: cn_email_clients (if the link has no caption the label must precede a section header)

vim +197 Documentation/translations/zh_CN/process/5.Posting.rst

ea09bbd4ce77dd Alex Shi      2019-04-01  192  
75cc66836d9eea Wu XiangCheng 2021-03-05  193   - 您确定您的邮件发送程序不会损坏补丁吗？被邮件客户端更改空白或修饰了行的补丁
75cc66836d9eea Wu XiangCheng 2021-03-05  194     无法被另一端接受，并且通常不会进行任何详细检查。如果有任何疑问，先把补丁寄
75cc66836d9eea Wu XiangCheng 2021-03-05  195     给你自己，让你自己确定它是完好无损的。
ea09bbd4ce77dd Alex Shi      2019-04-01  196  
d5187f5c1c0e82 Alex Shi      2019-04-01 @197     :ref:`Documentation/translations/zh_CN/process/email-clients.rst <cn_email_clients>`
75cc66836d9eea Wu XiangCheng 2021-03-05  198     提供了一些有用的提示，可以让特定的邮件客户端正常发送补丁。
ea09bbd4ce77dd Alex Shi      2019-04-01  199  
75cc66836d9eea Wu XiangCheng 2021-03-05  200   - 你确定你的补丁没有荒唐的错误吗？您应该始终通过scripts/checkpatch.pl检查
75cc66836d9eea Wu XiangCheng 2021-03-05  201     补丁程序，并解决它提出的问题。请记住，checkpatch.pl，虽然体现了对内核补丁
75cc66836d9eea Wu XiangCheng 2021-03-05  202     应该是什么样的大量思考，但它并不比您聪明。如果修复checkpatch.pl给的问题会
ea09bbd4ce77dd Alex Shi      2019-04-01  203     使代码变得更糟，请不要这样做。
ea09bbd4ce77dd Alex Shi      2019-04-01  204  

:::::: The code at line 197 was first introduced by commit
:::::: d5187f5c1c0e829ecd7c143196a1a9c447f7ac2d docs/zh_CN: redirect the email-clients link to Chinese version

:::::: TO: Alex Shi <alex.shi@linux.alibaba.com>
:::::: CC: Jonathan Corbet <corbet@lwn.net>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
