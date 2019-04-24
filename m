Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8E0377D08A
	for <lwn-linux-doc@archive.lwn.net>; Wed, 24 Apr 2019 16:18:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730666AbfDXQSt (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 24 Apr 2019 12:18:49 -0400
Received: from ms.lwn.net ([45.79.88.28]:55508 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727444AbfDXQSs (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 24 Apr 2019 12:18:48 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id B83E81AA;
        Wed, 24 Apr 2019 16:18:47 +0000 (UTC)
Date:   Wed, 24 Apr 2019 10:18:46 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Changbin Du <changbin.du@gmail.com>
Cc:     Bjorn Helgaas <bhelgaas@google.com>, rjw@rjwysocki.net,
        linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com,
        x86@kernel.org, fenghua.yu@intel.com,
        linuxppc-dev@lists.ozlabs.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, mchehab+samsung@kernel.org
Subject: Re: [PATCH v4 00/63] Include linux ACPI/PCI/X86 docs into Sphinx
 TOC tree
Message-ID: <20190424101846.7cc4bad7@lwn.net>
In-Reply-To: <20190423162932.21428-1-changbin.du@gmail.com>
References: <20190423162932.21428-1-changbin.du@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 24 Apr 2019 00:28:29 +0800
Changbin Du <changbin.du@gmail.com> wrote:

> The kernel now uses Sphinx to generate intelligent and beautiful documentation
> from reStructuredText files. I converted all of the Linux ACPI/PCI/X86 docs to
> reST format in this serias.
> 
> In this version I combined ACPI and PCI docs, and added new x86 docs conversion.

As mentioned by others, this is a lot of stuff; I would really rather see
each of those groups as separate patch sets.

If you can do a reasonably quick turnaround with Mauro's suggestions
addressed and tags applied, we should be able to get at least some of this
into 5.2.  Thanks, Mauro, for looking at all of this stuff!

Thanks,

jon
