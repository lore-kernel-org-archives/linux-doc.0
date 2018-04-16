Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DE0E47DE74
	for <lwn-linux-doc@archive.lwn.net>; Mon, 16 Apr 2018 20:02:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753323AbeDPUCC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 16 Apr 2018 16:02:02 -0400
Received: from ms.lwn.net ([45.79.88.28]:58674 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753244AbeDPUCC (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 16 Apr 2018 16:02:02 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id ADBF22E4;
        Mon, 16 Apr 2018 20:02:01 +0000 (UTC)
Date:   Mon, 16 Apr 2018 14:02:00 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Christina Quast <cquast@baylibre.com>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH] Changed .txt to .rst in Documentation/sound/*.rst
Message-ID: <20180416140200.7541cef7@lwn.net>
In-Reply-To: <CA+JAYfTAWHAp3W6VEzZx+PW7dbiz6K3Tv5mGHFiNbOiYy6g+3A@mail.gmail.com>
References: <CA+JAYfTAWHAp3W6VEzZx+PW7dbiz6K3Tv5mGHFiNbOiYy6g+3A@mail.gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 11 Apr 2018 18:33:26 +0200
Christina Quast <cquast@baylibre.com> wrote:

> Here is a small fixup for the documentation. Unless it's too trivial to
> change it.

Applied, thanks.

In the future, though, please send patches inline rather than as
attachments; that way I don't have to clean things up to apply them.

Thanks,

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
