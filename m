Return-Path: <SRS0=92oT=43=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04692C10F27
	for <linux-doc@archiver.kernel.org>; Tue, 10 Mar 2020 17:54:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CE8E221D7E
	for <linux-doc@archiver.kernel.org>; Tue, 10 Mar 2020 17:54:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbgCJRyU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 10 Mar 2020 13:54:20 -0400
Received: from ms.lwn.net ([45.79.88.28]:44412 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726290AbgCJRyU (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 10 Mar 2020 13:54:20 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E0FB3537;
        Tue, 10 Mar 2020 17:54:19 +0000 (UTC)
Date:   Tue, 10 Mar 2020 11:54:19 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        Saravana Kannan <saravanak@google.com>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 4/9] docs: driver.rst: supress two ReSt warnings
Message-ID: <20200310115419.684415ee@lwn.net>
In-Reply-To: <8356b02547087979f57cb71fbefb5e5f636c78f4.1583250595.git.mchehab+huawei@kernel.org>
References: <afbe367ccb7b9abcb9fab7bc5cb5e0686c105a53.1583250595.git.mchehab+huawei@kernel.org>
        <8356b02547087979f57cb71fbefb5e5f636c78f4.1583250595.git.mchehab+huawei@kernel.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue,  3 Mar 2020 16:50:34 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Get rid of those, by marking a literal block as such:
> 
> 	Documentation/driver-api/gpio/driver.rst:425: WARNING: Unexpected indentation.
> 	Documentation/driver-api/gpio/driver.rst:423: WARNING: Inline emphasis start-string without end-string.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/driver-api/driver-model/driver.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/driver-api/driver-model/driver.rst b/Documentation/driver-api/driver-model/driver.rst
> index baa6a85c8287..63887b813005 100644
> --- a/Documentation/driver-api/driver-model/driver.rst
> +++ b/Documentation/driver-api/driver-model/driver.rst
> @@ -210,7 +210,7 @@ probed.
>  While the typical use case for sync_state() is to have the kernel cleanly take
>  over management of devices from the bootloader, the usage of sync_state() is
>  not restricted to that. Use it whenever it makes sense to take an action after
> -all the consumers of a device have probed.
> +all the consumers of a device have probed::

Applied, thanks.

jon
