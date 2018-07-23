Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 71C7B7D071
	for <lwn-linux-doc@archive.lwn.net>; Mon, 23 Jul 2018 15:42:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388039AbeGWQoM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 23 Jul 2018 12:44:12 -0400
Received: from ms.lwn.net ([45.79.88.28]:34892 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388029AbeGWQoM (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 23 Jul 2018 12:44:12 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E63A030A;
        Mon, 23 Jul 2018 15:42:23 +0000 (UTC)
Date:   Mon, 23 Jul 2018 09:42:22 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Souptick Joarder <jrdr.linux@gmail.com>
Cc:     willy@infradead.org, darrick.wong@oracle.com,
        gregkh@linuxfoundation.org, mszeredi@redhat.com,
        viro@zeniv.linux.org.uk, seanga2@gmail.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        ajitn.linux@gmail.com, brajeswar.linux@gmail.com,
        sabyasachi.linux@gmail.com
Subject: Re: [PATCH] mm: Introduce new type vm_fault_t
Message-ID: <20180723094222.42fc5a33@lwn.net>
In-Reply-To: <20180722130134.GA31321@jordon-HP-15-Notebook-PC>
References: <20180722130134.GA31321@jordon-HP-15-Notebook-PC>
Organization: LWN.net
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 22 Jul 2018 18:31:34 +0530
Souptick Joarder <jrdr.linux@gmail.com> wrote:

> We have introduce a new return type vm_fault_t for
> fault, page_mkwrite and pfn_mkwrite handlers. Update
> the document for the same
> 
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>

Applied, thanks.

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
