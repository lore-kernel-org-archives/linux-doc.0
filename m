Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E75CE7D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 Jan 2019 22:34:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726667AbfAGWen (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 Jan 2019 17:34:43 -0500
Received: from ms.lwn.net ([45.79.88.28]:53654 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726643AbfAGWen (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 7 Jan 2019 17:34:43 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 775A52ED;
        Mon,  7 Jan 2019 22:34:42 +0000 (UTC)
Date:   Mon, 7 Jan 2019 15:34:41 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Bart Van Assche <bvanassche@acm.org>
Cc:     linux-doc@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Alison Chaiken <alison@she-devel.com>,
        Joe Perches <joe@perches.com>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        "Geyslan G . Bem" <geyslan@gmail.com>,
        Tiago Natel de Moura <tiago4orion@gmail.com>
Subject: Re: [PATCH v3] Documentation/CodingStyle: Use directory-local
 variables for emacs settings
Message-ID: <20190107153441.507affc0@lwn.net>
In-Reply-To: <20190107182019.105393-1-bvanassche@acm.org>
References: <20190107182019.105393-1-bvanassche@acm.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon,  7 Jan 2019 10:20:19 -0800
Bart Van Assche <bvanassche@acm.org> wrote:

> In emacs 23.1 support for directory-local variables was added (see also
> https://lists.gnu.org/archive/html/info-gnu-emacs/2009-07/msg00000.html).
> Simplify the settings in coding-style.rst by using that feature.
> Additionally, do not inherit any settings from emacs' linux coding style
> to minimize dependencies on the version of emacs that is being used.
> 
> I have verified with several large and nontrivial kernel source files
> that the new settings format code according to what checkpatch expects.
> 
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Alison Chaiken <alison@she-devel.com>
> Cc: Joe Perches <joe@perches.com>
> Cc: Federico Vaga <federico.vaga@vaga.pv.it>
> Cc: Geyslan G. Bem <geyslan@gmail.com>
> Cc: Tiago Natel de Moura <tiago4orion@gmail.com>

I've applied this (and I'm off to change my .emacs file).  Thanks!

jon
