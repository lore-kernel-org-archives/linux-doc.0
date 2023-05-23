Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E87C77B73
	for <linux-doc@archiver.kernel.org>; Tue, 23 May 2023 02:37:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232034AbjEWChX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 22 May 2023 22:37:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231439AbjEWChW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 May 2023 22:37:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC0A6CA
        for <linux-doc@vger.kernel.org>; Mon, 22 May 2023 19:37:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 114C762DF3
        for <linux-doc@vger.kernel.org>; Tue, 23 May 2023 02:37:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19EB8C433EF;
        Tue, 23 May 2023 02:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684809440;
        bh=YYKgfA7xzXLoN7jgNkC4rzFMCjcfOM5/xr1lm3h3DrE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=t67NHQOMPjAPtQk3Xt4OKMQ/AnTUdyRR9JLFl2yI3JGs/598A6IyzOkXfKUBbmiQU
         H2whKOBeWIdeW8v+pcRKCd1nYg44v3dSfxRRfmqUDHBsYPucGp5PoSEUzdZaa/i3HJ
         SP8ExTWvcJEVJPAwfJyXtBXljpYXJ9I2EN8R61l50vGqp53BrKyZYnhSed+79dvubb
         QlcSIChp/EhZ3y91EBcNq8mx80hyRsP9ZQwNMsnZE/1nKQOjtEySBxK0wctSfDWq4s
         DWkhETe2A9CY3M1bojBZLRmCEdJYQo7cQ2SjptO0HdnetbIVgN4d7k7TikXwLVeXbO
         /sd/woUuC8eKQ==
Date:   Mon, 22 May 2023 19:37:19 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Donald Hunter <donald.hunter@gmail.com>
Cc:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        donald.hunter@redhat.com
Subject: Re: [patch net-next v1 1/2] tools: ynl: Use dict of predefined
 Structs to decode scalar types
Message-ID: <20230522193719.1428a3bf@kernel.org>
In-Reply-To: <20230521170733.13151-2-donald.hunter@gmail.com>
References: <20230521170733.13151-1-donald.hunter@gmail.com>
        <20230521170733.13151-2-donald.hunter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 21 May 2023 18:07:32 +0100 Donald Hunter wrote:
> Use a dict of predefined Struct() objects to decode scalar types in native,
> big or little endian format. This removes the repetitive code for the
> scalar variants and ensures all the signed variants are supported.

> @@ -115,17 +116,17 @@ class NlAttr:
>          return self.raw
>  
>      def as_c_array(self, type):
> -        format, _ = self.type_formats[type]
> -        return list({ x[0] for x in struct.iter_unpack(format, self.raw) })
> +        format = self.get_format(type)
> +        return list({ x[0] for x in format.iter_unpack(self.raw) })

I probably asked about this before, and maybe not the question 
for this series but - why list({ ... }) and not [...]?

>          else:
> -            raise Exception(f'Unknown type at {space} {name} {value} {attr["type"]}')
> +            try:
> +                format = NlAttr.get_format(attr['type'], attr.byte_order)
> +                attr_payload = format.pack(int(value))
> +            except:
> +                raise Exception(f'Unknown type at {space} {name} {value} {attr["type"]}')

Could we do:

	elif attr["type"] in NlAttr.type_formats:

instead? Maybe my C brain treats exceptions as too exceptional..

> +            elif attr_spec["type"]:
> +                try:
> +                    decoded = attr.as_scalar(attr_spec['type'], attr_spec.byte_order)
> +                except:
> +                    raise Exception(f'Unknown {attr_spec["type"]} with name {attr_spec["name"]}')

Same here.

Nice cleanup!
