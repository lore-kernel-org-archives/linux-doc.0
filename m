Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2DACA7D2EF
	for <lwn-linux-doc@archive.lwn.net>; Tue,  4 Jun 2019 19:08:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbfFDTIj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 4 Jun 2019 15:08:39 -0400
Received: from ms.lwn.net ([45.79.88.28]:56986 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725933AbfFDTIj (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 4 Jun 2019 15:08:39 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id EFEA07DE;
        Tue,  4 Jun 2019 19:08:38 +0000 (UTC)
Date:   Tue, 4 Jun 2019 13:08:37 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     "Theodore Ts'o" <tytso@mit.edu>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC] Rough draft document on merging and rebasing
Message-ID: <20190604130837.24ea1d7b@lwn.net>
In-Reply-To: <20190601154248.GA17800@mit.edu>
References: <20190530135317.3c8d0d7b@lwn.net>
        <20190601154248.GA17800@mit.edu>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 1 Jun 2019 11:42:48 -0400
"Theodore Ts'o" <tytso@mit.edu> wrote:

> Finally, I'm bit concerned about anything which states absolutes,
> because there are people who tend to be real stickler for the rules,
> and if they see something stated in absolute terms, they fail to
> understand that there are exceptions that are well understood, and in
> use for years before the existence of the document which is trying to
> codify best practices.

Hence the "there are exceptions" text at the bottom of the document :)

Anyway, I'll rework it to try to take your comments into account.  Maybe
we should consistently say "rebasing" for changing the parent commit of a
patch set, and "history modification" for the other tricks...?

Thanks for taking a look,

jon
