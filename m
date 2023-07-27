Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59BE5C04FDF
	for <linux-doc@archiver.kernel.org>; Thu, 27 Jul 2023 15:30:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231843AbjG0PaS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Jul 2023 11:30:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232251AbjG0PaN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jul 2023 11:30:13 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ECCB171D;
        Thu, 27 Jul 2023 08:30:11 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 209FD2CD;
        Thu, 27 Jul 2023 15:30:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 209FD2CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1690471811; bh=liQq2dcD8ikYAEgx+GWN26TRs+v1bIlFG3MTf+1itqY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=avPa/rGgULsp1j+Cpn2BIWYNrjNSMozHL9lue2atTdqGANTUOuLXoKBpkC+KL0VbR
         1nZggUD7uNlCkl1kZLVVw172es5QALetfyfgTQHHK8qiK5yII7EU3eLq8syIg7jpMO
         jIDgBICSsTGpmeMfhxHxC2UOtG6nqUy8K6PGiSKsWsn9g8dUap05O6wEAD7zKC3Wd+
         0wLowEKT54mnR/+cWs+Xz6uHT8xdtqUehi8LC/j+f+PeJIR/5WLB/GbsmZsVz9lI3e
         7u8yEELx/fm+BBhr1wb3kdwFUisvruAz3p753//0Wwp1iok35JULL1g2YxvsgFXepZ
         vISupjmKZHhtg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     David Reaver <me@davidreaver.com>
Cc:     Dave Jiang <dave.jiang@intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        David Reaver <me@davidreaver.com>
Subject: Re: [PATCH] docs: ABI: sysfs-bus-nvdimm: fix unexpected indentation
 error
In-Reply-To: <20230727152234.86923-1-me@davidreaver.com>
References: <20230727152234.86923-1-me@davidreaver.com>
Date:   Thu, 27 Jul 2023 09:30:10 -0600
Message-ID: <87o7jx5q4d.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

David Reaver <me@davidreaver.com> writes:

> Fix the following error when running make htmldocs:
>
> Documentation/ABI/testing/sysfs-bus-nvdimm:10: ERROR: Unexpected indentation.
>
> This is caused by missing newlines before the code examples. In particular,
> before this patch, the second example for ctl_res_cnt doesn't render properly.
>
> Link: https://docs.kernel.org/admin-guide/abi-testing.html#abi-sys-bus-event-source-devices-nmemx-format
>
> Signed-off-by: David Reaver <me@davidreaver.com>
> ---
>  Documentation/ABI/testing/sysfs-bus-nvdimm | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/ABI/testing/sysfs-bus-nvdimm b/Documentation/ABI/testing/sysfs-bus-nvdimm
> index de8c5a59c77f..8564a0ff0d3e 100644
> --- a/Documentation/ABI/testing/sysfs-bus-nvdimm
> +++ b/Documentation/ABI/testing/sysfs-bus-nvdimm
> @@ -18,7 +18,9 @@ Description:	(RO) Attribute group to describe the magic bits
>  		Each attribute under this group defines a bit range of the
>  		perf_event_attr.config. Supported attribute is listed
>  		below::
> +
>  		  event  = "config:0-4"  - event ID
>
>  		For example::
> +
>  			ctl_res_cnt = "event=0x1"
>
>  What:           /sys/bus/event_source/devices/nmemX/events

Thanks for the patch.  This problem is already fixed in docs-next,
though, and thus in linux-next as well.

jon
