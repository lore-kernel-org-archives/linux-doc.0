Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C1A427D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 25 Mar 2019 15:51:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729534AbfCYPve (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 25 Mar 2019 11:51:34 -0400
Received: from ms.lwn.net ([45.79.88.28]:42986 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729106AbfCYPvd (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 25 Mar 2019 11:51:33 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 733C89AC;
        Mon, 25 Mar 2019 15:51:33 +0000 (UTC)
Date:   Mon, 25 Mar 2019 09:51:32 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jakub Wilk <jwilk@jwilk.net>
Cc:     linux-doc@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH] Documentation: fix core_pattern max length
Message-ID: <20190325095132.2cdbbdbc@lwn.net>
In-Reply-To: <20190318173421.502-1-jwilk@jwilk.net>
References: <20190318173421.502-1-jwilk@jwilk.net>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 18 Mar 2019 18:34:21 +0100
Jakub Wilk <jwilk@jwilk.net> wrote:

> The buffer size for core_pattern is 128, but one character is used for
> terminating null byte, so the actual limit is 127:
> 
>     # printf '%0999d' > /proc/sys/kernel/core_pattern
>     # tr -d '\n' < /proc/sys/kernel/core_pattern | wc -c
>     127
> 
> Signed-off-by: Jakub Wilk <jwilk@jwilk.net>

Applied, thanks.

jon
