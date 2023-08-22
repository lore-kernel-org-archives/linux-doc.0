Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DBF5EE49AB
	for <linux-doc@archiver.kernel.org>; Tue, 22 Aug 2023 09:02:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234131AbjHVJCA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 22 Aug 2023 05:02:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234151AbjHVJB5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Aug 2023 05:01:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA08B1B7;
        Tue, 22 Aug 2023 02:01:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 37D19637EC;
        Tue, 22 Aug 2023 09:01:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CBD6C433CA;
        Tue, 22 Aug 2023 09:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692694914;
        bh=oCbojt07SO8RbzwvZv92plbP41oFUdM1PKdym5EtsfI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ejrTcNOML+v/yoUgA5Kwpb44WA3VNRLu9jjOGOsnxQIwSlaxCp540Hmvyg63i9rtH
         NdoIi551+poyczVZA2UTFZ5DlC0VSUsvPKRz8YEWfUb6M0souzHca+GM79eNmbfCU5
         KVoBkD6GSip0E/5EzRgqxXSf3zqmL/jBy3g4trtpSvDWQ/UeiGuIPipI/KSLm8PHrj
         wi0oMF8WbQ9eHTlZpyyhkZL2HPZcXItn3Y6DCNL5+hE8LvRIw54l2RyqdM7hBxUYBt
         IsuqXXAbc3ytNVE7BX3Ogu6VXKu/H+zqfrNwHgy41qXj3G0NyAPja/nQyUezJtWl13
         WQJp9W02FGyEw==
Date:   Tue, 22 Aug 2023 11:01:44 +0200
From:   Christian Brauner <brauner@kernel.org>
To:     Hugh Dickins <hughd@google.com>
Cc:     Franklin =?utf-8?B?4oCcU25haXBl4oCd?= Mathieu <snaipe@arista.com>,
        ovt@google.com, corbet@lwn.net, akpm@linux-foundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH] shmem: add support for user extended attributes
Message-ID: <20230822-mammut-weinlaune-7925b2a8af59@brauner>
References: <9b8d38f0-fd22-3f98-d070-16baf976ecb5@google.com>
 <20230814082339.2006418-1-snaipe@arista.com>
 <986c412c-669a-43fe-d72a-9e81bca8211@google.com>
 <CAK8sBDM5aid1vkCKhBxqUHXrG_FbDRN0noLtPkcPv=jXb7NTNg@mail.gmail.com>
 <20230815-sensibel-weltumsegelung-6593f2195293@brauner>
 <924ed61c-5681-aa8b-d943-7f73694d159@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <924ed61c-5681-aa8b-d943-7f73694d159@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> "tmpfs,xattr: GFP_KERNEL_ACCOUNT for simple xattrs" just sent to fix it:
> https://lore.kernel.org/linux-fsdevel/f6953e5a-4183-8314-38f2-40be60998615@google.com/

Thank you. I snatched it now.
