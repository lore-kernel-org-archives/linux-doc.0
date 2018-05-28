Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=DKIM_SIGNED,
	FORGED_MUA_MOZILLA,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DDDE37D048
	for <lwn-linux-doc@archive.lwn.net>; Mon, 28 May 2018 07:06:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753667AbeE1HFE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 28 May 2018 03:05:04 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:42295 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753641AbeE1HE6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 May 2018 03:04:58 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20180528070456euoutp0227cb44b2439efdcd8a59d2cc5a082e02~yvQ8gHvEC2873728737euoutp028
        for <linux-doc@vger.kernel.org>; Mon, 28 May 2018 07:04:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20180528070456euoutp0227cb44b2439efdcd8a59d2cc5a082e02~yvQ8gHvEC2873728737euoutp028
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1527491096;
        bh=xunWBq7oKY2xJ/B63qCsJz8sQ8wHOM8iXnvJ0n4z+O8=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=qxiQjYPIjIAQQnJMCKSyQv+tgGpQmUjVShJzDSU4+7T8OMrGfbumDDCn+fGK6c1jt
         sh1J5YmzzO/wTv/M/i5L6xpRXlFuQ3FDVhX7pTdxAnE3bO0AMxtOiMCD+b2HgLc7/S
         mcDKfKyC1CISv8s3DDTMAHXCBQtiFu8TMK9i5rKc=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20180528070454eucas1p1f8a407a53394c06c2792d621abaa1327~yvQ6vfD5N2263822638eucas1p1N;
        Mon, 28 May 2018 07:04:54 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id C2.DA.17380.51AAB0B5; Mon, 28
        May 2018 08:04:53 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20180528070453eucas1p294be19abd2cab7d112404d15710edfde~yvQ5mevbz2769227692eucas1p2k;
        Mon, 28 May 2018 07:04:53 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20180528070452eusmtrp1b22d20e577d1eea12a18c33c7c9a48f2~yvQ5SlEjM1265812658eusmtrp1g;
        Mon, 28 May 2018 07:04:52 +0000 (GMT)
X-AuditID: cbfec7f4-6f9ff700000043e4-b8-5b0baa1563a6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id CA.39.04178.41AAB0B5; Mon, 28
        May 2018 08:04:52 +0100 (BST)
Received: from [106.116.147.122] (unknown [106.116.147.122]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20180528070452eusmtip23a4ffdb610c322c1b56c904cc6d97bc6~yvQ4wgUf_0461204612eusmtip2A;
        Mon, 28 May 2018 07:04:52 +0000 (GMT)
Subject: Re: [PATCH v2 1/3] usb: gadget: ccid: add support for USB CCID
 Gadget Device
To:     Marcus Folkesson <marcus.folkesson@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Felipe Balbi <balbi@kernel.org>, davem@davemloft.net,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
From:   Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Date:   Mon, 28 May 2018 09:04:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
        Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180526211940.25474-1-marcus.folkesson@gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAKsWRmVeSWpSXmKPExsWy7djP87qiq7ijDfrmWlvMWb+GzeJY2xN2
        iycH2hkt5pxvYbFoXryezaJnThOjxcK2JSwWl3fNYbNYtKyV2WLi+nusFu8/dTJZvL0zncWi
        Z+cJRovNm6YyO/B5bFl5k8lj56y77B6bV2h5bFrVyebx7tw5do8TM36zeOyfu4bdY3HfZFaP
        z5vkAjijuGxSUnMyy1KL9O0SuDK+3pjGWnCHs6J5ZVoD40X2LkZODgkBE4nXP6YzdTFycQgJ
        rGCU+Dn7NyuE84VRonnrchaQKiGBz4wSe9dHwHRcOTOTHaJoOaPE8RWtzBDORyDnD8gsTg5h
        gXCJhhPbGEESIgInmSUmNq1lBkkwC0RInPhykBHEZhMwlth7sAPMZhFQlZh89z2YLQpU0/T8
        J9iBvAKCEidnPgE7g1PAQWLemiuMEHPEJW49mc8EYcsDnTob7AoJgb/sEh+2fYNqLpNYMqeZ
        BeJuF4lvN3awQtjCEq+Ob4GGgIzE6ck9UDXlElM3X2ODGNTDKLH8w1uoBmuJw8cvAtkcQNs0
        Jdbv0ocIO0rc6HjKDhKWEOCTuPFWEOIePolJ26YzQ4R5JTrahCCqlSW2fD3FDGFLSrS+WcY4
        gVFpFpIvZyH5bBaSz2Yh7F3AyLKKUTy1tDg3PbXYKC+1XK84Mbe4NC9dLzk/dxMjMN2d/nf8
        yw7GXX+SDjEKcDAq8fA2/OaKFmJNLCuuzD3EKMHBrCTCy6ULFOJNSaysSi3Kjy8qzUktPsQo
        zcGiJM4bp1EXJSSQnliSmp2aWpBaBJNl4uCUamBk2mw6W9hV4O7DOssypsYp8lcSHNtPOGfY
        ZTcv16nkXM7y5qp3CFfWg5Bb4bJTtsssYjMvjo+UPccwS7Kwiv+jLWPUIfeZkzQDd5iaLBKv
        e3WBw2DLau7WfUYSRZarepjvX69x8H4SkS2YatKcWL5mX/hGM7H35m0533veP77rEJR6adlb
        ByWW4oxEQy3mouJEACG4nCNzAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrCIsWRmVeSWpSXmKPExsVy+t/xe7oiq7ijDSa+MrSYs34Nm8Wxtifs
        Fk8OtDNazDnfwmLRvHg9m0XPnCZGi4VtS1gsLu+aw2axaFkrs8XE9fdYLd5/6mSyeHtnOotF
        z84TjBabN01lduDz2LLyJpPHzll32T02r9Dy2LSqk83j3blz7B4nZvxm8dg/dw27x+K+yawe
        nzfJBXBG6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZmSrp29mkpOZklqUW6dsl
        6GV8vTGNteAOZ0XzyrQGxovsXYycHBICJhJXzswEsrk4hASWMkqsWPGbGSIhKdH78ABUkbDE
        n2tdbBBF7xkljt2fBlYkLBAu8WHTH2aQhIjAWWaJ/wsvgiWYBSIk1n6+xALRMZlRYuvzjawg
        CTYBY4m9BzsYQWxeATuJx4f/gsVZBFQlJt99DxYXBWq+d/4TG0SNoMTJmU9YQGxOAQeJeWuu
        MEIsMJOYt/kh1DJxiVtP5jNB2PISzVtnM09gFJqFpH0WkpZZSFpmIWlZwMiyilEktbQ4Nz23
        2FCvODG3uDQvXS85P3cTIzDGtx37uXkH46WNwYcYBTgYlXh4G35zRQuxJpYVV+YeYpTgYFYS
        4eXSBQrxpiRWVqUW5ccXleakFh9iNAV6biKzlGhyPjD95JXEG5oamltYGpobmxubWSiJ8543
        qIwSEkhPLEnNTk0tSC2C6WPi4JRqYHRKmvPx7kqDPflyi/5YqRxqK/mpENGe3u05973Y0jd8
        n/ybVSWPp798UrIqXdevdc2FupOhlyL2fExN2ieVozHnZ0+LwpQ/Z6Ifuj6Oy94/y69dXkvj
        2IIHWjM9a5b/cttjXvCgJ+jduSVaC+02TC99FsZUNbf/9u5QSYHyE6H/1OQ2Lb/yvU2JpTgj
        0VCLuag4EQBmmTaqBwMAAA==
Message-Id: <20180528070453eucas1p294be19abd2cab7d112404d15710edfde~yvQ5mevbz2769227692eucas1p2k@eucas1p2.samsung.com>
X-CMS-MailID: 20180528070453eucas1p294be19abd2cab7d112404d15710edfde
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20180526212048epcas2p1510fd6c92f20e8f6d0059742ab5fb3f7
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20180526212048epcas2p1510fd6c92f20e8f6d0059742ab5fb3f7
References: <CGME20180526212048epcas2p1510fd6c92f20e8f6d0059742ab5fb3f7@epcas2p1.samsung.com>
        <20180526211940.25474-1-marcus.folkesson@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Mi Marcus,

W dniu 26.05.2018 o 23:19, Marcus Folkesson pisze:
> Chip Card Interface Device (CCID) protocol is a USB protocol that
> allows a smartcard device to be connected to a computer via a card
> reader using a standard USB interface, without the need for each manufacturer
> of smartcards to provide its own reader or protocol.
> 
> This gadget driver makes Linux show up as a CCID device to the host and let a
> userspace daemon act as the smartcard.
> 
> This is useful when the Linux gadget itself should act as a cryptographic
> device or forward APDUs to an embedded smartcard device.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---

>   
> +config USB_CONFIGFS_CCID
> +	bool "Chip Card Interface Device (CCID)"
> +	depends on USB_CONFIGFS
> +	select USB_F_CCID
> +	help
> +	  The CCID function driver provides generic emulation of a
> +	  Chip Card Interface Device (CCID).
> +
> +	  You will need a user space server talking to /dev/ccidg*,
> +	  since the kernel itself does not implement CCID/TPDU/APDU
> +	  protocol.

Your function needs a userspace daemon to work.
It seems you want to use FunctionFS for such a purpose
instead of creating a new function.

Andrzej
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
