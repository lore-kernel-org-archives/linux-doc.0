Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 851D1C19F2A
	for <linux-doc@archiver.kernel.org>; Thu, 11 Aug 2022 20:17:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234698AbiHKURm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 11 Aug 2022 16:17:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229594AbiHKURm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 Aug 2022 16:17:42 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2EA69DB45;
        Thu, 11 Aug 2022 13:17:40 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id gb36so35341129ejc.10;
        Thu, 11 Aug 2022 13:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc;
        bh=lKQbVu6OeEILzPaVQ6saPWQ+P6yTH8efIb+CZ4tS2WI=;
        b=MXxzuk6Yi2USJbmoA9BKj8H8g+qbvHJCyhKbKtNAnv1KylBj0+clMG5tKcbkC4GHti
         REiLWyomp9+Ru31bhg8uEILpoFadBQDge8iRXK5XA9QNCUSJe67uzOU8F9tGBv6Gt3II
         gZOBGwOrfsqSyyNkDalCqzISop8aJIsTRxHx3IXVAbnak2q5ho/0ltG73WFqwOY1R4wy
         IP0Z2cTz5wXOfA0/MVUqG5N1Cbq0GRXZS5zFDK9lMSYfkR4UWCYk1kbxhmBBASGRHfTu
         wqYUDa9FaQI8IqnJNxockCHsIkUBiAJTr4f7P4j8x83okf3kFhw8MLlqTARVdn6USCpI
         /waQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc;
        bh=lKQbVu6OeEILzPaVQ6saPWQ+P6yTH8efIb+CZ4tS2WI=;
        b=I7U4lBLF3nT0ayKdXrzAJo0SWp4ogh6l961pm9UjwTw3LX3DbuPRnkBZmMxPkPcCRP
         Rv4oo0N8Ho6MGz2L59DOeapJlu8J5JxRja5hoDGWknj1Y4KUur+f+pIm3wxRfssPIUHu
         dik5SWxJ5ktA52Qo1RIpRGng9hVJdUhfFdCfMt3mhyGNK31cWP6XphcnvCM87ZRgvGmV
         wdz1xCO/RCmDaCdWCxlX3/pDFOuPeDDEDT2x7Pui8iOQsjPxiBnHH487BYdYR7ag/67H
         1Jya0NRfXsDaqKDwM4NoIeX8B+Rq23LGZnXVjO8XUej9qP+Tn7KE4tGpyZg5xpDsLOlo
         ugwg==
X-Gm-Message-State: ACgBeo3CvtHq+RALGS2YUbrU/mztdswOACb96RlNXBnWhNRiQchh5bMR
        m1yU31TdAX5EIys2rcSEw5TVPS4Yn00=
X-Google-Smtp-Source: AA6agR6GTH8ApBhEbqyORGJBBeFbD+iR4V2uJfd/JvPyobCPfwXTGjhn5w3IoW1/jtBanjvrgq1lLw==
X-Received: by 2002:a17:907:97cd:b0:731:5d0:4434 with SMTP id js13-20020a17090797cd00b0073105d04434mr440823ejc.603.1660249059352;
        Thu, 11 Aug 2022 13:17:39 -0700 (PDT)
Received: from [192.168.1.122] (cpc159313-cmbg20-2-0-cust161.5-4.cable.virginm.net. [82.0.78.162])
        by smtp.gmail.com with ESMTPSA id f1-20020a1709067f8100b007310a9a65cbsm56164ejr.16.2022.08.11.13.17.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Aug 2022 13:17:38 -0700 (PDT)
Subject: Re: [RFC net-next 1/4] ynl: add intro docs for the concept
To:     Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
        davem@davemloft.net, edumazet@google.com, pabeni@redhat.com
Cc:     sdf@google.com, jacob.e.keller@intel.com, vadfed@fb.com,
        johannes@sipsolutions.net, jiri@resnulli.us, dsahern@kernel.org,
        stephen@networkplumber.org, fw@strlen.de, linux-doc@vger.kernel.org
References: <20220811022304.583300-1-kuba@kernel.org>
 <20220811022304.583300-2-kuba@kernel.org>
From:   Edward Cree <ecree.xilinx@gmail.com>
Message-ID: <999354bc-4e79-73fc-e195-9b8d17b3d3b5@gmail.com>
Date:   Thu, 11 Aug 2022 21:17:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220811022304.583300-2-kuba@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/08/2022 03:23, Jakub Kicinski wrote:
> Short overview of the sections. I presume most people will start
> by copy'n'pasting existing schemas rather than studying the docs,
> but FWIW...
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
[...]
> +Operations describe the most common request - response communication. User
> +sends a request and kernel replies. Each operation may contain any combination
> +of the two modes familiar to netlink users - ``do`` and ``dump``.
> +``do`` and ``dump`` in turn contain a combination of ``request`` and ``response``
> +properties. If no explicit message with attributes is passed in a given
> +direction (e.g. a ``dump`` which doesn't not accept filter, or a ``do``

Double negative.  I think you just meant "doesn't accept filter" here?
-ed
