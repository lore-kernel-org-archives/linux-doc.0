Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33732C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 25 Apr 2022 01:15:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240031AbiDYBSw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 24 Apr 2022 21:18:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230410AbiDYBSv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 24 Apr 2022 21:18:51 -0400
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E0561AD8D
        for <linux-doc@vger.kernel.org>; Sun, 24 Apr 2022 18:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1650849349; x=1682385349;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=Buv3PNrbtF1fgAoIed9IrFQUE8TvUlPkYPR/lQiWGuk=;
  b=HGMgeUMBZIz8YMsAqSI8ZEtf/ASx3FJIdzYPBlq6I7vGSvumo2ZK08V0
   U7inoC6naVM6jmU0A4fUgeKXz1Z+dd6oZZP0fU+xi6iltPE0RpU95IVZ5
   9JnHxbFtIBdrMBLS8YGa+QQSxPpATmyWehJ9NVwWZ21YySS6PX7Wbx9Nm
   0WDGhtG96UJyM+0zSzlf+0ligIlIxCEBtCZv7BD17zzQuKBEKwfWK2wJc
   TO8o7JXmcdyakrGJKAjcyPZ/y+sNWlZu/MJBOMezIAruZlwbgdL/En4KE
   vL0zbfVa34WsOyaKwnUdqepddqLmEI/j6LEhT+sHvb/Ev/Zy4nOI3tsDt
   Q==;
X-IronPort-AV: E=Sophos;i="5.90,287,1643644800"; 
   d="scan'208";a="199603641"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 25 Apr 2022 09:15:49 +0800
IronPort-SDR: PCKjVYvCvMebX6h3Z/ohY+DeenLbLqsApEjcjmW6OPNKb1R9tgYDaP1qhmo8etlhHTgauKP5hL
 3/yBW9GYJj+G8976EcrZvaJEq7Mbk8h07RXk6YyAuzS+WTVrN+3mnGk7HwiSY+rjsMrNnj999v
 KFvffzxd2RKvZKaaem0B8k6dWkeFzQtmkczOQzmIV2McBPoVPD5idlTg4YjtIx23gEY8/i8veT
 qkKviYiDXGersdYEmrUosSGI2DSypAZs1FnHYtcjw0KRNwW85T8a0Doz/ML9leK2O/NkVgd+DZ
 rKA/RDsGnh5F37KBZtOjoF3h
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Apr 2022 17:46:01 -0700
IronPort-SDR: imoXib6ArFwcY0fOWR4nyVpU289+FvtsucIKyiiJrr5KJRhRtux3Y9mGUuTUp/SNWK2eGggerD
 wnabbU2ZtbKCtt1FAz6sLw3j0Q7c6QiYKQd4rollAJ6AW5HcgYf+UgSRSarlknzddtbuZ6w0jS
 1bQpgBQCqq7iaMElKF9+y29mgRKTyuQo1ruGWQxJhluoM712YT/XQ9ZGogd5fsFcsQ53wT7UoW
 Rq6vvQFH0Ju4tPxzJDY7Kj7KdzhdhVN/hTE5ZwuzUJwEA1E/vi3NilmnNdmZsPlIc8pvZ6Ri2z
 G9E=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Apr 2022 18:15:49 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KmnBr5CT1z1SHwl
        for <linux-doc@vger.kernel.org>; Sun, 24 Apr 2022 18:15:48 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1650849348; x=1653441349; bh=Buv3PNrbtF1fgAoIed9IrFQUE8TvUlPkYPR
        /lQiWGuk=; b=gOppKcUumvDb9wHitYS014PHyb+WOmgj+Ol09RXrRizrr1VA4Do
        1sk1f214YNb9RgY1UBJgbCXUdaPaoV1VcX0PrluECc0CV6pI+Rxa2tlFlvWmuLQa
        zp8DmFcqnNBWT7LJh8HSR6c2aBcI4MIc6IBCTms5cQ8beAHYZa4w4DuIpVXgAkJj
        pXj25RL6u3ybx+wwv2q6dMpAw7KrdxixxRI2LlTUR0z0Jk6wS8Dj08dotJcbu2ja
        /tG8sOKhhhWZDWds3Sc/h5AkrrYzth8mDET40t8YRjZPkt2Jmh+XUVtHRjoE6Wx5
        bDiMIjrAt/7PxaEes2krkiwCmKcdlTeP+jA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id WOG6_uLLImbW for <linux-doc@vger.kernel.org>;
        Sun, 24 Apr 2022 18:15:48 -0700 (PDT)
Received: from [10.225.163.24] (unknown [10.225.163.24])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KmnBq4NGpz1Rvlx;
        Sun, 24 Apr 2022 18:15:47 -0700 (PDT)
Message-ID: <ce2f858e-c211-2a1d-fc91-4451a9a64112@opensource.wdc.com>
Date:   Mon, 25 Apr 2022 10:15:46 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 4/5] ata: libata-core: Allow forcing most horkage flags
Content-Language: en-US
To:     Sergey Shtylyov <s.shtylyov@omp.ru>, linux-ide@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20220407123748.1170212-1-damien.lemoal@opensource.wdc.com>
 <20220407123748.1170212-5-damien.lemoal@opensource.wdc.com>
 <b74cbd2a-c9a2-2f3a-3421-3a79098ca3fd@omp.ru>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <b74cbd2a-c9a2-2f3a-3421-3a79098ca3fd@omp.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/25/22 03:17, Sergey Shtylyov wrote:
> On 4/7/22 3:37 PM, Damien Le Moal wrote:
> 
>> To facilitate debugging of drive issues in the field without kernel
>> changes (e.g. temporary test patches), add an entry for most horkage
>> flags in the force_tbl array to allow controlling these horkage
>> settings with the libata.force kernel boot parameter.
>>
>> Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
>> ---
>>  drivers/ata/libata-core.c | 22 ++++++++++++++++++++--
>>  1 file changed, 20 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
>> index 75856f4210d7..121cb55a219a 100644
>> --- a/drivers/ata/libata-core.c
>> +++ b/drivers/ata/libata-core.c
>> @@ -6230,9 +6230,27 @@ static const struct ata_force_param force_tbl[] __initconst = {
>>  	force_horkage_onoff(ncqtrim,	ATA_HORKAGE_NO_NCQ_TRIM),
>>  	force_horkage_onoff(ncqati,	ATA_HORKAGE_NO_NCQ_ON_ATI),
>>  
>> -	force_horkage_on(dump_id,	ATA_HORKAGE_DUMP_ID),
>> +	force_horkage_onoff(trim,	ATA_HORKAGE_NOTRIM),
>> +	force_horkage_onoff(trim_zero,	ATA_HORKAGE_ZERO_AFTER_TRIM),
>> +	force_horkage_on(max_trim_128m, ATA_HORKAGE_MAX_TRIM_128M),
>> +
>> +	force_horkage_onoff(dma,	ATA_HORKAGE_NODMA),
>>  	force_horkage_on(atapi_dmadir,	ATA_HORKAGE_ATAPI_DMADIR),
>> -	force_horkage_on(disable,	ATA_HORKAGE_DISABLE)
>> +	force_horkage_on(atapi_mod16_dma, ATA_HORKAGE_ATAPI_MOD16_DMA),
>> +
>> +	force_horkage_onoff(dma_log,	ATA_HORKAGE_NO_DMA_LOG),
>> +	force_horkage_onoff(id_dev_log,	ATA_HORKAGE_NO_ID_DEV_LOG),
>> +	force_horkage_onoff(log_dir,	ATA_HORKAGE_NO_LOG_DIR),
> 
>    Underscores in the names with "no" (without underscore) would look inconsistent,
> wouldn't they? Maybe drop the underscores here?

Yep. Done.

> 
> [...]
> 
> Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> MBR, Sergey


-- 
Damien Le Moal
Western Digital Research
