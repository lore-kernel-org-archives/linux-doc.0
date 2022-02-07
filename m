Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD718C4332F
	for <linux-doc@archiver.kernel.org>; Mon,  7 Feb 2022 13:43:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381647AbiBGNlf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Feb 2022 08:41:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1448997AbiBGNOa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Feb 2022 08:14:30 -0500
X-Greylist: delayed 62 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 07 Feb 2022 05:14:30 PST
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 909EDC043188
        for <linux-doc@vger.kernel.org>; Mon,  7 Feb 2022 05:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1644239668; x=1675775668;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+21Yyghs+bY9yok1fzjGL7GBXTYblCJPLUpgvVaqhd0=;
  b=iPXjWctu9xbPYMx7sW+1xITRwRuYn2WB4MXMTgFBt29rrzbqAlt6AnSR
   aXaqW5Q2uKX4/jwymoIazWY2igIb8zxE2iY6Er952a/wTG8Ebt57s8u2S
   ScIB5qOeB3E/nk4NzCgjeepPCEGcivKrK7R4x7T4s90DIm/7+XqfEkN/U
   PJ32v60h8l3dHIAxapr/iNhiZquqXarO8LJ3q2XSFRKQZI/+wf7JHWhY/
   xyuugNdYjlrb0E/bbJpwpNUI68NZpcAoxgyH1CmX+UmEitgvImvJMne+W
   J2/+cYmyuL4EGP26LHnaKphN+MR9dPToAU2NjsQbKyYSr+bFwuPAsagJm
   w==;
X-IronPort-AV: E=Sophos;i="5.88,349,1635177600"; 
   d="scan'208";a="197144059"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 07 Feb 2022 21:13:20 +0800
IronPort-SDR: GGGOE3+5WxdoUPCfdCYHH1wrCZs8NgxsCugMGA169AyzHr1Bd0h4q+BBnATq59OmtQEEN70dLM
 BHjRiAetujzqy/zgHvxxhhScYg8kUFvjlLhpqyGjCnt3ryNW+AvGzBzCGsTBQ+NTLeJlLEys+K
 Nn0m5ila8cxPHZK22/Yo3vVtQJv41Mf7077QZgRsDUN6Bpcg7s3UJi9KtB87UwF2xPsWPV3pzO
 NCnpD73OfdfM22opELGnCmVhY+UEDY1Eg7dtG1OXswbPr9uvX7VbLI0kumpOj0AK0/KLJL1zA5
 WHITtbqvPZYKKIenyjlWOrl8
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2022 04:46:23 -0800
IronPort-SDR: bFW908WaXjhbu57VhAtq3NzTCrqCfFOGdkugO1OY2szQvsXwNSnKzsU7dUi24XEGL2L5W5B5EK
 TtbuGUBjop1EPWb200Ww75PxoxowdIM9JhXcDVLlM4mt2Z4BdxfQeeak2La0DLrXS7jParezzD
 bx4Jj7yfoNIZh0GL8ZzMlcE+t4sujLQUR/vlrifyA1yvWUs6iDNlIfNXiLXdnDBQuMPvL9cM5B
 k2k8LM4hfD2tIV32MeG98RPaYfcdwc/WDpDcpMFUHisIlB7iR3zmwlS469eh1JFmdpd/tlvAYE
 7UQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2022 05:13:22 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JsmmK5mQXz1SVp3
        for <linux-doc@vger.kernel.org>; Mon,  7 Feb 2022 05:13:21 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1644239600; x=1646831601; bh=+21Yyghs+bY9yok1fzjGL7GBXTYblCJPLUp
        gvVaqhd0=; b=bT71PG1JnGgtpyzgL7ysLwH5cScwUnHimAea8aVkvrXak/d3FIh
        nR0UIyV0lbhU841TImHZ6+cwvjXsnFHUcIL9B7JHhJ6BndQ/6r25/7pBzWfdsUMX
        IEipyrvU7INZMPLGz1NGmF0gEB6XNFSwsZFbYcRucios52D3sc7sowhtcvfO8IwO
        JYYlhSXJVKHInuXdzZus7x/lMCY6myhx7s+mG5m4eoWMVrJ8DM3WKArraKoe7PNF
        c1gmANPKlp1izojLlvXz3/t54TeOWDcmVaaxHSSmWbuKa7dN814tytmrcB8U+sf0
        RBIZ05hglZCyfUlPjsTfwfxMHAhQVWBiqYg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id OKa50Aa_Jn2e for <linux-doc@vger.kernel.org>;
        Mon,  7 Feb 2022 05:13:20 -0800 (PST)
Received: from [10.225.163.63] (unknown [10.225.163.63])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JsmmG5ddvz1Rwrw;
        Mon,  7 Feb 2022 05:13:18 -0800 (PST)
Message-ID: <071c0b1d-32fb-e02f-d4e9-1540701d837b@opensource.wdc.com>
Date:   Mon, 7 Feb 2022 22:13:17 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 00/16] scsi: libsas and users: Factor out LLDD TMF code
Content-Language: en-US
To:     John Garry <john.garry@huawei.com>, jejb@linux.ibm.com,
        martin.petersen@oracle.com, artur.paszkiewicz@intel.com,
        jinpu.wang@cloud.ionos.com, chenxiang66@hisilicon.com,
        Ajish.Koshy@microchip.com
Cc:     yanaijie@huawei.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        linuxarm@huawei.com, liuqi115@huawei.com, Viswas.G@microchip.com
References: <1643110372-85470-1-git-send-email-john.garry@huawei.com>
 <1893d9ef-042b-af3b-74ea-dd4d0210c493@opensource.wdc.com>
 <14df160f-c0f2-cc9f-56d4-8eda67969e0b@huawei.com>
 <a8fae323-1877-058a-b03e-d175a725213f@opensource.wdc.com>
 <a2de1656-b1ec-2fb7-caab-657e27dacb48@huawei.com>
 <49da4d80-5cc3-35c3-ccaa-6def8165eb65@huawei.com>
 <59a198a8-1d87-bc09-d2d8-2d495ed74c16@opensource.wdc.com>
 <098f988e-1f12-c412-3111-60393dfe0f0b@huawei.com>
 <f3362c6f-b4b6-2914-0652-d786e19b6b03@opensource.wdc.com>
 <62e56609-7026-93a1-a446-a6fd68328653@opensource.wdc.com>
 <1114e27f-e6b3-e9b9-a892-f543f4636c4e@huawei.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <1114e27f-e6b3-e9b9-a892-f543f4636c4e@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2/7/22 22:09, John Garry wrote:
> Hi Damien,
> 
> On 04/02/2022 03:02, Damien Le Moal wrote:
>> This is the submission path, not completion. The code is:
>>
>> (gdb) list *(pm8001_queue_command+0x842)
>> 0x3d42 is in pm8001_queue_command (drivers/scsi/pm8001/pm8001_sas.c:491).
>> 486				atomic_dec(&pm8001_dev->running_req);
>> 487				goto err_out_tag;
>> 488			}
>> 489			/* TODO: select normal or high priority */
>> 490			spin_lock(&t->task_state_lock);
>> 491			t->task_state_flags |= SAS_TASK_AT_INITIATOR;
>> 492			spin_unlock(&t->task_state_lock);
>> 493		} while (0);
>> 494		rc = 0;
>> 495		goto out_done;
>>
>> So the task is already completed when the submission path tries to set
>> the state flag ? Debugging...
> 
> JFYI, I am putting together a patch to drop SAS_TASK_AT_INITIATOR 
> altogether. I just need to ensure that the logic in the isci code is 
> correct.

Great. Less dead code for the pm8001 driver :)

I was busy with a nasty libata bug today so I did not continue my
investigations. Will try tomorrow.


> 
> Thanks,
> John


-- 
Damien Le Moal
Western Digital Research
