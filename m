Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57917C76196
	for <linux-doc@archiver.kernel.org>; Tue, 28 Mar 2023 08:38:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbjC1Iiv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Mar 2023 04:38:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbjC1Iiu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Mar 2023 04:38:50 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C84D42D56;
        Tue, 28 Mar 2023 01:38:49 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id kc4so10939857plb.10;
        Tue, 28 Mar 2023 01:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679992729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ek4wwWcw4/B0a6zXzV51G3MRMlsrfWVAEVpyRGfV3lI=;
        b=UtA+nZmVoGiio2bZg/lji5B6rvaxqnprehkzxkOOibnCOvwSJIE642RvOvu+e71xie
         86uzd+EpRaWVDCtIBsdUSPXwTdJLGHChr3qM1lB9n7HyhDd9v7tTOi4eq+IYlkC9HaUV
         R0BLxchxkWtNDIqURx0AKV4Jhmf5Qix+DBKJOKPIn08feJYcwaI1lw2Z9C9j+Hvp7Gsa
         kzJEyCWfyU6MvyQtAgWZqlcxXMUhHqm0hHCHfcMtDACvUxDAlWSkPGn8yi4EbBE4Iceq
         XPrF7WxmYh0TY7EHLdIDJZNdYGCdQeKTnLKFyE7jnYvyVHDou42V9FaKwVr5JnzupUU9
         QNaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679992729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ek4wwWcw4/B0a6zXzV51G3MRMlsrfWVAEVpyRGfV3lI=;
        b=QnCkouQuC+Waomm8xyUHWgez3fNhBj6XyWyUAVSAfzBagHygVoomA8fjQJBiCBEVNJ
         4XtaT0DazQgsJ5xOdDWHgrSCZZv6fGkXoJflvSYq1IXYW8vGbhPmEeITCxXhPZtE0pnl
         YDXv6yFuzSZ0C1tj3ccFCQSBr2UWfJsxBQroUcvfTAc+lZGMjzvPpYK3dCGK0drxPJ0t
         M6qCQs6hmLCpt9pGWkWRq6PL3wrXKASi7M9ZHkQiysfwvrTQ4ofsreFv57zEz/pWTNrY
         uXSOXacaOXcPNRDT72uU3RCFZIkptoErPbpKgNMhPLl8rtknkl6SoH5f4+/DCjKUEWmo
         IRTQ==
X-Gm-Message-State: AAQBX9cdCz68POHbG1lX158JcpqR48JwX88SnMg/RZ6CVmFBmWXb1O6i
        7O8h+YrMR6fqWLPScWoDXrcyjcS2HvU=
X-Google-Smtp-Source: AKy350ZnGEQ+5E3+SPiIDZ4cWS2uSdx4He3At9d9x32kn/po3nwmR/BfBSPGkJRsUiyij9HDHFpqFw==
X-Received: by 2002:a17:903:2343:b0:1a1:ee8c:eef8 with SMTP id c3-20020a170903234300b001a1ee8ceef8mr18297671plh.2.1679992729260;
        Tue, 28 Mar 2023 01:38:49 -0700 (PDT)
Received: from [192.168.43.80] (subs32-116-206-28-54.three.co.id. [116.206.28.54])
        by smtp.gmail.com with ESMTPSA id l9-20020a170902d34900b001a064282b11sm20578064plk.151.2023.03.28.01.38.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 01:38:48 -0700 (PDT)
Message-ID: <355309ce-3b3b-9d1b-6b4e-5e867bba920a@gmail.com>
Date:   Tue, 28 Mar 2023 15:38:44 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH net-next v5 6/7] docs: netlink: document struct support
 for genetlink-legacy
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     corbet@lwn.net, davem@davemloft.net, donald.hunter@gmail.com,
        donald.hunter@redhat.com, edumazet@google.com, kuba@kernel.org,
        linux-doc@vger.kernel.org, netdev@vger.kernel.org,
        pabeni@redhat.com
References: <ZCGPy+90DsRpsicj@debian.me>
 <a1d0d61c-d6e9-aee6-fe67-e35f42b76a04@gmail.com>
Content-Language: en-US
From:   Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <a1d0d61c-d6e9-aee6-fe67-e35f42b76a04@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 3/27/23 21:39, Akira Yokosawa wrote:
>> Nit: The indentation for code-block codes should be relative to
>> code-block:: declaration (e.g. if it starts from column 4, the first
>> column of code is also at 4).
> 
> Hey Bagas,
> 
> I don't believe there is any such restriction. :-\
> Where did you find it ?
> 

This current doc renders well (no warnings), but personally I found
that aligning codes in the code-block:: is aesthetically better
in my eyes (I expect the leading spaces as margin).

-- 
An old man doll... just what I always wanted! - Clara

