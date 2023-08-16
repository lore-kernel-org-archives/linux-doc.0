Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6325CC001E0
	for <linux-doc@archiver.kernel.org>; Wed, 16 Aug 2023 15:21:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232640AbjHPPVK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Aug 2023 11:21:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343621AbjHPPUe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Aug 2023 11:20:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D28710C7
        for <linux-doc@vger.kernel.org>; Wed, 16 Aug 2023 08:20:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 03BA5619C8
        for <linux-doc@vger.kernel.org>; Wed, 16 Aug 2023 15:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5A89C433C8;
        Wed, 16 Aug 2023 15:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692199232;
        bh=nPgnGrW/AxW3ysL0uPT98hzgOeH7Jh7J3p6l1H8f+cE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=I2/cVds/sLrUcBV6oXoKyVsbwyFYgwnD1FaAqXQcZLZbEazUHVpOLS2rjR0RNQVIj
         +z7Bn8autQV9OBnS+7akDHxk4s2pLV3QzBQLgVCVLm5RC0Rs1zQ7mqsncIPQhPgTyx
         MNlXeB0X/qdv7cfQuHcYocuENj+Q+vrnAE8ele6v33o/KIU/trOW/qL7HqXs6l6uHW
         gvoVYJ4SKJqfO15j4Xve4dPMnuJelI/IC9J6zvsFJ8WiP65BwfW/+JJ20nMv4auIuY
         a0rZDuyr8pakpGR09kToYQjEVaPqTvNWu+khiDjv4RI+e4RU5S2BV+/Kj8f2nla1OZ
         xFgsEItOgHzcw==
Date:   Wed, 16 Aug 2023 08:20:30 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Donald Hunter <donald.hunter@gmail.com>
Cc:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Stanislav Fomichev <sdf@google.com>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        donald.hunter@redhat.com
Subject: Re: [PATCH net-next v2 05/10] tools/net/ynl: Refactor
 decode_fixed_header into NlMsg
Message-ID: <20230816082030.5c716f37@kernel.org>
In-Reply-To: <20230815194254.89570-6-donald.hunter@gmail.com>
References: <20230815194254.89570-1-donald.hunter@gmail.com>
        <20230815194254.89570-6-donald.hunter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 15 Aug 2023 20:42:49 +0100 Donald Hunter wrote:
> +    def __init__(self, nl_msg, ynl=None):
> +        self.genl_cmd, self.genl_version, _ = struct.unpack_from("BBH", nl_msg.raw, 0)
> +        nl_msg.raw = nl_msg.raw[4:]

It's a bit of a layering violation that we are futzing with the raw
member of NlMsg inside GenlMsg, no?

Should we add "fixed hdrs len" argument to NlMsg? Either directly or
pass ynl and let get the expected len from ynl? That way NlMsg can
split itself into hdr, userhdrs and attrs without GenlMsg "fixing it
up"?

> -        self.hdr = nl_msg.raw[0:4]
> -        offset = 4
> -
> -        self.genl_cmd, self.genl_version, _ = struct.unpack("BBH", self.hdr)
> -
> -        self.fixed_header_attrs = dict()
> -        for m in fixed_header_members:
> -            format = NlAttr.get_format(m.type, m.byte_order)
> -            decoded = format.unpack_from(nl_msg.raw, offset)
> -            offset += format.size
> -            self.fixed_header_attrs[m.name] = decoded[0]
> +        if ynl:
> +            op = ynl.rsp_by_value[self.genl_cmd]
> +            if op.fixed_header:
> +                nl_msg.decode_fixed_header(ynl, op.fixed_header)
>  
> -        self.raw = nl_msg.raw[offset:]
> +        self.raw = nl_msg.raw
