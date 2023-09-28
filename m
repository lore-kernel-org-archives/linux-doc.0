Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 899E9E732C0
	for <linux-doc@archiver.kernel.org>; Thu, 28 Sep 2023 11:24:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231877AbjI1LYx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 28 Sep 2023 07:24:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231770AbjI1LYm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Sep 2023 07:24:42 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69792CEA
        for <linux-doc@vger.kernel.org>; Thu, 28 Sep 2023 04:21:20 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A139C433C8;
        Thu, 28 Sep 2023 11:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695900080;
        bh=lju9IoH2uZH9cWxqe1taqQyexyQZqmya5S1kEljTcWs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jfwZ0pWL7tw5NjqLiZugoorRseDVCmloceUtFXaWA1uJmOgW1drltxw4xqFFDeJbx
         LAZSokzSyILd+0NlZ2AG77Gb/lbyWbW1h6vlEvdWY23SPADa6imA1l50n151ih3sYS
         /HFfcIZXCSt3eoKjggRe4lFiuBpy6q+tGph6o+AxS1qk8zYoijh+7Dr1eEMQmuz3Co
         77Py07t/1zCi+5TkuzfJ0HAeiu8vYcNmnwADo/40Inkfu+0BDl2Br+bG7ozfEz5FXM
         F1sJuGCH1C1UEDAGS5e2H9+q2mGy722H/ceDBkVq07gwf+EFGVVsLnqMORT7a/WOaB
         KL+oIqkfwckTA==
Date:   Thu, 28 Sep 2023 13:21:08 +0200
From:   Simon Horman <horms@kernel.org>
To:     Liang Chen <liangchen.linux@gmail.com>
Cc:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, bpoirier@nvidia.com, corbet@lwn.net,
        netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        gregkh@linuxfoundation.org, keescook@chromium.org, Jason@zx2c4.com,
        djwong@kernel.org, jack@suse.cz, linyunsheng@huawei.com,
        ulf.hansson@linaro.org
Subject: Re: [PATCH net-next v5 1/2] pktgen: Automate flag enumeration for
 unknown flag handling
Message-ID: <20230928112108.GE24230@kernel.org>
References: <20230920125658.46978-1-liangchen.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230920125658.46978-1-liangchen.linux@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Sep 20, 2023 at 08:56:57PM +0800, Liang Chen wrote:
> When specifying an unknown flag, it will print all available flags.
> Currently, these flags are provided as fixed strings, which requires
> manual updates when flags change. Replacing it with automated flag
> enumeration.
> 
> Signed-off-by: Liang Chen <liangchen.linux@gmail.com>
> Signed-off-by: Benjamin Poirier <bpoirier@nvidia.com>
> ---
>  Changes from v3:
> - check "n == IPSEC_SHIFT" instead of string comparison
> - use snprintf and check that the result does not overrun pkg_dev->result[]
> - avoid double '\n' at the end
> - move "return" in the OK case to remove "else" and decrease indent
> ---
>  net/core/pktgen.c | 38 ++++++++++++++++++++++----------------
>  1 file changed, 22 insertions(+), 16 deletions(-)
> 
> diff --git a/net/core/pktgen.c b/net/core/pktgen.c
> index f56b8d697014..48306a101fd9 100644
> --- a/net/core/pktgen.c
> +++ b/net/core/pktgen.c
> @@ -1318,9 +1318,10 @@ static ssize_t pktgen_if_write(struct file *file,
>  		return count;
>  	}
>  	if (!strcmp(name, "flag")) {
> +		bool disable = false;
>  		__u32 flag;
>  		char f[32];
> -		bool disable = false;
> +		char *end;
>  
>  		memset(f, 0, 32);
>  		len = strn_len(&user_buffer[i], sizeof(f) - 1);
> @@ -1332,28 +1333,33 @@ static ssize_t pktgen_if_write(struct file *file,
>  		i += len;
>  
>  		flag = pktgen_read_flag(f, &disable);
> -
>  		if (flag) {
>  			if (disable)
>  				pkt_dev->flags &= ~flag;
>  			else
>  				pkt_dev->flags |= flag;
> -		} else {
> -			sprintf(pg_result,
> -				"Flag -:%s:- unknown\nAvailable flags, (prepend ! to un-set flag):\n%s",
> -				f,
> -				"IPSRC_RND, IPDST_RND, UDPSRC_RND, UDPDST_RND, "
> -				"MACSRC_RND, MACDST_RND, TXSIZE_RND, IPV6, "
> -				"MPLS_RND, VID_RND, SVID_RND, FLOW_SEQ, "
> -				"QUEUE_MAP_RND, QUEUE_MAP_CPU, UDPCSUM, "
> -				"NO_TIMESTAMP, "
> -#ifdef CONFIG_XFRM
> -				"IPSEC, "
> -#endif
> -				"NODE_ALLOC\n");
> +
> +			sprintf(pg_result, "OK: flags=0x%x", pkt_dev->flags);
>  			return count;
>  		}
> -		sprintf(pg_result, "OK: flags=0x%x", pkt_dev->flags);
> +
> +		/* Unknown flag */
> +		end = pkt_dev->result + sizeof(pkt_dev->result);
> +		pg_result += sprintf(pg_result,
> +			"Flag -:%s:- unknown\n"
> +			"Available flags, (prepend ! to un-set flag):\n", f);
> +
> +		for (int n = 0; n < NR_PKT_FLAGS && pg_result < end; n++) {
> +			if (!IS_ENABLED(CONFIG_XFRM) && n == IPSEC_SHIFT)
> +				continue;
> +			pg_result += snprintf(pg_result, end - pg_result,
> +					      "%s, ", pkt_flag_names[n]);
> +		}
> +		if (!WARN_ON_ONCE(pg_result >= end)) {
> +			/* Remove the comma and whitespace at the end */
> +			*(pg_result - 2) = '\0';

Hi Liang Chen,

Should the string have a trailing '\n' in keeping with the current formatting?

> +		}
> +
>  		return count;
>  	}
>  	if (!strcmp(name, "dst_min") || !strcmp(name, "dst")) {
> -- 
> 2.31.1
> 
> 
