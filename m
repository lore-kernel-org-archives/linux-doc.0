Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B4C2D7D90F
	for <lwn-linux-doc@archive.lwn.net>; Sat, 24 Aug 2019 21:18:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728022AbfHXVSL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 24 Aug 2019 17:18:11 -0400
Received: from ms.lwn.net ([45.79.88.28]:50308 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727969AbfHXVSK (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 24 Aug 2019 17:18:10 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 0899035A;
        Sat, 24 Aug 2019 21:18:09 +0000 (UTC)
Date:   Sat, 24 Aug 2019 15:18:08 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jacob Huisman <jacobhuisman@kernelthusiast.com>
Cc:     Federico Vaga <federico.vaga@vaga.pv.it>,
        Harry Wei <harryxiyou@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: process: fix broken link
Message-ID: <20190824151808.782b77c4@lwn.net>
In-Reply-To: <20190816122209.5bz4rlln5cahn7ki@jacob-MS-7A62>
References: <20190816122209.5bz4rlln5cahn7ki@jacob-MS-7A62>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 16 Aug 2019 13:22:09 +0100
Jacob Huisman <jacobhuisman@kernelthusiast.com> wrote:

> http://linux.yyz.us/patch-format.html seems to be down since
> approximately September 2018. There is a working archive copy on
> arhive.org. Replaced the links in documenation + translations.
> 
> Signed-off-by: Jacob Huisman <jacobhuisman@kernelthusiast.com>
> ---
>  Documentation/process/howto.rst                                 | 2 +-
>  Documentation/process/submitting-patches.rst                    | 2 +-
>  Documentation/translations/it_IT/process/howto.rst              | 2 +-
>  Documentation/translations/it_IT/process/submitting-patches.rst | 2 +-
>  Documentation/translations/ja_JP/SubmittingPatches              | 2 +-
>  Documentation/translations/ja_JP/howto.rst                      | 2 +-
>  Documentation/translations/ko_KR/howto.rst                      | 2 +-
>  Documentation/translations/zh_CN/process/howto.rst              | 2 +-
>  Documentation/translations/zh_CN/process/submitting-patches.rst | 2 +-
>  9 files changed, 9 insertions(+), 9 deletions(-)

Dead links don't help anybody, so I've applied this.  I have to wonder,
though, whether there is really value in carrying around a link to a page
that hasn't been maintained in years.  Almost everything that appears
there is already in submitting-patches.rst; maybe we could see if there's
anything that's missing, add it, then drop the link?

Thanks,

jon
