Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 339707D2EE
	for <lwn-linux-doc@archive.lwn.net>; Fri, 31 Aug 2018 22:52:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727240AbeIADCe (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 31 Aug 2018 23:02:34 -0400
Received: from ms.lwn.net ([45.79.88.28]:34050 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726869AbeIADCe (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 31 Aug 2018 23:02:34 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 7BD3F9B4;
        Fri, 31 Aug 2018 22:52:48 +0000 (UTC)
Date:   Fri, 31 Aug 2018 16:52:35 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Himanshu Jha <himanshujha199640@gmail.com>
Cc:     Julia.Lawall@lip6.fr, Gilles.Muller@lip6.fr, nicolas.palix@imag.fr,
        cocci@systeme.lip6.fr, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: dev-tools: coccinelle: Update documentation
Message-ID: <20180831165235.1c12e0b8@lwn.net>
In-Reply-To: <20180813104638.7935-1-himanshujha199640@gmail.com>
References: <20180813104638.7935-1-himanshujha199640@gmail.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 13 Aug 2018 16:16:38 +0530
Himanshu Jha <himanshujha199640@gmail.com> wrote:

> * Fix install instruction by adding `./autogen` command
>   before `./configure`.
> * Add link to a more detailed installation instruction.
> * Add link to SmPL grammar documentation.
> * Add single space after ',' to slightly improve readability.
> 
> Signed-off-by: Himanshu Jha <himanshujha199640@gmail.com>

Applied, thanks,

jon
