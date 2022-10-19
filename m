Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A70CC4332F
	for <linux-doc@archiver.kernel.org>; Wed, 19 Oct 2022 14:13:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232089AbiJSON3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 19 Oct 2022 10:13:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232097AbiJSONM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Oct 2022 10:13:12 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D43521C77F3;
        Wed, 19 Oct 2022 06:55:40 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 5CB5260C;
        Wed, 19 Oct 2022 13:53:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5CB5260C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1666187637; bh=360lzm9U3LeSeoCVdsLfBOUHx/sNrnUrP5/45tJ0mdU=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Eh/fcKBqyBANCHn9MKm5+rqH8Qd9BDycO12Io5w08bmUUJn+G9WobXcTodHtOXpW5
         NUAGtYVTAgGJci3MTwo/aZIC+nR/dh5xwo+3vAz8H5U8uHzB3EWEJId7Fq2vHw+4iQ
         YsHo6tfM9Gk+cu041YZhRPqQd8Z9AA0Ap9Mjpe3nfw7sF/fBFrjlwRLCWQU0xlght5
         VmF+OYeDhfcM1Bq2DGKC4g7iiUD82Ffju7CF04OOJs3Ky8KnoA8JCXVnEkBkKOysC1
         bpIlByiY2chZJeMtL4JekThXaq1qOw8TuG2rS9w0VIuhdOwlj/lxwZrnwGH6EkkDyu
         JJATBQs1G8dyw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Alexander Atanasov <alexander.atanasov@virtuozzo.com>
Cc:     kernel@openvz.org,
        Alexander Atanasov <alexander.atanasov@virtuozzo.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v5 8/8] documentation: create a document about how
 balloon drivers operate
In-Reply-To: <20221019095620.124909-9-alexander.atanasov@virtuozzo.com>
References: <20221019095620.124909-1-alexander.atanasov@virtuozzo.com>
 <20221019095620.124909-9-alexander.atanasov@virtuozzo.com>
Date:   Wed, 19 Oct 2022 07:53:56 -0600
Message-ID: <8735bjdimj.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Alexander Atanasov <alexander.atanasov@virtuozzo.com> writes:

> Describe ballooning and how it works. Explain the two values
> and why they are there.
> Point the places where a user can see more balloon information and
> how each driver operates.
>
> Signed-off-by: Alexander Atanasov <alexander.atanasov@virtuozzo.com>
> ---
>  Documentation/mm/balloon.rst | 138 +++++++++++++++++++++++++++++++++++
>  1 file changed, 138 insertions(+)
>  create mode 100644 Documentation/mm/balloon.rst

When you add a new RST file, you also need to add it to index.rst so
that it becomes part of the docs build.

Thanks,

jon
