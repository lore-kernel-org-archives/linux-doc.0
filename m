Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6CEFC7D071
	for <lwn-linux-doc@archive.lwn.net>; Wed, 25 Jul 2018 09:29:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728222AbeGYKkD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 25 Jul 2018 06:40:03 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37518 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728649AbeGYKkD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Jul 2018 06:40:03 -0400
Received: by mail-lj1-f194.google.com with SMTP id v9-v6so6070391ljk.4
        for <linux-doc@vger.kernel.org>; Wed, 25 Jul 2018 02:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=me9fM+mmxyRJ6Ojgqt6pQB6EEtcm3+xP9T9w3oeLyzc=;
        b=deSWtuG8AtHBs3AeUFKChm0Fu1SA9moEe9eO2ldewd7s4EVu7GVRpozLFbrRLvY7jP
         TRmRLtiwTfuQ1qmc/m8N2qMNYpGwaB7xAtu08pX5RoIEpyNdshDlpYJazfywCJld+Z1s
         LKLzc59Qo8RRdlvHqDcJKK38a1ZHaSls2CwjMQwTzLl0Rs/ZUIH2homyv3IzDZDoEbIQ
         JS5c6RRvE5VEIOq07AC88IqWmiA4u1wU8PnL83N6BQYcSsWLNtOerQlI49esqQXWtY4f
         LpAcqF8yk2vNsDrOcJf7J08QNg8Bs4MK/v7/znyvwI88cmpuGQaciFQ+MR4vORwhY+lw
         I5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=me9fM+mmxyRJ6Ojgqt6pQB6EEtcm3+xP9T9w3oeLyzc=;
        b=WQ3dbDXgntRiTTqb9hX4HGC+s5AsbjgeQcIxXwCKVvF9gZuFcggqUSNioba8kfnfeo
         EZewFjizu5Y8PO3cL34X4vara21Z9qWU7ZhtDSdxlKKddVD8HiCZqPgIewKLfHPNQvT3
         4Q5jRjsNJ0VmaZnFsBYTt9QuE6FZxAUcYtBePqrPSYAyWLMs/ngaUAuR41UK42Erv9UP
         h8VD6y8vuqUeTeYkRAXfaXT82eLYx0CYsztsGV5gO6wvjFHL4X5FkmxGPot9Y6QtSJQG
         FxSHDT2dT//C5u1q/Slsu1/Ayz47XQgoGSQ8JwIxLF9jvQfwiItEa6qQG0yoTkeRAXfS
         xOag==
X-Gm-Message-State: AOUpUlGy7uQCmG75uV0vkwdEwci7HmOX0rcCojToPAhN/5ZWZ3gabFab
        joaF8u3V1KQyhSEV/eNg2xTGAQ==
X-Google-Smtp-Source: AAOMgpfncEKunmP6XkBZ593ZGec10pNNyuxeGQPl3NXvoBat6zJBtujP01C2KPDNNq40cuyTqTx4DA==
X-Received: by 2002:a2e:4186:: with SMTP id d6-v6mr14319831ljf.36.1532510951879;
        Wed, 25 Jul 2018 02:29:11 -0700 (PDT)
Received: from [192.168.0.126] ([31.173.87.217])
        by smtp.gmail.com with ESMTPSA id m8-v6sm2710895ljj.10.2018.07.25.02.29.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Jul 2018 02:29:11 -0700 (PDT)
Subject: Re: [PATCH 1/4] docs: bpf: Rename README.rst to index.rst
To:     "Tobin C. Harding" <me@tobin.cc>, Jonathan Corbet <corbet@lwn.net>
Cc:     Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        linux-doc@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20180725022926.8993-1-me@tobin.cc>
 <20180725022926.8993-2-me@tobin.cc>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <0141716c-e909-1429-68fe-6da71d4c6677@cogentembedded.com>
Date:   Wed, 25 Jul 2018 12:29:10 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180725022926.8993-2-me@tobin.cc>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello!

On 7/25/2018 5:29 AM, Tobin C. Harding wrote:

> Recently bpf/ docs were converted to us RST format.  'README.rst' was

    s/us/use/?

> created but in order to fit in with the Sphinx build system this file
> should be named 'index.rst'.  Rename file, fixes to integrate into Sphinx
> build system in following patches.
> 
> docs: Rename Documentation/bpf/README.rst to Documentation/bpf/index.rst
> 
> Signed-off-by: Tobin C. Harding <me@tobin.cc>
[...]

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
