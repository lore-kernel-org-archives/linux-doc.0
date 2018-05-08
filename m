Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 49BB57DE74
	for <lwn-linux-doc@archive.lwn.net>; Tue,  8 May 2018 16:14:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755298AbeEHQNr (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 8 May 2018 12:13:47 -0400
Received: from ms.lwn.net ([45.79.88.28]:35952 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755237AbeEHQNq (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 8 May 2018 12:13:46 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 7A635318;
        Tue,  8 May 2018 16:13:44 +0000 (UTC)
Date:   Tue, 8 May 2018 10:13:42 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-fbdev@vger.kernel.org,
        linux-can@vger.kernel.org, "Luis R. Rodriguez" <mcgrof@kernel.org>,
        linux-iio@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-crypto@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH 00/18] Fix some build warnings/errors with Sphinx
Message-ID: <20180508101342.2bde20ea@lwn.net>
In-Reply-To: <cover.1525684985.git.mchehab+samsung@kernel.org>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
Organization: LWN.net
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon,  7 May 2018 06:35:36 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:

> I decided to give a try with Sphinx last stable version
> (1.17.4), and noticed several issues. The worse one was
> with the networking book: a non-standard footnote there
> with [*] instead of a number causes it to break PDF building.
> 
> So, I took some spare time to address some warnings all over
> the tree, and moved a few text documents to a book. 

OK, I've applied the ones that seem to make sense for me to take now.
There's comments on the firmware one, and I'd rather have Tejun's OK for
the cgroup one.  The code-comment changes should probably go via the
usual maintainers.

> I with
> I had more time to move the other ones and to solve other
> warnings.

You and me both - but each step helps!

Thanks,

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
