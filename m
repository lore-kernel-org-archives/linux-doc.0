Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 572807D584
	for <lwn-linux-doc@archive.lwn.net>; Thu, 20 Sep 2018 17:12:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbeITW4c (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 20 Sep 2018 18:56:32 -0400
Received: from ms.lwn.net ([45.79.88.28]:46944 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726540AbeITW4c (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 20 Sep 2018 18:56:32 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 6920F2EF;
        Thu, 20 Sep 2018 17:12:04 +0000 (UTC)
Date:   Thu, 20 Sep 2018 11:12:02 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Felix Eckhofer <felix@eckhofer.com>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH] doc: Fix acronym "FEKEK" in ecryptfs
Message-ID: <20180920111202.5dd5d440@lwn.net>
In-Reply-To: <20180917093446.GA28595@pollux.tribut.de>
References: <20180917093446.GA28595@pollux.tribut.de>
Organization: LWN.net
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 17 Sep 2018 11:34:48 +0200
Felix Eckhofer <felix@eckhofer.com> wrote:

> "FEFEK" was incorrectly used as acronym for "File Encryption Key
> Encryption Key". This replaces all occurences with "FEKEK".
> 
> Signed-off-by: Felix Eckhofer <felix@eckhofer.com>
> ---
>  Documentation/security/keys/ecryptfs.rst | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied, thanks.

jon
