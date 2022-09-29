Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B537FC07E9D
	for <linux-doc@archiver.kernel.org>; Thu, 29 Sep 2022 09:02:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235052AbiI2JC5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Sep 2022 05:02:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234996AbiI2JCz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Sep 2022 05:02:55 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B28913F2B9
        for <linux-doc@vger.kernel.org>; Thu, 29 Sep 2022 02:02:54 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id m4so1120280wrr.5
        for <linux-doc@vger.kernel.org>; Thu, 29 Sep 2022 02:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=DZmDQv8ShqZf7E/inJFJGxMUcsYwqScCUrRVgWR98nY=;
        b=XMRKHBD1fsH0SwtXOXbXgy4xlhe0PT50wqYvlMutjUHckwdv83t51kPNUH5ISbqk+K
         kRPyUu0S2cTfehNHmmkML7U37UvzIoBiac8jiJO/UpXS6qn83oBQlyDHyVL2gt3nng24
         rsS0T/jJgerjjUe2uejbHRRYI0j/SLSXKCNQK0KHtPRb+E3AjZrj+yJP1cpLUXckhOXl
         V0AXfuma/RDVIvIpkXzq55yeL7IEUZHhrcjsNqyZLAjPox0siVOpPE3NXoMTEwiWc4aO
         rtVGYQZijdYYtlR8lNyru2X0qj0L6aYvXv5w4iOgiACjvqrbFlRRSBLjBtIj8pLlMWqX
         k1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=DZmDQv8ShqZf7E/inJFJGxMUcsYwqScCUrRVgWR98nY=;
        b=cd2JvBRcB7de5tA7tkEAvmgnuZ59bw6xuOSE2I8hO2b8kAdzsHxB7rtPKWHQEniCOh
         Qus5lsleAAVg3k9XtblC4WGK+yYjBX+OyAmJeJ+UEO5v/XV11KPAOhTNeRdZ2TXJGpg/
         4OKc89cy9Lkenjt2aatTv8GbRoPuGpGmCtjmi0xEAmG/T7mrd71zOsFt3WuJVi5DsZKI
         Tv9ABS7q+RDHYVttDw9tuLA6WPw58yJKDyMc4BwQRRic+O+oEARb/1mBvtA6yGwkQwpS
         GBi1Uw5aiFCJyZMdAzHFNZkcEkqUZ5S7SBMjx6wsT9xgHLRJghXX0Y8LXBPoi41cfvzk
         YW+Q==
X-Gm-Message-State: ACrzQf3aUwNpoGIF2c9EnaKUNRLL2jIXDjOwUtxu7ZbAV4v0NPEEBEcD
        Q7x0924Ohti2zTAG65518uAknA==
X-Google-Smtp-Source: AMsMyM7w0ZxZawq0waECn8eu948HVrHSg3so7w5opKWFIVTeECdQIOM8OCtQHHVGy2+R0Fk/5p1DbQ==
X-Received: by 2002:a5d:59c3:0:b0:22a:4463:5a3a with SMTP id v3-20020a5d59c3000000b0022a44635a3amr1323371wry.123.1664442172642;
        Thu, 29 Sep 2022 02:02:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:b41:c160:c9dd:4896:ac7a:b9e1? ([2a01:e0a:b41:c160:c9dd:4896:ac7a:b9e1])
        by smtp.gmail.com with ESMTPSA id v11-20020a05600c444b00b003a682354f63sm4043540wmn.11.2022.09.29.02.02.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 02:02:51 -0700 (PDT)
Message-ID: <6c64b772-7b2b-77f8-4523-4408e0b3bf8a@6wind.com>
Date:   Thu, 29 Sep 2022 11:02:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net-next 4/6] netlink: add a proto specification for FOU
Content-Language: en-US
To:     Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc:     netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
        robh@kernel.org, johannes@sipsolutions.net, ecree.xilinx@gmail.com,
        stephen@networkplumber.org, sdf@google.com, f.fainelli@gmail.com,
        fw@strlen.de, linux-doc@vger.kernel.org, razor@blackwall.org,
        gnault@redhat.com
References: <20220929011122.1139374-1-kuba@kernel.org>
 <20220929011122.1139374-5-kuba@kernel.org>
From:   Nicolas Dichtel <nicolas.dichtel@6wind.com>
Organization: 6WIND
In-Reply-To: <20220929011122.1139374-5-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Le 29/09/2022 à 03:11, Jakub Kicinski a écrit :
> FOU has a reasonably modern Genetlink family. Add a spec.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  Documentation/netlink/specs/fou.yaml | 128 +++++++++++++++++++++++++++
>  1 file changed, 128 insertions(+)
>  create mode 100644 Documentation/netlink/specs/fou.yaml
> 
> diff --git a/Documentation/netlink/specs/fou.yaml b/Documentation/netlink/specs/fou.yaml
> new file mode 100644
> index 000000000000..266c386eedf3
> --- /dev/null
> +++ b/Documentation/netlink/specs/fou.yaml
> @@ -0,0 +1,128 @@
> +name: fou
> +
> +protocol: genetlink-legacy
> +
> +doc: |
> +  Foo-over-UDP.
> +
> +c-family-name: fou-genl-name
> +c-version-name: fou-genl-version
> +max-by-define: true
> +kernel-policy: global
> +
> +definitions:
> +  -
> +    type: enum
> +    name: encap_type
> +    name-prefix: fou-encap-
> +    enum-name:
> +    entries: [ unspec, direct, gue ]
> +
> +attribute-sets:
> +  -
> +    name: fou
> +    name-prefix: fou-attr-
> +    attributes:
> +      -
> +        name: unspec
> +        type: unused
The first attribute should always be unspec/unused. Maybe it could be
automatically generated?

> +      -
> +        name: port
> +        type: u16
> +        byte-order: big-endian
> +      -
> +        name: af
> +        type: u8
> +      -
> +        name: ipproto
> +        type: u8
> +      -
> +        name: type
> +        type: u8
> +      -
> +        name: remcsum_nopartial
> +        type: flag
> +      -
> +        name: local_v4
> +        type: u32
> +      -
> +        name: local_v6
> +        type: binary
> +        checks:
> +          min-len: 16
> +      -
> +        name: peer_v4
> +        type: u32
> +      -
> +        name: peer_v6
> +        type: binary
> +        checks:
> +          min-len: 16
> +      -
> +        name: peer_port
> +        type: u16
> +        byte-order: big-endian
> +      -
> +        name: ifindex
> +        type: s32
> +
> +operations:
> +  list:
> +    -
> +      name: unspec
> +      doc: unused

To what correspond this name?
It helps to name the generated operations array?
Something else than 'const struct genl_small_ops fou_ops[3]'?
