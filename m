Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC3CC433F5
	for <linux-doc@archiver.kernel.org>; Mon,  6 Dec 2021 17:58:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239290AbhLFSCD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Dec 2021 13:02:03 -0500
Received: from ms.lwn.net ([45.79.88.28]:53596 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236253AbhLFSCD (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 6 Dec 2021 13:02:03 -0500
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 6FEB72E6;
        Mon,  6 Dec 2021 17:58:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6FEB72E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1638813514; bh=sywxED8ASzDJ/8ewyqQkB0gvjhrcELYubizZ/BagrVg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=YPhoBGOaUJo3cxFLVoUmZ/J2t1+/LuwFkXVHdinoW4az2fLRZzOMxs6/+kcPWiMrZ
         EcbIvjmwlQBrfBn8H8oEUS2yQj690Fyi0ztO1YKn+omV3coqT2i9g2K1ai9uwyH8Qz
         xfp9hglJLHjnLm6HJdsN7Ptcxrfuzwvoj4EQaF7twd6ucQ4GLNPDUyZkJBXgf6QRB2
         0JyDbQYf4Oxmf0sbolIMc5OLHCoT9e42CZeT1c4/+u7LTuqLVhsWNWf4LanHt0RtVK
         K8MiXvwLN/m20E4bf5zymRHH7wZX1PXxPeeXtZEwLNn4kdMA+/MQtTMUgIuaP7C+nW
         D9HzPWxYaGecQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: Re: [PATCH 04/11] docs/vm: delele three spaces from page_owner
In-Reply-To: <761f674199f426431c894c3a2eeda2e57ced925f.1638706875.git.siyanteng@loongson.cn>
References: <cover.1638706875.git.siyanteng@loongson.cn>
 <761f674199f426431c894c3a2eeda2e57ced925f.1638706875.git.siyanteng@loongson.cn>
Date:   Mon, 06 Dec 2021 10:58:33 -0700
Message-ID: <87pmq9399y.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng01@gmail.com> writes:

> Fix warning as:
>
> linux-next/Documentation/vm/page_owner.rst:92: WARNING: Unexpected indentation.
> linux-next/Documentation/vm/page_owner.rst:96: WARNING: Unexpected indentation.
> linux-next/Documentation/vm/page_owner.rst:107: WARNING: Unexpected indentation.

A general comment: "fixed a warning" is almost never a useful changelog
entry.  Instead, talk about what you fixed that was causing the warning;
that, not the warning itself, is the real problem.

> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  Documentation/vm/page_owner.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/vm/page_owner.rst b/Documentation/vm/page_owner.rst
> index 9837fc8147dd..9a3af6aafa09 100644
> --- a/Documentation/vm/page_owner.rst
> +++ b/Documentation/vm/page_owner.rst
> @@ -89,11 +89,11 @@ Usage
>  
>  	Page allocated via order XXX, ...
>  	PFN XXX ...
> -	 // Detailed stack
> +	// Detailed stack
>  
>  	Page allocated via order XXX, ...
>  	PFN XXX ...
> -	 // Detailed stack
> +	// Detailed stack

I don't think this is the right fix; instead, this text should be in a
literal block.

Thanks,

jon
