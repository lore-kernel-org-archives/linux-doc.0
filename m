Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7BBC37D082
	for <lwn-linux-doc@archive.lwn.net>; Fri, 12 Oct 2018 17:21:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727195AbeJMAzZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 12 Oct 2018 20:55:25 -0400
Received: from ms.lwn.net ([45.79.88.28]:51070 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726665AbeJMAzY (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 12 Oct 2018 20:55:24 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 2259B2E5;
        Fri, 12 Oct 2018 17:21:54 +0000 (UTC)
Date:   Fri, 12 Oct 2018 11:21:53 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mike Rapoport <rppt@linux.ibm.com>
Cc:     David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] docs: memory-hotplug: add details about locking
 internals
Message-ID: <20181012112153.3e1801cb@lwn.net>
In-Reply-To: <1539233897-10207-1-git-send-email-rppt@linux.ibm.com>
References: <1539233897-10207-1-git-send-email-rppt@linux.ibm.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 11 Oct 2018 07:58:15 +0300
Mike Rapoport <rppt@linux.ibm.com> wrote:

> As discussed at [1], the latest updates to memory hotplug documentation are
> causing a conflict between docs and mmotm trees.
> These patches resolve the conflict.
> 
> [1] https://lkml.org/lkml/2018/10/8/227
> 
> David Hildenbrand (1):
>   docs/core-api: memory-hotplug: add some details about locking internals
> 
> Mike Rapoport (1):
>   docs/core-api: rename memory-hotplug-notifier to memory-hotplug

I've applied the pair, thanks.

jon
