Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FAC9C433F5
	for <linux-doc@archiver.kernel.org>; Mon, 23 May 2022 07:33:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbiEWHds (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 23 May 2022 03:33:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230099AbiEWHdO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 23 May 2022 03:33:14 -0400
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF3F8B866
        for <linux-doc@vger.kernel.org>; Mon, 23 May 2022 00:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1653291192; x=1684827192;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LJ8/2FSDHURz0Zuhe/Qx3SaImInSLYq6abN68q4sCnc=;
  b=foKFe5lQFTftB9JDVG2byaPm0IT9I0Xw7eneQty4EXohnlyHG11cX3ti
   dKtAYKExp7i/3u3rQPBTLNFEn4qFq6Vf3/ey0w1krwaQRS4iPFtOwPYMU
   CwSksmGDLH8FDL6kEzeo4nB4sSUVdt0y3Z/K0wdF8T6MGJzFJRH6Ot+JV
   MFuEGR1+8+lRWB6RYls6n2vFH0PuKxLmrbuCFfyH5neWXwRhrp/5HEblY
   t2uekA4eM+ruO5qVf/0vMFd/+dpgMdJ1vPILachpKpVvqcB5PdoTgC1eE
   0IUasBPXsWtE1NlyHYa1ynVIv9OC7WNlZ/ISZYatnWSc/SbbWHg+Mreg+
   Q==;
X-IronPort-AV: E=Sophos;i="5.91,245,1647273600"; 
   d="scan'208";a="199924552"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 23 May 2022 15:33:11 +0800
IronPort-SDR: 2+q8jK/9TnCUaAAmGWVKVLQlkeqp8g4B2mdSEs6GQhHwkD3xOaWfbFml//6dzYLUHQkcFY8/IF
 yiu9LrUoqcvS7Ks6zRpN5st/xFCquFN57+vXTrY8Quk8FR7/ztL/Al560bZFi4Eub7zsELp4Br
 0SrvJQdco+q6zpheLVFuP0vyTDVH/pN0gNqwWk+KO+X8pGMv4ChE5X9dYEGyQk/5KzQpKnUnEK
 gLwFiDumxozzlg0BNB0EFR5kTBOqYAvMS2tcmCYLiYnOUcERDQwmWnm/4hnu2B2Fk29W7pGntz
 lylVCu8I+NrFywGFpNU3f1xe
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 May 2022 23:52:45 -0700
IronPort-SDR: gUBxS1BhO64bpT/UzNIM8F5btPCCOtTA9khyWJqTav9mPVOzRNITOQHSPNtnEp4QvaxZW7MIEh
 TrctIJkuJedAu7mRKyUB+xc1f2Ao/vGEvaJ48Kdkq85Uw3m8My73smDwEWI77VRsGlgnsmiTZx
 5G6R247tWJwAMRLF5/NM67fKFx5AKuAIiJlAnIrLbd0aBglI1NGvPO38wIvV53TnUTyDqe/N3j
 aFFy4mb4zMbiGNM6cSnwIfyZVOUXwEaPbYS1PBnt9vwlT3dlI/jqn3B6S6wpD6an7jckLrvX4Z
 22I=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 May 2022 00:33:12 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4L68FM3tj1z1Rvlx
        for <linux-doc@vger.kernel.org>; Mon, 23 May 2022 00:33:11 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1653291190; x=1655883191; bh=LJ8/2FSDHURz0Zuhe/Qx3SaImInSLYq6abN
        68q4sCnc=; b=fbzRa9DHE20CwXRkfGCjdgl4Zx6hwQ1fI7gSJy9Vj9vrbyA+aoA
        Rw4pr+X1sm88OhK0n/MDZUOKzRM6+1XUPow3v38BNiuuWUVEjPBAs9JimtP0J1oa
        5enJzvjcWir1XMEjtGp0JTqRmXwbjRULL5fIoXkiLjsspkVa4jgTQ05LmTmyHnhR
        tAowXU1Vzw58oSBt7G62IYzQ0lpP7zWaJj51+rCw1WCpuu18fMc5yugLgsQ/CeJU
        id9aSljXegV2ggC4TO5fIgUiEHK+NcWIdCLYtpiMwg5m/PynMdAGy7CWYAxCpc+z
        CjoJdVpQWLUB4jwo/6+Bk7Cb0jybiv+eikw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id Lq5rhOyApkDJ for <linux-doc@vger.kernel.org>;
        Mon, 23 May 2022 00:33:10 -0700 (PDT)
Received: from [10.89.85.73] (c02drav6md6t.dhcp.fujisawa.hgst.com [10.89.85.73])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4L68FJ4nptz1Rvlc;
        Mon, 23 May 2022 00:33:08 -0700 (PDT)
Message-ID: <6175fe49-f3e2-bfcb-2b97-b58763f1cf0e@opensource.wdc.com>
Date:   Mon, 23 May 2022 16:33:05 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH 3/4] scsi: core: Cap shost max_sectors according to DMA
 optimum mapping limits
Content-Language: en-US
To:     John Garry <john.garry@huawei.com>, joro@8bytes.org,
        will@kernel.org, jejb@linux.ibm.com, martin.petersen@oracle.com,
        hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-ide@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-scsi@vger.kernel.org, liyihang6@hisilicon.com,
        chenxiang66@hisilicon.com, thunder.leizhen@huawei.com
References: <1653035003-70312-1-git-send-email-john.garry@huawei.com>
 <1653035003-70312-4-git-send-email-john.garry@huawei.com>
 <e65e7329-67e3-016f-e213-86e51b8021d6@opensource.wdc.com>
 <d5a31b82-4134-a7fb-1a51-446e32db2fd0@huawei.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <d5a31b82-4134-a7fb-1a51-446e32db2fd0@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2022/05/23 15:53, John Garry wrote:
> On 21/05/2022 00:30, Damien Le Moal wrote:
>>> diff --git a/drivers/scsi/hosts.c b/drivers/scsi/hosts.c
>>> index f69b77cbf538..a3ae6345473b 100644
>>> --- a/drivers/scsi/hosts.c
>>> +++ b/drivers/scsi/hosts.c
>>> @@ -225,6 +225,11 @@ int scsi_add_host_with_dma(struct Scsi_Host *shost, struct device *dev,
>>>   	shost->cmd_per_lun = min_t(int, shost->cmd_per_lun,
>>>   				   shost->can_queue);
>>>   
> 
> Hi Damien,
> 
>>> +	if (dma_dev->dma_mask) {
>>> +		shost->max_sectors = min_t(unsigned int, shost->max_sectors,
>>> +				dma_opt_mapping_size(dma_dev) >> SECTOR_SHIFT);
>>> +	}
>> Nit: you could drop the curly brackets here.
> 
> Some people prefer this style - multi-line statements have curly 
> brackets, while single-line statements conform to the official coding 
> style (and don't use brackets).

OK.

> 
> I'll just stick with what we have unless there is a consensus to change.
> 
> Thanks,
> John
> 
>>
>>> +
>>>   	error = scsi_init_sense_cache(shost);
>>>   	if (error)
>>>   		goto fail;
> 


-- 
Damien Le Moal
Western Digital Research
