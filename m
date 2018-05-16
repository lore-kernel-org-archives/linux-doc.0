Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C7F807D043
	for <lwn-linux-doc@archive.lwn.net>; Wed, 16 May 2018 19:12:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751290AbeEPTMP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 16 May 2018 15:12:15 -0400
Received: from ms.lwn.net ([45.79.88.28]:37732 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751017AbeEPTMO (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 16 May 2018 15:12:14 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id DD67A2E7;
        Wed, 16 May 2018 19:12:13 +0000 (UTC)
Date:   Wed, 16 May 2018 13:12:11 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Thomas Hebb <tommyhebb@gmail.com>
Cc:     linux-kernel@vger.kernel.org, trivial@kernel.org,
        linux-doc@vger.kernel.org (open list:DOCUMENTATION)
Subject: Re: [PATCH] Documentation: arm: clean up Marvell Berlin family info
Message-ID: <20180516131211.01ebf987@lwn.net>
In-Reply-To: <20180514215511.17328-1-tommyhebb@gmail.com>
References: <20180514215511.17328-1-tommyhebb@gmail.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 14 May 2018 17:55:10 -0400
Thomas Hebb <tommyhebb@gmail.com> wrote:

> Remove dead links, make spacing consistent, and note that the family was
> acquired by Synaptics in 2017.
> 
> Signed-off-by: Thomas Hebb <tommyhebb@gmail.com>

Applied to the docs tree, thanks.

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
