Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D24B7C433EF
	for <linux-doc@archiver.kernel.org>; Wed,  6 Apr 2022 08:59:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236522AbiDFJBr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Apr 2022 05:01:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1446748AbiDFI4j (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Apr 2022 04:56:39 -0400
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6412241FA3A
        for <linux-doc@vger.kernel.org>; Tue,  5 Apr 2022 18:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1649209691; x=1680745691;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=VuoVmwsM1kjAIgmEzd4iWUN0hXYBPqUPYmlYGxx90q0=;
  b=kJ1NHzeHl5aQt+tO+r1y0nJkUwR+AyAMkpIc13M4tcbFKjrHIzsjSvUT
   whZcipRu6mqZAW1I1jMyYd4gmiwzG+ui2UGrOd/FjDcRRQ6yd+2S/c01d
   2VUYfVzrgaB/ZkXXRmRgJ85ZVf0TMCuo9PXfuEyIHgGhKja2NhKhiZzMV
   GDpLIkTYdg0xyiBY+ilbBastNQWnyn5FiWETd+ncuRn1y55wqiNI/v2gG
   MqHRdjbhFJTdB9fKDHfRPjXqCeeksm34Nq3gQfi1nzghnXq8W7fnZhYxo
   /eaWXJUGLL9+C/G+4+090rqSMbMAs/pa+SaRITDlheqRYARZm7F/QUxvl
   w==;
X-IronPort-AV: E=Sophos;i="5.90,238,1643644800"; 
   d="scan'208";a="202037230"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 06 Apr 2022 09:48:05 +0800
IronPort-SDR: R5z1LoHBZU495kWQFWRmqeK3ZqNBVdDS3PmggahFJ39ssJmgJ9N8hTjs3U8DIMeKMS0zksUFIW
 6v4sbcXeabiJIEnV5ayJh3kWR95MztrX5jtbQM+BrTbep+syMQOG4k0z0TxlXBoPBXZ17STXkC
 STxTiaA4DVWU4Wj6HBuckv+Aoql/MWAxk2DrnpC6f//VVsfOsgqm/sj6FiqVDk2GIbpg/TIdig
 3Eu5XMGKwKO9itXClgN9WXIXJdhb3QjLhXwBM+bCcGVTBi/guLMPFGJkS4d5+Q0pdwQB+c2oi7
 CdFjIzcRoQgiM2bZVmoqREk5
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Apr 2022 18:18:48 -0700
IronPort-SDR: 2enYcOEv4x+BAhSneFO+nyP1OFDxxFWtSeJ3xRaF7NL+3cr5fi/ls0o4qlQtNYZVC8EIVSRjrj
 +OnoU5o4TK/v9j6kBELsG1zf88iss/f5WHP6RIUt4OUsiuJd/iLCyVdrlj6OKE7h2YOLGji3ac
 7eSxlncpNA+Zrz80/caTwnxq9mHK6ZTra0fUQnipB6AQSIk8qPF/F1jKhw0ShBh6KNuTXoYrwp
 ISbQnMmGw+0kNfdHpjI1mRnD1E73wUhtJkRRBxO+gP5EHW4rmAU6PCjvv6i5cYam+iyOFjcqrl
 ibA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Apr 2022 18:48:06 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KY6ps52v2z1SVp0
        for <linux-doc@vger.kernel.org>; Tue,  5 Apr 2022 18:48:05 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1649209685; x=1651801686; bh=VuoVmwsM1kjAIgmEzd4iWUN0hXYBPqUPYml
        YGxx90q0=; b=E4UOnw8BjAuFsxgUNz1JVDSZoX8yQLctisFANLe1Z/7C0dFuEJk
        LfdRZDbW8aSOdPPRAKOLeHbtE6mmG+YYKwab0H3EYIozRVzMTdKBgE2ik7HJHuwe
        1b/tZXQrhQEBKn14uwEUh3KXtkYU3AwYxZb/cftSIWs4sLb5Ii1/2OmbJOA5JmTM
        pMTGewU2Q4eeocqSTsJgcr3aFdUI/EEHKR3ZwRZqyhl210d7gKEwFqJzkMZnFvWx
        sVkMFEpQFSvwkCv/cyub/aWGqmuHgeyvyl77QlJzkoPLP94S2ray/pI2ibZtgHr6
        MBrtS9l0xhBIHxhWo4d1BYM4S1B2CX7v4tQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 1IITOeN00g7o for <linux-doc@vger.kernel.org>;
        Tue,  5 Apr 2022 18:48:05 -0700 (PDT)
Received: from [10.149.53.254] (washi.fujisawa.hgst.com [10.149.53.254])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KY6pr31hmz1Rvlx;
        Tue,  5 Apr 2022 18:48:04 -0700 (PDT)
Message-ID: <f7bbb09f-562f-fce2-cd16-a1c67fc334b5@opensource.wdc.com>
Date:   Wed, 6 Apr 2022 10:48:03 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] libata: Inline ata_qc_new_init() in
 ata_scsi_qc_new()
Content-Language: en-US
To:     Christoph Hellwig <hch@lst.de>, John Garry <john.garry@huawei.com>
Cc:     linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-scsi@vger.kernel.org
References: <1649083990-207133-1-git-send-email-john.garry@huawei.com>
 <1649083990-207133-3-git-send-email-john.garry@huawei.com>
 <20220405055252.GA23698@lst.de>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220405055252.GA23698@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/5/22 14:52, Christoph Hellwig wrote:
> On Mon, Apr 04, 2022 at 10:53:10PM +0800, John Garry wrote:
>> From: Christoph Hellwig <hch@lst.de>
>>
>> It is a bit pointless to have ata_qc_new_init() in libata-core.c since it
>> pokes scsi internals, so inline it in ata_scsi_qc_new() (in libata-scsi.c).
>>
>> <Christoph, please provide signed-off-by>
>> [jpg, Take Christoph's change from list and form into a patch]
>> Signed-off-by: John Garry <john.garry@huawei.com>
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Although I still think merging the two patches into one to avoid all
> the churn would be much better.

I agree. Let's merge these 2 patches.


-- 
Damien Le Moal
Western Digital Research
