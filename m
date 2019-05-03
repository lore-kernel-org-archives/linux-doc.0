Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1F39F7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri,  3 May 2019 12:43:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727682AbfECMnv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 3 May 2019 08:43:51 -0400
Received: from ms.lwn.net ([45.79.88.28]:48080 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727032AbfECMnv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 3 May 2019 08:43:51 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id EE0E47DE;
        Fri,  3 May 2019 12:43:49 +0000 (UTC)
Date:   Fri, 3 May 2019 06:43:47 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Changbin Du <changbin.du@gmail.com>
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/27] Include linux x86 docs into Sphinx TOC tree
Message-ID: <20190503064347.1d027e87@lwn.net>
In-Reply-To: <20190502070633.9809-1-changbin.du@gmail.com>
References: <20190502070633.9809-1-changbin.du@gmail.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu,  2 May 2019 15:06:06 +0800
Changbin Du <changbin.du@gmail.com> wrote:

> The kernel now uses Sphinx to generate intelligent and beautiful documentation
> from reStructuredText files. I converted all of the Linux x86 docs to rst
> format in this serias.
> 
> For you to preview, please visit below url:
> http://www.bytemem.com:8080/kernel-doc/index.html

x86 folks: how would you like to handle this set?  Take it yourselves,
have me take it, print it out and set it on fire, ...?

Thanks,

jon
