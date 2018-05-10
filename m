Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 82EF47DE74
	for <lwn-linux-doc@archive.lwn.net>; Thu, 10 May 2018 20:05:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752064AbeEJUEz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 10 May 2018 16:04:55 -0400
Received: from ms.lwn.net ([45.79.88.28]:59056 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751438AbeEJUEy (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 10 May 2018 16:04:54 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 28976308;
        Thu, 10 May 2018 20:04:53 +0000 (UTC)
Date:   Thu, 10 May 2018 14:04:50 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Justin Skists <justin.skists@juzza.co.uk>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation/process/posting: wrap text at 80 cols
Message-ID: <20180510140450.756c6e1c@lwn.net>
In-Reply-To: <20180510193737.GA19307@tanglefoot>
References: <20180510193737.GA19307@tanglefoot>
Organization: LWN.net
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 10 May 2018 20:37:37 +0100
Justin Skists <justin.skists@juzza.co.uk> wrote:

> Trivial patch to adjust the text formatting to wrap at 80 columns. No
> actual content has changed.
> 
> Signed-off-by: Justin Skists <justin.skists@juzza.co.uk>

Applied, thanks.

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
