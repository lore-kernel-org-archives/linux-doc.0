Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8B38C6FD18
	for <linux-doc@archiver.kernel.org>; Tue, 25 Apr 2023 08:48:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233108AbjDYIs5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 25 Apr 2023 04:48:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233416AbjDYIsp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Apr 2023 04:48:45 -0400
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1911B448C;
        Tue, 25 Apr 2023 01:48:44 -0700 (PDT)
Received: from tarshish (unknown [10.0.8.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.tkos.co.il (Postfix) with ESMTPS id 5DF854403E5;
        Tue, 25 Apr 2023 11:29:37 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
        s=default; t=1682411377;
        bh=UkMtkcMa++6iafnSwjpqXocSH7XxdlGS73FZYqAy42c=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=ER6tN7Ne7zbJaKJK/SgUbaqWD+EMpWJnlUNmkipwMGUUdFvlDkd5yNleCADsygJJG
         DJtmLxs/Rq8XvEP9dLbKKmeeCJo7gJ5BMbB4bwQ63bOtpb/mdh/m+21QygRpg98tQz
         e43fbIzITzWGsKYelX1pKhK0yIfY1vyAgvryR4WeEqOfV1fK4dXF60o4ODU/8qmK01
         Y/E187SOV1rgJbSz7RfZd7GHwmF/Cf1q2aqPZnCRdHwhKEwk+uaqBK5lf/7zp0aPG1
         AbBjRi44jzdzxcLBz6u5PkWxRub0+CTnPg7VKcio1TRTA/7tV5Fv0okzLYffH+R8HC
         0n4imCKraTr4Q==
References: <9e137548c4e76e0d8deef6d49460cb37897934ca.1682333574.git.baruch@tkos.co.il>
User-agent: mu4e 1.9.21; emacs 28.2
From:   Baruch Siach <baruch@tkos.co.il>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] docs: dt: fix documented Primecell compatible
 string
Date:   Tue, 25 Apr 2023 11:31:15 +0300
In-reply-to: <9e137548c4e76e0d8deef6d49460cb37897934ca.1682333574.git.baruch@tkos.co.il>
Message-ID: <878regbbr7.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Rob, Krzysztof,

On Mon, Apr 24 2023, Baruch Siach wrote:
> Only arm,primecell is documented as compatible string for Primecell
> peripherals. Current code agrees with that.

Once again my patches do not show up in patchwork. But they do show in
lore:

  https://lore.kernel.org/linux-devicetree/9e137548c4e76e0d8deef6d49460cb37897934ca.1682333574.git.baruch@tkos.co.il/

FYI,
baruch

> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> v2:
>
>   Split the translation update to a separate patch
> ---
>  Documentation/devicetree/usage-model.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/usage-model.rst b/Documentation/devicetree/usage-model.rst
> index b6a287955ee5..0717426856b2 100644
> --- a/Documentation/devicetree/usage-model.rst
> +++ b/Documentation/devicetree/usage-model.rst
> @@ -415,6 +415,6 @@ When using the DT, this creates problems for of_platform_populate()
>  because it must decide whether to register each node as either a
>  platform_device or an amba_device.  This unfortunately complicates the
>  device creation model a little bit, but the solution turns out not to
> -be too invasive.  If a node is compatible with "arm,amba-primecell", then
> +be too invasive.  If a node is compatible with "arm,primecell", then
>  of_platform_populate() will register it as an amba_device instead of a
>  platform_device.

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
