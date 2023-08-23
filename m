Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B6E6EE49AB
	for <linux-doc@archiver.kernel.org>; Wed, 23 Aug 2023 07:39:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233482AbjHWHjO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Aug 2023 03:39:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233245AbjHWHjN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Aug 2023 03:39:13 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEAC7E7F;
        Wed, 23 Aug 2023 00:38:42 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fed963273cso26665255e9.1;
        Wed, 23 Aug 2023 00:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692776317; x=1693381117;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pESS9OyXd4b4MwXA7MmwtxF+VqbMh78IBFirX8/MdPM=;
        b=qzpATMFb5mJ7QuY/P1GXrob5daj4MU7R3Khsp1ZjJL0KLvPrmy6l4aEQlO4/mUYNCo
         XCyxuGrnb7gu3iHGCdVnAhyiGjB/vY/t3z6ZdFhnjQ8RlAmTVV815TQ90P23Kp7x7K7e
         kYqbXceIhT3g3Oj1bw1PxkQR0qGm16Je/yjvR2iQ8GcSJoxknaP1i683sfYCxjxnom7D
         ySmmll+V3FsjF9Hk8dpid30jpL9jeJeRviyAfI8iYxiTKiUyTa1JF12vMgqS85eCYIp4
         b8itKDWZFVmANZmYg5Y6brLCsi0tnTNCuAo8yGkr8T5E8M2Lh4xmtpIv8aFhijClxeoq
         26EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692776317; x=1693381117;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pESS9OyXd4b4MwXA7MmwtxF+VqbMh78IBFirX8/MdPM=;
        b=HcNlP4mD+2K79clLt62VUPyGRgst0aNw7iKEGoj5to1kwC4zrn1NMQAMeql/jO3aCL
         rW5GNWQu8GF4Tf5WcyEwBRM/HUZ7Qr8km8MTby+/YI2VDN2utvISpLid02gUB2xaT2pp
         eFKq4oVKbf2GjJ+7etiTLhhXwL//0DwgLRopQdFesyAKFDworQ7P74fA7RGr5a6bYuoM
         2DkNmkDVejKONZ84tZH19iuqDRjDUiV5/ZBNsiScDObPq9Ze7XQ3gFaB7RzjTF//EY19
         eg0qZxS3QlcIJ+xgzcRO0XsiI5PaoPkQl1MuWi8o786DrTYqxSizZ6Hm1nlOF5nK9n+D
         6KLQ==
X-Gm-Message-State: AOJu0YwlTARgkcghC/W18J/BMAU7Mb96lS4Ed8bzB7/W1G0U1Gkbr+gH
        XJ7D1VJsl0OKThXyFqYScnk=
X-Google-Smtp-Source: AGHT+IEzljQwkrTc75QvlauFjhCv2bOoxK9oGDYKLDmc20p7cRlVbWWuxUP1pTgDMB97r1C8fdJ5Nw==
X-Received: by 2002:adf:f9c4:0:b0:319:7abb:4112 with SMTP id w4-20020adff9c4000000b003197abb4112mr9977755wrr.21.1692776316668;
        Wed, 23 Aug 2023 00:38:36 -0700 (PDT)
Received: from imac ([2a02:8010:60a0:0:e4cf:1132:7b40:4262])
        by smtp.gmail.com with ESMTPSA id q13-20020adffecd000000b00317643a93f4sm17924234wrs.96.2023.08.23.00.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 00:38:35 -0700 (PDT)
From:   Donald Hunter <donald.hunter@gmail.com>
To:     netdev@vger.kernel.org
Cc:     Jakub Kicinski <kuba@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Stanislav Fomichev <sdf@google.com>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        donald.hunter@redhat.com
Subject: Re: [PATCH net-next v3 07/12] tools/net/ynl: Add support for
 netlink-raw families
In-Reply-To: <20230822194304.87488-8-donald.hunter@gmail.com> (Donald Hunter's
        message of "Tue, 22 Aug 2023 20:42:59 +0100")
Date:   Wed, 23 Aug 2023 08:29:39 +0100
Message-ID: <m2v8d6gqsc.fsf@gmail.com>
References: <20230822194304.87488-1-donald.hunter@gmail.com>
        <20230822194304.87488-8-donald.hunter@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Donald Hunter <donald.hunter@gmail.com> writes:
>
> -    def handle_ntf(self, nl_msg, genl_msg):
> +    def handle_ntf(self, decoded):
>          msg = dict()
>          if self.include_raw:
> -            msg['nlmsg'] = nl_msg
> -            msg['genlmsg'] = genl_msg
> -        op = self.rsp_by_value[genl_msg.genl_cmd]
> +            msg['raw'] = decoded
> +        op = self.rsp_by_value[decoded.cmd()]
> +        attrs = self._decode(decoded.raw_attrs, op.attr_set.name)
> +        if op.fixed_header:
> +            attrs.update(self._decode_fixed_header(gm, op.fixed_header))

There's a mistake here, 'gm' should be 'decoded'. I'll fix in a v4.

> +
>          msg['name'] = op['name']
> -        msg['msg'] = self._decode(genl_msg.raw_attrs, op.attr_set.name)
> +        msg['msg'] = attrs
>          self.async_msg_queue.append(msg)
