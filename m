Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59914E95A8F
	for <linux-doc@archiver.kernel.org>; Tue, 10 Oct 2023 10:13:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbjJJKNK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 10 Oct 2023 06:13:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229892AbjJJKNI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Oct 2023 06:13:08 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0934A99;
        Tue, 10 Oct 2023 03:13:04 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B782240010;
        Tue, 10 Oct 2023 10:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1696932783;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=tUJNRfjUuKDFIex/FlVkBB3IJFXVfYCMFME1OSx+B1Q=;
        b=ooMZcpQQ9d+EZTwSj4Ex/lkRdL5BVBOV/mrBbIZ3BpTjcbG6JWrDXoTX18T/WTyoRkLVWK
        Ui1KsmIrLO0e58CyJfmXa1EPjj6hT1+xZ0foZI7Qe+g6ndpyxdT78rigRFF8y/kn5ReIgX
        Uk8h14kB6mb6I/S3AHgnZPmYDXQqPILahEhNbmgO8EWdATehaN677V+prOn2LWFo5I8pFP
        2ZejcQt6wNfXe8xsDVAcfpZZqhAYWtHGOs48NzT/LnnLG5XjV/eLuArgVrXHfu+RjOeZxR
        YKcgTv73SEJb5GYitNWi7/22TLOzchudYSSFdsiP05XNA62nEyQXHf4aZD8Mlg==
Date:   Tue, 10 Oct 2023 12:13:01 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-i3c@lists.infradead.org,
        Matt Johnston <matt@codeconstruct.com.au>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Conor Culhane <conor.culhane@silvaco.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] i3c: Fix typo "Provisional ID" to "Provisioned ID"
Message-ID: <169693275141.1756460.10774272832837669579.b4-ty@bootlin.com>
References: <20231003075339.197099-1-matt@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231003075339.197099-1-matt@codeconstruct.com.au>
X-GND-Sasl: alexandre.belloni@bootlin.com
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On Tue, 03 Oct 2023 15:53:39 +0800, Matt Johnston wrote:
> The MIPI I3C spec refers to a Provisioned ID, since it is (sometimes)
> provisioned at device manufacturing.
> 
> 

Applied, thanks!

[1/1] i3c: Fix typo "Provisional ID" to "Provisioned ID"
      commit: 57ec42b9a1b7e4db4a1c2aa4fcc4eefe6d31bcb8

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
