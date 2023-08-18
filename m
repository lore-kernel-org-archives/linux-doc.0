Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DB16EE4982
	for <linux-doc@archiver.kernel.org>; Fri, 18 Aug 2023 17:39:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343760AbjHRRjQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Aug 2023 13:39:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379148AbjHRRit (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Aug 2023 13:38:49 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A30C3C38;
        Fri, 18 Aug 2023 10:38:41 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::646])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id EDAD26A2;
        Fri, 18 Aug 2023 17:38:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EDAD26A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1692380321; bh=qo+Ml6qZKunskRw0xbTtK48PjbWTKeB3h3G+AS+aw2g=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=A8rZa8aIuMxeL/M2bYGtux29jYx9zWXquTANyoAo6VQXpEDpmeSttpu5H9kyUxads
         5G4KkdTiE9giVS3Y78S96ZtbZd+Zs6pnNWcNbv4VpyPov5LHGxrIx42mr0U75nISgp
         GBAxjmxBL4w8Wvlta+Veqc1XRfcgjYi6QmbmNUDO0MP+PheVrSNjs/zn78nBxrst9P
         Me4uacOmR72r9/QrFG/+XsuDzftYjygHf3Q/VhMuLXl7jEHtegqS+m7OlBZY3BJRgQ
         2cmpR+IsqfuH8Az9ZeyQLaq2y1A316zMsrIEbX1hjw8pfEmK4pmH6tkbr6H5Tj2g5d
         mSoUu7QxKrwuQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH 0/3] Documentation: Fix typos
In-Reply-To: <20230814212822.193684-1-helgaas@kernel.org>
References: <20230814212822.193684-1-helgaas@kernel.org>
Date:   Fri, 18 Aug 2023 11:38:40 -0600
Message-ID: <87msyol07z.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Bjorn Helgaas <helgaas@kernel.org> writes:

> From: Bjorn Helgaas <bhelgaas@google.com>
>
> Fix typos in Documentation.  I split these into:
>
>   Documentation/ABI/
>   Documentation/devicetree/bindings/
>   <everything else>
>
> If it would be better split more or differently, I'm happy to do that.
> These are strictly typo fixes, no clarification or rewording.
>
>
> Bjorn Helgaas (3):
>   Documentation/ABI: Fix typos
>   dt-bindings: Fix typos
>   Documentation: Fix typos
>
I've applied parts 1 and 3, thanks.

jon
