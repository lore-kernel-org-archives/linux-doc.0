Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 888527DBD4
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 Oct 2019 13:29:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728340AbfJGN3d (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 Oct 2019 09:29:33 -0400
Received: from ms.lwn.net ([45.79.88.28]:57442 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727801AbfJGN3c (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 7 Oct 2019 09:29:32 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C5E68316;
        Mon,  7 Oct 2019 13:29:31 +0000 (UTC)
Date:   Mon, 7 Oct 2019 07:29:30 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jessica Yu <jeyu@kernel.org>
Cc:     Matthias Maennich <maennich@google.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-doc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Adam Zerella <adam.zerella@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] doc: move namespaces.rst out of kbuild directory
Message-ID: <20191007072930.07b1e90a@lwn.net>
In-Reply-To: <20191007081241.GA8279@linux-8ccs>
References: <20191007043611.31036-1-yamada.masahiro@socionext.com>
        <20191007060614.GA142813@google.com>
        <20191007081241.GA8279@linux-8ccs>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 7 Oct 2019 10:12:42 +0200
Jessica Yu <jeyu@kernel.org> wrote:

> This was my line of thought as well, since the audience of
> admin-guide/ is sysadmins and users. Namespaces are mostly relevant to
> module authors and kernel developers. Currently, I don't think there
> is an existing good place in Documentation/ for this topic :-/
> I suppose kernel-hacking/ might be the closest fit, as Adam suggested.

I didn't see this thread before responding in the first, naturally...  

I think the core-api manual is probably as good a place as any for this.
Changing the name to something like symbol-namespaces.rst is probably a
good idea, since most people think of other things when they see
"namespaces".  Or perhaps that mythical Somebody could expand it into a
proper description of symbol exports in general...:)

Thanks,

jon
