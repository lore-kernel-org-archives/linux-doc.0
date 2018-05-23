Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DE5827D08C
	for <lwn-linux-doc@archive.lwn.net>; Wed, 23 May 2018 15:45:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750866AbeEWPnu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 23 May 2018 11:43:50 -0400
Received: from lelnx194.ext.ti.com ([198.47.27.80]:11441 "EHLO
        lelnx194.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750771AbeEWPnt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 May 2018 11:43:49 -0400
Received: from dflxv15.itg.ti.com ([128.247.5.124])
        by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w4NFhgOs022196;
        Wed, 23 May 2018 10:43:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1527090222;
        bh=ysubGUSHK9Wf2BeAEe5yfbT9COgPgqX4KSL6wA69vTU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=PlJMMKgOmDCwtf/EK3llP7r64NiX/mAFG/plz2huwI4oQ8pVtKP6kh8GhFhMLKMod
         F5kcTAw1nOnYl9bWVr+VdjEPnVbn8QAp+ekk4OJlemDFu+yB2wUuGLL7KLhTNYWI5Y
         /BhBe/B+0yNEbZpaa0vOhCnuU5SJHpbxCTCJ8ozA=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4NFhgjM019258;
        Wed, 23 May 2018 10:43:42 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3; Wed, 23
 May 2018 10:43:42 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend Transport;
 Wed, 23 May 2018 10:43:42 -0500
Received: from [128.247.59.147] (ileax41-snat.itg.ti.com [10.172.224.153])
        by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4NFhgfD007860;
        Wed, 23 May 2018 10:43:42 -0500
Subject: Re: [RFC PATCH 0/6] net: ethernet: ti: cpsw: add MQPRIO and CBS Qdisc
 offload
To:     Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>, <davem@davemloft.net>
CC:     <corbet@lwn.net>, <akpm@linux-foundation.org>,
        <netdev@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <vinicius.gomes@intel.com>, <henrik@austad.us>,
        <jesus.sanchez-palencia@intel.com>, Sekhar Nori <nsekhar@ti.com>,
        Yogesh Siraswar <yogeshs@ti.com>,
        Schuyler Patton <spatton@ti.com>
References: <20180518211510.13341-1-ivan.khoronzhuk@linaro.org>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <176f9a29-0a89-ffa1-d7f7-708a2cdfdc7e@ti.com>
Date:   Wed, 23 May 2018 10:43:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180518211510.13341-1-ivan.khoronzhuk@linaro.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Ivan,

On 05/18/2018 04:15 PM, Ivan Khoronzhuk wrote:
> This series adds MQPRIO and CBS Qdisc offload for TI cpsw driver.
> It potentially can be used in audio video bridging (AVB) and time
> sensitive networking (TSN).
> 
> Patchset was tested on AM572x EVM and BBB boards. Last patch from this
> series adds detailed description of configuration with examples. For
> consistency reasons, in role of talker and listener, tools from
> patchset "TSN: Add qdisc based config interface for CBS" were used and
> can be seen here: https://www.spinics.net/lists/netdev/msg460869.html
> 
> Based on net-next/master

Thanks a lot, it is great work.

In general I have no comments as of now, but I prefer to wait a bit (few 
weeks) for more comments and possible test reports.

If no comments, pls feel free to repost as final series.


> 
> Ivan Khoronzhuk (6):
>    net: ethernet: ti: cpsw: use cpdma channels in backward order for txq
>    net: ethernet: ti: cpdma: fit rated channels in backward order
>    net: ethernet: ti: cpsw: add MQPRIO Qdisc offload
>    net: ethernet: ti: cpsw: add CBS Qdisc offload
>    net: ethernet: ti: cpsw: restore shaper configuration while down/up
>    Documentation: networking: cpsw: add MQPRIO & CBS offload examples
> 
>   Documentation/networking/cpsw.txt       | 540 ++++++++++++++++++++++++
>   drivers/net/ethernet/ti/cpsw.c          | 364 +++++++++++++++-
>   drivers/net/ethernet/ti/davinci_cpdma.c |  31 +-
>   3 files changed, 913 insertions(+), 22 deletions(-)
>   create mode 100644 Documentation/networking/cpsw.txt
> 

-- 
regards,
-grygorii
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
