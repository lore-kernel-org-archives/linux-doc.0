Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DA6E77D8A4
	for <lwn-linux-doc@archive.lwn.net>; Mon, 18 Mar 2019 18:02:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727235AbfCRSCm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 18 Mar 2019 14:02:42 -0400
Received: from ms.lwn.net ([45.79.88.28]:51078 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727189AbfCRSCl (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 18 Mar 2019 14:02:41 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 7FDF02D9;
        Mon, 18 Mar 2019 18:02:40 +0000 (UTC)
Date:   Mon, 18 Mar 2019 12:02:39 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     =?UTF-8?B?VGltb3Row6ll?= Isnard <timotheecisnard@gmail.com>
Cc:     linux-doc@vger.kernel.org, trivial@kernel.org
Subject: Re: [PATCH] Documentation: admin-guide: Fix minimum required gcc
 version
Message-ID: <20190318120239.63c2f532@lwn.net>
In-Reply-To: <20190305105303.30838-1-timotheecisnard@gmail.com>
References: <20190305105303.30838-1-timotheecisnard@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue,  5 Mar 2019 11:53:03 +0100
Timothée Isnard <timotheecisnard@gmail.com> wrote:

> Signed-off-by: Timothée Isnard <timotheecisnard@gmail.com>
> ---
>  Documentation/admin-guide/README.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
> index 47e577264198..a582c780c3bd 100644
> --- a/Documentation/admin-guide/README.rst
> +++ b/Documentation/admin-guide/README.rst
> @@ -251,7 +251,7 @@ Configuring the kernel
>  Compiling the kernel
>  --------------------
>  
> - - Make sure you have at least gcc 3.2 available.
> + - Make sure you have at least gcc 4.6 available.
>     For more information, refer to :ref:`Documentation/process/changes.rst <changes>`.
>  
>     Please note that you can still run a.out user programs with this kernel.

This was already fixed (commit f07fb1088fb1) back in February.

Thanks,

jon
