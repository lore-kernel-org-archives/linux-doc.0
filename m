Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CD6527DBEB
	for <lwn-linux-doc@archive.lwn.net>; Mon, 21 Oct 2019 18:55:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbfJUSyI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 21 Oct 2019 14:54:08 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:39220 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729894AbfJUSyI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Oct 2019 14:54:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=dL6VLOf3YewOp4A2n+mPvAornsHOXwZDiX+c4WejJCs=; b=T9zSq7JE/DYsWS/lzj8lbTRdt
        k/TK+nhbiOYmvx2Ux59y9zjgho8lwhkM+iyIjj0BNE+Z1GYK0ySuCLsJlWT/corV1yDuPZbw43iox
        X+IZiWtWTdOagR6ia6Kmtu1xBAkBERg05rl+mc5vYTbVeSPqHSBzcVsEX0SOOTLJrNEQv+3TkhVE3
        zCKHALDiY8GrU5Mt5DJNG2U/FW+tfyjRoKFCavUYLM80ai2SjaUEUwZl2Yrrsxi8F6b1JObcDPauN
        x7dm+MNsGqU55XwwYZXReVE7NU8SQidgcpDBFBK3OjqTNGcY8VvzuC+Senx85xqEP/EKUukiKmT4c
        Os3WFlSTA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iMcog-0008CC-Vf; Mon, 21 Oct 2019 18:54:06 +0000
Date:   Mon, 21 Oct 2019 11:54:06 -0700
From:   Matthew Wilcox <willy@infradead.org>
To:     Changbin Du <changbin.du@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Jiri Kosina <trivial@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kernel-doc: trivial improvement for warning message
Message-ID: <20191021185406.GC9214@bombadil.infradead.org>
References: <20191020132323.29658-1-changbin.du@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191020132323.29658-1-changbin.du@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Oct 20, 2019 at 09:23:23PM +0800, Changbin Du wrote:
> The message "Function parameter or member ..." looks weird.
> 
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
> ---
>  scripts/kernel-doc | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> index 81dc91760b23..cd3d2ca52c34 100755
> --- a/scripts/kernel-doc
> +++ b/scripts/kernel-doc
> @@ -1475,8 +1475,13 @@ sub push_parameter($$$$) {
>  		$parameterdescs{$param} = $undescribed;
>  
>  	        if (show_warnings($type, $declaration_name) && $param !~ /\./) {
> -			print STDERR
> -			      "${file}:$.: warning: Function parameter or member '$param' not described in '$declaration_name'\n";
> +			if ($decl_type eq "struct" or $decl_type eq 'union') {
> +				print STDERR
> +					"${file}:$.: warning: $decl_type member '$param' not described in '$declaration_name'\n";
> +			} else {
> +				print STDERR
> +					"${file}:$.: warning: $decl_type parameter '$param' not described in '$declaration_name'\n";
> +			}
>  			++$warnings;

How about instead ...

		if (show_warnings($type, $declaration_name) && $param !~ /\./) {			if ($decl_type eq "struct")
				$msg = "struct member";
			elif ($decl_type eq "union")
				$msg = "union member";
			else
				$msg = "function parameter";
			print STDERR "${file}:$.: warning: $msg '$param' not described in '$declaration_name'\n";

(please excuse my perl, i am not a native speaker)
