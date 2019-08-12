Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 392CD7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Mon, 12 Aug 2019 20:56:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726924AbfHLU4G (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 12 Aug 2019 16:56:06 -0400
Received: from ms.lwn.net ([45.79.88.28]:36972 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726144AbfHLU4G (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 12 Aug 2019 16:56:06 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 19C7B2D8;
        Mon, 12 Aug 2019 20:56:06 +0000 (UTC)
Date:   Mon, 12 Aug 2019 14:56:05 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>
Cc:     linux-doc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] Documentation: sphinx: Add missing comma to list
 of strings
Message-ID: <20190812145605.04ff5e01@lwn.net>
In-Reply-To: <20190812160708.32172-1-j.neuschaefer@gmx.net>
References: <20190812160708.32172-1-j.neuschaefer@gmx.net>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 12 Aug 2019 18:07:04 +0200
Jonathan Neuschäfer <j.neuschaefer@gmx.net> wrote:

> In Python, like in C, when a comma is omitted in a list of strings, the
> two strings around the missing comma are concatenated.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---
> 
> v2:
> - new patch
> ---
>  Documentation/sphinx/automarkup.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/sphinx/automarkup.py b/Documentation/sphinx/automarkup.py
> index 77e89c1956d7..a8798369e8f7 100644
> --- a/Documentation/sphinx/automarkup.py
> +++ b/Documentation/sphinx/automarkup.py
> @@ -25,7 +25,7 @@ RE_function = re.compile(r'([\w_][\w\d_]+\(\))')
>  # to the creation of incorrect and confusing cross references.  So
>  # just don't even try with these names.
>  #
> -Skipfuncs = [ 'open', 'close', 'read', 'write', 'fcntl', 'mmap'
> +Skipfuncs = [ 'open', 'close', 'read', 'write', 'fcntl', 'mmap',
>                'select', 'poll', 'fork', 'execve', 'clone', 'ioctl']

Hmm...that's a wee bit embarrassing.  Applied (and the socket() patch
too), thanks.

jon
