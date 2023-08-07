Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B42EC001DB
	for <linux-doc@archiver.kernel.org>; Mon,  7 Aug 2023 16:44:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbjHGQoI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Aug 2023 12:44:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231616AbjHGQoH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Aug 2023 12:44:07 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85782171E;
        Mon,  7 Aug 2023 09:44:05 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 16A762E0;
        Mon,  7 Aug 2023 16:44:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 16A762E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1691426644; bh=4qpWNamh1TwV3MOuBRN3slhayshEZuWO3IMBpmvtwpY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=PFYxRIBHuXColW1w3gAsxe00exv5xzhWJ0O1Ct086j4hXR1+VITJJb26nc6w7oFLu
         987ZNn06btfFF6rgr+sQOFvUcWaL9NKIB73+LY2p2HJ+J6gaKMC5T/bgHS6tfcHmrl
         2yU/eHTDiy/HYPM/98bWj7rGN0QTnDf77bV1aApI/s2oDweZLCwsDMujkTGM8a+xuT
         sGB/elcLZRs5mC+FrEJm0hDHzjVBPdmmLIjYIf15GwH9ELjRIpMyZUgFqGcyeG372X
         ISth0tz5ay9TIjO+Xh+iPD4IoDCuAV3qbqK6uWYMiiKBr6PhIbhm4yqGz9wtcAr7Mu
         x10aMyXtY38Vw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: core-api/cpuhotplug: Fix state names
In-Reply-To: <427ee6f-61e3-e97e-195d-cee0bede2ceb@linutronix.de>
References: <20230515162038.62703-1-anna-maria@linutronix.de>
 <87ttwd8f4e.ffs@tglx> <427ee6f-61e3-e97e-195d-cee0bede2ceb@linutronix.de>
Date:   Mon, 07 Aug 2023 10:44:03 -0600
Message-ID: <87a5v26bvw.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Anna-Maria Behnsen <anna-maria@linutronix.de> writes:

> On Mon, 15 May 2023, Thomas Gleixner wrote:
>
>> On Mon, May 15 2023 at 18:20, Anna-Maria Behnsen wrote:
>> 
>> > Dynamic allocated hotplug states in documentation and comment above
>> > cpuhp_state enum do not match the code. To not get confused by wrong
>> > documentation, change to proper state names.
>> >
>> > Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
>> 
>> Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
>> 
>
> Ping?

I didn't pick this up because linux/cpuhotplug.h is a bit outside my
turf; I can certainly do so, though, if that seems like the best path.

jon
