Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7EEE47D072
	for <lwn-linux-doc@archive.lwn.net>; Mon, 21 May 2018 15:27:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752713AbeEUP1n (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 21 May 2018 11:27:43 -0400
Received: from ms.lwn.net ([45.79.88.28]:47454 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752311AbeEUP1n (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 21 May 2018 11:27:43 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id CD9F4AA6;
        Mon, 21 May 2018 15:27:42 +0000 (UTC)
Date:   Mon, 21 May 2018 09:27:41 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc:     linux-doc <linux-doc@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] docs/vm: transhuge: split userspace bits to
 admin-guide/mm
Message-ID: <20180521092741.40f2cbd7@lwn.net>
In-Reply-To: <1526285620-453-1-git-send-email-rppt@linux.vnet.ibm.com>
References: <1526285620-453-1-git-send-email-rppt@linux.vnet.ibm.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 14 May 2018 11:13:37 +0300
Mike Rapoport <rppt@linux.vnet.ibm.com> wrote:

> Here are minor updates to transparent hugepage docs. Except from minor
> formatting and spelling updates, these patches re-arrange the transhuge.rst
> so that userspace interface description will not be interleaved with the
> implementation details and it would be possible to split the userspace
> related bits to Documentation/admin-guide/mm, which is done by the third
> patch.

Looks good, I've applied the set, after adding a changelog for #3.

Thanks,

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
