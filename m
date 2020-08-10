Return-Path: <SRS0=3K0Z=BU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A42C433DF
	for <linux-doc@archiver.kernel.org>; Mon, 10 Aug 2020 15:10:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 954352075D
	for <linux-doc@archiver.kernel.org>; Mon, 10 Aug 2020 15:10:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725873AbgHJPK0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 Aug 2020 11:10:26 -0400
Received: from pegase1.c-s.fr ([93.17.236.30]:7296 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725869AbgHJPKZ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 10 Aug 2020 11:10:25 -0400
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 4BQKCD51skz9v0GZ;
        Mon, 10 Aug 2020 17:10:16 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id yI8csEgIiygU; Mon, 10 Aug 2020 17:10:16 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 4BQKCD3c98z9v0GT;
        Mon, 10 Aug 2020 17:10:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 7D8238B967;
        Mon, 10 Aug 2020 17:10:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id WdhuVDZ3HBdc; Mon, 10 Aug 2020 17:10:22 +0200 (CEST)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 53D328B965;
        Mon, 10 Aug 2020 17:10:22 +0200 (CEST)
Subject: Re: [PATCH] Documentation/features: refresh powerpc arch support
 files
To:     Tobias Klauser <tklauser@distanz.ch>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
        linux-doc@vger.kernel.org
References: <20200810100906.3805-1-tklauser@distanz.ch>
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <4b6b65e8-ec79-ebf0-0ab5-7b48182584f1@csgroup.eu>
Date:   Mon, 10 Aug 2020 17:09:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200810100906.3805-1-tklauser@distanz.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



Le 10/08/2020 à 12:09, Tobias Klauser a écrit :
> Support for these was added by commit aa65ff6b18e0 ("powerpc/64s:
> Implement queued spinlocks and rwlocks").
> 
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> ---
>   Documentation/features/locking/queued-rwlocks/arch-support.txt  | 2 +-
>   .../features/locking/queued-spinlocks/arch-support.txt          | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/features/locking/queued-rwlocks/arch-support.txt b/Documentation/features/locking/queued-rwlocks/arch-support.txt
> index 5c6bcfcf8e1f..4dd5e554873f 100644
> --- a/Documentation/features/locking/queued-rwlocks/arch-support.txt
> +++ b/Documentation/features/locking/queued-rwlocks/arch-support.txt
> @@ -22,7 +22,7 @@
>       |       nios2: | TODO |
>       |    openrisc: |  ok  |
>       |      parisc: | TODO |
> -    |     powerpc: | TODO |
> +    |     powerpc: |  ok  |

In your commit log you are refering to a commit titled "powerpc/64s:"

Are you sure it is now OK for all powerpc, not only for book3s/64 as 
suggested by yout text ?

Christophe

>       |       riscv: | TODO |
>       |        s390: | TODO |
>       |          sh: | TODO |
> diff --git a/Documentation/features/locking/queued-spinlocks/arch-support.txt b/Documentation/features/locking/queued-spinlocks/arch-support.txt
> index b55e420a34ea..b16d4f71e5ce 100644
> --- a/Documentation/features/locking/queued-spinlocks/arch-support.txt
> +++ b/Documentation/features/locking/queued-spinlocks/arch-support.txt
> @@ -22,7 +22,7 @@
>       |       nios2: | TODO |
>       |    openrisc: |  ok  |
>       |      parisc: | TODO |
> -    |     powerpc: | TODO |
> +    |     powerpc: |  ok  |
>       |       riscv: | TODO |
>       |        s390: | TODO |
>       |          sh: | TODO |
> 
