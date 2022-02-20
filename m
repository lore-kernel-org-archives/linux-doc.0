Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 448DAC433FE
	for <linux-doc@archiver.kernel.org>; Sun, 20 Feb 2022 01:37:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243297AbiBTBhh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 19 Feb 2022 20:37:37 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243296AbiBTBhg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 19 Feb 2022 20:37:36 -0500
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCCD241627
        for <linux-doc@vger.kernel.org>; Sat, 19 Feb 2022 17:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1645321036; x=1676857036;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=sA62GIn4J7Vn1J8aTsNQLtDPF43p9ytzlEaBVC5jSkw=;
  b=U/fHwuweJ7Vju6pob2qQYvoUYC3DjAv75I92dHfQaLOtaCAKvHExrSX3
   Tv43ETountj87SD0DAM6jMU9sksdLCNN6OFKEbJ91ip+gyz/Quu4ImVsB
   xvctbNQhy2G9B0pzr4Z06CtUCS3mgyqifFHo9eJjleKGvqL/zgOZOc/RZ
   cYhNv/CIBFYh+fhCn8q45HCe97tziSSC6KzaXpxu0mdalAiVncyUZymCg
   9FkU5dWL3V52uekRCUhtMRKs+XpHusNC6dSQYc5SKMU8stn7AbsufVhYG
   tTfHX8ICijeZGg9Ribx8qJjdr0FCvKlammB58hq/rY3dFrWNKKgE/RXRG
   A==;
X-IronPort-AV: E=Sophos;i="5.88,382,1635177600"; 
   d="scan'208";a="192333132"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 20 Feb 2022 09:37:15 +0800
IronPort-SDR: AWpUgpvrYNbgDQBFeC68HztzyXHnkpW2+cRSzQaFugg7s6cbxqsQFjk85UTBb8iWC7wVoOMsUY
 BQTIS/SEf9oK/OqwTDOFLr+ElvxoahtE+65FXjruHnLCaXKMlvjvdH91y3Ikg0VRGPw0+1y9tn
 iHB85+7chPZmZarXGD35nzM4BW2oXvJGapvFzODG26HFQBKmrAQkSXWtrMpD7AW1+ePOoC5z9n
 BQN7KGK9Eqews9sdzGJVU6LsdqqQU8e5TmU4QbPLRXrZ1aeoH3uN11QCv0dBLZJ+sHbpkua6dt
 7FKkFUFWwL4mxtkq7opeEJuY
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2022 17:09:57 -0800
IronPort-SDR: 8ARMIWqOeSkG8v1BFv8VK+TOqXbTUdvWkb3xILuQ6isWRyC/BZVj7lcqavm0CjVBLCksFSntRe
 wXt2yOPMaK959nEzNIolMqwXFUj1JaY43fietjeUiLUf24cnBm2U/G2hO2wqKruUzcaYTyOULV
 73D7wscD0alKbAMfocOFkxsOyc+QLptPmfgSnA+da9qrnlH1buKsxSXbx9qjqFl2ZYNz5PyLuW
 gilDY7/VkfL+tnCkrtlUaLATQNZxErmqGrVvQ2W2nyaeno07CY8764/rHOOqBRhU482NdAKuj3
 aYU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2022 17:37:15 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4K1Sj647qCz1SVp4
        for <linux-doc@vger.kernel.org>; Sat, 19 Feb 2022 17:37:14 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1645321033; x=1647913034; bh=sA62GIn4J7Vn1J8aTsNQLtDPF43p9ytzlEa
        BVC5jSkw=; b=sMnG9vHr3Nj2EDJv+2DzQnkkhfjha2fa1kvJdm+SzAVf8VH8eAA
        TwLYiYRhPGOcsMd0npt18GrjIQy0UMXEzTwzEMpLHd/biEeExWOfD+JGK7tc/0RS
        sbbmkIziZRHn1NBmWmlyOyMC34pPPZJxOCcTl2Zhqp8ROMWfDN71jGJl+xl+Rlps
        quYi1O9dULdrUtAqUxifXANCmv4pgqeqEPMxJq3JR+HPFtHDGxZoIx+bijcI0XnG
        obgZrxeTmOCpCDy9jO2D+VWOUzNAs3ghh0fm7eoQBamJkWTBdu7FL2Xurmr4ANGE
        Po4KWtZ02aZTn4U13XRaTRTVJ4lbFBpj0wQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 0zzhu9-muvQC for <linux-doc@vger.kernel.org>;
        Sat, 19 Feb 2022 17:37:13 -0800 (PST)
Received: from [10.225.163.78] (unknown [10.225.163.78])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4K1Sj33bjNz1Rvlx;
        Sat, 19 Feb 2022 17:37:11 -0800 (PST)
Message-ID: <0d4f988d-881c-3717-f9d8-38739cf17e91@opensource.wdc.com>
Date:   Sun, 20 Feb 2022 10:37:10 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 00/18] scsi: libsas and users: Factor out LLDD TMF code
Content-Language: en-US
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     John Garry <john.garry@huawei.com>, jejb@linux.ibm.com,
        artur.paszkiewicz@intel.com, jinpu.wang@cloud.ionos.com,
        chenxiang66@hisilicon.com, hch@lst.de, Ajish.Koshy@microchip.com,
        yanaijie@huawei.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linuxarm@huawei.com, liuqi115@huawei.com, Viswas.G@microchip.com
References: <1645112566-115804-1-git-send-email-john.garry@huawei.com>
 <yq1zgmmh675.fsf@ca-mkp.ca.oracle.com>
 <b9aea895-4b24-4529-0d87-5148e6990c95@opensource.wdc.com>
 <yq1ee3yfhnj.fsf@ca-mkp.ca.oracle.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <yq1ee3yfhnj.fsf@ca-mkp.ca.oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2/20/22 10:31, Martin K. Petersen wrote:
> 
> Damien,
> 
>>> Applied to 5.18/scsi-staging, thanks!
>>
>> Did you push this ? I do not see John series in the branch...
> 
> It's there now.
> 

Got it. Thanks !

-- 
Damien Le Moal
Western Digital Research
