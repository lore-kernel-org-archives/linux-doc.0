Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 498947D8AB
	for <lwn-linux-doc@archive.lwn.net>; Thu,  1 Nov 2018 11:34:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728266AbeKAUgd (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 1 Nov 2018 16:36:33 -0400
Received: from foss.arm.com ([217.140.101.70]:55236 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728199AbeKAUgd (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 1 Nov 2018 16:36:33 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D8AAA78;
        Thu,  1 Nov 2018 04:34:00 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F4883F71D;
        Thu,  1 Nov 2018 04:33:58 -0700 (PDT)
Date:   Thu, 1 Nov 2018 11:33:55 +0000
From:   Mark Rutland <mark.rutland@arm.com>
To:     Peng Hao <peng.hao2@zte.com.cn>
Cc:     robh+dt@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
        andy@infradead.org, dvhart@infradead.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        hutao@cn.fujitsu.com, linux-doc@vger.kernel.org
Subject: Re: [PATCH V5 2/8]  misc/pvpanic: Remove one extra semicolon
Message-ID: <20181101113355.z6l3l33buhcpukl4@lakrids.cambridge.arm.com>
References: <1541085002-42993-1-git-send-email-peng.hao2@zte.com.cn>
 <1541085002-42993-2-git-send-email-peng.hao2@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1541085002-42993-2-git-send-email-peng.hao2@zte.com.cn>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Nov 01, 2018 at 11:09:56PM +0800, Peng Hao wrote:
> There is an extra semicolon in pvpanic_device_ids, remove it.

This is a comma, not a semicolon.

How about:

  Since there should be nothing after the sentinel entry in an
  acpi_device_id list, it doesn't make sense for it to have a trailing
  comma.

  This patch removes the redundant comma.

... with that commit message (and the title fixed to say 'comma' rather
than 'semicolon':

Acked-by: Mark Rutland <mark.rutland@arm.com>

Either that, or simply drop this patch entirely.

Thanks,
Mark.

> 
> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> ---
>  drivers/misc/pvpanic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/pvpanic.c b/drivers/misc/pvpanic.c
> index fd86dab..059005c 100644
> --- a/drivers/misc/pvpanic.c
> +++ b/drivers/misc/pvpanic.c
> @@ -35,7 +35,7 @@
>  
>  static const struct acpi_device_id pvpanic_device_ids[] = {
>  	{ "QEMU0001", 0 },
> -	{ "", 0 },
> +	{ "", 0 }
>  };
>  MODULE_DEVICE_TABLE(acpi, pvpanic_device_ids);
>  
> -- 
> 1.8.3.1
> 
