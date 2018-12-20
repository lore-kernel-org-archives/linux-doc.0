Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3AD337D8A3
	for <lwn-linux-doc@archive.lwn.net>; Thu, 20 Dec 2018 15:28:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729011AbeLTP2U (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 20 Dec 2018 10:28:20 -0500
Received: from ms.lwn.net ([45.79.88.28]:53446 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728425AbeLTP2U (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 20 Dec 2018 10:28:20 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 2C6D3182;
        Thu, 20 Dec 2018 15:28:20 +0000 (UTC)
Date:   Thu, 20 Dec 2018 08:28:19 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Thorsten Leemhuis <linux@leemhuis.info>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/1] RFC: Revamp admin-guide/tainted-kernels.rst to make
 it more comprehensible
Message-ID: <20181220082819.69fc3e5c@lwn.net>
In-Reply-To: <96fc8865-c54f-5c6c-f6c8-d7a5a12735e6@leemhuis.info>
References: <20181217152043.9989-1-linux@leemhuis.info>
        <20181217112437.5fe868eb@lwn.net>
        <8f67a8ca-bf64-c537-843a-b03bcfc3dace@infradead.org>
        <96fc8865-c54f-5c6c-f6c8-d7a5a12735e6@leemhuis.info>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 20 Dec 2018 16:23:38 +0100
Thorsten Leemhuis <linux@leemhuis.info> wrote:

> While at it: Jonathan, you mentioned putting the script in scripts/, but
> according to the Makefile in that directory it is "for various helper
> programs used throughout the kernel for the build process". That's one
> reason why it feels wrong to put it there. Another one: that script
> targets users and thus we should try to make sure they can access it
> easily. That's why I'm currently inclined to put it in tools/ somewhere.

Yeah, tools/ is a better place.  Maybe a tools/debugging directory or some
such?

jon
