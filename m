Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 10D3D7D87A
	for <lwn-linux-doc@archive.lwn.net>; Mon, 10 Sep 2018 22:51:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbeIKDrh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 10 Sep 2018 23:47:37 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:40372 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726217AbeIKDrh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Sep 2018 23:47:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=hc4IlQhF3Phesq7k51FXQ9Jgbq3bdqp2K2rCftZKgIg=; b=D1K7I9zywkzP19OFOdtwf7Vvp
        rpPFf4cUqLzSRLSyzdJ0ai0ff7ZEXeXR6mcbq2z9brtgAiatarQmLrx6UyUjaFfAkvl+sOJpKxKHI
        0C7bNThRo+C3QDnaOJ1/E/oeuD5clrsPUpRMjl//GSSeR4/+9SZkHJo2qG00h9pUgVvW7Bkc7TeMh
        5/hPayW3E6EPS7wQNwfYDanj6eKQAZy6mImERTp9d1PfpUcVIcc/S8DkczqWPfJSlCgn3Yg2856L7
        nvOqCS1lsVah3bcqMb+qpAL8oAYq4WR3E+zopQGBLjOGly4gLd2Kxnzg/N+V84J4Zf4SAth7wfScV
        HGEaSS/1Q==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fzV1d-0004WT-2d; Mon, 10 Sep 2018 22:51:21 +0000
To:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: nodocs in 4.19-rcX
Message-ID: <ace3eeb9-0a15-a4ff-cf2d-af9335fd9810@infradead.org>
Date:   Mon, 10 Sep 2018 15:51:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jonathan,

4.19-rc contains some users of :nodocs: but that is not recognized yet,
so we get:

lnx-419-rc3/Documentation/core-api/boot-time-mm.rst:78: ERROR: Error in "kernel-doc" directive:
unknown option: "nodocs".

.. kernel-doc:: mm/bootmem.c
   :nodocs:

lnx-419-rc3/Documentation/core-api/boot-time-mm.rst:91: ERROR: Error in "kernel-doc" directive:
unknown option: "nodocs".

.. kernel-doc:: mm/memblock.c
   :nodocs:


Do you plan to merge the patch(es) for :nodocs: ?

thanks,
-- 
~Randy
