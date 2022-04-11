Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C9F7C433F5
	for <linux-doc@archiver.kernel.org>; Mon, 11 Apr 2022 12:26:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344958AbiDKM2g (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 11 Apr 2022 08:28:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241422AbiDKM2g (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Apr 2022 08:28:36 -0400
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A76322B1B
        for <linux-doc@vger.kernel.org>; Mon, 11 Apr 2022 05:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1649679982; x=1681215982;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=nxDlmRhRAD3e4b50YnwI05OwnqM0Kx3WSfBLQtZ4B+4=;
  b=gyYxifJFx1YUyLpJyCMcLDw+bRGQZ2ay4nw6xmpZKE5uINFVS6Veqnsh
   38n0b9U1M3DEP6EmOsYJFz+53xwI/thc/NHV/zF61odpZvSCH4hOY1dtu
   AlM5t64txXSP+dlAzk3kya+Y0K4xJrC9AGMJAg5l9OFPEdYww/HSFRRoq
   +dbcIM5+e2sGZVR5hJHwWjawm36kTFgdQkjCtzWZnmPBk48A4q5N9GUF2
   ny8Lu9cKQL8qE9sWaQ/g40HNJsUQJ5CHpdAZ9gzoYk4G8fuxdhXYPqOli
   TO9U2DnLc8JvAIKqkQE6+CGPC0Sj9qQkMdXnpRSsX2N0jY1+NX7+gfnQQ
   A==;
X-IronPort-AV: E=Sophos;i="5.90,251,1643644800"; 
   d="scan'208";a="309587281"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 11 Apr 2022 20:26:21 +0800
IronPort-SDR: Q5OJaHpZBw2ArogKmOLaInLC/DKxCmpOpojU4E4Unvtj/NI1n5dHkADv19U4MiORKuDxSH9TRZ
 f4ASi/ZOd1h2l66xZTZDUirvrThfY/kERACXGx7JUCo2T6GUhHcBziwHooOnbkjoVv7i6wgCJk
 dRqR/AP5to0iEjNYB2UgAtA9LSrv0zeS0yH4PPwNt/a5sOc9VoZu6IU9yzRRsU9cd8nKwnKfkg
 pe/28veyNmNPECxR/6oZXUVgZ48cAaDTjF/yAhaTZNNzShG8ozbCLT8bVJQ0/a8U3UA0ddKIs6
 y0beG5DOx72lJDyVEw73xT5y
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Apr 2022 04:56:50 -0700
IronPort-SDR: +cZ0fAnp7yFzwz0gO9WaGPGzbpLl3EkOLnzYG/uOvS+G8OsoVY2VBCODcf9wsY3yy4xPjN5YaK
 ZE+V0FaRU15S68qGgevmrP6IP1DR3Dovx4WXmOAheXBR0YxN7/kwIS5O+H9trvDOkD8jRP+5tv
 PFl6ZRGu3WyNI1fDAWWRzsKyV7oRPXXoXHWcPeRHfPu9Z1Kd28ShiTo6IAzidnJQTyS2AwpXK8
 5qlg2mW36ErvLVnMq0vj9+UvBDjIUF3p8MZxMGyLUf0HG0FXMLXon08ftgbZUopP5aZnnjli3o
 eKQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Apr 2022 05:26:21 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KcSl03Z9Mz1SVnx
        for <linux-doc@vger.kernel.org>; Mon, 11 Apr 2022 05:26:20 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1649679980; x=1652271981; bh=nxDlmRhRAD3e4b50YnwI05OwnqM0Kx3WSfB
        LQtZ4B+4=; b=Y6YMMzkjp56dtzgUYupp0o+cOKzOyT6mbiOz+Ndy76IucRqegtu
        HK4kCrTTVPEvmwa9n5NJjVqrhQUEyp26gMpwhPZuYNaFeqaEUNpEazyMxofJQQ8C
        T8AerkJHVH1/1DZ9oNDjOAJxcqEllGfeT3JHvxLrN6CNgg58glAKMxCbiT3GdRes
        GA1DBZDXb9KXC9fg9RQRYIaOLX8Z/93N26KdRnXJ32aD+EilFP1kZAOaxEROiuNf
        RBjHkB6Gc/X7si7yguvQmn/WHGW0r6BGUZkz8pNVF01xk8ZWR62VhcDClnmK7tKk
        FDBjxyfwcwdBTy8jyK/MFmn2XUlTx0wKJYg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id O9E4YwEa7gUN for <linux-doc@vger.kernel.org>;
        Mon, 11 Apr 2022 05:26:20 -0700 (PDT)
Received: from [10.225.163.9] (unknown [10.225.163.9])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KcSkz1flXz1Rvlx;
        Mon, 11 Apr 2022 05:26:18 -0700 (PDT)
Message-ID: <58553b08-3c58-a4c8-a402-26d036ef0640@opensource.wdc.com>
Date:   Mon, 11 Apr 2022 21:26:18 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4] libata: Improve ATA queued command allocation
Content-Language: en-US
To:     John Garry <john.garry@huawei.com>, hch@lst.de
Cc:     linux-doc@vger.kernel.org, linux-ide@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1649408652-217372-1-git-send-email-john.garry@huawei.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <1649408652-217372-1-git-send-email-john.garry@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/8/22 18:04, John Garry wrote:
> Improve ATA queued command allocation as follows:
> 
> - For attaining a qc tag for a SAS host we need to allocate a bit in
>   ata_port.sas_tag_allocated bitmap.
> 
>   However we already have a unique tag per device in range
>   [0, ATA_MAX_QUEUE -1] in the scsi cmnd budget token, so just use that
>   instead.
> 
> - It is a bit pointless to have ata_qc_new_init() in libata-core.c since it
>   pokes scsi internals, so inline it in ata_scsi_qc_new() (in
>   libata-scsi.c). Also update Doc accordingly.
> 
> - Use standard SCSI helpers set_host_byte() and set_status_byte() in
>   ata_scsi_qc_new().
> 
> Christoph Hellwig originally contributed the change to inline
> ata_qc_new_init().
> 
> Signed-off-by: John Garry <john.garry@huawei.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Applied to for-5.19. Thanks !

-- 
Damien Le Moal
Western Digital Research
