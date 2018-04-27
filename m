Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9B5067DE78
	for <lwn-linux-doc@archive.lwn.net>; Fri, 27 Apr 2018 15:47:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1758515AbeD0PrW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 27 Apr 2018 11:47:22 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:59876 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758513AbeD0PrV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Apr 2018 11:47:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
        Subject:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=3J7SsYoSz2FTprcC3amXDz8Gy8xJY1oTvVnw6mgoL0k=; b=IUS/bNqZOrCARamjQKURHGxX/
        Likyy+Z8r9ArYHZTNEJcVwBUV+XKGP8Reh+q1wUVLXt4eS0+mEsu2j5wEhfTY+qoTrleVK+Cc97pp
        edT0nMRoSdRXTZ1aLRyoqtDbaY4l1tuGa3lbHso7PC955W2JTRfcqmSDN3OpvdLxlleOp7BywxxsB
        mWGoTNVOYJCdtoGF4otJVCq9HoVdK5OuSGdR2A4aozA+3FL0pi8Dzgd7BgkPs7Tn1mL/uuYwsakDi
        3EKjyy+VdqePmSp042RARmPXV9TVyCqdTrG97LIHl+voVz41ZhngdrCvONilQsHzdQ01+OiRPkTs0
        6aGgOkppA==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fC5ae-0005jJ-8R; Fri, 27 Apr 2018 15:47:16 +0000
Subject: Re: [net-next] ipv6: sr: Add documentation for seg_flowlabel sysctl
To:     Ahmed Abdelsalam <amsalam20@gmail.com>, davem@davemloft.net,
        linux-doc@vger.kernel.org, netdev@vger.kernel.org
References: <1524825344-2573-1-git-send-email-amsalam20@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e9dcc2ad-798f-5dce-a508-e3d1fb450d0e@infradead.org>
Date:   Fri, 27 Apr 2018 08:47:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1524825344-2573-1-git-send-email-amsalam20@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 04/27/2018 03:35 AM, Ahmed Abdelsalam wrote:
> This patch adds a documentation for seg_flowlabel sysctl into
> Documentation/networking/ip-sysctl.txt
> 
> Signed-off-by: Ahmed Abdelsalam <amsalam20@gmail.com>
> ---
>  Documentation/networking/ip-sysctl.txt | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/networking/ip-sysctl.txt b/Documentation/networking/ip-sysctl.txt
> index 5dc1a04..7528f71 100644
> --- a/Documentation/networking/ip-sysctl.txt
> +++ b/Documentation/networking/ip-sysctl.txt
> @@ -1428,6 +1428,19 @@ ip6frag_low_thresh - INTEGER
>  ip6frag_time - INTEGER
>  	Time in seconds to keep an IPv6 fragment in memory.
>  
> +IPv6 Segment Routing:
> +
> +seg6_flowlabel - INTEGER
> +	Controls the behaviour of computing the flowlabel of outer
> +	IPv6 header in case of SR T.encaps
> +
> +	-1 set flowlabel to zero.
> +	0 copy flowlabel from Inner paceket in case of Inner IPv6

	                            packet

> +		(Set flowlabel to 0 in case IPv4/L2)
> +	1 Compute the flowlabel using seg6_make_flowlabel()
> +
> +	Default is 0.
> +
>  conf/default/*:
>  	Change the interface-specific default settings.
>  
> 


-- 
~Randy
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
