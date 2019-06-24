Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FSL_HELO_FAKE,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7BA6D7D2EF
	for <lwn-linux-doc@archive.lwn.net>; Mon, 24 Jun 2019 22:03:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727419AbfFXWDQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 24 Jun 2019 18:03:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:54968 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726263AbfFXWDQ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 24 Jun 2019 18:03:16 -0400
Received: from gmail.com (unknown [104.132.1.77])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7D92320665;
        Mon, 24 Jun 2019 22:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561413795;
        bh=2Y2nsE+RWUoElhVrsjv17oGBg4y6eaMBuyDPXCXhQ38=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=u7U1H4LdnEu6Jq1bg1calSv5Z7rLBDeR5uL7S+cZap8Phhg+y/e9w3x0r11JKYJ+E
         ZI7O4QG8lbeSsXM/ACNzbWX/emdViI/+FIX8e6r9ZsWD+t++7ocE1CTAKrBFqHBBq3
         nG0bAhj4cAWPxtvLJC6FvLa0XiONxOz9+A0JESO0=
Date:   Mon, 24 Jun 2019 15:03:14 -0700
From:   Eric Biggers <ebiggers@kernel.org>
To:     "Hook, Gary" <Gary.Hook@amd.com>
Cc:     "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        "davem@davemloft.net" <davem@davemloft.net>
Subject: Re: [PATCH 2/3] crypto: doc - Describe the crypto engine
Message-ID: <20190624220313.GB237341@gmail.com>
References: <156140322426.29777.8610751479936722967.stgit@taos>
 <156140326736.29777.7751606850237303573.stgit@taos>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156140326736.29777.7751606850237303573.stgit@taos>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 24, 2019 at 07:07:49PM +0000, Hook, Gary wrote:
> Add a reference to the crypto engine documentation to
> the index.
> 
> Signed-off-by: Gary R Hook <gary.hook@amd.com>
> ---
>  Documentation/crypto/index.rst |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/crypto/index.rst b/Documentation/crypto/index.rst
> index c4ff5d791233..37cd7fb0ea82 100644
> --- a/Documentation/crypto/index.rst
> +++ b/Documentation/crypto/index.rst
> @@ -19,6 +19,7 @@ for cryptographic use cases, as well as programming examples.
>     intro
>     architecture
>     devel-algos
> +   crypto_engine
>     userspace-if
>     crypto_engine
>     api
> 

It's already in the list.

- Eric
