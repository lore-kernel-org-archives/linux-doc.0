Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7169E75434
	for <linux-doc@archiver.kernel.org>; Tue,  3 Oct 2023 08:24:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239942AbjJCIYH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Oct 2023 04:24:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239956AbjJCIX6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Oct 2023 04:23:58 -0400
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB01FB4;
        Tue,  3 Oct 2023 01:23:24 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D8551C0007;
        Tue,  3 Oct 2023 08:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1696321403;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jSGcSwAqUefKWmuimG5WT5sO8MU51Z7G0dHxsNTfhXM=;
        b=J8fnA1o8wn6xc0cQOA4aHjVfrhDtatLI15AwEqfkCmRZNmwQ+SHktd6U38GrZplOOvBKpH
        fD+SKVGxi/4rLFf/e/ygsfGdY5r5+ydbBux0xZ8mdWK9PGWMeQzi3ufBKF6+iaZFr2juwf
        aFU1xDdhouV1o6Ijw+N4gHhnr5aDP00flyo40GH778kB5EpZCnryuajnGo+LXYyrE6EVk5
        /keLPFJcVPRpQy+gnlc/KKYbSGddlJBTexnXDhX8tPBbM/qQGpIFapuAIdRwxObCbSdMqP
        GVYJbYQFlLV72qnt3FVo1nHt0CmDIBEM7lAmYs5W9Dndp4bEe11Nsd0IJA3CMw==
Date:   Tue, 3 Oct 2023 10:23:19 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Matt Johnston <matt@codeconstruct.com.au>
Cc:     linux-i3c@lists.infradead.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Conor Culhane <conor.culhane@silvaco.com>,
        linux-kernel@vger.kernel.org (open list),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        linux-doc@vger.kernel.org (open list:DOCUMENTATION)
Subject: Re: [PATCH] i3c: Fix typo "Provisional ID" to "Provisioned ID"
Message-ID: <20231003102319.77fdf512@xps-13>
In-Reply-To: <20231003075339.197099-1-matt@codeconstruct.com.au>
References: <20231003075339.197099-1-matt@codeconstruct.com.au>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Matt,

matt@codeconstruct.com.au wrote on Tue,  3 Oct 2023 15:53:39 +0800:

> The MIPI I3C spec refers to a Provisioned ID, since it is (sometimes)
> provisioned at device manufacturing.
>=20
> Signed-off-by: Matt Johnston <matt@codeconstruct.com.au>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
