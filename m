Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7A16E7DD31
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Mar 2018 21:47:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751187AbeC2VrE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Mar 2018 17:47:04 -0400
Received: from ms.lwn.net ([45.79.88.28]:53734 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751182AbeC2VrD (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 29 Mar 2018 17:47:03 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 69BFEAAA;
        Thu, 29 Mar 2018 21:47:03 +0000 (UTC)
Date:   Thu, 29 Mar 2018 15:47:02 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab@s-opensource.com>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        johannes@sipsolutions.net
Subject: Re: [PATCH] docs: kernel-doc: fix parsing of arrays
Message-ID: <20180329154702.5df6c7bc@lwn.net>
In-Reply-To: <d5892e146872e40717117da6cc01e57525a063d2.1522335536.git.mchehab@s-opensource.com>
References: <d5892e146872e40717117da6cc01e57525a063d2.1522335536.git.mchehab@s-opensource.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 29 Mar 2018 10:58:59 -0400
Mauro Carvalho Chehab <mchehab@s-opensource.com> wrote:

> The logic with parses array has a bug that prevents it to
> parse arrays like:
> 	struct {
> 	...
> 		struct {
> 			u64 msdu[IEEE80211_NUM_TIDS + 1];
> 			...
> 	...
> 
> Fix the parser to accept it.

Applied, thanks.

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
