Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id ED6D87D90D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 12 Nov 2019 15:43:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbfKLPnA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 12 Nov 2019 10:43:00 -0500
Received: from ms.lwn.net ([45.79.88.28]:41574 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727049AbfKLPnA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 12 Nov 2019 10:43:00 -0500
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 7BE587DE;
        Tue, 12 Nov 2019 15:42:59 +0000 (UTC)
Date:   Tue, 12 Nov 2019 08:42:57 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: On global citations, URLs and translations
Message-ID: <20191112084257.4cca2d4c@lwn.net>
In-Reply-To: <87a79141s3.fsf@intel.com>
References: <CANiq72=mBLHTLtstBPU4TZT2DOAnYrtbd4SDh0tjkjo07ns=4w@mail.gmail.com>
        <87a79141s3.fsf@intel.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 12 Nov 2019 16:17:32 +0200
Jani Nikula <jani.nikula@linux.intel.com> wrote:

> Fix the references in both places to actually make them cross
> references. See below.
> 
> BR,
> Jani.
> 
> 
> diff --git a/Documentation/process/programming-language.rst b/Documentation/process/programming-language.rst
> index e5f5f065dc24..59efa6d7a053 100644
> --- a/Documentation/process/programming-language.rst
> +++ b/Documentation/process/programming-language.rst
> @@ -3,7 +3,7 @@
>  Programming Language
>  ====================
>  
> -The kernel is written in the C programming language [c-language]_.
> +The kernel is written in the C programming language `[c-language]`_.
>  More precisely, the kernel is typically compiled with ``gcc`` [gcc]_
>  under ``-std=gnu89`` [gcc-c-dialect-options]_: the GNU dialect of ISO C90
>  (including some C99 features).
> @@ -34,7 +34,7 @@ in order to feature detect which ones can be used and/or to shorten the code.
>  
>  Please refer to ``include/linux/compiler_attributes.h`` for more information.
>  
> -.. [c-language] http://www.open-std.org/jtc1/sc22/wg14/www/standards
> +.. _[c-language]: http://www.open-std.org/jtc1/sc22/wg14/www/standards
>  .. [gcc] https://gcc.gnu.org
>  .. [clang] https://clang.llvm.org
>  .. [icc] https://software.intel.com/en-us/c-compilers

That fixes this particular instance, while leaving the adjacent ones
untouched :)

I think this is a good change, especially if applied to all instances.  I
also wonder, though, if we should adopt a rule that translations need
unique labels - prepend "IT-" or some such for the Italian translation,
for example?

Thanks,

jon
