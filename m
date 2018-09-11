Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 25E337D584
	for <lwn-linux-doc@archive.lwn.net>; Tue, 11 Sep 2018 15:25:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726909AbeIKUZM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 11 Sep 2018 16:25:12 -0400
Received: from ms.lwn.net ([45.79.88.28]:50526 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726800AbeIKUZM (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 11 Sep 2018 16:25:12 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 932402DD;
        Tue, 11 Sep 2018 15:25:24 +0000 (UTC)
Date:   Tue, 11 Sep 2018 09:25:22 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>
Subject: Re: nodocs in 4.19-rcX
Message-ID: <20180911092522.7a335ce8@lwn.net>
In-Reply-To: <ace3eeb9-0a15-a4ff-cf2d-af9335fd9810@infradead.org>
References: <ace3eeb9-0a15-a4ff-cf2d-af9335fd9810@infradead.org>
Organization: LWN.net
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 10 Sep 2018 15:51:20 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> 4.19-rc contains some users of :nodocs: but that is not recognized yet,
> so we get:
> 
> lnx-419-rc3/Documentation/core-api/boot-time-mm.rst:78: ERROR: Error in "kernel-doc" directive:
> unknown option: "nodocs".
> 
> .. kernel-doc:: mm/bootmem.c
>    :nodocs:
> 
> lnx-419-rc3/Documentation/core-api/boot-time-mm.rst:91: ERROR: Error in "kernel-doc" directive:
> unknown option: "nodocs".
> 
> .. kernel-doc:: mm/memblock.c
>    :nodocs:
> 
> 
> Do you plan to merge the patch(es) for :nodocs: ?

:nodocs" was v1 of the patch set:

  https://lwn.net/ml/linux-doc/1529328996-16247-1-git-send-email-rppt%40linux.vnet.ibm.com/

In the end, I merged v3, which changed things (and did not contain
the :nodocs: directive:

  https://lwn.net/ml/linux-doc/1530306311-10510-1-git-send-email-rppt%40linux.vnet.ibm.com/

So I'm guessing that anything that snuck in with :nodocs: didn't get
updated.  Somehow I missed that.  Adding CC: Mike, since his
fingerprints are on all aspects of this...:)

jon
