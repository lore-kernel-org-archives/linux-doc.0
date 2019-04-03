Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DE1407D04D
	for <lwn-linux-doc@archive.lwn.net>; Wed,  3 Apr 2019 19:36:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbfDCTgP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 3 Apr 2019 15:36:15 -0400
Received: from ms.lwn.net ([45.79.88.28]:54102 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726151AbfDCTgP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 3 Apr 2019 15:36:15 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id AB7959B7;
        Wed,  3 Apr 2019 19:36:14 +0000 (UTC)
Date:   Wed, 3 Apr 2019 13:36:13 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Changbin Du <changbin.du@gmail.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2 00/24] Include linux ACPI docs into Sphinx TOC tree
Message-ID: <20190403133613.13f3fd75@lwn.net>
In-Reply-To: <CAJZ5v0jbCi3Jgn5YXPCP+zgs-O7z-9_3p3XZGvm40_6RDsJqkQ@mail.gmail.com>
References: <20190329001135.15847-1-changbin.du@gmail.com>
        <CAJZ5v0gKX9E+U_9eKfTr7pWGH=jxMLz_Jr850-6BcbG3xBz5qg@mail.gmail.com>
        <CAJZ5v0jbCi3Jgn5YXPCP+zgs-O7z-9_3p3XZGvm40_6RDsJqkQ@mail.gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 2 Apr 2019 10:25:23 +0200
"Rafael J. Wysocki" <rafael@kernel.org> wrote:

> There are ACPI-related documents currently in Documentation/acpi/ that
> don't clearly fall under either driver-api or admin-guide.  For
> example, some of them describe various aspects of the ACPI support
> subsystem operation and some document expectations with respect to the
> ACPI tables provided by the firmware etc.
> 
> Where would you recommend to put them after converting to .rst?

OK, I've done some pondering on this.  Maybe what we need is a new
top-level "hardware guide" book meant to hold information on how the
hardware works and what the kernel's expectations are.  Architecture
information could maybe go there too.  Would this make sense?

If so, I could see a division like this:

Hardware guide
	acpi-lid
	aml-debugger (or maybe driver api?)
	debug (ditto)
	DSD-properties-rules
	gpio-properties
	i2c-muxes

Admin guide
	cppc_sysfs
	initrd_table_override

Driver-API
	enumeration
	scan_handlers

other:
	dsdt-override: find another home for those five lines

...and so on.  I've probably gotten at least one of those wrong, but that's
the idea.

Of course, then it would be nice to better integrate those documents so
that they fit into a single coherent whole...a guy can dream...:)

Thanks,

jon
