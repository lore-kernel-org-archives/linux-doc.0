Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 738527D08C
	for <lwn-linux-doc@archive.lwn.net>; Wed,  6 Jun 2018 08:54:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932343AbeFFIx4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 6 Jun 2018 04:53:56 -0400
Received: from mail-lf0-f68.google.com ([209.85.215.68]:42323 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932290AbeFFIxy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Jun 2018 04:53:54 -0400
Received: by mail-lf0-f68.google.com with SMTP id v135-v6so7869047lfa.9
        for <linux-doc@vger.kernel.org>; Wed, 06 Jun 2018 01:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KFCZqKw1JCkf/KAOJsnTNttqWEk37rnMum1mVmWTp5g=;
        b=AcyiikX8+71R3oKn1h1nkChUCekT6PEw5uiOe3Jn87/gB2x4nmnoPuNF2DxE5S+9y5
         6zbVv0HvG5Jzq3sD8/U5QL4FKskBDWeAc1FP4dSa0bezVaTRm4nRERB6B8WMosmV0wl3
         asOSmHNVfEZNi4e5PGZlQw2/bngEm55nMGL6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=KFCZqKw1JCkf/KAOJsnTNttqWEk37rnMum1mVmWTp5g=;
        b=P/8mI7qb7vXVqPi3SwN3hR1wY7oLg25eQ9nixgPvQ6KiUluB8HKLa2EGqAfRSwk5c7
         FmIe0tFQhNGQQQW7pCzqIIbFfRuyb4CBNlG4ZvCq7texoAbfHY/wxICwzyd6NoejPDK4
         FKCY8lE/gHJJoHqDf9zMH3vvHFrpHlfk1XJ3svbgNCdeEIvDPSEbQo2k+rQx0LrlRMIU
         D224lnQYTTypn6r+5T24tjeogFSVOX13BYUXE+PCsN0bhycjgDtRTFPHsB5NvyYJ3BkW
         hyKZbcXirtrz0Dtd7CmjLzKGmUW8cl9Pe0zKrmiqV0/BJ1+XIW+Gyt7H5XVGbwdq1TOh
         7LOQ==
X-Gm-Message-State: APt69E3NwhU3gGMcfrxrPqA/qKKs/mZ2hjEZlPPgPUTv1hGKnyY7ig0r
        sGtR69LkiZhyvjtiTo7MEOql0n+dSRA=
X-Google-Smtp-Source: ADUXVKIcregdNZj2hWX0XliozQ1h3FaL4Pa1tB9FE6OA/wJ+l2oQjS/RzvAyu2mWfWceCCb2moeo2Q==
X-Received: by 2002:a19:d898:: with SMTP id r24-v6mr1148254lfi.7.1528275233397;
        Wed, 06 Jun 2018 01:53:53 -0700 (PDT)
Received: from khorivan (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id t15-v6sm4679124lfd.79.2018.06.06.01.53.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jun 2018 01:53:52 -0700 (PDT)
Date:   Wed, 6 Jun 2018 11:53:50 +0300
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     Vinicius Costa Gomes <vinicius.gomes@intel.com>
Cc:     grygorii.strashko@ti.com, davem@davemloft.net, corbet@lwn.net,
        akpm@linux-foundation.org, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, henrik@austad.us,
        jesus.sanchez-palencia@intel.com
Subject: Re: [RFC PATCH 0/6] net: ethernet: ti: cpsw: add MQPRIO and CBS
 Qdisc offload
Message-ID: <20180606085348.GB5346@khorivan>
Mail-Followup-To: Vinicius Costa Gomes <vinicius.gomes@intel.com>,
        grygorii.strashko@ti.com, davem@davemloft.net, corbet@lwn.net,
        akpm@linux-foundation.org, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, henrik@austad.us,
        jesus.sanchez-palencia@intel.com
References: <20180518211510.13341-1-ivan.khoronzhuk@linaro.org>
 <87602y1n4j.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87602y1n4j.fsf@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 04, 2018 at 02:23:56PM -0300, Vinicius Costa Gomes wrote:
>Hi Ivan,
>
>Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org> writes:
>
>> This series adds MQPRIO and CBS Qdisc offload for TI cpsw driver.
>> It potentially can be used in audio video bridging (AVB) and time
>> sensitive networking (TSN).
>>
>> Patchset was tested on AM572x EVM and BBB boards. Last patch from this
>> series adds detailed description of configuration with examples. For
>> consistency reasons, in role of talker and listener, tools from
>> patchset "TSN: Add qdisc based config interface for CBS" were used and
>> can be seen here: https://www.spinics.net/lists/netdev/msg460869.html
>>
>> Based on net-next/master
>>
>
>I didn't test this, but it looks fine from my side.
>
>I agree with Grygorii, that if no comments, this should be re-sent as a
>patch series next.
Thanks, I'll do it on this week.

>
>
>> Ivan Khoronzhuk (6):
>>   net: ethernet: ti: cpsw: use cpdma channels in backward order for txq
>>   net: ethernet: ti: cpdma: fit rated channels in backward order
>>   net: ethernet: ti: cpsw: add MQPRIO Qdisc offload
>>   net: ethernet: ti: cpsw: add CBS Qdisc offload
>>   net: ethernet: ti: cpsw: restore shaper configuration while down/up
>>   Documentation: networking: cpsw: add MQPRIO & CBS offload examples
>>
>>  Documentation/networking/cpsw.txt       | 540 ++++++++++++++++++++++++
>>  drivers/net/ethernet/ti/cpsw.c          | 364 +++++++++++++++-
>>  drivers/net/ethernet/ti/davinci_cpdma.c |  31 +-
>>  3 files changed, 913 insertions(+), 22 deletions(-)
>>  create mode 100644 Documentation/networking/cpsw.txt
>>
>> --
>> 2.17.0
>
>
>Cheers,
>--
>Vinicius

-- 
Regards,
Ivan Khoronzhuk
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
