Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6DB7C433EF
	for <linux-doc@archiver.kernel.org>; Wed,  6 Apr 2022 12:24:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233007AbiDFM0E (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Apr 2022 08:26:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233019AbiDFMZn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Apr 2022 08:25:43 -0400
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BA361D08F7
        for <linux-doc@vger.kernel.org>; Wed,  6 Apr 2022 01:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1649232619; x=1680768619;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=W+sQyQXwqNPtg3DW2PfzXKmUropifws/e8bOcPZZ7OU=;
  b=Ikh9/WBRVWkxL0SZ32Q8cpYE7/amOzDB3g/u/wUsnSH/IoVlxNF115og
   GrJOSfHKLHuqui4Kj85nPBJlXXUvdtk6k8KxJ1HetBx9oRZe89oXdgk+H
   BgWir0zL84go5t1BvwuqeaA8dQ70X5Ywg4Ied8U325b1BPJBKmVIA4Iym
   EcVceVNO8ABwmAFSz3ZDyG2Ob852lRfl5OoT+BFZRvyiBZR14EbYGDfF+
   nnz7u4KvRExKw6Du76LTf5PQUvCCLrnY39NRuty4uVw2gcHrKHOSpzxAz
   0gLErK9oSF35+eeJf/IaC++nGTqKeybXCabFxtbyHhSQ1Xli2ohsYDDSh
   g==;
X-IronPort-AV: E=Sophos;i="5.90,239,1643644800"; 
   d="scan'208";a="198116342"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 06 Apr 2022 16:10:18 +0800
IronPort-SDR: kGIYD3rI6UjUIM8gwh/485Sf2TPIUw2IELNLRSqZ6trRMsD+WTTNyXPbS0QOyUi6QmQgN8ui8V
 RgaU3qQKmAkDufXf1FYT4heg/2cXpVgFvEtTGpSRkTkwnilLnqkJYudkOuwzfIyLSLGA5LpK5P
 q6+QKjrI34DekNTpWgX+Qx4GY410EqwkdWx60WS5GTfeAkXEC+Fut9gzU5muSx3/r71/KwL9BO
 UgZwBdnNMpPjoJaRkjtjy+MrVjUfAuBDD64dcUApPotoXD3z9aqp24C7YgqAaX1hqEApF4xam3
 5XSIDjmlu/sGx0grnOlQNRnj
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Apr 2022 00:40:59 -0700
IronPort-SDR: 3yl+LXyu5gtyhlbzLAyr70wRKT8oiD3kMmuPlpb4eYqH+L8EPQneGDAn2TtQFtWrJtk9GKmRQY
 lkgLIR2DFJlKDNZs6J9L2oojZyxJCTTPR5xY+JtrMen6f0hgcHmY0Atpr6Il0i+hHoLArxs97M
 tnKx+mUm8wLgoe17lyOe+UenecFuH1Iy8KY/BY8emimHdyFSIyPJ4yDZdFtUGlOYONuAUXcstN
 7YvH5SE0nynWytsfENpnx7kVZjt4n59aahpWvphdWgiOmqDo88DPkVSPsk/ThTu6V9EnFW2wuM
 YMA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Apr 2022 01:10:18 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KYHHs1NgLz1SHwl
        for <linux-doc@vger.kernel.org>; Wed,  6 Apr 2022 01:10:17 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1649232616; x=1651824617; bh=W+sQyQXwqNPtg3DW2PfzXKmUropifws/e8b
        OcPZZ7OU=; b=Y6xg7hgBprDMhQ9Dd9yZYi4n5vw1VkHmGMIB+1Gb/HpwKMH3Nc8
        gmrqc9mu3pjeJ1LUydu6p2X3dmmBsJP3EoDbypQA/8EgW2uuzAZcnQXTLBie40HT
        sZpZjRgozIo+IbnV0QDFQl4B0efwec0utMN5DpPxOY7t6+MzUGJMwgNrWPRE6gzX
        sQts++PNkctblTnuD72tngEIhJqlOYt5lgcByWZ/T5f+Fy4SRXuAA3els6ycoCXg
        5uW49QQMj7eArdp23KXOlIUuB9dpUlsIxPbld4lYaY6sFmcc5C0mol9wz1bfBHq1
        XnmlhUEWsKdxBbVph8Ztd4qXHawIv/MbS5Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id BhwfgL0k5CN9 for <linux-doc@vger.kernel.org>;
        Wed,  6 Apr 2022 01:10:16 -0700 (PDT)
Received: from [10.149.53.254] (washi.fujisawa.hgst.com [10.149.53.254])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KYHHq6LY1z1Rvlx;
        Wed,  6 Apr 2022 01:10:15 -0700 (PDT)
Message-ID: <0c6c0c64-74f8-e15a-d79e-0866b5cc209d@opensource.wdc.com>
Date:   Wed, 6 Apr 2022 17:10:14 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] libata: Use scsi cmnd budget token for qc tag for
 SAS host
Content-Language: en-US
To:     John Garry <john.garry@huawei.com>, hch@lst.de
Cc:     linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-scsi@vger.kernel.org
References: <1649083990-207133-1-git-send-email-john.garry@huawei.com>
 <1649083990-207133-2-git-send-email-john.garry@huawei.com>
 <a3cce73f-2e91-309d-bee0-a34a30335a18@opensource.wdc.com>
 <ab6a13c1-90c4-63f0-c48d-c1faa0ae68fd@huawei.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <ab6a13c1-90c4-63f0-c48d-c1faa0ae68fd@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/6/22 16:12, John Garry wrote:
> On 06/04/2022 02:39, Damien Le Moal wrote:
>> On 4/4/22 23:53, John Garry wrote:
>>> For attaining a qc tag for a SAS host we need to allocate a bit in
>>> ata_port.sas_tag_allocated bitmap.
>>>
>>> However we already have a unique tag per device in range
>>> [0, ATA_MAX_QUEUE) in the scsi cmnd budget token, so just use that
>>> instead.
>>
>> The valid range is [0, ATA_MAX_QUEUE - 1]. Tag ATA_MAX_QUEUE is 
>> ATA_TAG_INTERNAL which is never allocated as a valid device tag but 
>> used directly in ata_exec_internal().
> 
> But that is what I have in [0, ATA_MAX_QUEUE), which is same as [0, 
> ATA_MAX_QUEUE - 1].

Oh ! I missed the ")" !
I would prefer an explicit [0, ATA_MAX_QUEUE - 1] to be clear :)

> 
> Thanks,
> john


-- 
Damien Le Moal
Western Digital Research
