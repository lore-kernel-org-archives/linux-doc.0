Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37113C433B4
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 19:05:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A5E96101A
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 19:05:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235132AbhDATE7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Apr 2021 15:04:59 -0400
Received: from vern.gendns.com ([98.142.107.122]:49660 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235887AbhDAS7B (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 1 Apr 2021 14:59:01 -0400
X-Greylist: delayed 4503 seconds by postgrey-1.27 at vger.kernel.org; Thu, 01 Apr 2021 14:59:01 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=RNTCZdBbhMjO2dSPgQllX07OBfeYeDmdhR8sOt+nJoE=; b=vwbwnsmAtNcVyjR8tkrz0eRMBh
        CnyXQ6lqeYRkpUIOZKS0A7ZbmOuy6x9rnrLNOKkC7c+umNbC8CisM4UIkzjWlauPZwcnxin/7/jS2
        tS1zslG3PeZcBvsUUsmEYGF5xgP53MAFQpT4Z2dFSuPX2xGQi7E8JNwFta/Fu/aP5PuTL4NuNW/uS
        NmQAyubwdxboI/QLNyTqOOyXCY+D/34jZK7/4CJHbrySh6hqYWzMrSFxDfDnLB3hmozeuJo2ARCyl
        Z+vmkTCFFkF5IdCLrHJRKH4SOu6gQf6FPz6uo0j9utqvAJv98WW+I6DU18pRbz5Y3bU6oHPfJzShw
        K53VXlsw==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net ([108.198.5.147]:43322 helo=[192.168.0.134])
        by vern.gendns.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94)
        (envelope-from <david@lechnology.com>)
        id 1lRzQv-00056q-AA; Thu, 01 Apr 2021 11:40:33 -0400
Subject: Re: [PATCH 12/32] MAINTAINERS: update lego,ev3-battery.yaml reference
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-kernel@vger.kernel.org
References: <cover.1617279355.git.mchehab+huawei@kernel.org>
 <be4e2f1c7f6b2cfbda4fc98ca2177b048a3ed575.1617279355.git.mchehab+huawei@kernel.org>
From:   David Lechner <david@lechnology.com>
Message-ID: <a727e107-a322-7720-3438-a165b3297a32@lechnology.com>
Date:   Thu, 1 Apr 2021 10:40:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <be4e2f1c7f6b2cfbda4fc98ca2177b048a3ed575.1617279355.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id: davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/1/21 7:17 AM, Mauro Carvalho Chehab wrote:
> Changeset 3004e581d92a ("dt-bindings: power: supply: lego-ev3-battery: Convert to DT schema format")
> renamed: Documentation/devicetree/bindings/power/supply/lego_ev3_battery.txt
> to: Documentation/devicetree/bindings/power/supply/lego,ev3-battery.yaml.
> 
> Update its cross-reference accordingly.
> 
> Fixes: 3004e581d92a ("dt-bindings: power: supply: lego-ev3-battery: Convert to DT schema format")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---

Reviewed-by: David Lechner <david@lechnology.com>

