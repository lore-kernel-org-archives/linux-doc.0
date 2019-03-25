Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5E4637D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 25 Mar 2019 15:53:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728882AbfCYPxx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 25 Mar 2019 11:53:53 -0400
Received: from ms.lwn.net ([45.79.88.28]:43002 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727238AbfCYPxw (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 25 Mar 2019 11:53:52 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id D4A019AC;
        Mon, 25 Mar 2019 15:53:51 +0000 (UTC)
Date:   Mon, 25 Mar 2019 09:53:50 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Tom Levy <tomlevy93@gmail.com>
Cc:     linux-doc@vger.kernel.org,
        Trivial Patch Monkey <trivial@kernel.org>
Subject: Re: [PATCH] docs: remove spaces from shell variable assignment
Message-ID: <20190325095350.076478c1@lwn.net>
In-Reply-To: <20190321013756.13028-1-tomlevy93@gmail.com>
References: <20190321013756.13028-1-tomlevy93@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 21 Mar 2019 14:37:56 +1300
Tom Levy <tomlevy93@gmail.com> wrote:

> The instructions for generating patches are given as shell commands
> with variables as placeholders. They use the syntax "SRCTREE= linux",
> which is wrong for the Bourne shell family (it runs the command
> "linux" with the variable "SRCTREE" set to the empty string).
> 
> Remove the spaces to avoid confusion. This breaks the pretty alignment
> but helps new contributors who try to run the commands as written.
> 
> Signed-off-by: Tom Levy <tomlevy93@gmail.com>
> Cc: Jonathan Corbet <corbet@lwn.net>

Applied, thanks.  Though I agree with Jani that this advice is looking a
little dated in general...

jon
