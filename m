Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E223C433F5
	for <linux-doc@archiver.kernel.org>; Thu,  9 Dec 2021 09:50:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbhLIJxt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Dec 2021 04:53:49 -0500
Received: from ewsoutbound.kpnmail.nl ([195.121.94.170]:51717 "EHLO
        ewsoutbound.kpnmail.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231328AbhLIJxt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Dec 2021 04:53:49 -0500
X-Greylist: delayed 662 seconds by postgrey-1.27 at vger.kernel.org; Thu, 09 Dec 2021 04:53:49 EST
X-KPN-MessageId: bd6b3fdb-58d3-11ec-8a6e-005056ab378f
Received: from smtp.kpnmail.nl (unknown [10.31.155.39])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id bd6b3fdb-58d3-11ec-8a6e-005056ab378f;
        Thu, 09 Dec 2021 10:38:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:from:to:subject:mime-version:date:message-id;
        bh=/2Oj4SyeYGLBI2nPdOkSXq5zZCzg9F3x0zRkpn+lWNk=;
        b=kUgMgzcj93rKFQp79GbDayyQOiKuHOxq5gMZCFpKu4TG7Rj0Uk0+Jt/xLBersDCO+SZ6ugY5Qrm3d
         sQljOUwgW2Okcyxi8p+V9pPRgLqjpe8HMzV9wIus71KvEgSur3d5/m2sQILWt7VHLQZZkxpGuce0a8
         LCOBmABlLlk97QtuwIMe5NhO8sI5o0nltJL7UNaKLLx758bfv85h6cGDqYDSOpHA9rN+KzudfEr/Hc
         vnl0jSCbQYUWxPjZUzH9raRSed56jmrg7WyavpXopAwJHchJvIpB8H/m/R8etdyRG73YCoN8y5Lpq7
         lCljV+blAkva/tA7NCsBh6og6pLahvQ==
X-KPN-VerifiedSender: No
X-CMASSUN: 33|j2Gg76hkz5IBVmEtCItK58Fywvd8OThAxXNOUjlbO4xCrkyMjsQPjoh02jccv8C
 fM8OAFvyHW32aUWDCd5v8Sg==
X-Originating-IP: 193.91.129.219
Received: from [192.168.2.10] (cdb815bc1.dhcp.as2116.net [193.91.129.219])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id dbdde91f-58d3-11ec-81f5-005056ab7447;
        Thu, 09 Dec 2021 10:39:10 +0100 (CET)
Message-ID: <d13b108b-31f8-81cc-1317-ca3fbb785586@xs4all.nl>
Date:   Thu, 9 Dec 2021 10:39:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: [PATCH] docs/bpf: Add rkisp1 into index
Content-Language: en-US
To:     Yanteng Si <siyanteng01@gmail.com>,
        heiko.stuebner@theobroma-systems.com
Cc:     dafna.hirschfeld@collabora.com, mchehab+huawei@kernel.org,
        corbet@lwn.net, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
References: <20211209090440.544128-1-siyanteng@loongson.cn>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20211209090440.544128-1-siyanteng@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 09/12/2021 10:04, Yanteng Si wrote:
> Since cd42f8023f1 ("media: rockchip: rkisp1: add support for v12 isp variants") which
> introduced a warning:
> 
> linux/Documentation/driver-api/media/drivers/rkisp1.rst
> 
> Add it into index.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  Documentation/driver-api/media/drivers/index.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/driver-api/media/drivers/index.rst b/Documentation/driver-api/media/drivers/index.rst
> index 426cda633bf0..9631115a710e 100644
> --- a/Documentation/driver-api/media/drivers/index.rst
> +++ b/Documentation/driver-api/media/drivers/index.rst
> @@ -27,6 +27,7 @@ Video4Linux (V4L) drivers
>  	vimc-devel
>  	zoran
>  	ccs/ccs
> +	rkisp1
>  
>  
>  Digital TV drivers
> 

A similar patch has already been merged into the media tree, so
this patch can be dropped.

Regards,

	Hans
