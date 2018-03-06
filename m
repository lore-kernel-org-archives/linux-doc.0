Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1A7207E688
	for <lwn-linux-doc@archive.lwn.net>; Tue,  6 Mar 2018 20:28:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753590AbeCFU2U (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 6 Mar 2018 15:28:20 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:39226 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750797AbeCFU2T (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Mar 2018 15:28:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=g0oxIlI2Q7f8pg4D29zWRCl8BVpFxGc96AzyoaJEzww=; b=Z6hcnDM1tTp6/mdZz2FFoSiPq
        SUIlmewtm/qADz74cQdtLDGStRo7VJQz4RvQYxHKMLTOzQ6F8iWMEjkMjh/nHL4Snnefzwh/sAB1E
        FMGUDXMv7S6p+lYY7onXqpWSJbiu3aHaof0XVmmFYnVJ+mblXtuzoflin5jteo1IWvV8hYma/mm9O
        wzFicNj4hBqgDcXetWRPDljmJE6oVWu9GXvr81q+IXlD5cspZgIgEfvV+3edeWl3kwQh8WXtinqWc
        Ewuf+2J9brXbeFWtV9UfRTHQQn/r5MedPmDEn3vCE4+3bMC+nbiuLfChVR8E8jAkSQdS5DAKJfUgP
        Ewpb4/K0g==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.89 #1 (Red Hat Linux))
        id 1etJC4-0002O9-Qj; Tue, 06 Mar 2018 20:28:16 +0000
Subject: Re: [PATCH v2 6/8] [PATCH 6/8] Documentation: hwmon: Add a document
 for PECI hwmon client driver
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, joel@jms.id.au,
        andrew@aj.id.au, arnd@arndb.de, gregkh@linuxfoundation.org,
        jdelvare@suse.com, linux@roeck-us.net, benh@kernel.crashing.org,
        andrew@lunn.ch
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
References: <20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
 <20180221161606.32247-7-jae.hyun.yoo@linux.intel.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <0e3750a0-d45b-368d-f5cb-d2cca6797ecb@infradead.org>
Date:   Tue, 6 Mar 2018 12:28:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180221161606.32247-7-jae.hyun.yoo@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On 02/21/2018 08:16 AM, Jae Hyun Yoo wrote:

> +temp<n>_label		Provides DDR DIMM temperature if this label indicates
> +			'DIMM #'.
> +temp<n>_input		Provides current temperature of the DDR DIMM.
> +
> +Note:
> +	DIMM temperature group will be appeared when the client CPU's BIOS

	                       will appear when

> +	completes memory training and testing.
> 


-- 
~Randy
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
