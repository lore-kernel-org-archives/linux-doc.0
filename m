Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E0A7C77B73
	for <linux-doc@archiver.kernel.org>; Sun,  4 Jun 2023 02:04:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbjFDCEH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 3 Jun 2023 22:04:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbjFDCEG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 3 Jun 2023 22:04:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86DD4DD
        for <linux-doc@vger.kernel.org>; Sat,  3 Jun 2023 19:04:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D62A6612ED
        for <linux-doc@vger.kernel.org>; Sun,  4 Jun 2023 02:04:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E197EC433D2;
        Sun,  4 Jun 2023 02:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685844244;
        bh=Bv6NDQo9VdNYdgQDQQYOlGCNwgLTTxAxcYNuPKEPEKs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=LSS02eHxu17/6WNVodQRQFHSmHAf1VyH2Ww70FKn4rxKQmTauKi4+6ccv9Tz4wPB6
         rfxWT4u+1F+JdOlogKFPA8czzdqWw3UbQCRMLLPUdV0ew2g80jKiLDxobGVLeVWFXN
         3xVQa4G+pUGWGj7dES3rQ1eLkgAgekcBOhPY6zb71ue2tYyqkjW3pqvdBgMI6oW4ki
         NxlXl6tT7GuKnCUH6/Xmg7s/vGJlKgH3Vr+cANnMS2A413e2qhC5g62E2nMc9X4luy
         mJy8FPj8aZf7oV3iagKRDl1jEkRf6w1V0HOJwSyPBmcnCo4AIlwo9Zoj5PkvXkh1Bv
         YCcSYDmPTKbJA==
Date:   Sun, 4 Jun 2023 11:04:00 +0900
From:   Masami Hiramatsu (Google) <mhiramat@kernel.org>
To:     kernel test robot <lkp@intel.com>
Cc:     oe-kbuild-all@lists.linux.dev,
        Bagas Sanjaya <bagasdotme@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: [trace:probes/core 16/16] htmldocs: Warning:
 Documentation/trace/fprobetrace.rst references a file that doesn't exist:
 Documentation/trace/fprobes.rst
Message-Id: <20230604110400.197a8c4e201ace830741ccf1@kernel.org>
In-Reply-To: <202306040144.aD72UzkF-lkp@intel.com>
References: <202306040144.aD72UzkF-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 4 Jun 2023 01:15:57 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace probes/core
> head:   438ae37afde3d24731cf23e5b77370e76218744e
> commit: 438ae37afde3d24731cf23e5b77370e76218744e [16/16] Documentation: tracing/probes: Add fprobe event tracing document
> reproduce:
>         # https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git/commit/?id=438ae37afde3d24731cf23e5b77370e76218744e
>         git remote add trace git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace
>         git fetch --no-tags trace probes/core
>         git checkout 438ae37afde3d24731cf23e5b77370e76218744e
>         make menuconfig
>         # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
>         make htmldocs
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306040144.aD72UzkF-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> Warning: Documentation/trace/fprobetrace.rst references a file that doesn't exist: Documentation/trace/fprobes.rst
> 

Oops, it should be fprobe.rst, instead of fprobes.rst...

Thanks,

> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
