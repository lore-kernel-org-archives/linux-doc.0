Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C6FC433F5
	for <linux-doc@archiver.kernel.org>; Mon, 25 Apr 2022 00:31:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236292AbiDYAen (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 24 Apr 2022 20:34:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236605AbiDYAem (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 24 Apr 2022 20:34:42 -0400
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 339C2BC9B
        for <linux-doc@vger.kernel.org>; Sun, 24 Apr 2022 17:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1650846695; x=1682382695;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wDLCtuBq54UtBmgKxE3AVpjC3YNcL/Oi5cNMLBrmOHw=;
  b=Lnr7FMCliDx83gBJ3rvk+MR4w8GOEAoHQM6/ZCuz79Qjjnyqy6sBUoRP
   XJ+eceNYm5UojTKUCXQ2rW49cirHfaNo/vQERMDEqjrdZJGUZBRVb1uSM
   UKbkIAIdlqBbxXnjqemdmoPu5aCgAMjm6OMWuM3DDQZ43RJf2slVwt7qD
   v+LSmPyK7zlIeAX2ArP9ehUS+wHC/lmyKqxXd8ISHHA2MghGwC67/cod+
   Aza/2o0etfRBunPDjl/GlCgcGUkG22BbVGPRITiZqmE8cMEBSuP5GnkR2
   LPbl5qpk548+GEJ+YAr36n70zf1cEUndEZsyKGrXczwLnAB1VdsAOVZJR
   g==;
X-IronPort-AV: E=Sophos;i="5.90,287,1643644800"; 
   d="scan'208";a="198702952"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 25 Apr 2022 08:31:34 +0800
IronPort-SDR: Dbm3JYKrpP8v3yDo9CWkNSYrSw0To+N2i3mn2gkPeBk3Y4akyqdCukQs+PabsR4sGm006N2Ypd
 CoZi/9+pfJYPxeQwCdA5rXRbrttb+/RYkQEkpjyGfsxSdHYWe2E29aalPV5kmosvas7UgbVgnB
 5Ia52KjZI4OAPg/SnpTY2pLnKpNY/BhPm7H2SLycEkSVhWGE/L5acHwAF8tSn2sJ33ZDysVBv7
 xcRdf7qqkjYlgDSqsw4ga1kON95rSTuRU0dQpRvMvtJi/YISmMzXx6e/zxCHOSEGmCY+1A2obA
 kvRkGfPqwDBAN9GK2VL5P00s
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Apr 2022 17:02:32 -0700
IronPort-SDR: FksWxohpXhQCL/jO1X7p0GysUwpK74amRSvpXv84dK8C0C6V6R6wcleaMbbPIkbi1LOUOL+rhX
 V8llDPjHrHxh7eyzKYYCA75ZILXGb+HglYujFa80np0dTCi9VngQVITcuUkF6MJnqQj51Cj7R5
 FNN+5arhR7I8enYHgE2QTwjOiqA4+zc1DQM6ufYY0l1nesQtOUz/MvzYKqpJ/5yC5deAV+yTd3
 P9YuH5Sok0WkOBu6LB0xArFtIjHggWEdxdwXtP48Nk4ZAkloOI1w52oOAyFw4E15Zhn9oEchWd
 F1c=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Apr 2022 17:31:36 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KmmCq54bjz1SVnx
        for <linux-doc@vger.kernel.org>; Sun, 24 Apr 2022 17:31:35 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1650846695; x=1653438696; bh=wDLCtuBq54UtBmgKxE3AVpjC3YNcL/Oi5cN
        MLBrmOHw=; b=DoR0uPeWt/xyFkliUhyDW6DvSryy9Y0bFXtAuH43ROxKkB+uFe+
        9bZwDj6G8CS4bmj72fzJUoFXK6OtCQBpIQ/B0hXBd8RC4mrcI+ymFciCT4N9W5Mz
        lkSRRrKUz+8IrazPZndLAXxqvVZOQD6atFczyNyLlz9UgY+Y1moTWYkqyUehvR7Y
        HMF9A/ko+2pERO/OgxIFHjE2Hbq7HIeOSEn+8R5Eckn7uepMs/qtywX7wPfmz301
        ipUKn1MNGlZRWqfEi4GwRlZrXheKsgLRgzApLgFlJCHc9XcGtwcIy5Q+VpqpzGcr
        cEeMjsO9Rr/wrmaXlpWq/x2sijXj1OlYsBA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id epXt0yEqSCAF for <linux-doc@vger.kernel.org>;
        Sun, 24 Apr 2022 17:31:35 -0700 (PDT)
Received: from [10.225.163.24] (unknown [10.225.163.24])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KmmCp0wCwz1Rvlx;
        Sun, 24 Apr 2022 17:31:33 -0700 (PDT)
Message-ID: <983b5717-0993-cb5e-cc21-71efbcd8f636@opensource.wdc.com>
Date:   Mon, 25 Apr 2022 09:31:32 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] Documentation: drop more IDE boot options and ide-cd.rst
Content-Language: en-US
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Phillip Potter <phil@philpotter.co.uk>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20220424033701.7988-1-rdunlap@infradead.org>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220424033701.7988-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/24/22 12:37, Randy Dunlap wrote:
> Drop ide-* command line options.
> Drop cdrom/ide-cd.rst documentation.
> 
> Fixes: 898ee22c32be ("Drop Documentation/ide/")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Phillip Potter <phil@philpotter.co.uk>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> ---
> I missed a few things in dropping all IDE documentation.
> Hopefully this is all of the remaining pieces.
> 
>  Documentation/admin-guide/kernel-parameters.txt |   20 
>  Documentation/cdrom/ide-cd.rst                  |  538 --------------
>  2 files changed, 558 deletions(-)

Acked-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research
