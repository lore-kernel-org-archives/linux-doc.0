Return-Path: <SRS0=kY26=6K=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A927C54FCB
	for <linux-doc@archiver.kernel.org>; Sun, 26 Apr 2020 22:36:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E913720700
	for <linux-doc@archiver.kernel.org>; Sun, 26 Apr 2020 22:36:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="oh/tqB8Z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbgDZWgG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 26 Apr 2020 18:36:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726188AbgDZWgG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 26 Apr 2020 18:36:06 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75E38C061A0F
        for <linux-doc@vger.kernel.org>; Sun, 26 Apr 2020 15:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
        Subject:Sender:Reply-To:Cc:Content-ID:Content-Description;
        bh=SNFhIZiKZ2/3VKu6umi3SmXnknL9L4QpHLNCP0Z7k8I=; b=oh/tqB8ZSOYH103KgClifhaBIi
        wqI7fHB3VHa7UHHsrJNvi6lD7gCNwYJvD3pJBFHs4WrbcnH/ek9UlOYAXxPFnDdJUp84v7+yR0s72
        InijN+Z6JG5/rEi6rpOkCeMfngmGL9oyxfqnIljAFvV59xB8gUVyUaaB81Z+vhKIWEzuz3FS0Ae/a
        MJ/PT58WGUWOcThnNfz+bmSrgw2XU5U9UyQ2t237/cBsor0FB+yy8j7wGkHJXyCVGFSpWoQAuH/en
        7qCeT+D/0ASXPLtihoeFkLfL7mr6OD149V3WrN6RZhL52msumGdsqImhQk3n+0JX8kRacqzDenI1j
        7sPYD2dw==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jSpsZ-0000rE-8C; Sun, 26 Apr 2020 22:36:03 +0000
Subject: Re: [INFO] Documentation/RCU ReST format
To:     Federico Vaga <federico.vaga@vaga.pv.it>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <2106522.Q2ZRUUiV7S@harkonnen>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <918903f9-2cfc-b368-98a1-d81337d7fdf5@infradead.org>
Date:   Sun, 26 Apr 2020 15:36:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <2106522.Q2ZRUUiV7S@harkonnen>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/26/20 3:23 PM, Federico Vaga wrote:
> Hi,
> 
> is there a reason for not converting the .txt files in Documentation/RCU?
> 
> 

Mauro sent this patch series last week for RCU.

https://lore.kernel.org/linux-doc/20200421175818.GS17661@paulmck-ThinkPad-P72/T/#m711283ef658e4c2c5acd4dcca0279f3532211cd6

-- 
~Randy

