Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D7EED7D581
	for <lwn-linux-doc@archive.lwn.net>; Tue, 21 Aug 2018 17:19:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbeHUUhw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 21 Aug 2018 16:37:52 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:55696 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726612AbeHUUhw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Aug 2018 16:37:52 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     od@zcrc.me, Mathieu Malaterre <malat@debian.org>,
        linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-mips@linux-mips.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v7 00/24] TCU patchset v7
Date:   Tue, 21 Aug 2018 19:16:11 +0200
Message-Id: <20180821171635.22740-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net; s=mail; t=1534871809; bh=lUaJww5mQU8gGtIiC/2MeG+isI/sXxRp/8lsFMzow6o=; h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding; b=BuT9xWLDhbvkenEW6ozw0b+gkK12tD0LiKt3x2ctlCVPDA4ZuBkPSCUL4dZ3km0F1Nb8nZyjp/vyWC/d6dDFl6S968zZrxofd1prqUsPXRQTKS4+8yaQz1oPkn/zEY66xHkrmL2FvHrvWYK3LCPP3WBOm/qgm3Eq8NmyC1D3Onw=
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

This is the v7 of my patchset that adds support for the Timer/Counter
Unit in Ingenic JZ47xx SoCs.

From v6, only patches [05/24] and [06/24] were modified to fix a section
mismatch. All the other patches are the same.

Thanks,
-Paul Cercueil

