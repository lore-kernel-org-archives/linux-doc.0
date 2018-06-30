Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A60967D072
	for <lwn-linux-doc@archive.lwn.net>; Sat, 30 Jun 2018 13:56:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751155AbeF3N41 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 30 Jun 2018 09:56:27 -0400
Received: from ms.lwn.net ([45.79.88.28]:37972 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750892AbeF3N40 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 30 Jun 2018 09:56:26 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 492DF4F00;
        Sat, 30 Jun 2018 13:56:26 +0000 (UTC)
Date:   Sat, 30 Jun 2018 07:56:25 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Jani Nikula <jani.nikula@intel.com>,
        linux-doc <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 0/2] Documentation/sphinx: add kind of "nodocs"
 directive
Message-ID: <20180630075625.7b491449@lwn.net>
In-Reply-To: <20180629150734.4e680fcc@lwn.net>
References: <1530306311-10510-1-git-send-email-rppt@linux.vnet.ibm.com>
        <20180629150734.4e680fcc@lwn.net>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 29 Jun 2018 15:07:34 -0600
Jonathan Corbet <corbet@lwn.net> wrote:

> > These patches allow passing "-no-doc-sections" option to scripts/kernel-doc
> > from the sphinx generator.
> > 
> > This allows to avoid duplicated DOC: sections when "kernel-doc:" directive
> > is used without explicit selection of functions or function types. For
> > instance, [1] has "IDA description" and "idr synchronization" twice.
> > 
> > v3 changes:
> > * add description for empty "functions" directive to
> > Documentation/doc-guide/kernel-doc.rst  
> 
> Actually, I applied the previous set this morning...any chance you could
> send me the docs update separately?

Never mind...I realized I hadn't pushed that work, so I just switched over
to the newer version, sorry for the noise.

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
