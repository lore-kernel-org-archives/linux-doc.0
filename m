Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C00937DD31
	for <lwn-linux-doc@archive.lwn.net>; Wed, 28 Mar 2018 15:10:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753759AbeC1PK2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 28 Mar 2018 11:10:28 -0400
Received: from mail-wm0-f45.google.com ([74.125.82.45]:55316 "EHLO
        mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753611AbeC1PK0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Mar 2018 11:10:26 -0400
Received: by mail-wm0-f45.google.com with SMTP id b127so4766262wmf.5
        for <linux-doc@vger.kernel.org>; Wed, 28 Mar 2018 08:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zHiNbEAnE4cqfYGIp31Mi+Pb//oSGnBO2ZqzYaRSOW8=;
        b=ikHcB77iJAGsuM9vaen8cca5di/p+bDF0N3mDK80McUCHyapQ1nmka6CTvcpVfx281
         HEPgNGb+BxyPktmx1C69/E8DJujHqo4bGNTfEf2bmvfwZrokmGclCeoyLX1PEie3vvEM
         n+SGxXZ1M++ItVessHdWOZ8UykS88a3r4tCNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zHiNbEAnE4cqfYGIp31Mi+Pb//oSGnBO2ZqzYaRSOW8=;
        b=lM2JGOHoziBFQ1DeWnQXwpg6rvlheijoGcmNaRQm3gkU7zwFLyammHelqIU4EwnPHH
         AbadMUpAg4t09gCJYaKsw9KJvAEy/wyFe9TyGWXFBCO9dwD+N+p1J7EJaFWeJBoMuxvA
         Thowh9bdov0xN1V2oTzCU9CwELG82P2qS4OdbulNLa96vywRH0lglmgGl826lLBgqIJs
         WMO/pwVtSU9mY1rGtQQAbkN6VPMhTbJsrDCn4EO3siWBG6vnA5YEspSzQA6eikQcTxAT
         +1oFoCLJ5KOWytYEi18vYnBhnvOmvBCKCGkezKYdjy3heyFlZb6/BSvWADRw4m3NSNkI
         qeDA==
X-Gm-Message-State: AElRT7GX2GJ7tajp2uTwthvdiBs8d1lydHmf6G+3yec0LwQ0wOamfEcs
        Cfg2AMqLMDYULtXmWsFyBkfLaW9BO68=
X-Google-Smtp-Source: AIpwx4/2QeO5suc2rv8iIOmIp5IcjNbv/PRF0toNTPibNThlZLAIuM6iQzfrN3HLcsKgPl4J/Tx0gw==
X-Received: by 10.80.171.22 with SMTP id s22mr3864142edc.263.1522249825416;
        Wed, 28 Mar 2018 08:10:25 -0700 (PDT)
Received: from ?IPv6:2001:41d0:fe90:b800:b0a9:da92:8c72:d9e2? ([2001:41d0:fe90:b800:b0a9:da92:8c72:d9e2])
        by smtp.googlemail.com with ESMTPSA id s27sm2693943edm.78.2018.03.28.08.10.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Mar 2018 08:10:24 -0700 (PDT)
Subject: Re: [PATCH v4 0/8] Ingenic JZ47xx Timer/Counter Unit drivers
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>,
        James Hogan <jhogan@kernel.org>,
        Maarten ter Huurne <maarten@treewalker.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@linux-mips.org,
        linux-doc@vger.kernel.org
References: <20180110224838.16711-2-paul@crapouillou.net>
 <20180317232901.14129-1-paul@crapouillou.net>
 <aeb57b92-6932-9774-dc50-7563d30846bf@linaro.org>
 <2fb3344b4034385ed89bcdf7da2347d4@crapouillou.net>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <6a0ac21b-1dbc-9821-0951-fe5e9ac34bd3@linaro.org>
Date:   Wed, 28 Mar 2018 17:10:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <2fb3344b4034385ed89bcdf7da2347d4@crapouillou.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 28/03/2018 17:01, Paul Cercueil wrote:
> Le 2018-03-18 23:13, Daniel Lezcano a écrit :
>> On 18/03/2018 00:28, Paul Cercueil wrote:
>>> Hi,
>>>
>>> This is the 4th version of my TCU patchset.
>>>
>>> The major change is a greatly improved documentation, both in-code
>>> and as separate text files, to describe how the hardware works and
>>> how the devicetree bindings should be used.
>>>
>>> There are also cosmetic changes in the irqchip driver, and the
>>> clocksource driver will now use as timers all TCU channels not
>>> requested by the TCU PWM driver.
>>
>> Hi Paul,
>>
>> I don't know why but you series appears in reply to [PATCH v3 2/9]. Not
>> sure if it is my mailer or how you are sending the patches but if it is
>> the latter can you in the future, when resending a new version, not use
>> the in-reply-to option. It will be easier to follow the versions.
>>
>> Thanks.
>>
>>  -- Daniel
> 
> Hi Daniel,
> 
> I guess I did a mistake. I always reply to the first patch of the previous
> version of the patchset (is that correct?).

It depends, if you have a threaded view of emails, it is not easy to
review the patches when they are in several levels. Usually you can see
the patches is top posted without in-reply-to every version.

You can use in-reply-to to an email suggesting a change in order to give
context.

For the v4 series of these drivers, I'm lost :/


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
