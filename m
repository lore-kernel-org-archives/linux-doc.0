Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EED1FFA3744
	for <linux-doc@archiver.kernel.org>; Mon, 31 Oct 2022 13:32:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230337AbiJaNcJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 31 Oct 2022 09:32:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbiJaNcI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 31 Oct 2022 09:32:08 -0400
Received: from out2.migadu.com (out2.migadu.com [188.165.223.204])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71B4610043
        for <linux-doc@vger.kernel.org>; Mon, 31 Oct 2022 06:32:04 -0700 (PDT)
Message-ID: <01d669eb-a71a-040e-ac1f-41536a5a2425@lirui.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lirui.org; s=key1;
        t=1667223122;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FfA2RvFAY3yvaFqJUlZzERqNNDLx/0Kmo1qZPYPpf1M=;
        b=gHBx3C3XfjJNi6aP7NQxhphByo1H4DnfHrQm/5QZfSCVZh8aIQACNffGJ6eaUTn3/tP2Yp
        2PsnhTQo9N1B5fTIma9pZrEfnKAawvwIww0sJDqcVHNvs7Ml37/jNg8lvRL6YqiDsgfW5c
        WuN5tepKFhkG8O15ArWlsxzCEpAbqhiBxnYsTJ5344eyyQdGRqrgZddF6psyva5xBJoPpK
        Fxo2P0eR6Z+LoL6cWeVvclfN9JlF5vWJmOEpLl5mpzSf8CxcyiD5P1VB4T3HuqszjZai/+
        M9oNb+j8adAPcFhxvTrPkHNt3IaQ9ODAUied0s9JolTwa/ayoxhZaTwnzGxh/g==
Date:   Mon, 31 Oct 2022 21:31:46 +0800
MIME-Version: 1.0
Subject: Re: Font size for actual content in Alabaster too small?
Content-Language: en-US
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
References: <7bddd517-6326-8f92-1ff2-1f97c9d4b235@gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Rui Li <me@lirui.org>
In-Reply-To: <7bddd517-6326-8f92-1ff2-1f97c9d4b235@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2022/10/31 20:27, Bagas Sanjaya wrote:
> Hi,
>
> I have done make htmldocs on linux-next (which includes switching doc theme
> to Alabaster) and see the results.
>
> Honestly, the font size for actual content (body) is only 10pt, which makes
> reading the docs a bit harder. I think that 12pt should be more readable
> instead.
>
> ---- >8 ----
> diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
> index 9b36f7abd24f3f..7894901ca92e4e 100644
> --- a/Documentation/sphinx-static/custom.css
> +++ b/Documentation/sphinx-static/custom.css
> @@ -10,6 +10,10 @@ div.body h3 { font-size: 130%; }
>  
>  /* Tighten up the layout slightly */
>  div.body { padding: 0 15px 0 10px; }
> +
> +/* Largen body font size for readability */
> +div.body { font-size: 12pt; }
> +
>  div.sphinxsidebarwrapper { padding: 1em 0.4em; }
>  /* Tweak document margins and don't force width */
>  div.document {
>
> Thanks.
>
The text style also makes Chinese characters hard to read in my perspective. And the
font "goudy old style" will let hyphen looks like a dot.

-- 
Rui Li    0x77E6D821D7AE84FE

