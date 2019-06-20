Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 370267D2EF
	for <lwn-linux-doc@archive.lwn.net>; Thu, 20 Jun 2019 20:17:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbfFTURP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 20 Jun 2019 16:17:15 -0400
Received: from ms.lwn.net ([45.79.88.28]:47688 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725907AbfFTURP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 20 Jun 2019 16:17:15 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 53C9B2BA;
        Thu, 20 Jun 2019 20:17:15 +0000 (UTC)
Date:   Thu, 20 Jun 2019 14:17:14 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] doc-rst: Add missing newline at end of file
Message-ID: <20190620141714.46fdf30e@lwn.net>
In-Reply-To: <20190617143400.4559-1-geert+renesas@glider.be>
References: <20190617143400.4559-1-geert+renesas@glider.be>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 17 Jun 2019 16:34:00 +0200
Geert Uytterhoeven <geert+renesas@glider.be> wrote:

> "git diff" says:
> 
>     \ No newline at end of file
> 
> after modifying the file.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied, thanks.

jon
