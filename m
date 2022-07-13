Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB067CCA479
	for <linux-doc@archiver.kernel.org>; Wed, 13 Jul 2022 16:14:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237165AbiGMQOJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 Jul 2022 12:14:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237127AbiGMQOG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Jul 2022 12:14:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2E2C33E30
        for <linux-doc@vger.kernel.org>; Wed, 13 Jul 2022 09:14:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5081A61B03
        for <linux-doc@vger.kernel.org>; Wed, 13 Jul 2022 16:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9AEFC3411E;
        Wed, 13 Jul 2022 16:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657728844;
        bh=IZ4lbr0QQR2cpYQsDk6nEI4H4gzY2dXgkKPRchZ7Y98=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XJBz34iF9w5bg0QVzw34go4EKR99EumNhLBoFIIr8SmA8lFldGTihFVu1CL2nVvDv
         ZdoK7SmPabp+5GQW2jWisbZO586CaIW3sLm7f81CEe/PfaT3rjwT6YNoJaWZF8bTfl
         FcMS52z8tc5bGuaXnlDMagy3FXhtNygztY9cZVeTLhBZSTZBZEey2XPEhTyMd/yg+x
         paYFd1IlP08nxQqwnolFJTt1F0a0kHbbeEZowcVK7hn9LGU6zXnWCYu+cOd2WO+4aR
         zNkK+msji46zSVFIrSb7ig3cp1jxLrjnVrYFWpVr75iS1lWLpknUyZqQY4UTrREpFw
         74RvXXryVbLoA==
From:   Conor Dooley <conor@kernel.org>
To:     hch@lst.de
Cc:     Tianyu.Lan@microsoft.com, iommu@lists.linux.dev,
        linux-doc@vger.kernel.org, lkp@intel.com, lkp@lists.01.org,
        ltykernel@gmail.com, oliver.sang@intel.com
Subject: Re: [EXTERNAL] [swiotlb] 44d89f2248: Kernel_panic-not_syncing:swiotlb_init_remap:nslabs=#too_small
Date:   Wed, 13 Jul 2022 17:11:34 +0100
Message-Id: <20220713161133.1707380-1-conor@kernel.org>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220713060246.GA13497@lst.de>
References: <20220713060246.GA13497@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

FWIW, I hit this on a PolarFire SoC.
Was relieved to see that it was not another wacky edge case like my
last run-in with swiotlb issues! If you could CC me on the fix that'd
be great.

Thanks,
Conor.
