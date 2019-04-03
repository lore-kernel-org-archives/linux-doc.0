Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,URIBL_RED,URIBL_RHS_DOB
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9A9667D04D
	for <lwn-linux-doc@archive.lwn.net>; Wed,  3 Apr 2019 19:23:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbfDCTXH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 3 Apr 2019 15:23:07 -0400
Received: from ms.lwn.net ([45.79.88.28]:54030 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726099AbfDCTXH (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 3 Apr 2019 15:23:07 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 4170F97D;
        Wed,  3 Apr 2019 19:23:06 +0000 (UTC)
Date:   Wed, 3 Apr 2019 13:23:05 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Changbin Du <changbin.du@gmail.com>
Cc:     Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/12] Include linux PCI docs into Sphinx TOC tree
Message-ID: <20190403132305.41e6e185@lwn.net>
In-Reply-To: <20190403154955.12096-1-changbin.du@gmail.com>
References: <20190403154955.12096-1-changbin.du@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed,  3 Apr 2019 23:49:43 +0800
Changbin Du <changbin.du@gmail.com> wrote:

> The kernel now uses Sphinx to generate intelligent and beautiful documentation
> from reStructuredText files. I converted most of the Linux PCI docs to rst
> format in this serias.
> 
> For you to preview, please visit below url:
> http://www.bytemem.com:8080/kernel-doc/PCI/index.html
> 
> Thank you!

So I have the same comment that I had with regard to the ACPI set: I would
really rather not clutter the top level of the doc tree with this.  In
this case the resolution is a lot simpler, though: everything here seems
suitable for the driver API guide.  Could you please redo the patch set to
place the docs there?

Reflecting Bjorn's comment on the title lines and adding his ack would be
a nice touch while you're at it.

Thanks for doing this work - this one's almost there, I think.

jon
