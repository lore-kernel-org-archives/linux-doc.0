Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E15C7EE23
	for <linux-doc@archiver.kernel.org>; Sat, 13 May 2023 09:13:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236972AbjEMJN1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 13 May 2023 05:13:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231225AbjEMJN0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 13 May 2023 05:13:26 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE07630F1
        for <linux-doc@vger.kernel.org>; Sat, 13 May 2023 02:13:24 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-965cc5170bdso1641847566b.2
        for <linux-doc@vger.kernel.org>; Sat, 13 May 2023 02:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683969203; x=1686561203;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SXTHGE0Wl3MaP4uQCGWbuj/wOoT4T39v9HX0v0hxJf8=;
        b=C44D9GW14rmvbs7slqJlRtWSEfFd9m39+QRGn2224B3WZhCy2QWUpTUK/lBtbqxYIC
         iUZQ60xpLSaDuao6yvw1CKoebvNp5k0jXXOp31Cs/rcab+fomOK7Dk6edkGti7pS6h+U
         rMh8qN+jlW0Z9aHfGw0ktcUVqK6KcDablHWy99+cx3sDFD5Z1s1T65/72xMgqVojPav0
         lTahVG0K+dus6WDboiXKl0DVjo1Z9ClI2zt5MtjQNUtg5p7hRSVHulltwjriTq38DGNf
         FIRLNAwqnCRlpjEFLRCHqORBLnDV/PpYOQ1XptPRFE2BB+waXZUF/XUb3ew1gETvNgyn
         7EXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683969203; x=1686561203;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SXTHGE0Wl3MaP4uQCGWbuj/wOoT4T39v9HX0v0hxJf8=;
        b=cB1ZQtOUhY4snDpCsA8mq6bYI33llFMleDfZ5jcQDEJMoTazwP69E2d/ptbpXjyvjg
         YCQQXBksaAB3OSi7h89nPUr5+Tx0RAy0Gu2JSHPQDmWV4n8iXeBuLR/4FebJWWhYN1PE
         dd3zVLQKXOTEbNDjxZGjduZY5nZ8pY7UbGQKUYDp73dk6A0uJg7oznSQlTExrXmeC18S
         ry7V8wGkZ7cPwMsZ3FtGixX6KnukVCFoGzLDA6k0fdVD0A3S0HbYkEE+uqDXt/nYGE31
         AybDX8IVl0DslLEyrpPSK9IK1Xaz2StYYei+HGnzcOGmEJ3XMEgWXYVDApODqII1I4G2
         W+Ag==
X-Gm-Message-State: AC+VfDzT3IhzVxekUi1Po68o1w4pwEVgOJHLqAYwbzn7QHMzUzfjCP05
        DFrKQp173FiV7RHQF1ap7py9hA==
X-Google-Smtp-Source: ACHHUZ7jtwC+5aOEbgSa4I23nZNu1ofmb71WzoHsdxR68vtuGufCicwFl3Sq/PA8VrfW+/qE2RKTQw==
X-Received: by 2002:a17:907:9608:b0:969:e95e:e4f3 with SMTP id gb8-20020a170907960800b00969e95ee4f3mr17483776ejc.55.1683969203257;
        Sat, 13 May 2023 02:13:23 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:1d0:810a:586c:c5ba? ([2a02:810d:15c0:828:1d0:810a:586c:c5ba])
        by smtp.gmail.com with ESMTPSA id ib10-20020a1709072c6a00b009531d9efcc4sm6538708ejc.133.2023.05.13.02.13.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 May 2023 02:13:22 -0700 (PDT)
Message-ID: <65cf0de4-42b9-2b25-ac16-9e2ddfcfdb93@linaro.org>
Date:   Sat, 13 May 2023 11:13:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] docs: submitting-patches: Discuss interleaved replies
To:     Kees Cook <keescook@chromium.org>, Jonathan Corbet <corbet@lwn.net>
Cc:     Thorsten Leemhuis <linux@leemhuis.info>,
        Rong Tao <rtoax@foxmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Zhangfei Gao <zhangfei.gao@foxmail.com>,
        linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tyler Hicks <code@tyhicks.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jiri Kosina <jikos@kernel.org>,
        Matthieu Baerts <matthieu.baerts@tessares.net>,
        Xujun Leng <lengxujun2007@126.com>,
        linux-kernel@vger.kernel.org
References: <20230511184131.gonna.399-kees@kernel.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230511184131.gonna.399-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/05/2023 20:41, Kees Cook wrote:
> Top-posting has been strongly discouraged in Linux development, but this
> was actually not written anywhere in the common documentation about
> sending patches and replying to reviews. Add a section about trimming
> and interleaved replies.
> 
> Cc: Jonathan Corbet <corbet@lwn.net>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

