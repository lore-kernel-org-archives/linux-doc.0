Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A7EE07DE78
	for <lwn-linux-doc@archive.lwn.net>; Tue,  8 May 2018 11:11:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752246AbeEHLLZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 8 May 2018 07:11:25 -0400
Received: from forward3j.cmail.yandex.net ([5.255.227.21]:45331 "EHLO
        forward3j.cmail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751463AbeEHLLY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 May 2018 07:11:24 -0400
X-Greylist: delayed 462 seconds by postgrey-1.27 at vger.kernel.org; Tue, 08 May 2018 07:11:24 EDT
Received: from mxback6j.mail.yandex.net (mxback6j.mail.yandex.net [IPv6:2a02:6b8:0:1619::10f])
        by forward3j.cmail.yandex.net (Yandex) with ESMTP id 7BA95210FE;
        Tue,  8 May 2018 14:03:41 +0300 (MSK)
Received: from localhost (localhost [::1])
        by mxback6j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id nEomScDIlD-3dkSiZ96;
        Tue, 08 May 2018 14:03:40 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1525777420;
        bh=1sb8u4zladgXXYUI4W8JZhDIorKwVe4/SsMifjMT5WA=;
        h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date;
        b=OC3NtcL5GsJ0WhUyPxyRrXe32vTb3LthxSMYpzFrTDQQXxubwVOls6MqdaEbMAi/s
         4XOiRrkDmkflQDT5KM6RIRlmXmWYmY5Z9YXqhjO8o+wU2Sp7lfln1lkfXzi/llwai6
         iaa9XsGikPpzPGyW8H4wZ1ySXrZJRO/7FvpVgEYU=
Authentication-Results: mxback6j.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by web22j.yandex.ru with HTTP;
        Tue, 08 May 2018 14:03:39 +0300
From:   Evgeniy Polyakov <zbr@ioremap.net>
Envelope-From: drustafa@yandex.ru
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
In-Reply-To: <cd5b6e6a8d51820ee158127cdd50e44645c44ee7.1525684985.git.mchehab+samsung@kernel.org>
References: <cover.1525684985.git.mchehab+samsung@kernel.org><cover.1525684985.git.mchehab+samsung@kernel.org> <cd5b6e6a8d51820ee158127cdd50e44645c44ee7.1525684985.git.mchehab+samsung@kernel.org>
Subject: Re: [PATCH 18/18] w1: w1_io.c: fix a kernel-doc warning
MIME-Version: 1.0
Message-Id: <702861525777419@web22j.yandex.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date:   Tue, 08 May 2018 14:03:39 +0300
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi

07.05.2018, 12:36, "Mauro Carvalho Chehab" <mchehab+samsung@kernel.org>:
> Add a blank line to avoid this Sphinx warning:
>         ./drivers/w1/w1_io.c:197: WARNING: Definition list ends without a blank line; unexpected unindent.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Looks good to me, thank you!
What tree should this be forwarded to, or folks from linux doc will pick it up?

Acked-by: Evgeniy Polyakov <zbr@ioremap.net>

> ---
>  drivers/w1/w1_io.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/w1/w1_io.c b/drivers/w1/w1_io.c
> index 075d120e7b88..0364d3329c52 100644
> --- a/drivers/w1/w1_io.c
> +++ b/drivers/w1/w1_io.c
> @@ -194,6 +194,7 @@ static u8 w1_read_bit(struct w1_master *dev)
>   * bit 0 = id_bit
>   * bit 1 = comp_bit
>   * bit 2 = dir_taken
> + *
>   * If both bits 0 & 1 are set, the search should be restarted.
>   *
>   * Return: bit fields - see above
> --
> 2.17.0
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
