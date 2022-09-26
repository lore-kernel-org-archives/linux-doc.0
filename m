Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB8BC6FA82
	for <linux-doc@archiver.kernel.org>; Mon, 26 Sep 2022 23:06:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbiIZXGl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Sep 2022 19:06:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbiIZXGk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Sep 2022 19:06:40 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87EE6A8CD3;
        Mon, 26 Sep 2022 16:06:39 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 2C8686D9;
        Mon, 26 Sep 2022 23:06:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2C8686D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1664233599; bh=x4bD4t1RcVMe0VTPkmDyYlZ/oBT2wqnLaflr1UARwbE=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=minqt+yDgk/k4VYZYcVSdtc4ChOTf1w/kZH2d49aiWTntowUL0LwWcWUKIrzdcqpw
         zTdWjwu2+XiFmrupRe9wU/cAzMe/u1feQOU4mimxcNaQqSXJmZ/3dXlOxxuZp7F9tJ
         8OknKg3UAZubPv4HSK4zQaldGsjSOHeA/QIIQk4xTVcZeEyZOBMJ3HWMfHG7gWOj+1
         29TvM4VtTHVTGza2G2yXMco5WiZdSsyI6GUz+Lr7NQfR09tYchWdgMiqCdB+GoRdPJ
         v6Jx7whjgaIXDee/YVtpXfQK16KWBw8Bc9VD/pJbEw4ya2dAJye5Ul/4QHZa4ghjJS
         muHOnY+tFcZaQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Hoi Pok Wu <wuhoipok@gmail.com>, mike.kravetz@oracle.com,
        songmuchun@bytedance.com
Cc:     Hoi Pok Wu <wuhoipok@gmail.com>, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: hugetlbpage.rst: fix a typo of hugepage size
In-Reply-To: <20220922030645.9719-1-wuhoipok@gmail.com>
References: <20220922030645.9719-1-wuhoipok@gmail.com>
Date:   Mon, 26 Sep 2022 17:06:38 -0600
Message-ID: <87tu4tpwg1.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hoi Pok Wu <wuhoipok@gmail.com> writes:

> should be kB instead of Kb
>
> Signed-off-by: Hoi Pok Wu <wuhoipok@gmail.com>
> ---
>  Documentation/admin-guide/mm/hugetlbpage.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/mm/hugetlbpage.rst b/Documentation/admin-guide/mm/hugetlbpage.rst
> index 8e2727dc18d4..19f27c0d92e0 100644
> --- a/Documentation/admin-guide/mm/hugetlbpage.rst
> +++ b/Documentation/admin-guide/mm/hugetlbpage.rst
> @@ -65,7 +65,7 @@ HugePages_Surp
>  	may be temporarily larger than the maximum number of surplus huge
>  	pages when the system is under memory pressure.
>  Hugepagesize
> -	is the default hugepage size (in Kb).
> +	is the default hugepage size (in kB).

Applied, thanks.

jon
