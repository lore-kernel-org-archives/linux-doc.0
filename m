Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED69C433F5
	for <linux-doc@archiver.kernel.org>; Mon, 25 Apr 2022 06:15:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233656AbiDYGSo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 25 Apr 2022 02:18:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230169AbiDYGSj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Apr 2022 02:18:39 -0400
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 376CDBC3E
        for <linux-doc@vger.kernel.org>; Sun, 24 Apr 2022 23:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1650867336; x=1682403336;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hVM1Wj4nHDkPexEOec7X52T3CLZ3gZGOXYqVoR7klFU=;
  b=ZhXL5k2tYstu0fWma23lI3RNpeX/nOWR+qlb1my7Mz00PJxmgaEiys/Q
   vCMQQtKUYq7M2prlii/3jNkaCx5yxgceTUUymiQP96dUqo4O0ekxiVEKS
   235hjWC/pDyV4fvhzjMeu1fuDex/i8nea2uDDqQ7pNXsRfIrIBD/qz1ET
   qoPl/9SbTaf6ScrkEtb05i04UZ/t8oBDTxkS0Aue7B0YltXS+B+Eq7MWm
   cEkPvbeU0VzchZugjtI5epBPWhVsjpnoa2ZHIeb+MFNZCgauIedAsJQpz
   dkvck49cb7/dpREymC/xAux2OvNx/2zcJJljMuUp6xrH/UuUZsAsHx2Zr
   A==;
X-IronPort-AV: E=Sophos;i="5.90,287,1643644800"; 
   d="scan'208";a="302936078"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 25 Apr 2022 14:15:34 +0800
IronPort-SDR: yRXN1Xfiz8zlVbQ4VGbmfWcnlMM8FaimPxeU3IGInnQMNqM+ly6fgI7aUEa4cI9fsmgfvqWu0K
 GGa0e/MHAm/CXAMFJLdn9zyA8dPgBML9s0luQKjKNTjgEPchJ1gQTIxxVavnI5oz8a4PcmEaS6
 c175LS98JZh4Hzg6ydYkuNdDYOrya0FXAe1OAyxCNO61rRupEGA2FLhtNJzw2z3KjrFbB2KP/l
 YwfjFaIh5Hk0/gjsxP2cdRONemjel9sSSvTf8aTNyiiK69ZFVa18to5mBTrxUQNTdDKADSiRJL
 nV4opvHaT9JJvPjVoZcnQqRd
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Apr 2022 22:46:30 -0700
IronPort-SDR: K+6Ij7GcPxdnbMntfVN1mLWD62do9GY2V1HsVHBSubeFiXLgp6epjRcdj9VzHDaVbtqvV3hihO
 pb+LgITX6dOxjLBR5GHuYOJDMYlFZSTp6q/ANRyHU/CQM3xgW2zT9eEIZoL0xJWJufuprYgSZH
 7cU18rQ5Mg0lRwqrVlq+oNhm8AgQLqh8ZqU/XLHJwCVpdNWSgontmIr+CN7NM1GVKDd4F/FHpD
 4YedB4ZC+x4WsCKavBJ08e0jDQ9S/gntl2WDrLfkQ9RxnGgbEIHAtCVrJGn4RUGdzNDnqo6h15
 uak=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Apr 2022 23:15:34 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Kmvrj639wz1SVny
        for <linux-doc@vger.kernel.org>; Sun, 24 Apr 2022 23:15:33 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1650867333; x=1653459334; bh=hVM1Wj4nHDkPexEOec7X52T3CLZ3gZGOXYq
        VoR7klFU=; b=sJcmh3mz5LiAiLC51APRQvegJ7YJZW+o/IaX8RBIiJJYlviqeuP
        S8RgFmhKjJJnY1qsyfz2DjWLuYyC1Asetr6UE7r9hEMtjaTOKQhTLZs+DNPOuUK1
        qTE58TyTbU/K5TlAqQzNSBZ2tlvmXKdg0Wi91FUurdgS+bi82dpatNhjq4LmwI8R
        I8lEFUK3NJZFYzedHVM2yFoiyO1WJLqxU8pChhoX7IpAi2kWVoXpxmTUnXN6ABqZ
        hvx2i2dlsoQ7kfxUsICp7jZxI39Lil0qg84AIgumvGcHCbwjFUnuVbdxjr1Ufr7Q
        XcwDuET75SN/7zBZGwaBeUHXSlCO1t/tEtg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id OJ4O7nekoYZ0 for <linux-doc@vger.kernel.org>;
        Sun, 24 Apr 2022 23:15:33 -0700 (PDT)
Received: from [10.225.163.24] (unknown [10.225.163.24])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Kmvrh3f6Tz1Rvlx;
        Sun, 24 Apr 2022 23:15:32 -0700 (PDT)
Message-ID: <71a4a301-ca96-e1a3-aeee-fd69b8f1eb7b@opensource.wdc.com>
Date:   Mon, 25 Apr 2022 15:15:31 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 4/5] ata: libata-core: Allow forcing most horkage flags
Content-Language: en-US
To:     Hannes Reinecke <hare@suse.de>, linux-ide@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     Sergey Shtylyov <s.shtylyov@omp.ru>
References: <20220425013417.3947791-1-damien.lemoal@opensource.wdc.com>
 <20220425013417.3947791-5-damien.lemoal@opensource.wdc.com>
 <b64df936-681c-c88e-9f44-ab71e810584f@suse.de>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <b64df936-681c-c88e-9f44-ab71e810584f@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/25/22 15:00, Hannes Reinecke wrote:
> On 4/25/22 03:34, Damien Le Moal wrote:
>> To facilitate debugging of drive issues in the field without kernel
>> changes (e.g. temporary test patches), add an entry for most horkage
>> flags in the force_tbl array to allow controlling these horkage
>> settings with the libata.force kernel boot parameter.
>>
>> Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
>> Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>> ---
>>   drivers/ata/libata-core.c | 22 ++++++++++++++++++++--
>>   1 file changed, 20 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
>> index e5a0e73b39d3..f68cb5639ec4 100644
>> --- a/drivers/ata/libata-core.c
>> +++ b/drivers/ata/libata-core.c
>> @@ -6230,9 +6230,27 @@ static const struct ata_force_param force_tbl[] __initconst = {
>>   	force_horkage_onoff(ncqtrim,	ATA_HORKAGE_NO_NCQ_TRIM),
>>   	force_horkage_onoff(ncqati,	ATA_HORKAGE_NO_NCQ_ON_ATI),
>>   
>> -	force_horkage_on(dump_id,	ATA_HORKAGE_DUMP_ID),
>> +	force_horkage_onoff(trim,	ATA_HORKAGE_NOTRIM),
>> +	force_horkage_on(trim_zero,	ATA_HORKAGE_ZERO_AFTER_TRIM),
>> +	force_horkage_on(max_trim_128m, ATA_HORKAGE_MAX_TRIM_128M),
>> +
>> +	force_horkage_onoff(dma,	ATA_HORKAGE_NODMA),
>>   	force_horkage_on(atapi_dmadir,	ATA_HORKAGE_ATAPI_DMADIR),
>> -	force_horkage_on(disable,	ATA_HORKAGE_DISABLE)
>> +	force_horkage_on(atapi_mod16_dma, ATA_HORKAGE_ATAPI_MOD16_DMA),
>> +
>> +	force_horkage_onoff(dmalog,	ATA_HORKAGE_NO_DMA_LOG),
>> +	force_horkage_onoff(iddevlog,	ATA_HORKAGE_NO_ID_DEV_LOG),
>> +	force_horkage_onoff(logdir,	ATA_HORKAGE_NO_LOG_DIR),
>> +
>> +	force_horkage_on(max_sec_128,	ATA_HORKAGE_MAX_SEC_128),
>> +	force_horkage_on(max_sec_1024,	ATA_HORKAGE_MAX_SEC_1024),
>> +	force_horkage_on(max_sec_lba48,	ATA_HORKAGE_MAX_SEC_LBA48),
>> +
>> +	force_horkage_onoff(lpm,	ATA_HORKAGE_NOLPM),
>> +	force_horkage_onoff(setxfer,	ATA_HORKAGE_NOSETXFER),
>> +	force_horkage_on(dump_id,	ATA_HORKAGE_DUMP_ID),
>> +
>> +	force_horkage_on(disable,	ATA_HORKAGE_DISABLE),
> 
> ... and this exemplifies my concerns with the 'onoff' mechanism:
> Why is 'disable' just marked as 'on' ?

Yeah, I can add the off side of it too. Fairly useless though as these are
off by default, except for the few cases where we already know that the
flag is needed, in which case turning it off would be a bad idea. So I do
not allow it by having the "on" only.

> Sure we can set it to 'off' (we have to, otherwise that flag would 
> always be set). And if we can set it to 'off', where's the different to 
> 'onoff' ?

Because of the reversed definition of the flag. E.g. nodmalog means *set*
ATA_HORKAGE_NO_DMA_LOG flags. so the "no" option means set. If we add the
off version for non reversed flags, then the "no" option would clear the
flag, not set it. It is a mess. That is the cleanest way I could think of
without making things even more messy.

At best, we can allow everything to be set/cleared using 2 macros:
onoff and offon, depending on the flag meaning polarity (i.e. a NO flag or
not).

> 
> Style-differences apart it looks good.
> 
> Cheers,
> 
> Hannes


-- 
Damien Le Moal
Western Digital Research
