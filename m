Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65944C43460
	for <linux-doc@archiver.kernel.org>; Mon, 26 Apr 2021 18:36:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36EAC6024A
	for <linux-doc@archiver.kernel.org>; Mon, 26 Apr 2021 18:36:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235161AbhDZShL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Apr 2021 14:37:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234275AbhDZShL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Apr 2021 14:37:11 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFB97C061574;
        Mon, 26 Apr 2021 11:36:27 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id a12so39586983pfc.7;
        Mon, 26 Apr 2021 11:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=R1zYCnRhPzK7ALzd9Ha9cbeuBR9fcK/CDlQF6NU1K8A=;
        b=G35Rbsbmm+x39F0C3A8w9UMWLrerD1BHvuBAhembsV7gIiNkn57JBJqU4I27lYSc7a
         7Cq6pTvqwPlxV8XC7U8c958Wq8j5totT+iTRNw0QX1qJPK7h+kFk8X70KVyhieW+IaiU
         v5iKp/EsZ5QX5YfSXc1vmI9HxM7hmMJrRFv7dj9j3qIbvU25Kn8sd7Whas1nC2zFBBk2
         Iyu1/+7C/bsgFw1gjG2JtYhPgv+JzpPvfTe/kH/g+5w0+D+MMpsgClP7VR0awwHxfhb5
         0fiQqRd9mdhc0FC+H/1RUgUmcpWDSUHAgomUNhR2eB+9K4r7RZu8KQQIA+Y7M8fcRL1N
         Gayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=R1zYCnRhPzK7ALzd9Ha9cbeuBR9fcK/CDlQF6NU1K8A=;
        b=rE5Y9VW1dLTJmisE6bTtKC17RZuUmcDGH9b6sNbSrOMf5iyuA3LhoXRNN/Mhc/jqtZ
         UtSmN9v6yyNNZvjRXxgnkwEm5KYXlB86P/5ReN9AFHGEK46+5oRQdiAWK3jIm0RRDr7G
         AmHJGzoi7a6Gk3UAnkw0jx/FbiZPLJlBelQEAoM+DFwVQmYjBY4I9pSSU9xJ9jPqmH7u
         5j3mw6aVcQFCCJykInE5+mIHdL+e0crO5CqMA6mJnyRbKEDCwfedYrsjOWcDYliwC+F4
         QGGlp7M7frdb76WaifXby2hBw4/uYqKjCdC6hky17Rzm6z/3oOcgjJIBCNelTRnMfW2F
         Prcw==
X-Gm-Message-State: AOAM530q+TUpSqVKoyc+UxkRxPpplDkzKSY+0ub/S1u8/hq2E7yH2VRb
        UWCaNVFKF06jLPAH8hnei7736nXYnN8=
X-Google-Smtp-Source: ABdhPJw+KfTDqMTzMves1D4YgBaRKJJGT/Hp1VlhtgmBzkTiI1wc9BJ9iicFpJqAPRaMhATuByzGUw==
X-Received: by 2002:a63:d009:: with SMTP id z9mr18109712pgf.16.1619462187103;
        Mon, 26 Apr 2021 11:36:27 -0700 (PDT)
Received: from [10.67.49.104] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id gj13sm111394pjb.57.2021.04.26.11.36.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Apr 2021 11:36:26 -0700 (PDT)
Subject: Re: [net-next, v2, 1/7] net: dsa: check tx timestamp request in core
 driver
To:     Yangbo Lu <yangbo.lu@nxp.com>, netdev@vger.kernel.org
Cc:     Richard Cochran <richardcochran@gmail.com>,
        Vladimir Oltean <vladimir.oltean@nxp.com>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kurt Kanzenbach <kurt@linutronix.de>,
        Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Claudiu Manoil <claudiu.manoil@nxp.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        UNGLinuxDriver@microchip.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210426093802.38652-1-yangbo.lu@nxp.com>
 <20210426093802.38652-2-yangbo.lu@nxp.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <7186533c-5d4c-d78b-c16d-96e4dfdb3404@gmail.com>
Date:   Mon, 26 Apr 2021 11:36:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210426093802.38652-2-yangbo.lu@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/26/21 2:37 AM, Yangbo Lu wrote:
> Check tx timestamp request in core driver at very beginning of
> dsa_skb_tx_timestamp(), so that most skbs not requiring tx
> timestamp just return. And drop such checking in device drivers.
> 
> Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>
> Tested-by: Kurt Kanzenbach <kurt@linutronix.de>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
