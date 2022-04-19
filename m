Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F64CC4332F
	for <linux-doc@archiver.kernel.org>; Tue, 19 Apr 2022 06:44:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231149AbiDSGrC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 Apr 2022 02:47:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237419AbiDSGrB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Apr 2022 02:47:01 -0400
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF37431378
        for <linux-doc@vger.kernel.org>; Mon, 18 Apr 2022 23:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1650350661; x=1681886661;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8WWWeqkjRsJguwhNbQdCeYL7WvDMBr86xY9Uzcx3OXA=;
  b=lWKWucuUxWhCj22S+HzeLshqEDFbWAngaAbmSlC5ZGTFPXjVntThVG9H
   DWQkSyXJUvNgTy+vOURB9vm+TBmZIrhgtQY16QQYQ7XAyBLq+PR6E4hjt
   ZmxSJhYi6XaRs9vdmzWwjXz8bDouL5bWsZJwos1GNuse15E2fPlcUr4+d
   pbWBspcfRl/W7T9z8URYsuxUOtgJLozw38mvBIrhp30IFJCB420GzAB/O
   gPeEhXVunOCDXH6mdhBUIMQgQQ15wY5tFQB6nhMszPfsqJKW36hjyp3EA
   0TzJ72ZD7qlpD+gv4l4fwk86Yf8yEMSo4P2Sj8t5m6nvT86wHNMS06KQS
   w==;
X-IronPort-AV: E=Sophos;i="5.90,272,1643644800"; 
   d="scan'208";a="199133686"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 19 Apr 2022 14:44:19 +0800
IronPort-SDR: 8ADurf1946pRa+0in6m/yUfOPlR2mYGrDGKKEy9M8sdK0SOx1onAQqVvhw2nnvMYQO/O9n7Nss
 qnKcqHlgheuTzXLRlVLcVnWUT/syryJSv4Wyino0EPAFlFju59GlGmJmcwfkEZOaF+ZArIUuz1
 eVbB4UisMlhfKLgpUwab6/Px3Zjb8upCfOaNOrOg6lOPyYUGhL9xluWy0uzGLA6NMKZJSReGoa
 SnxQv36VcbwbIYgGZyVpMfio6GpMWlWTs/nUchYPMXJ17f5nwr4T5BMs+8Aq6rt2gVMirj3a5j
 ngfhJn1ZseWwi5+GHMYxVFuZ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Apr 2022 23:14:39 -0700
IronPort-SDR: s7QNJY1euVADYAmxHf6FDH0h5widzXA1NGXZ4ekmwLe2j2bOU3TVRW1IeUBEGbK+l7HKT7iRQZ
 VSbRADsBydXGPpz9sY9zTLIbi77euDtwHJ0xbuB6NKxD2DpoEpiH0tphTfSJGNH7ySPnVzg7sY
 5v+Aj6ut53NCrLDuhzWXwJ2LlEmLiDQ/SYUQAqESkPcsCPXgpVVv50I8p8zkBd1d88I1oF1Z2q
 0RYccVivISZZhwhQqLYKygtIrm1agtKgQeAK0/NmQE+wcAiYzFI3cObKhBJtWDaVLBupTG/QTw
 uXM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Apr 2022 23:44:19 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KjDmf4ZM2z1SVp2
        for <linux-doc@vger.kernel.org>; Mon, 18 Apr 2022 23:44:18 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1650350657; x=1652942658; bh=8WWWeqkjRsJguwhNbQdCeYL7WvDMBr86xY9
        Uzcx3OXA=; b=rErrfmkm1eN0G90XNiKwz3BP6CTW8icQ48Osq+ekJiG4DQxQwid
        6zuPxQsa7uK/IW/QcPikMBUOlxEhg2FyYhGVfoww/j0nQ+3ywc1cCSUtsx5r7RGg
        CCczSTFxS5ZiJLygtA3jK4PeoCirK+m79Uu7q9IbR08R2P079vtIB8Ek+AwokjaN
        QZEKWDEC+tynmqWGUkJRp0asRXe50vqTEIXVvre2eAH2Y9+RDA9KbBCwsJXqd7fW
        99ND1HhAqLnRrgaE0T/Se9JEuG9CfKfsL4Gi5wbc7NqMiUn24LTOUX47mczpNPNB
        z98Vk1QBz3A2y+esuzpgZn1GNUPflMzit7A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id RU26uWeLdMWw for <linux-doc@vger.kernel.org>;
        Mon, 18 Apr 2022 23:44:17 -0700 (PDT)
Received: from [10.225.163.14] (unknown [10.225.163.14])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KjDmc3KYcz1Rvlx;
        Mon, 18 Apr 2022 23:44:16 -0700 (PDT)
Message-ID: <7991758d-16b4-c9c4-0425-c2ec41943db8@opensource.wdc.com>
Date:   Tue, 19 Apr 2022 15:44:15 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] Drop Documentation/ide/
Content-Language: en-US
To:     Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>
Cc:     patches@lists.linux.dev, Christoph Hellwig <hch@lst.de>,
        Jens Axboe <axboe@kernel.dk>, linux-ide@vger.kernel.org,
        linux-block@vger.kernel.org
References: <20220419011021.15527-1-rdunlap@infradead.org>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220419011021.15527-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/19/22 10:10, Randy Dunlap wrote:
> Drop all Documentation/ide/ since IDE support was deleted by
> Christoph Hellwig <hch@lst.de>, Jun 16 2021.
> 
> Fixes: b7fb14d3ac63 ("ide: remove the legacy ide driver")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: linux-ide@vger.kernel.org
> Cc: linux-block@vger.kernel.org

Acked-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

Jonathan,

Are you going to take this patch or do you want me to queue it through the
libata tree ?

-- 
Damien Le Moal
Western Digital Research
