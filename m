Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 02F9B7D923
	for <lwn-linux-doc@archive.lwn.net>; Wed, 24 Apr 2019 16:15:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732571AbfDXQO6 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 24 Apr 2019 12:14:58 -0400
Received: from ms.lwn.net ([45.79.88.28]:55482 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727913AbfDXQO5 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 24 Apr 2019 12:14:57 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 8E6621AA;
        Wed, 24 Apr 2019 16:14:56 +0000 (UTC)
Date:   Wed, 24 Apr 2019 10:14:55 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mike Rapoport <rppt@linux.ibm.com>
Cc:     linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/vm: add documentation of memory models
Message-ID: <20190424101455.12cd407e@lwn.net>
In-Reply-To: <1556101715-31966-1-git-send-email-rppt@linux.ibm.com>
References: <1556101715-31966-1-git-send-email-rppt@linux.ibm.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 24 Apr 2019 13:28:35 +0300
Mike Rapoport <rppt@linux.ibm.com> wrote:

> Describe what {FLAT,DISCONTIG,SPARSE}MEM are and how they manage to
> maintain pfn <-> struct page correspondence.

Quick question: should this document perhaps mention that DISCONTIGMEM
appears to be on its way out?

Thanks,

jon
