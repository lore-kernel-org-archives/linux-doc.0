Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1BBA47E279
	for <lwn-linux-doc@archive.lwn.net>; Mon, 23 Apr 2018 21:17:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932280AbeDWVRd (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 23 Apr 2018 17:17:33 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:52380 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932254AbeDWVRd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 23 Apr 2018 17:17:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=pMi3EKrftXs5OMkv+xkb+R0VcYXX4g+CEqGoLLs3JBs=; b=M33AFhEnCvNyclI94WH/1QS+8
        Oel5D6ZUBIG5jSQyjtFYpdyANLbwgDR04sJJyVhSivokgbOjURk34URTbT+nIdiXpDyL3lPwthb2T
        wgEQdGDLijIRqX8hvT9woolKn57hUZbz/catfpSdaBy/CsadP+MZakCXE3dJ9sSVYTxEyQbOhUHK3
        p2qIm3g63xkeh9taB8JHrSGtBiEjiS/f5HlkJauyWm088Nf4VORBy+xAVFYmpcx6vPFmS1DADGzSn
        9/nwQ8QYeuFufVVuIh/JVzw0kA4fctti4rHO/xUjvfB67STD/r0QToiXMLqKSUk9NV46GUwydhv2j
        6IhuJSEFg==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fAiq1-0004Nl-Rs; Mon, 23 Apr 2018 21:17:30 +0000
Subject: Re: [PATCH v1 1/1] misc: IBM Virtual Management Channel Driver
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     "Bryant G. Ly" <bryantly@linux.vnet.ibm.com>,
        benh@kernel.crashing.org, mpe@ellerman.id.au, arnd@arndb.de,
        corbet@lwn.net, seroyer@linux.vnet.ibm.com,
        mrochs@linux.vnet.ibm.com, adreznec@linux.vnet.ibm.com,
        fbarrat@linux.vnet.ibm.com, davem@davemloft.net,
        linus.walleij@linaro.org, akpm@linux-foundation.org,
        mikey@neuling.org, pombredanne@nexb.com,
        tlfalcon@linux.vnet.ibm.com, msuchanek@suse.de,
        linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <1524494812-60150-1-git-send-email-bryantly@linux.vnet.ibm.com>
 <1524494812-60150-2-git-send-email-bryantly@linux.vnet.ibm.com>
 <c07b14b7-8f34-2ba5-536f-85896ff21661@infradead.org>
 <20180423195310.GA10693@kroah.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <4142fd3b-05eb-d934-bcd3-f8f564e24fa7@infradead.org>
Date:   Mon, 23 Apr 2018 14:17:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180423195310.GA10693@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 04/23/18 12:53, Greg KH wrote:
> On Mon, Apr 23, 2018 at 11:38:18AM -0700, Randy Dunlap wrote:
>> On 04/23/18 07:46, Bryant G. Ly wrote:
>>> This driver is a logical device which provides an
>>> interface between the hypervisor and a management
>>> partition.
>>>
>>> This driver is to be used for the POWER Virtual
>>> Management Channel Virtual Adapter on the PowerVM
>>> platform. It provides both request/response and
>>> async message support through the /dev/ibmvmc node.
>>>
>>> Signed-off-by: Bryant G. Ly <bryantly@linux.vnet.ibm.com>
>>> Reviewed-by: Steven Royer <seroyer@linux.vnet.ibm.com>
>>> Reviewed-by: Adam Reznechek <adreznec@linux.vnet.ibm.com>
>>> Tested-by: Taylor Jakobson <tjakobs@us.ibm.com>
>>> Tested-by: Brad Warrum <bwarrum@us.ibm.com>
>>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>> Cc: Arnd Bergmann <arnd@arndb.de>
>>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>>> ---
>>>  Documentation/ioctl/ioctl-number.txt  |    1 +
>>>  Documentation/misc-devices/ibmvmc.txt |  161 +++
>>>  MAINTAINERS                           |    6 +
>>>  arch/powerpc/include/asm/hvcall.h     |    1 +
>>>  drivers/misc/Kconfig                  |   14 +
>>>  drivers/misc/Makefile                 |    1 +
>>>  drivers/misc/ibmvmc.c                 | 2415 +++++++++++++++++++++++++++++++++
>>>  drivers/misc/ibmvmc.h                 |  209 +++
>>>  8 files changed, 2808 insertions(+)
>>>  create mode 100644 Documentation/misc-devices/ibmvmc.txt
>>>  create mode 100644 drivers/misc/ibmvmc.c
>>>  create mode 100644 drivers/misc/ibmvmc.h
>>
>>> diff --git a/Documentation/misc-devices/ibmvmc.txt b/Documentation/misc-devices/ibmvmc.txt
>>> new file mode 100644
>>> index 0000000..bae1064
>>> --- /dev/null
>>> +++ b/Documentation/misc-devices/ibmvmc.txt
> 
> Aren't we doing new documentation in .rst format instead of .txt?

I am not aware that .rst format is a *requirement* for new documentation.

??

-- 
~Randy
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
