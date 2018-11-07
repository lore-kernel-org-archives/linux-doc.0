Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6430F7D08A
	for <lwn-linux-doc@archive.lwn.net>; Wed,  7 Nov 2018 19:38:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726432AbeKHFJt (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 8 Nov 2018 00:09:49 -0500
Received: from smtp1-3.goneo.de ([85.220.129.32]:35929 "EHLO smtp1-3.goneo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725953AbeKHFJs (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 8 Nov 2018 00:09:48 -0500
Received: from localhost (localhost [127.0.0.1])
        by smtp1.goneo.de (Postfix) with ESMTP id AC1A2241024;
        Wed,  7 Nov 2018 20:37:59 +0100 (CET)
X-Virus-Scanned: by goneo
Received: from smtp1.goneo.de ([127.0.0.1])
        by localhost (smtp1.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id a2I8XAhCMkzi; Wed,  7 Nov 2018 20:37:58 +0100 (CET)
Received: from [192.168.1.127] (dyndsl-037-138-077-056.ewe-ip-backbone.de [37.138.77.56])
        by smtp1.goneo.de (Postfix) with ESMTPSA id 594FC23F106;
        Wed,  7 Nov 2018 20:37:58 +0100 (CET)
Subject: Re: [PATCH v2 2/2] kernel-doc: extend $type_param to match members
 referenced by pointer
To:     Mike Rapoport <rppt@linux.ibm.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1541609233-14182-1-git-send-email-rppt@linux.ibm.com>
 <1541609233-14182-3-git-send-email-rppt@linux.ibm.com>
From:   Markus Heiser <markus.heiser@darmarit.de>
Message-ID: <67c21f80-754f-1aa6-6722-bb90da5e5370@darmarit.de>
Date:   Wed, 7 Nov 2018 20:37:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1541609233-14182-3-git-send-email-rppt@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Am 07.11.18 um 17:47 schrieb Mike Rapoport:
> Currently, function parameter description can match '@type.member'
> expressions but fails to match '@type->member'.
> Extend the $type_param regex to allow matching both
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>   scripts/kernel-doc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> index 24d3550..f9f1431 100755
> --- a/scripts/kernel-doc
> +++ b/scripts/kernel-doc
> @@ -212,7 +212,7 @@ my $anon_struct_union = 0;
>   my $type_constant = '\b``([^\`]+)``\b';
>   my $type_constant2 = '\%([-_\w]+)';
>   my $type_func = '(\w+)\(\)';
> -my $type_param = '\@(\w*(\.\w+)*(\.\.\.)?)';
> +my $type_param = '\@(\w*((\.\w+)|(->\w+))*(\.\.\.)?)';

Thanks, works! FWIW: added [1] this to the linuxdoc project (a kernel-doc
spinoff).  There we have a small frmaework for testing kernel-doc patches [2].
Which found a few hundert usages of '->' pointers in the whole kernel sources.

[1] https://github.com/return42/linuxdoc/commit/cce336ce0
[2] https://github.com/return42/linuxdoc/blob/master/Makefile#L95

-- Markus --
