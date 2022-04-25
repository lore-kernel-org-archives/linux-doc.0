Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FD58C433F5
	for <linux-doc@archiver.kernel.org>; Mon, 25 Apr 2022 01:37:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240192AbiDYBkl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 24 Apr 2022 21:40:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237647AbiDYBkd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 24 Apr 2022 21:40:33 -0400
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 465855FA8
        for <linux-doc@vger.kernel.org>; Sun, 24 Apr 2022 18:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1650850651; x=1682386651;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=4qjsgGSnOsl1+VPd9smV9N4k5ycwpkxlrj/HoG4I0rs=;
  b=LXzsuB+XnjPeoPypMIB/5jX84093bmnpl0JKX8VvsNcLKYjPCkOeK6+J
   KBtnBUfRwsuPcOH7i8cFMUPKEVXihmSrM8CFDW79wrjOqei51pliEUgw+
   Q+VLfu+yr7frA3QlC1Vbd6lDdRG/UuGZ9r8yt1Bjze0eTRRBNQSpdbBNS
   Q1R2aXSNaKmVhEjl7rh+WtXEc1dV5vpZxE5zG7blq5MWzhQXBwJ4Di+DU
   nOz0cVZ2YkMab0bcTTs5blOVeLbBbzgG/3tTSTFB9neERIEx6Bo5FwDc0
   COB+8+3OByupaSXZo31Qe54yBZPMhmALyEJSfpNXqyo2rG8KI48PeABtc
   Q==;
X-IronPort-AV: E=Sophos;i="5.90,287,1643644800"; 
   d="scan'208";a="310680887"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 25 Apr 2022 09:37:30 +0800
IronPort-SDR: tXntsuPw7wznXAeUi9MxPwRJdtJXguq5JzTQ1HbSm66bi7HFWTqtnyGq432ra889yP75q+1UEY
 3/2N+9NkY1e0Y6zO/LyZ+qujlBG6Zt6nHk8rK0KDtIw8YjaF5eyKOPGqfl2AxXMznZvmYrrTaL
 LXMO2iGXleUuugqgAClcx3auAdc0atJ+NOaPmpw1Ou522bsY24Ais+1OCM6usdno19WI5qtDmI
 pBA+sjR/Z0OPdJnBEfHEaF6a3RxjkmWH13jl8eE/okBqUR2JdawFYdtzAcQUQKPdbsDJREsCLW
 CY9hOz6iQfIcRhtPqFrLf5RM
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Apr 2022 18:08:27 -0700
IronPort-SDR: vv7qCuMVXepD4lLiSW5DTd4uHsYyLkh/i4nHWovV86AtB5Sf/AoZe24SdK33WVIUZvQhLO2LKU
 SSbVsjea+4LSKVsjxiDH9RJ7slJKYljyWN8xNh7RYlV7Fe24hNw7uYp8Ypy27lWwfepJ5SrYsN
 65fy0YsoAsmXhVPHrmI2lBL1IBzX051s9I2goP9P0dfCBivDB4IpadoNsNcZt0mDYiiwV7rxOt
 zNJVcYVisHbndHxeSek2sYxvnROFT8iB0PDM6+z88t0GK0iaGYyV+pRiJiuD+yYWHzXRe5t8Kx
 wbU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Apr 2022 18:37:30 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Kmngs73XVz1Rwrw
        for <linux-doc@vger.kernel.org>; Sun, 24 Apr 2022 18:37:29 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:references:to:from:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1650850649; x=1653442650; bh=4qjsgGSnOsl1+VPd9smV9N4k5ycwpkxlrj/
        HoG4I0rs=; b=gCqNnGVqxMz+MIbVj+lmeoy8wdVCbqzmbdmzu/deHN3Ooh9y6O9
        PmwOdsMHGW5soq/AediF/CyiVRZ+HANpfjNRS5rA2rDo/IkaUza+omyrK8YDtYfq
        WMkKuZiPFKuzvnvF0bpvR0hA+gdAKyEcgOykrFfBbEHhoemykrSRHtMXhxeOrbXY
        IG0ZrtSP4Q/LOp/ukusknY/CpvJ+xJeHUSguVWoFE4zMOj4NuoSACWhcsxf/qwlx
        MkOHmt8U8gFH9khohBeJfjluw9fcWwCmFw0RI6BD19oNJTMFAk3JcwPyH8kMjEiR
        3z0SgnVzQt5OaJ8UeKJ2AX5yIb/PjSPL1gg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id K13yordd6gyK for <linux-doc@vger.kernel.org>;
        Sun, 24 Apr 2022 18:37:29 -0700 (PDT)
Received: from [10.225.163.24] (unknown [10.225.163.24])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Kmngr5vR7z1Rvlx;
        Sun, 24 Apr 2022 18:37:28 -0700 (PDT)
Message-ID: <59c773a2-ab66-d36d-46d5-b04cb7cc9eec@opensource.wdc.com>
Date:   Mon, 25 Apr 2022 10:37:27 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 5/5] doc: admin-guide: Update libata kernel parameters
Content-Language: en-US
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
To:     linux-ide@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Cc:     Sergey Shtylyov <s.shtylyov@omp.ru>
References: <20220425013417.3947791-1-damien.lemoal@opensource.wdc.com>
 <20220425013417.3947791-6-damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220425013417.3947791-6-damien.lemoal@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/25/22 10:34, Damien Le Moal wrote:
> Cleanup the text text describing the libata.force boot parameter and
> update the list of the values to include all supported horkage and link
> flag that can be forced.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> ---
>  .../admin-guide/kernel-parameters.txt         | 71 ++++++++++++++-----
>  1 file changed, 55 insertions(+), 16 deletions(-)

Jonathan,

Are you OK with these changes ? Will you take this patch or should I keep
it with the series in the libata tree ? Either way work for me.

Thanks !

> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 3f1cc5e317ed..00fb37cab649 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -2622,14 +2622,14 @@
>  			when set.
>  			Format: <int>
>  
> -	libata.force=	[LIBATA] Force configurations.  The format is comma-
> -			separated list of "[ID:]VAL" where ID is
> -			PORT[.DEVICE].  PORT and DEVICE are decimal numbers
> -			matching port, link or device.  Basically, it matches
> -			the ATA ID string printed on console by libata.  If
> -			the whole ID part is omitted, the last PORT and DEVICE
> -			values are used.  If ID hasn't been specified yet, the
> -			configuration applies to all ports, links and devices.
> +	libata.force=	[LIBATA] Force configurations.  The format is a comma-
> +			separated list of "[ID:]VAL" where ID is PORT[.DEVICE].
> +			PORT and DEVICE are decimal numbers matching port, link
> +			or device.  Basically, it matches the ATA ID string
> +			printed on console by libata.  If the whole ID part is
> +			omitted, the last PORT and DEVICE values are used.  If
> +			ID hasn't been specified yet, the configuration applies
> +			to all ports, links and devices.
>  
>  			If only DEVICE is omitted, the parameter applies to
>  			the port and all links and devices behind it.  DEVICE
> @@ -2639,7 +2639,7 @@
>  			host link and device attached to it.
>  
>  			The VAL specifies the configuration to force.  As long
> -			as there's no ambiguity shortcut notation is allowed.
> +			as there is no ambiguity, shortcut notation is allowed.
>  			For example, both 1.5 and 1.5G would work for 1.5Gbps.
>  			The following configurations can be forced.
>  
> @@ -2652,19 +2652,58 @@
>  			  udma[/][16,25,33,44,66,100,133] notation is also
>  			  allowed.
>  
> +			* nohrst, nosrst, norst: suppress hard, soft and both
> +			  resets.
> +
> +			* rstonce: only attempt one reset during hot-unplug
> +			  link recovery.
> +
> +			* [no]dbdelay: Enable or disable the extra 200ms delay
> +			  before debouncing a link PHY and device presence
> +			  detection.
> +
>  			* [no]ncq: Turn on or off NCQ.
>  
> -			* [no]ncqtrim: Turn off queued DSM TRIM.
> +			* [no]ncqtrim: Enable or disable queued DSM TRIM.
> +
> +			* [no]ncqati: Enable or disable NCQ trim on ATI chipset.
> +
> +			* [no]trim: Enable or disable (unqueued) TRIM.
> +
> +			* trim_zero: Indicate that TRIM command zeroes data.
> +
> +			* max_trim_128m: Set 128M maximum trim size limit.
> +
> +			* [no]dma: Turn on or off DMA transfers.
> +
> +			* atapi_dmadir: Enable ATAPI DMADIR bridge support.
> +
> +			* atapi_mod16_dma: Enable the use of ATAPI DMA for
> +			  commands that are not a multiple of 16 bytes.
> +
> +			* [no]dmalog: Enable or disable the use of the
> +			  READ LOG DMA EXT command to access logs.
> +
> +			* [no]iddevlog: Enable or disable access to the
> +			  identify device data log.
> +
> +			* [no]logdir: Enable or disable access to the general
> +			  purpose log directory.
> +
> +			* max_sec_128: Set transfer size limit to 128 sectors.
> +
> +			* max_sec_1024: Set or clear transfer size limit to
> +			  1024 sectors.
>  
> -			* nohrst, nosrst, norst: suppress hard, soft
> -			  and both resets.
> +			* max_sec_lba48: Set or clear transfer size limit to
> +			  65535 sectors.
>  
> -			* rstonce: only attempt one reset during
> -			  hot-unplug link recovery
> +			* [no]lpm: Enable or disable link power management.
>  
> -			* dump_id: dump IDENTIFY data.
> +			* [no]setxfer: Indicate if transfer speed mode setting
> +			  should be skipped.
>  
> -			* atapi_dmadir: Enable ATAPI DMADIR bridge support
> +			* dump_id: Dump IDENTIFY data.
>  
>  			* disable: Disable this device.
>  


-- 
Damien Le Moal
Western Digital Research
