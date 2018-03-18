Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E33077E66E
	for <lwn-linux-doc@archive.lwn.net>; Sun, 18 Mar 2018 22:13:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754026AbeCRWNV (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 18 Mar 2018 18:13:21 -0400
Received: from mail-pl0-f67.google.com ([209.85.160.67]:40324 "EHLO
        mail-pl0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754417AbeCRWNT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 18 Mar 2018 18:13:19 -0400
Received: by mail-pl0-f67.google.com with SMTP id x4-v6so127609pln.7
        for <linux-doc@vger.kernel.org>; Sun, 18 Mar 2018 15:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UPZsdqQ90By7rkmGcBHJhYiR6yf9SXC5gqS8gJnkmXg=;
        b=TyOxmMsPAEfKi6/h9HlcNoSe/eNtzMeZ+TkxSpiwTJ1aqFBIDQJ6vFZyzqRLyqPyh+
         if4JGm31HGBeEHxKmaAqgM9n2GvhiAnam2bQTdXLOxJYGWKqBd7c+Uoa+jo0rLRn67TN
         6moIULRspbQFz8pru4C4/9cxs2jtXGtLZPIs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UPZsdqQ90By7rkmGcBHJhYiR6yf9SXC5gqS8gJnkmXg=;
        b=GRO8PmF5e/o8oyfoNxoXkKvB+CY4LTf/RYhHi7AGavq95mn9h1TZwslNv2/Q2zjzUP
         5XPPaQUF6X7/xSjGSEP6nzrdXb0SPC8nG3j4bUvE8UtV6DidKxT1MFxVZCNIbspH6qtO
         MqsuXQQqqQa6t9HKz1BK/j00QWlyKdL9KkWJmlKHZlroRf0c753T0IZkeyW3kuWEiSrV
         BlKycXwD/BXRwEAtXztnSQ3AC92GV3aQb3kJlclTx+ApYZr4n/VP81LgdoOag98ucJXr
         izTvW1TcXgVVXJFLeNhgy1/6m72vavnnVBfCeomk/2ek6ByGlrnUzuYfdAkSDo4zFMN5
         GNew==
X-Gm-Message-State: AElRT7G+1KQyiG9ECipZYf1pd9lSNi7a5oTXO50AHH1bq0OAQX1iR9x9
        aRg2tIAGRkzLYwEcxwrdosXKq30etiU=
X-Google-Smtp-Source: AG47ELtRQUtlD6j/ltIY+IqoWcWfVTDLvAnjRU1gdQkFHzMsTZhgunhE/izCerQNWpJ+Y/kLoEM9EA==
X-Received: by 2002:a17:902:8f96:: with SMTP id z22-v6mr10011123plo.169.1521411198616;
        Sun, 18 Mar 2018 15:13:18 -0700 (PDT)
Received: from [172.16.47.110] (165084180235.ctinets.com. [165.84.180.235])
        by smtp.googlemail.com with ESMTPSA id q13sm22662162pgr.52.2018.03.18.15.13.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 18 Mar 2018 15:13:17 -0700 (PDT)
Subject: Re: [PATCH v4 0/8] Ingenic JZ47xx Timer/Counter Unit drivers
To:     Paul Cercueil <paul@crapouillou.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     James Hogan <jhogan@kernel.org>,
        Maarten ter Huurne <maarten@treewalker.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@linux-mips.org,
        linux-doc@vger.kernel.org
References: <20180110224838.16711-2-paul@crapouillou.net>
 <20180317232901.14129-1-paul@crapouillou.net>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <aeb57b92-6932-9774-dc50-7563d30846bf@linaro.org>
Date:   Sun, 18 Mar 2018 23:13:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180317232901.14129-1-paul@crapouillou.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 18/03/2018 00:28, Paul Cercueil wrote:
> Hi,
> 
> This is the 4th version of my TCU patchset.
> 
> The major change is a greatly improved documentation, both in-code
> and as separate text files, to describe how the hardware works and
> how the devicetree bindings should be used.
> 
> There are also cosmetic changes in the irqchip driver, and the
> clocksource driver will now use as timers all TCU channels not
> requested by the TCU PWM driver.

Hi Paul,

I don't know why but you series appears in reply to [PATCH v3 2/9]. Not
sure if it is my mailer or how you are sending the patches but if it is
the latter can you in the future, when resending a new version, not use
the in-reply-to option. It will be easier to follow the versions.

Thanks.

 -- Daniel



-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
