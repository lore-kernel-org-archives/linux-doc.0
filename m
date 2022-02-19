Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43ABEC433FE
	for <linux-doc@archiver.kernel.org>; Sat, 19 Feb 2022 23:05:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242232AbiBSXFj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 19 Feb 2022 18:05:39 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240183AbiBSXFi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 19 Feb 2022 18:05:38 -0500
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 345BA53722
        for <linux-doc@vger.kernel.org>; Sat, 19 Feb 2022 15:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1645311919; x=1676847919;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=kHJ/r1f2SyCAt1W8EUkUx9OyONl6xS5Ptg5B6Feh0xM=;
  b=nhC2CS9Z3nj34k+qjYy+D8NcI39zfKQ/r6Kz/eNwhKla4OSDyuSutTy0
   uKZ2UwAJwb/R85zyzlgKOfgzg1+egmR4IYkbo42ncqG2LdUdg86yzT1Ix
   vdDG2JoD5qD24Tx9b4yDBTaE32fvF/tO95B3ScNIY5YVEWo40z8rzF9Wy
   GpFJ3o+eXAa1MB0fbVhVOaOY4BfFFUVAm8r8c5VDc8B9iMwrQFu+cLTRB
   fL4rZS1+XsqSj9EM/outvSwJx0L8ARpfoNw5wxNXF2/31s7py/P3YY59y
   QHAatouB0swicIP45gAAimvwUZBtmiQ5e4Og3ISLSTr96O8aaFC3Y7fDS
   A==;
X-IronPort-AV: E=Sophos;i="5.88,382,1635177600"; 
   d="scan'208";a="194376851"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 20 Feb 2022 07:05:17 +0800
IronPort-SDR: BE00QC4ICd8qNLD0NO5hNHTQ3jI8n7rF3INSw6FosrfZARrWQha+Ob6yycDd86Dv+LGqLCfu8s
 I/XQ5+3c2J0af9AhkUaSFQ08zn/3/sxPEltfJLYnXNkl5gSE3kfzX7ORDdIjCJ4qMMfsjNF1yf
 Jf1PU29TMFM6+o2Y5FoWEEWBGb1nOFKmapCHehHw/c5l3jHqW/wjkpFBtyRmEcM9DGINCbsLmk
 e8CuL5gkiAuk/hgzdSXdEeeyCBaC1QFQrss1Fz4Y1kItvndVlBxrLpcxC81iCGJF4aRFbumwru
 p17szKB35FsyhoA/oa7Dni9E
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2022 14:36:52 -0800
IronPort-SDR: tOfXSW6gyOY8TuerxcOSwfOKs4FqoYCCSFofwTDoL/DxGRAnz9aLklznVGl078WnQneuXf/GfU
 o2lKMgRal+9PzsGl1wlnwmhbDrcLgJdKriBnyQApL5avTDqoe1PKmBYAMhdyWnV8eJo09FVoLM
 6dfdBhB4Cr1obdoTyGd/noB228G4DDArRcrZNUQWNWSiFzarHMl9AFIJSRBzGHvAFFiqxl1hfO
 14n9gezMLWhTsBbLHfheP26T9vpo2YnFYNtShl0PbuksAU91nRHpZYIt44kcSfWqycpuhmKz3Q
 p1Y=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2022 15:05:16 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4K1PKm3HMPz1SVp6
        for <linux-doc@vger.kernel.org>; Sat, 19 Feb 2022 15:05:16 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1645311915; x=1647903916; bh=kHJ/r1f2SyCAt1W8EUkUx9OyONl6xS5Ptg5
        B6Feh0xM=; b=mvVsPULYTrI6Ny31vsA5J2N+E98vYwcfCrWjY6dhSATKu+Jfbgd
        8KcsE9NjBoTwUXGTRQmcEMuOOWXPh7IUwdqyVC3F1ujvBq5vJD83Xt9tS7C4Pwb5
        l+LZ/r4t0c/yhq3/y2Ae9MRuzVIzF063bZ2Y6STkeca9IAoKNzLWLXRNk9T8Oq6N
        GhEjz2hPaH6Jl5BIG+iQxZGt3ZxhZP19d/fLfRflEWQ3kMu3DUk3XQfx4fYOqbZQ
        Rt3OY0B2oklTst/aBbFE0Vwm9ZWiR1N/2EnXCciljI4GQpxfWF/dL5Ax2/jFg7X+
        nQnvycO72Ady5ddceihZ7O+3vBGuv9KjjDA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 0ylybigyXwk5 for <linux-doc@vger.kernel.org>;
        Sat, 19 Feb 2022 15:05:15 -0800 (PST)
Received: from [10.225.163.78] (unknown [10.225.163.78])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4K1PKj1qGyz1Rvlx;
        Sat, 19 Feb 2022 15:05:13 -0800 (PST)
Message-ID: <8a2b6e4b-6721-dffd-5bfe-70ac8004deaa@opensource.wdc.com>
Date:   Sun, 20 Feb 2022 08:05:11 +0900
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
 <5ecf520e-588c-d756-1cb8-2224535b550e@opensource.wdc.com>
 <yq15ypail31.fsf@ca-mkp.ca.oracle.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <yq15ypail31.fsf@ca-mkp.ca.oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2/20/22 06:53, Martin K. Petersen wrote:
> 
> Damien,
> 
>> This series and my pm8001 series have a conflict. When applying the
>> pm8001 patches on top of these libsas changes, patch 28 has a fairly
>> easy to resolve conflict. Let me know if you want me to send a v6
>> rebased on top of this.
> 
> "fairly easy to resolve", huh? Sure, if you manually rework the entire
> patch.

Sorry about that. It is easy to resolve once you have been staring at
the code for days :) Sending v6 for patch 28.

> 
> Please send me an updated version of #28. The rest of the series is
> fine...
> 
> Thanks!
> 


-- 
Damien Le Moal
Western Digital Research
