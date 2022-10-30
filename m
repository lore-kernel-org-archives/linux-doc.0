Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F663C38A02
	for <linux-doc@archiver.kernel.org>; Sun, 30 Oct 2022 18:52:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbiJ3SwR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 30 Oct 2022 14:52:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbiJ3SwQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 30 Oct 2022 14:52:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4175B484
        for <linux-doc@vger.kernel.org>; Sun, 30 Oct 2022 11:52:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 509E460F2F
        for <linux-doc@vger.kernel.org>; Sun, 30 Oct 2022 18:52:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51419C433D6;
        Sun, 30 Oct 2022 18:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667155934;
        bh=xfbHTZtsv4ooZR7yI6bz2q2hHWAAqWrm4tRnwf9d+Po=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kfwA9aS7uCv3b6xcVakRiQ9dc5UF6wvy6XcUaX/3DwigCDgRIAuFgIcC/weET53zM
         2WSaYWnPPj2W9+Vx/Eh3HWun9yG/POiQg/UuU4tp7pi1VEDLNZgP0QYufJUKXKAASJ
         72wieVdkwS7Yi1eU1jKvG1G97oF5cUDALw4G9BuFq4mskoWaS/sjTDZn2QAuWxCbmN
         Ul56AXbVvJUmxfjDP8uwIFRI4n83/RSJgohtpXktJXA6S2O3keUYL2hpr8J9ShF3ap
         h+Btgb8Xv+bDbQHnRBJB6ZDIzCcsP2BprpvC4dG7vgVFP4w9eVQ283bXQ0zIjKMpHZ
         2B8njMPNcEGSA==
From:   SeongJae Park <sj@kernel.org>
To:     kernel test robot <lkp@intel.com>
Cc:     SeongJae Park <sjpark@amazon.de>, damon@lists.linux.dev,
        oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [sj:damon/next 26/37] htmldocs: Documentation/admin-guide/mm/damon/guide.rst:5: WARNING: Duplicate explicit target name: "page".
Date:   Sun, 30 Oct 2022 18:52:12 +0000
Message-Id: <20221030185212.104281-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <202210301953.0QNM3R4h-lkp@intel.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 30 Oct 2022 19:48:49 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/=
> next
> head:   be45b44bd28cc8b20ccb1197147389e75d815e68
> commit: 1304ee0155423bb664d6b4342faa02765bf393bb [26/37] Docs/DAMON: Add mo=
> re DAMON docs for external DAMON-only html documents
> reproduce:
>         # https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git/commit/?id=3D1304ee0155423bb664d6b4342faa02765bf393bb
>         git remote add sj https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git
>         git fetch --no-tags sj damon/next
>         git checkout 1304ee0155423bb664d6b4342faa02765bf393bb
>         make menuconfig
>         # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
>         make htmldocs
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>

Thank you, I fixed these and pushed[1,2]!

[1] https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git/commit/?h=damon/next&id=4e00b5e54958681516214cdb674160f7f8d0442c
[2] https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git/commit/?h=damon/next&id=458173b3a762f83527d35cff2ca2693bb17d7911


Thanks,
SJ

[...]
