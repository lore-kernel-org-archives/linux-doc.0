Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C229FC43334
	for <linux-doc@archiver.kernel.org>; Mon, 11 Jul 2022 11:22:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231262AbiGKLWO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 11 Jul 2022 07:22:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230527AbiGKLVp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Jul 2022 07:21:45 -0400
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 907C75D59B
        for <linux-doc@vger.kernel.org>; Mon, 11 Jul 2022 03:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1657536388; x=1689072388;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=M38FathVBz+QDBZGXrRIt275IISeBfhxZNFV9WnBgzI=;
  b=HZ1aNajO6/J0p+9gLTDjEEes5JoV7FUwJ/1luQqyWg1YaRpNkRvqrI32
   zM7Tm8ccJfAcoMFp+s2SGUgyrUXP2wiF3pR9f0R43Ayt5DMPVDTmMvEWI
   HzNnB0vosgE8IAiJ6C5pNVHdtU+AQrS8m1xMDOn0wy86m/7zDqdUcfzjp
   Bvq22ZatKBaq26uu6PCtuk/EMvVmxPRIGmcqy5L++hOucg9Ph4me4653T
   Qkp5T6gIyiRAFMiUvvmTAz5TXS9KtouTINe+9pbD9IHLKFJKijo604Hda
   VyI1L8iQTD5WxVdUKVfIZSwE0rbjidDdcp4o32Jpd+XZvy3vmLkVHHKXG
   w==;
X-IronPort-AV: E=Sophos;i="5.92,262,1650902400"; 
   d="scan'208";a="206062167"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 11 Jul 2022 18:46:28 +0800
IronPort-SDR: ai554QTSPJJ96xjvD6eSD6J3gyWWazrZeNkyS7vsw9/A7v4cEIHw6GL4uWzrLRfaKLaCxujNIA
 IwTYLWo9w8CAGYE1VwMJd1HyDw+UHvAErok7/jj7t01RVABmg+s4Hyv/SNccEF/YTGsM34i1VR
 ggg8h1bsaf6BcYg5C/qVRE1Gi6mNGrnROImKkdmTjERpg1QuL+cJmf2xn3myrUgNBGSNrE8TlD
 lOcQEU7I91jJgoJ1QsBOeidkxIXldSawtD/yjfHqZwDEj1DvNVray0iq4k0Mbm3MIF4LdcBRMI
 7E+TCdUClCVa9kZ3nfexbTXc
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Jul 2022 03:03:27 -0700
IronPort-SDR: 8zyZXfdJ+VzY67/v2Mih2iLcmDgWkjecT3D9l6tamYdix+Pc6DUU251t1yHNGr2JaboK8gc5/6
 k3Q/HwTewqoLx6+w66A8Y/RFJaWkq4C2yQNpW8D6+8e+8rUlzjTIzIhsfsqSgxUXIp7jzHFL3a
 rpWdnkSNMNWxASh22pSbMeNkYZaRHYpLl/2AtvUGpwX5NGG4aEOEaoqgz1ZviVmZK/KRtjIsmB
 tRcwI2oqAf5/sQPTUDEaU8pzMMwuVrSKUnvZsODmJJLPi/CVPDObKKL7zBjdUFulS//S/bcWWq
 o5E=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Jul 2022 03:40:28 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LhL4q53Wfz1Rws0
        for <linux-doc@vger.kernel.org>; Mon, 11 Jul 2022 03:40:27 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1657536026; x=1660128027; bh=M38FathVBz+QDBZGXrRIt275IISeBfhxZNF
        V9WnBgzI=; b=Jq8yiythf4/NGMPDez5TDXQRmsRywCxgvudQsGMOmYsnKVsSgRw
        Z4ASuw7usvOrTQKmaPKdWKF6TuTLFpxxEeOa6LGPkWFwal2t9Ftp2g6X1zVAH/Vf
        icYZ6ZMn/S+DdP4FS0n6P1h7o5igMr45a8B/bUdts7FCCnSxCl6n8LdMRPZFkYzX
        IOCwnB6HlRhrkluKixvZotg9Y8P5Z5MwHkQGLEYH2TlYfPYZFdopY6kOukm9SPHi
        MSfHEEhn41NkWpbh+5tU9s8JMTXgsxx5iFx7xwwiFZ2REAmup3MUsSbWP3LCpZFA
        oO4VfhLvJVEW9Wb6ZQS8VgdguaAlSHxUZuw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id rcSbFUbzXloh for <linux-doc@vger.kernel.org>;
        Mon, 11 Jul 2022 03:40:26 -0700 (PDT)
Received: from [10.225.163.114] (unknown [10.225.163.114])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LhL4m0m61z1RtVk;
        Mon, 11 Jul 2022 03:40:23 -0700 (PDT)
Message-ID: <62b801e8-66b6-0af7-b0c9-195823bf9f62@opensource.wdc.com>
Date:   Mon, 11 Jul 2022 19:40:22 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 0/5] DMA mapping changes for SCSI core
Content-Language: en-US
To:     John Garry <john.garry@huawei.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Christoph Hellwig <hch@lst.de>
Cc:     joro@8bytes.org, will@kernel.org, jejb@linux.ibm.com,
        m.szyprowski@samsung.com, robin.murphy@arm.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-ide@vger.kernel.org, iommu@lists.linux-foundation.org,
        iommu@lists.linux.dev, linux-scsi@vger.kernel.org,
        linuxarm@huawei.com
References: <1656590892-42307-1-git-send-email-john.garry@huawei.com>
 <b5f80062-e8ef-9597-1b0c-393140950dfb@huawei.com>
 <20220706134447.GA23753@lst.de> <yq1y1x47jgn.fsf@ca-mkp.ca.oracle.com>
 <5fd4814a-81b1-0e71-58e0-57a747eb684e@huawei.com>
 <6367a264-a3d3-8857-9b5a-2afcd25580cb@opensource.wdc.com>
 <a415e4a1-72ce-53e1-437a-fc7e56e4b913@huawei.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <a415e4a1-72ce-53e1-437a-fc7e56e4b913@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 7/11/22 16:36, John Garry wrote:
> On 11/07/2022 00:08, Damien Le Moal wrote:
>>> Ah, I think that I misunderstood Damien's question. I thought he was
>>> asking why not keep shost max_sectors at dma_max_mapping_size() and t=
hen
>>> init each sdev request queue max hw sectors at dma_opt_mapping_size()=
.
>> I was suggesting the reverse:)  Keep the device hard limit
>> (max_hw_sectors) to the max dma mapping and set the soft limit
>> (max_sectors) to the optimal dma mapping size.
>=20
> Sure, but as I mentioned below, I only see a small % of requests whose=20
> mapping size exceeds max_sectors but that still causes a big performanc=
e=20
> hit. So that is why I want to set the hard limit as the optimal dma=20
> mapping size.

How can you possibly end-up with requests larger than max_sectors ? BIO
split is done using this limit, right ? Or is it that request merging is
allowed up to max_hw_sectors even if the resulting request size exceeds
max_sectors ?

>=20
> Indeed, the IOMMU IOVA caching limit is already the same as default=20
> max_sectors for the disks in my system - 128Kb for 4k page size.
>=20
>>
>>> But he seems that you want to know why not have the request queue max
>>> sectors at dma_opt_mapping_size(). The answer is related to meaning o=
f
>>> dma_opt_mapping_size(). If we get any mappings which exceed this size
>>> then it can have a big dma mapping performance hit. So I set max hw
>>> sectors at this =E2=80=98opt=E2=80=99 mapping size to ensure that we =
get no mappings
>>> which exceed this size. Indeed, I think max sectors is 128Kb today fo=
r
>>> my host, which would be same as dma_opt_mapping_size() value with an
>>> IOMMU enabled. And I find that only a small % of request size may exc=
eed
>>> this 128kb size, but it still has a big performance impact.
>>>
>=20
> Thanks,
> John


--=20
Damien Le Moal
Western Digital Research
