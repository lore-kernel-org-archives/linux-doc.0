Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C4ABC433EF
	for <linux-doc@archiver.kernel.org>; Fri,  1 Apr 2022 02:13:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244022AbiDACPh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 31 Mar 2022 22:15:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244000AbiDACPh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 Mar 2022 22:15:37 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F005991AD4
        for <linux-doc@vger.kernel.org>; Thu, 31 Mar 2022 19:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        Subject:From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=kvtTPFUIZGZ/ELwr3IDx6NyWJmoG3Lb3wy+32MogvKE=; b=PqkgJds7owdXAPBq40iWQJqYLG
        +k8Ql6MslfZaQnI37KEeowrb3oA1+rPRS4XNxXjz0u4XeJRcgoBs25k0U1tF6MWfIzk1Qf/2Bu+9a
        kdFLukEgQFh2PlueuEivX2FAprMMDP2VCQA8h7w2xeJ8OC+0P0vlp+drSWU9Yc5QW4QMVzjYTYebh
        3ceyQecAYUfWlRsZv/WQ9yJwxqkSrXcC4An0UBAaUkDnazDxs7CSn2e/PsGYxb3OaWq3/Z/YeGPPD
        LJ/PE5z11koJh/BpD0S1M3LvYQDYPoJGJs0jj34e8ZRCeUtrFmakuyY71mdTagDSm48Dz+psLY4FL
        f9bQQPZg==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1na6nE-002mhu-6f
        for linux-doc@vger.kernel.org; Fri, 01 Apr 2022 02:13:40 +0000
Message-ID: <73d98132-1d08-ef29-edb7-9e062b9154b8@infradead.org>
Date:   Thu, 31 Mar 2022 19:13:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: doc. warning question
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

I'm seeing this warning:

linux-next-20220331/Documentation/driver-api/thermal/intel_dptf.rst:7: WARNING: Undefined substitution referenced: "copy".

which says:
:Copyright: |copy| 2022 Intel Corporation


(and have been seeing it for awhile).

I don't see what is different or peculiar about this one. There are several similar
instances in other files in Documentation/driver-api/.

Any ideas?

thanks.
-- 
~Randy
