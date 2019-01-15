Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 284137D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 15 Jan 2019 00:27:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727299AbfAOA1X (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 14 Jan 2019 19:27:23 -0500
Received: from ms.lwn.net ([45.79.88.28]:38574 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727195AbfAOA1X (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 14 Jan 2019 19:27:23 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 516902E5;
        Tue, 15 Jan 2019 00:27:23 +0000 (UTC)
Date:   Mon, 14 Jan 2019 17:27:22 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mike Rapoport <rppt@linux.ibm.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH] docs/core-api: memory-allocation: add mention of
 kmem_cache_create_userspace
Message-ID: <20190114172722.206546e5@lwn.net>
In-Reply-To: <1547466454-29457-1-git-send-email-rppt@linux.ibm.com>
References: <1547466454-29457-1-git-send-email-rppt@linux.ibm.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 14 Jan 2019 13:47:34 +0200
Mike Rapoport <rppt@linux.ibm.com> wrote:

> Mention that when a part of a slab cache might be exported to the
> userspace, the cache should be created using kmem_cache_create_usercopy()
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Hmm...I didn't know that :)

Applied, thanks.

jon
