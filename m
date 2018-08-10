Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9E94A7D00A
	for <lwn-linux-doc@archive.lwn.net>; Fri, 10 Aug 2018 15:21:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728075AbeHJRvt (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 10 Aug 2018 13:51:49 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:51799 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727352AbeHJRvt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Aug 2018 13:51:49 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20180810152130euoutp0133331b3dbcfffdd0bbde91898fbcef22~Jjxo74yyX2869128691euoutp015;
        Fri, 10 Aug 2018 15:21:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20180810152130euoutp0133331b3dbcfffdd0bbde91898fbcef22~Jjxo74yyX2869128691euoutp015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1533914490;
        bh=xRnDLZqvcGW055V67jfr4R6NFy2wkUCZD4R7qYcG+2c=;
        h=From:To:Cc:Subject:Date:In-reply-to:References:From;
        b=X10kpFXmtMGtoz7mJ7vORmYuhVnUddrNenuk8jw8oP25RRBcYd/TkYcKJS8V9IH+2
         rs6Isz6Dd72b6koDfx0Y7QvBPsLHsU32g2ULXUkyf/delE9HLh+bFv/cewbFZXmQCa
         rvCBYmTEiRZBcT8VhLj+YcRP/SgsnzUzZDPRTrXE=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20180810152130eucas1p24119cbd2ca85983d8fae5a3f7ce40e80~Jjxookatn0554305543eucas1p2m;
        Fri, 10 Aug 2018 15:21:30 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id B2.83.04806.A7DAD6B5; Fri, 10
        Aug 2018 16:21:30 +0100 (BST)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20180810152129eucas1p1f89d84bc1fa21ae10d6d4de897433d33~JjxnvXDGw1168711687eucas1p1n;
        Fri, 10 Aug 2018 15:21:29 +0000 (GMT)
X-AuditID: cbfec7f5-367ff700000012c6-15-5b6dad7a5966
Received: from eusync1.samsung.com ( [203.254.199.211]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 85.77.04128.97DAD6B5; Fri, 10
        Aug 2018 16:21:29 +0100 (BST)
Received: from amdc3058.localnet ([106.120.53.102]) by eusync1.samsung.com
        (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5
        2014)) with ESMTPA id <0PD90003S3ZTUR10@eusync1.samsung.com>; Fri, 10 Aug
        2018 16:21:29 +0100 (BST)
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Antonino Daplas <adaplas@pol.net>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] Documentation/fb: corrections for fbcon.txt
Date:   Fri, 10 Aug 2018 17:21:28 +0200
Message-id: <3719966.vSoGJ8kQly@amdc3058>
User-Agent: KMail/4.13.3 (Linux/3.13.0-96-generic; KDE/4.13.3; x86_64; ; )
In-reply-to: <74fe20d7-0200-fb2b-c765-63da788456be@infradead.org>
MIME-version: 1.0
Content-transfer-encoding: 7Bit
Content-type: text/plain; charset="us-ascii"
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrCIsWRmVeSWpSXmKPExsWy7djP87pVa3OjDQ4dFbBY0naZzeLJgXZG
        iytf37NZPLu1l8liYdsSFosTfR9YLd7emc7iwO6xeYWWx6HDHYwe97uPM3ks7pvM6jH3cDO7
        x+dNcgFsUVw2Kak5mWWpRfp2CVwZd3/eZi5oZq443PibvYFxD1MXIyeHhICJRM+rTpYuRi4O
        IYEVjBIH/i1nBUkICXxmlPh2NruLkQOsqPkqVM0yRok5HU3MEM5vRokz76aCTWITsJKY2L6K
        EcQWEdCQ+H3lCitIEbPALCaJ5TeusYMkhAUcJK5fucQCMpVFQFXi1DYfkDCvgKbE7P/LmEFs
        UQEviS372plASjgFHCWO/2eDKBGU+DH5HguIzSwgL7Fv/1RWCFtH4uyxdYwgqyQEDrBJtPX8
        Y4b4zEXictcqKFtY4tXxLewQtozE5cndLBAN0xkl3vxaCuWsZ5RYc+YYNFysJQ4fvwi1gk9i
        0rbpzJCg4JXoaBOCKPGQON4+jRESElMYJU7OPs86gVFmFpJrZyG5dhaSaxcwMq9iFE8tLc5N
        Ty02zkst1ytOzC0uzUvXS87P3cQITAun/x3/uoNx35+kQ4wCHIxKPLwMqTnRQqyJZcWVuYcY
        JTiYlUR4M01zo4V4UxIrq1KL8uOLSnNSiw8xSnOwKInz8mmlRQsJpCeWpGanphakFsFkmTg4
        pRoYTZnUKho1LJ2PKvWp8pm5Lj+X/MB3kmvktYM/vu9R7n658PfjG0ye02Ofr4p06C281bFy
        7ctL+nUiv9p/5a9mmSR1+PPzgEVJnUIyl5+k/Zpo/1suZ00Kq0idhtON1v1aCyXyD3+Isq9I
        awlcqn3mgK+8F69ngtapd4dCjp/WzltwZd5RH4NVSizFGYmGWsxFxYkA03MwGgcDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrELMWRmVeSWpSXmKPExsVy+t/xy7qVa3OjDU5OUbZY0naZzeLJgXZG
        iytf37NZPLu1l8liYdsSFosTfR9YLd7emc7iwO6xeYWWx6HDHYwe97uPM3ks7pvM6jH3cDO7
        x+dNcgFsUVw2Kak5mWWpRfp2CVwZd3/eZi5oZq443PibvYFxD1MXIweHhICJRPNVli5GLg4h
        gSWMEg1PNzNDOH8ZJTa9aQJyODnYBKwkJravYgSxRQQ0JH5fucIKUsQsMIdJYt6i6WAJYQEH
        ietXLrGATGURUJU4tc0HJMwroCkx+/8ysDmiAl4SW/a1gy3mFHCUOP6fDWLXNEaJLZtXsUHU
        C0r8mHyPBcRmFpCX2Ld/KiuErSWxfudxpgmM/LOQlM1CUjYLSdkCRuZVjCKppcW56bnFRnrF
        ibnFpXnpesn5uZsYgSG97djPLTsYu94FH2IU4GBU4uFlSM2JFmJNLCuuzD3EKMHBrCTCm2ma
        Gy3Em5JYWZValB9fVJqTWnyIUZqDRUmc97xBZZSQQHpiSWp2ampBahFMlomDU6qBsfH0nebl
        j5+UHd8/e13mtsWdp5f+Wmnr84zjjj+DuV+rRXKW7mTFWscF7FN3ZQVu796loHj4QtD+usOH
        i9bPedy3863Ur31+LzpLlLprV+VFfNrn+V1G4eSz5vKF61WqFk15bzTXuKk2V9T/TOG+7kz1
        qn38DJKCeavX9zqZPdv+++z0g5PKbymxFGckGmoxFxUnAgCgVDboZQIAAA==
X-CMS-MailID: 20180810152129eucas1p1f89d84bc1fa21ae10d6d4de897433d33
X-Msg-Generator: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20180807162802epcas3p41d328edbbe86a7c4417b4f4567bbea26
References: <CGME20180807162802epcas3p41d328edbbe86a7c4417b4f4567bbea26@epcas3p4.samsung.com>
        <74fe20d7-0200-fb2b-c765-63da788456be@infradead.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tuesday, August 07, 2018 09:27:52 AM Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix grammar, spacing, indentation, and Kconfig menu locations
> in fbcon.txt.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Patch queued for 4.19, thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

