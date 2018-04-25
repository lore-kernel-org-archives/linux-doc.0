Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BA8AB7E279
	for <lwn-linux-doc@archive.lwn.net>; Wed, 25 Apr 2018 06:05:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751255AbeDYGFk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 25 Apr 2018 02:05:40 -0400
Received: from mx2.suse.de ([195.135.220.15]:53309 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751247AbeDYGFj (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 25 Apr 2018 02:05:39 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id E1C62AD65;
        Wed, 25 Apr 2018 06:05:37 +0000 (UTC)
Date:   Wed, 25 Apr 2018 08:05:34 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Sam Hansen <hansens@google.com>
Cc:     linux-i2c@vger.kernel.org, wsa@the-dreams.de, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation/i2c: direct users to i2c-tools regarding
 i2c/smbus.h
Message-ID: <20180425080534.53877bec@endymion>
In-Reply-To: <20180419222356.242535-1-hansens@google.com>
References: <20180419222356.242535-1-hansens@google.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Sam,

Please don't include the same persons in To: and Cc:. It makes the
message delivered twice to them.

On Thu, 19 Apr 2018 15:23:56 -0700, Sam Hansen wrote:
> The current examples reference i2c/smbus.h, which is the first reference
> in Documentation/i2c/dev-interface to anything related to the i2c-tools
> project.  This moves the existing reference to i2c-tools up into the
> C-example, directing the user to the project's git repository.
> 
> Signed-off-by: Sam Hansen <hansens@google.com>
> ---
>  Documentation/i2c/dev-interface | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/i2c/dev-interface b/Documentation/i2c/dev-interface
> index fbed645ccd75..ed20f7b7851a 100644
> --- a/Documentation/i2c/dev-interface
> +++ b/Documentation/i2c/dev-interface
> @@ -23,6 +23,10 @@ First, you need to include these two headers:
>    #include <linux/i2c-dev.h>
>    #include <i2c/smbus.h>
>  
> +The i2c/smbus header file is provided by the i2c-tools project.  For more info
> +about i2c-tools, see:
> +https://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git/
> +
>  Now, you have to decide which adapter you want to access. You should
>  inspect /sys/class/i2c-dev/ or run "i2cdetect -l" to decide this.
>  Adapter numbers are assigned somewhat dynamically, so you can not
> @@ -163,10 +167,6 @@ what happened. The 'write' transactions return 0 on success; the
>  returns the number of values read. The block buffers need not be longer
>  than 32 bytes.
>  
> -The above functions are made available by linking against the libi2c library,
> -which is provided by the i2c-tools project.  See:
> -https://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git/.
> -

I'm fine with moving the pointer to i2c-tools up in the document.
However I find it unfortunate to remove the only reference to libi2c.
Typically, distributions will only include the tools in i2c-tools, and
they are not relevant in this case. The library will be in a separate
package (libi2c or similar), and the header file in yet another package
(libi2c-devel or similar.) Although the exact package names are
distribution specific, it would be convenient to hint the reader at
which packages he is supposed to install. You could also mention that
the C program must be compiled with -li2c.

>  
>  Implementation details
>  ======================


-- 
Jean Delvare
SUSE L3 Support
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
