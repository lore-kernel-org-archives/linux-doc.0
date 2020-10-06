Return-Path: <SRS0=3O92=DN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06376C4363D
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 14:01:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB52320760
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 14:01:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbgJFOBg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Oct 2020 10:01:36 -0400
Received: from ms.lwn.net ([45.79.88.28]:51866 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725902AbgJFOBg (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Oct 2020 10:01:36 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id B69EA2B7;
        Tue,  6 Oct 2020 14:01:35 +0000 (UTC)
Date:   Tue, 6 Oct 2020 08:01:34 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Changbin Du <changbin.du@intel.com>,
        linux-kernel@vger.kernel.org,
        Markus Heiser <markus.heiser@darmarit.de>
Subject: Re: [PATCH] scripts: kernel-doc: allow passing desired Sphinx C
 domain dialect
Message-ID: <20201006080134.07d94d26@lwn.net>
In-Reply-To: <20201006084207.125c88d5@coco.lan>
References: <ee1f16453ad40eae2603adfde5f6dda3ab1befc7.1601798520.git.mchehab+huawei@kernel.org>
        <20201005101736.7adf4f46@lwn.net>
        <20201006084207.125c88d5@coco.lan>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 6 Oct 2020 08:42:07 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> As right now we don't support Sphinx version 3.0[1], we're actually using just
> $sphinx_major. So, I'm wonder if it would make sense to also make <minor>
> optional.

Maybe...someday we may need it, knowing how the Sphinx folks approach
compatibility, but I guess we can always add it then if so.

> The change would be trivial, although the regex will become even more
> harder to read ;-)

	^(\d+)(\.(\d+)){,2}

?  (untested, of course)

> [1] not sure how valuable would be adding support for Sphinx 3.0. While
> I didn't make any tests, I'm strongly suspecting that, with the approach
> we took for backward/forward compatibility, adding support for it
> would mean to just do a trivial change at cdomain.py by applying a
> patch that Markus did replacing a regex function that doesn't exist
> anymore at Sphinx API and emulating C namespace with the logic I
> already implemented. 

3.0 might just be skippable at this point, methinks.  

jon
