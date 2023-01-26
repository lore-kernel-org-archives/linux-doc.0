Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1409DC54E94
	for <linux-doc@archiver.kernel.org>; Thu, 26 Jan 2023 14:37:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231542AbjAZOhl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 26 Jan 2023 09:37:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjAZOhk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Jan 2023 09:37:40 -0500
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 593B323862;
        Thu, 26 Jan 2023 06:37:35 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C19AD2D3;
        Thu, 26 Jan 2023 14:37:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C19AD2D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1674743854; bh=0562LnNUCt9JJJhRg4NFLkVnEkQms9BWIzzgPLd1QRM=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=WluIPROi/OYJ6Ckue5eY2R57K5jPfXBoV01kK89mACVlFNDTWTlRTNXuc8wtXIhHz
         7WFv0hnqotkBWr9pFkiAV2D0Da2VI/iuwrZza6jn4rHB29rsdDepw8TdvkljX7lyAf
         QBISnW9/3zrfzqLy0ZYWvtUF4ma09pJlldKJUHJJdfhbC26aK8Cflz/7v5b0ByIQh3
         K98S5hKzdzkRHfpdXUdGDvxmRdaN6ROHTJOfqwLmUmJgEMK38oLxfwkCujnjZx06BF
         DGfa13+iRz3Zm32/Jh650R4LDuiCKmziuC9tMHfUGZ4viS2c4pZuBGt/EbYe4Ss98n
         zeitpWiNljs4w==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Bagas Sanjaya <bagasdotme@gmail.com>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: leds: fix the following docu build warning
In-Reply-To: <5fd77765-4f55-f204-6aa0-963830cd13d8@gmail.com>
References: <20230125154426.12464-1-skhan@linuxfoundation.org>
 <5fd77765-4f55-f204-6aa0-963830cd13d8@gmail.com>
Date:   Thu, 26 Jan 2023 07:37:33 -0700
Message-ID: <87bkmlbbv6.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Bagas Sanjaya <bagasdotme@gmail.com> writes:

> On 1/25/23 22:44, Shuah Khan wrote:
>> Add leds-qcom-lpg to Documentation/leds/index.rst to fix the following
>> doc build warning.
>> 
>
> The patch subject should have been "docs: leds: add missing documentation
> to the toctree"

Shuah has been doing this for a while and really does not need your
instructions on how to do a patch; this one is fine as-is.

Bagas, please stop harassing our contributors.  I'm getting fairly tired
of asking that.

> Otherwise, LGTM.
>
> Acked-by: Bagas Sanjaya <bagasdotme@gmail.com>

Do you have a history or status with the LED subsystem that puts you in
a position to ack this patch?

jon
