Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=DKIM_SIGNED,
	FORGED_MUA_MOZILLA,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B46B57D062
	for <lwn-linux-doc@archive.lwn.net>; Mon, 28 May 2018 09:13:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754153AbeE1JMh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 28 May 2018 05:12:37 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:57376 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753984AbeE1JMg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 May 2018 05:12:36 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20180528091233euoutp020b00d761fc76660cd6914c175ec875bc~yxAYGUy6f2990229902euoutp02n
        for <linux-doc@vger.kernel.org>; Mon, 28 May 2018 09:12:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20180528091233euoutp020b00d761fc76660cd6914c175ec875bc~yxAYGUy6f2990229902euoutp02n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1527498753;
        bh=AtIvXAHW3G2pgFU5VAYrzS3spxgJ8WiOMg0ru+SI5uo=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=LLBWGV1Ie2sDLYwPa0gyHvGP8k1BDmVHf0O1Gas4rvSwuVjmHyg6gpI68hznE5PAO
         IXJn2hR4aw1Ai7xlzbxW7OPydHzpXg4SIgIWgMy5ZcmmR9QiHjwpHNe1PrhKMIPPQJ
         24IiQEqr4oXh7Vipb06FomFs1HbBazQ8TPKgzwHU=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20180528091231eucas1p2825c4183ccfdabffc674422d2ed7a6e6~yxAV9fSBZ2014120141eucas1p2O;
        Mon, 28 May 2018 09:12:31 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id F0.CC.05700.EF7CB0B5; Mon, 28
        May 2018 10:12:30 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20180528091229eucas1p20cfbb68cdfaa6de2cf5b5a7e2bdac72c~yxAUSF7e61070710707eucas1p2j;
        Mon, 28 May 2018 09:12:29 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20180528091229eusmtrp14b781346266f115976ca0b55dabf81ee~yxATp9x9K1838718387eusmtrp1N;
        Mon, 28 May 2018 09:12:29 +0000 (GMT)
X-AuditID: cbfec7f2-1c1ff70000011644-b9-5b0bc7fee098
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id C9.AC.04178.CF7CB0B5; Mon, 28
        May 2018 10:12:28 +0100 (BST)
Received: from [106.116.147.122] (unknown [106.116.147.122]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20180528091228eusmtip2b97f9662fc14b79e7f953ce8d95927b7~yxATHZ7pf0595205952eusmtip2m;
        Mon, 28 May 2018 09:12:28 +0000 (GMT)
Subject: Re: [PATCH v2 1/3] usb: gadget: ccid: add support for USB CCID
 Gadget Device
To:     Marcus Folkesson <marcus.folkesson@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Felipe Balbi <balbi@kernel.org>, davem@davemloft.net,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
From:   Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Date:   Mon, 28 May 2018 11:12:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
        Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180528083834.GB4651@gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf0hTYRTl23vbe65mz5l4K0ucWGakSRGPilCIeGF/BGGFQrn0odmm4y01
        A2W1ppYrKhFrKv2wdOlquekyITQDZ1ozE0rDfk/KSpu6ShNWvp6R/51z7rn3O/fykZh8SLyU
        PJR1hOWylCqFRIo7Oqdda33OBcnr3pti6CqrRUJ3FrkJ2t1ejOiq3pM4ra+xSmhj1QlEXy26
        jtP9rVUS+lqtAaPPW1+L6W8Tp0T06FAFThvvdSHabivH4vyZppuDIuae6RXB2M1RjK3+lIQZ
        c7kIpuviDM60VVsIpuZsmZiZtK3Y5Zck3ZLGqg7lslzM1hRpxp3KAs2XwKOWmaeYDg0uOo1I
        EqgN0PJu22kkJeWUGUFxcSkhEC+CMd/jOTKJ4JbJhf3rqDseJOh1CH5d7xEJZBzB2bcfZ01+
        ZCC1F3RdDsQ3LKZiwf4mjvdg1BgGZyx6nPdIqPVw/0EJ4jFORYDxSouIx0HUPmg8N/F3jowK
        gEeX3Dg/x4+Khm5vPC9jVDC8dF8WCTgU9M2Vf+1AGUio/lIgtObCyIwFF/Rt0DDcJhFwIHx2
        NhECDoGeMuOcJw/K7c8lfE6gjAjqPKNiobAZHjr7xHwGjFoN1tYYQY6HgZJhQriJPwyMBghx
        /OGCo2LuVDIoKZIL7nBo+t49l3IJGL7WonNIYZq3o2neYqZ5i5n+v3sF4fUomM3RqtNZbWwW
        mxetVaq1OVnp0anZahua/XM9PudEC/r+7GAHokikWCiLnJYmy8XKXG2+ugMBiSkWy6RrZyVZ
        mjL/GMtlH+ByVKy2Ay0jcUWwbH9kYZKcSlceYQ+zrIbl/lVFpN9SHap5zHWW5bKewuph9x51
        atC11ANhOzS3480py0PvvGtnM6ceeMPj1rwp7f+UkKj70btx/Peyxny9jIufWmlL1FhGvDbl
        utUVHk8YFxZS+yJNbDAkR/z0VRufqMo/EKsSiK8DT+4Oept3h0rbbzg2banxDG1n75ozG/R9
        Ox8xJ+oUuDZDGRuFcVrlH1RrOXBvAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrIIsWRmVeSWpSXmKPExsVy+t/xe7p/jnNHG+xcaWMxZ/0aNotjbU/Y
        LZ4caGe0mHO+hcWiefF6NoueOU2MFgvblrBYXN41h81i0bJWZouJ6++xWrz/1Mlk8fbOdBaL
        np0nGC02b5rK7MDnsWXlTSaPnbPusntsXqHlsWlVJ5vHu3Pn2D1OzPjN4rF/7hp2j8V9k1k9
        Pm+SC+CM0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJSc3JLEst0rdL
        0MvYMLu24LVwxZrfF5gbGG/ydzFycEgImEgsbxTtYuTiEBJYyijx++5T5i5GTqC4pETvwwPs
        ELawxJ9rXWwQRe8ZJabfms0EkhAWCJf4sOkPM8ggEQFDic33HUBqmAU+MUss/DOPCaJhCZNE
        6+S1jCANbALGEnsPdoDZvAJ2EtPubwKzWQRUJXoW7AAbKioQIdE0bw07RI2gxMmZT1hAFnAK
        6Emc+uIIEmYWMJOYt/khM4QtLnHryXwmCFteonnrbOYJjEKzkHTPQtIyC0nLLCQtCxhZVjGK
        pJYW56bnFhvqFSfmFpfmpesl5+duYgRG97ZjPzfvYLy0MfgQowAHoxIPb8Nvrmgh1sSy4src
        Q4wSHMxKIrxcukAh3pTEyqrUovz4otKc1OJDjKZAv01klhJNzgcmnrySeENTQ3MLS0NzY3Nj
        Mwslcd7zBpVRQgLpiSWp2ampBalFMH1MHJxSDYzWTwwir+i3FzdnzZ/pOlNZZOa58xvsEost
        q8sEjrYYLwu7cmzZ1x3S9ux14qZdfwQ07tm/F5N9vWSXzpODXlv9fTWeCnNI8sdfd1mz9/hR
        npPTQ1pu9IW+fdRouklngXOmSrf9zEeibs+Orc/ZnrV4bb9p5G6LpT/ZOt+fM2WV3n9rEmfF
        w7tKLMUZiYZazEXFiQAp36RBBAMAAA==
Message-Id: <20180528091229eucas1p20cfbb68cdfaa6de2cf5b5a7e2bdac72c~yxAUSF7e61070710707eucas1p2j@eucas1p2.samsung.com>
X-CMS-MailID: 20180528091229eucas1p20cfbb68cdfaa6de2cf5b5a7e2bdac72c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20180526212048epcas2p1510fd6c92f20e8f6d0059742ab5fb3f7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20180526212048epcas2p1510fd6c92f20e8f6d0059742ab5fb3f7
References: <CGME20180526212048epcas2p1510fd6c92f20e8f6d0059742ab5fb3f7@epcas2p1.samsung.com>
        <20180526211940.25474-1-marcus.folkesson@gmail.com>
        <20180528070453eucas1p294be19abd2cab7d112404d15710edfde~yvQ5mevbz2769227692eucas1p2k@eucas1p2.samsung.com>
        <20180528083834.GB4651@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

W dniu 28.05.2018 o 10:38, Marcus Folkesson pisze:
> Hi Andrzej,
> 
> On Mon, May 28, 2018 at 09:04:51AM +0200, Andrzej Pietrasiewicz wrote:
>> Mi Marcus,
>>
>> W dniu 26.05.2018 o 23:19, Marcus Folkesson pisze:
>>> Chip Card Interface Device (CCID) protocol is a USB protocol that
>>> allows a smartcard device to be connected to a computer via a card
>>> reader using a standard USB interface, without the need for each manufacturer
>>> of smartcards to provide its own reader or protocol.
>>>
>>> This gadget driver makes Linux show up as a CCID device to the host and let a
>>> userspace daemon act as the smartcard.
>>>
>>> This is useful when the Linux gadget itself should act as a cryptographic
>>> device or forward APDUs to an embedded smartcard device.
>>>
>>> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
>>> ---
>>
>>>    
>>> +config USB_CONFIGFS_CCID
>>> +	bool "Chip Card Interface Device (CCID)"
>>> +	depends on USB_CONFIGFS
>>> +	select USB_F_CCID
>>> +	help
>>> +	  The CCID function driver provides generic emulation of a
>>> +	  Chip Card Interface Device (CCID).
>>> +
>>> +	  You will need a user space server talking to /dev/ccidg*,
>>> +	  since the kernel itself does not implement CCID/TPDU/APDU
>>> +	  protocol.
>>
>> Your function needs a userspace daemon to work.
>> It seems you want to use FunctionFS for such a purpose
>> instead of creating a new function.
>>
>> Andrzej
> 
>>> +	  since the kernel itself does not implement CCID/TPDU/APDU
> Oops, the driver does handle CCID.

Which parts of code do this handling?

Is there any kind of state machine usual for protocols?
If the protocol is stateless then isn't it just a data format then?

Which part of this handling must be done in kernel and why?

Does the said handling do anything other than forwarding the
traffic between USB and a character device?

What is the character device used for? I know: read, write and poll.
But why? To do what?

> 
> Well, yes, It needs an application that perform the "smartcard operations", such as
> generate keys or sign data, as this depends on how it should be used.
> 
> The actual smartcard operations could for example be in software,
> use a crypto engine in SoC or external HSM (Hardware Security Module).
> 
> Without the application, the gadget shows up as a smart card reader
> with an unconnected smartcard.
> 

Does showing up as anything require anything other than merely
providing USB descriptors?

Andrzej
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
