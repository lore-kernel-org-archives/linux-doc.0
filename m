Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A06397D90D
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Nov 2019 20:08:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725792AbfKGUI3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Nov 2019 15:08:29 -0500
Received: from ms.lwn.net ([45.79.88.28]:39444 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725785AbfKGUI3 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 7 Nov 2019 15:08:29 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 9E68E2C1;
        Thu,  7 Nov 2019 20:08:28 +0000 (UTC)
Date:   Thu, 7 Nov 2019 13:08:27 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     mike.leach@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/4] coresight: Documentation: next v5.4-rc5
Message-ID: <20191107130827.58058a5b@lwn.net>
In-Reply-To: <20191031175834.17548-1-mathieu.poirier@linaro.org>
References: <20191031175834.17548-1-mathieu.poirier@linaro.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 31 Oct 2019 11:58:30 -0600
Mathieu Poirier <mathieu.poirier@linaro.org> wrote:

> Good day Jonathan,
> 
> Please consider the following patches for inclusion in the next merge window.
> 
> Thanks,
> Mathieu
> 
> Mike Leach (4):
>   coresight: etm4x: docs: Update ABI doc for new sysfs name scheme.
>   coresight: etm4x: docs: Update ABI doc for new sysfs etm4 attributes
>   coresight: docs: Create common sub-directory for coresight trace.
>   coresight: etm4x: docs: Adds detailed document for programming etm4x.
> 
>  .../testing/sysfs-bus-coresight-devices-etm4x | 183 ++--
>  .../{ => coresight}/coresight-cpu-debug.rst   |   0
>  .../coresight/coresight-etm4x-reference.rst   | 798 ++++++++++++++++++
>  .../trace/{ => coresight}/coresight.rst       |   2 +-
>  Documentation/trace/coresight/index.rst       |   9 +
>  Documentation/trace/index.rst                 |   3 +-
>  MAINTAINERS                                   |   3 +-
>  7 files changed, 925 insertions(+), 73 deletions(-)

I've applied the set, thanks.

jon
