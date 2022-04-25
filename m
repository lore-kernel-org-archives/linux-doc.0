Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85106C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 25 Apr 2022 01:35:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240180AbiDYBiH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 24 Apr 2022 21:38:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240182AbiDYBh7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 24 Apr 2022 21:37:59 -0400
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AD57F32B8
        for <linux-doc@vger.kernel.org>; Sun, 24 Apr 2022 18:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1650850496; x=1682386496;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=PihVGb+4ZJ8NifB01sCkIVHS9Wa7WiDOczyNQLelXiI=;
  b=Sck9xvXwzYFTi/tzbAog8uS3ffipZ1bgxscV6fv1g9OKiGQtMjouh7eK
   jYo8Kxe5u6bED7kuseK7L6jtLYdUHxxGudqER0XPBRkWYEjiuO/7yp5+J
   QzY5699kEUSgdYJ2nRN9M2dtxbrRwklBW1UBCa6jITDYs+gnTy26xw1PK
   pbZ710nzHKa0hCK/fHzKPvtS9PD6UvR1Pq3qso5dpDSP45W1U8Tii/mZ2
   qtxRAIOpXO/fy797lf09k7paozhaaevE+Vva1Vjou849CQHvC1Ln8ueYl
   bTtZbPW7Br/pxnCnIlFYD2PfGifW98s/SnBQWhU3Sjwaw/Ur6MNkrtPPB
   A==;
X-IronPort-AV: E=Sophos;i="5.90,287,1643644800"; 
   d="scan'208";a="310680638"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 25 Apr 2022 09:34:53 +0800
IronPort-SDR: Am1CcBMllv7xijQlWcVWO+WCG74sBFs/idcMHYPNqrULLr7KfSyVi58kmB/shanKh6ex6Wzikx
 YabyPMm6VPE9nnjhDiQ3/EBNLMklpPgBS8Z4nNhIx0QaFSKv8jo52XCN2ND5AIcxcNHc9crd+w
 y51lthk+7kXSrXdAISvhXOHlZGspA4BvcLA25RQJXJFkSEwJqdV6UquB02akdg0XXQWZVnYfvj
 Y++2X53MU3CMApHobIVPs5dPi6Wux54mFItoRJQ78kJJMDlzKSARG1ctZkEsLd5H8ahMoCaEUy
 gqs2u4AE/6Slf0oMVc49Fti1
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Apr 2022 18:05:05 -0700
IronPort-SDR: rv2m4hMzYjVG2JFf/nq5BMCRLzIh/uRWOWFabs0raePR2Tn/dJ1J9llCmMFG7pKV/55B6xCARN
 TiYBQOc7FvpaR3a7cGDvL4RECHKwnRxmL+cnDb/+R8ld/0n2dTQJ/MlUT6SOHzI9nrxJcMMNdW
 d5kck3k8mY0QWjw9tgTuSAEzGb5Air2y3HyjGm3Gyh28IkPpB84webZooRilsN8operu7WU6PK
 kjZxTbQ5IWoW8bSkyS/6fMqUZBRYZG8vXGdRqCJ3u3Oae7BE5vwro2iGAallzsvYrnAzB8tJ/t
 UEw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Apr 2022 18:34:52 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Kmncq6lPmz1SVny
        for <linux-doc@vger.kernel.org>; Sun, 24 Apr 2022 18:34:51 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1650850491; x=1653442492; bh=PihVGb+4ZJ8NifB01sCkIVHS9Wa7WiDOczy
        NQLelXiI=; b=dQU/1b3P8Mve7XNza8EReimCInR7zLtf6L8EMxktF1BLb2/mQF0
        YjCijf6Ku0ToqP37dDGbPr8l2gWjTZWkEmFDjru/lAZlha/GwjZYqmIhC7id8IUz
        /4AgOfITvv49hHkJKGqQ5RoQoB+H/Q7kBqxikLzPwcNdmmsDL4cKZdm+mb/fj6GW
        vmLDbtXTlmuoU6VJ7ANIObzIaUYLgfcwolG0NVmvIJser/aDOXvkv6i8lcXIV0xB
        y3sH6OL5r7IR0SFxNTx77Gtx5vYc0IoiNNHXpIfgsHB3+9wCwre43uscJ+iQmzoK
        7Gyrw+3r/+rrPotsPvxvAAExpXS24oeYisQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id vsQIcY6ECLQ3 for <linux-doc@vger.kernel.org>;
        Sun, 24 Apr 2022 18:34:51 -0700 (PDT)
Received: from [10.225.163.24] (unknown [10.225.163.24])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Kmncp5rCFz1Rvlx;
        Sun, 24 Apr 2022 18:34:50 -0700 (PDT)
Message-ID: <29ff67cb-9099-95cb-0074-8e86a89cf6ee@opensource.wdc.com>
Date:   Mon, 25 Apr 2022 10:34:49 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/5] ata: libata-core: Refactor force_tbl definition
Content-Language: en-US
To:     Sergey Shtylyov <s.shtylyov@omp.ru>, linux-ide@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20220407123748.1170212-1-damien.lemoal@opensource.wdc.com>
 <20220407123748.1170212-3-damien.lemoal@opensource.wdc.com>
 <eefb2f6e-3f38-28bb-6e96-8eb42d27933b@omp.ru>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <eefb2f6e-3f38-28bb-6e96-8eb42d27933b@omp.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/25/22 02:53, Sergey Shtylyov wrote:
> On 4/7/22 3:37 PM, Damien Le Moal wrote:
> 
>> Introduce the macro definitions force_cbl(), force_spd_limit(),
>> force_xfer(), force_lflag_on(), force_horkage_on() and
>> force_horkage_onoff() to define with a more compact syntax the struct
>> ata_force_param entries in the force_tbl array defined in the function
>> ata_parse_force_one().
>> To reduce the indentation of the array declaration, force_tbl definition
>> is also moved out of the ata_parse_force_one() function.
> 
>    Some entries are reordered too... :-)
> 
>> Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> 
>> diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
>> index bc59c77b99b6..c0cf42ffcc38 100644
>> --- a/drivers/ata/libata-core.c
>> +++ b/drivers/ata/libata-core.c
>> @@ -6143,67 +6143,90 @@ int ata_platform_remove_one(struct platform_device *pdev)
>>  EXPORT_SYMBOL_GPL(ata_platform_remove_one);
>>  
>>  #ifdef CONFIG_ATA_FORCE
>> +
>> +#define force_cbl(name, flag)				\
>> +	{ # name,	.cbl		= (flag) }
> 
>    Why not #name here and below?
> 
>> +
>> +#define force_spd_limit(spd, val)			\
>> +	{ # spd,	.spd_limit	= (val) }
>> +
>> +#define force_xfer(mode, shift)				\
>> +	{ # mode,	.xfer_mask	= (1UL << (shift)) }
>> +
>> +#define force_lflag_on(name, flags)			\
> 
>    Not just force_lflag()?

Patch 3 adds force_lflag_onoff(), so I added the on version here. Will
move this change to patch 3.

> 
>> +	{ # name,	.lflags		= (flags) }
>> +
>> +#define force_horkage_on(name, flag)			\
>> +	{ # name,	.horkage_on	= (flag) }
>> +
>> +#define force_horkage_onoff(name, flag)			\
>> +	{ "no" # name,	.horkage_on	= (flag) },	\
>> +	{ # name,	.horkage_off	= (flag) }
>> +
> [...]
>> @@ -6285,7 +6308,7 @@ static void __init ata_parse_force_param(void)
>>  	int last_port = -1, last_device = -1;
>>  	char *p, *cur, *next;
>>  
>> -	/* calculate maximum number of params and allocate force_tbl */
>> +	/* Calculate maximum number of params and allocate ata_force_tbl */
> 
>    Drove-by change? :-)

Yeah, just a comment bug I caught along the way. I do not think it
deserves its own patch. Will mention it in the commit message.

> 
> [...]
> 
> Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> MBR, Sergey


-- 
Damien Le Moal
Western Digital Research
