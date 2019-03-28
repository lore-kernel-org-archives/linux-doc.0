Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 84CD07D08A
	for <lwn-linux-doc@archive.lwn.net>; Thu, 28 Mar 2019 16:35:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbfC1Qey (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 28 Mar 2019 12:34:54 -0400
Received: from smtprelay0232.hostedemail.com ([216.40.44.232]:37408 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726029AbfC1Qey (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Mar 2019 12:34:54 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id 29068180AA51A;
        Thu, 28 Mar 2019 16:34:53 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: birth84_81c6b7977a304
X-Filterd-Recvd-Size: 1655
Received: from XPS-9350.home (unknown [47.151.153.53])
        (Authenticated sender: joe@perches.com)
        by omf01.hostedemail.com (Postfix) with ESMTPA;
        Thu, 28 Mar 2019 16:34:51 +0000 (UTC)
Message-ID: <158b68a902139066f53d308cc5a428774445a05b.camel@perches.com>
Subject: Re: [PATCH 00/23] Include linux ACPI docs into Sphinx TOC tree
From:   Joe Perches <joe@perches.com>
To:     Changbin Du <changbin.du@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     rjw@rjwysocki.net, lenb@kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Date:   Thu, 28 Mar 2019 09:34:50 -0700
In-Reply-To: <20190328162721.26138-1-changbin.du@gmail.com>
References: <20190328162721.26138-1-changbin.du@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 2019-03-29 at 00:26 +0800, Changbin Du wrote:
> Hi Corbet and All,
> The kernel now uses Sphinx to generate intelligent and beautiful documentation
> from reStructuredText files. I converted most of the Linux ACPI docs to rst
> format in this serias.
[]
>  ...pio-properties.txt => gpio-properties.rst} |  76 +++--

Please also update this MAINTAINERS entry

MAINTAINERS-GPIO ACPI SUPPORT
MAINTAINERS-M:  Mika Westerberg <mika.westerberg@linux.intel.com>
MAINTAINERS-M:  Andy Shevchenko <andriy.shevchenko@linux.intel.com>
MAINTAINERS-L:  linux-gpio@vger.kernel.org
MAINTAINERS-L:  linux-acpi@vger.kernel.org
MAINTAINERS-S:  Maintained
MAINTAINERS:F:  Documentation/acpi/gpio-properties.txt
MAINTAINERS-F:  drivers/gpio/gpiolib-acpi.c
MAINTAINERS-


