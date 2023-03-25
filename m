Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D820C6FD1C
	for <linux-doc@archiver.kernel.org>; Sat, 25 Mar 2023 03:42:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbjCYDmq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 24 Mar 2023 23:42:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjCYDmp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Mar 2023 23:42:45 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8144EEC73;
        Fri, 24 Mar 2023 20:42:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 14AE7B82639;
        Sat, 25 Mar 2023 03:42:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F7D9C433EF;
        Sat, 25 Mar 2023 03:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679715761;
        bh=w1HMk9XloU7GWNDvy95EffIX1lx6+f+8rKUIJQwndDA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=kChmuXH/7D6a3V89rgR728ioUafLdSlTxL1QqWZd+NzOnTQQFnkOeuQx5GNEnMpHg
         KHbLtRo8SMEUxghM7egtEKDZfkBOeF61wljrU3S774Zp0COJk9ouWowHzFl0t+Sp87
         0E78UF49hrEy7OY1LuWTMWMcUp1wBpZ4qrcw4qaBw8qG69EprmlIX94CTc5hdYgwms
         0c5E0Wxfll8PEJqhkdNUYld+h9RVJpSSFVZQ9rh02FOn82Aaylbic00wxXDoeHF3/q
         CbtXzswpFzSGyXSh2shCQQnJO7tojpzEyctwdkkN+S+H4Py1aK4+jcymK/bp2l9hqI
         vp8ARanzktPOw==
Date:   Fri, 24 Mar 2023 20:42:40 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Donald Hunter <donald.hunter@gmail.com>
Cc:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        donald.hunter@redhat.com
Subject: Re: [PATCH net-next v4 3/7] tools: ynl: Add struct attr decoding to
 ynl
Message-ID: <20230324204240.6accb0c2@kernel.org>
In-Reply-To: <20230324191900.21828-4-donald.hunter@gmail.com>
References: <20230324191900.21828-1-donald.hunter@gmail.com>
        <20230324191900.21828-4-donald.hunter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 24 Mar 2023 19:18:56 +0000 Donald Hunter wrote:
> diff --git a/tools/net/ynl/lib/ynl.py b/tools/net/ynl/lib/ynl.py
> index b635d147175c..af1d6d380035 100644
> --- a/tools/net/ynl/lib/ynl.py
> +++ b/tools/net/ynl/lib/ynl.py
> @@ -102,6 +102,16 @@ class NlAttr:
>          format, _ = self.type_formats[type]
>          return list({ x[0] for x in struct.iter_unpack(format, self.raw) })
>  
> +    def as_struct(self, members):
> +        value = dict()
> +        offset = 0
> +        for m in members:

Maybe add a TODO here for string and binary?

> +            format, size = self.type_formats[m.type]
> +            decoded = struct.unpack_from(format, self.raw, offset)
> +            offset += size
> +            value[m.name] = decoded[0]
> +        return value
> +
>      def __repr__(self):
>          return f"[type:{self.type} len:{self._len}] {self.raw}"
>  
> @@ -373,8 +383,11 @@ class YnlFamily(SpecFamily):
>          rsp[attr_spec['name']] = value
>  
>      def _decode_binary(self, attr, attr_spec):
> +        struct_name = attr_spec.get('struct')
>          sub_type = attr_spec.get('sub-type')

Could you add these as fields in class SpecAttr, like is_multi
and access the fields here instead of the get()s?

> -        if sub_type:
> +        if struct_name:
> +            decoded = attr.as_struct(self.consts[struct_name])
> +        elif sub_type:
>              decoded = attr.as_c_array(sub_type)
>          else:
>              decoded = attr.as_bin()
