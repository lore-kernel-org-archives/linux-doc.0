Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D6F187D08A
	for <lwn-linux-doc@archive.lwn.net>; Tue, 30 Apr 2019 12:33:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727134AbfD3Mdd (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 30 Apr 2019 08:33:33 -0400
Received: from ms.lwn.net ([45.79.88.28]:48128 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726015AbfD3Mdd (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 30 Apr 2019 08:33:33 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id BE7799AF;
        Tue, 30 Apr 2019 12:33:31 +0000 (UTC)
Date:   Tue, 30 Apr 2019 06:33:28 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mike Rapoport <rppt@linux.ibm.com>
Cc:     Anshuman Khandual <anshuman.khandual@arm.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] docs/vm: add documentation of memory models
Message-ID: <20190430063328.41ceca5f@lwn.net>
In-Reply-To: <1556453863-16575-1-git-send-email-rppt@linux.ibm.com>
References: <1556453863-16575-1-git-send-email-rppt@linux.ibm.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 28 Apr 2019 15:17:43 +0300
Mike Rapoport <rppt@linux.ibm.com> wrote:

> Describe what {FLAT,DISCONTIG,SPARSE}MEM are and how they manage to
> maintain pfn <-> struct page correspondence.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

I've applied this, thanks.

jon
