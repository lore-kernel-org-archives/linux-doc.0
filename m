Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EC3C47E66E
	for <lwn-linux-doc@archive.lwn.net>; Sat, 17 Mar 2018 23:29:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752467AbeCQX3U (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 17 Mar 2018 19:29:20 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:34428 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751809AbeCQX3T (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 17 Mar 2018 19:29:19 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     James Hogan <jhogan@kernel.org>,
        Maarten ter Huurne <maarten@treewalker.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@linux-mips.org,
        linux-doc@vger.kernel.org
Subject: [PATCH v4 0/8] Ingenic JZ47xx Timer/Counter Unit drivers
Date:   Sun, 18 Mar 2018 00:28:53 +0100
Message-Id: <20180317232901.14129-1-paul@crapouillou.net>
In-Reply-To: <20180110224838.16711-2-paul@crapouillou.net>
References: <20180110224838.16711-2-paul@crapouillou.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net; s=mail; t=1521329357; bh=SBKmvf9sw6wE61z1vU1rY2tzAn60kkuZjUK19pQhAD8=; h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=KfpY6QXNrBv/ipJJdOuDr5X5erWsaqmOiXmrn7f6HmxprfT7ptSOioifY29U109OkoX7KFdBluPkpMWcBbNCg1um0zWabpQGyt6jV9xM9bK+u4R4aA7YinUQb5b0ycQ3ML1qIn95abKd0dCiWF+/4IBOVMpNOS65m/NLY5p63LE=
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

This is the 4th version of my TCU patchset.

The major change is a greatly improved documentation, both in-code
and as separate text files, to describe how the hardware works and
how the devicetree bindings should be used.

There are also cosmetic changes in the irqchip driver, and the
clocksource driver will now use as timers all TCU channels not
requested by the TCU PWM driver.

Cheers,
-Paul

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
