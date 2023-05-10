Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95531C77B7D
	for <linux-doc@archiver.kernel.org>; Wed, 10 May 2023 08:29:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236168AbjEJI3h (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 10 May 2023 04:29:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236548AbjEJI3b (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 May 2023 04:29:31 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60F517AA7;
        Wed, 10 May 2023 01:29:08 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-64115e652eeso48554818b3a.0;
        Wed, 10 May 2023 01:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683707347; x=1686299347;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z8RwRIsfRADOKmrmxPkNV2fLHwpgOdBlB311q+5skVQ=;
        b=jEOcMdkwiWfkDoBrNqA4na8Gdr2MZN3tgMBfXMcXf010KyfCNmgKjfaOebiEpVClxJ
         ujbM3w3bQhCMdH6HnyPlpireLhs+egi5d1aPTyne0LPbHzbhAIziblvsuCdBpHq7B/j3
         BOK3w+nFqnN4tQXBJbDR6VvFpCRf+wEECIkI0OnkkDBOpzacpqfZA8qkIMawg3nOl+1/
         1txIGxtAxFPKqUOWQSH+GVdTSQRC49wUczjaKcjQHrIcoBJDjrMEFDCtlIj8lhyNSQ1o
         iXh5LBk7b7nvIh5kZICoHkjHIFAY9ApCJhj8yNBkewT/zREhY2lIrSTXeXezTce48sIi
         VJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683707347; x=1686299347;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z8RwRIsfRADOKmrmxPkNV2fLHwpgOdBlB311q+5skVQ=;
        b=FzQiUCHr7uNozxP3X1DN6g8s0x3oA+VBkEGKHMT07Tm9YnXL6bberzR1l6qwBO8VNz
         XM1g1bmI6EDSeeqcIDx8th8VSNVDfY6fv8zBb8x2DzxRMoj1H5JVULWGl8xB7n7kq5Yj
         EKbIAOLBS8TLbv6jn51btq047NJ/6dMGejgCPNnxF5YzQAddazmkw+MGqvcBC0odVkEt
         XOLfQKcxt17G9vjM1VmNTRIpjztO9RmL5mCsJG2sRcG4K++4CqkiHMA06MC1ea2DKG9N
         1ZQnvfnK2k6P45ZQCEQG3cDI0g0wI8vzzNG+yXCU1Um9JaU2yjMVj4hp5bYbpyrzENrq
         aEnQ==
X-Gm-Message-State: AC+VfDyge5kwaM8FItCZMVbtcImOsPT6WWE3Fa9YPw/BiF1eAyKcrtMP
        sAv5KPgi/Y28FRLmsniL0lk=
X-Google-Smtp-Source: ACHHUZ7OM6Sh+tRD+ZbCT6Ey8cEjtr57bo8TKktmhcIpJrEfJdtW9peJDIQ795tG2Ehlh4lyOtZZhQ==
X-Received: by 2002:a05:6a00:1a49:b0:646:24c6:5f9e with SMTP id h9-20020a056a001a4900b0064624c65f9emr10532448pfv.16.1683707347594;
        Wed, 10 May 2023 01:29:07 -0700 (PDT)
Received: from [192.168.43.80] (subs03-180-214-233-68.three.co.id. [180.214.233.68])
        by smtp.gmail.com with ESMTPSA id r19-20020a62e413000000b0063799398eb9sm3054243pfh.58.2023.05.10.01.29.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 01:29:07 -0700 (PDT)
Message-ID: <334e9041-5121-3dc7-9ddd-4ce33585fec6@gmail.com>
Date:   Wed, 10 May 2023 15:29:03 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] docs: networking: fix x25-iface.rst heading & index order
Content-Language: en-US
To:     Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Martin Schiller <ms@dev.tdt.de>, linux-x25@vger.kernel.org
References: <20230510022914.2230-1-rdunlap@infradead.org>
From:   Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20230510022914.2230-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 5/10/23 09:29, Randy Dunlap wrote:
> -============================-
>  X.25 Device Driver Interface
> -============================-
> +============================
>  

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

-- 
An old man doll... just what I always wanted! - Clara

