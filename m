Return-Path: <SRS0=SFNS=4G=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABCBBC34031
	for <linux-doc@archiver.kernel.org>; Tue, 18 Feb 2020 23:58:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7DA0E2070B
	for <linux-doc@archiver.kernel.org>; Tue, 18 Feb 2020 23:58:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="M6GT+uQZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727333AbgBRX6R (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 18 Feb 2020 18:58:17 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:35656 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727158AbgBRX6R (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Feb 2020 18:58:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=/MYGnKK0wzoZy0pOkX/WbXC+Lf8u2jDnU6ZCUa4UKdM=; b=M6GT+uQZQVonXRx59OkrEdGZzU
        66D+TivE91DNdv3v8FBuKLH+V5ExvhmM+3TKzXWDbRMwnykOqz1b9jGx7p0i5Uke0r9xTOwEE6NLa
        PUPhObJvlwO1SiCELQWh8YbMVlcSZuwvbYt+z+oXz+4ja6ArefN70MFg8TqWRwDvf7//DSUy7mP9U
        l73EG8VLBoyXwBx7YjzixH5vuAqS+WCryY1abbSs8/Ybf0PTsOF+Kmh6yimvyMVDE+i8Dvh+IHP+9
        LsEaeujryjkIshW3dAg9jDqwoRMY5VKvMTdW9qycosSyEZVTqurwd+xcKd21+uIGmm296F3OsnVTp
        ebx+OnHA==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j4Ckp-0004Je-Hq; Tue, 18 Feb 2020 23:58:15 +0000
Subject: Re: [PATCH] Documentation: kobject.txt has been reviewed and
 converted to rst
To:     lxsameer@gnu.org, corbet@lwn.net
Cc:     linux-doc@vger.kernel.org
References: <20200218213815.60856-1-lxsameer@gnu.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <4f1e8771-1902-885f-63e2-bb8d37dc5a91@infradead.org>
Date:   Tue, 18 Feb 2020 15:58:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200218213815.60856-1-lxsameer@gnu.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2/18/20 1:38 PM, lxsameer@gnu.org wrote:
> From: Sameer Rahmani <lxsameer@gnu.org>
> 
> Reivew the `kobject.txt` file and moved the converted rst version to `core-api`
> section where it makes more sense.
> 
> Signed-off-by: Sameer Rahmani <lxsameer@gnu.org>
> ---
>  Documentation/core-api/index.rst   |   1 +
>  Documentation/core-api/kobject.rst | 434 +++++++++++++++++++++++++++++
>  2 files changed, 435 insertions(+)
>  create mode 100644 Documentation/core-api/kobject.rst

> diff --git a/Documentation/core-api/kobject.rst b/Documentation/core-api/kobject.rst
> new file mode 100644
> index 000000000000..42f47ee36b63
> --- /dev/null
> +++ b/Documentation/core-api/kobject.rst
> @@ -0,0 +1,434 @@

Hi,
Did you make any non-Sphinx-format changes to kobject.txt {or .rst}?
It's difficult to tell in this patch format.
If you are making any changes to koject.txt, please do that in a
separate patch so that we can review it, then do the conversion from
.txt to .rst.  You also need to remove the kobject.txt file.


thanks.
-- 
~Randy

