Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D6DC4320E
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jul 2021 06:27:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3FECF60E0C
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jul 2021 06:27:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234056AbhGWFrM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Jul 2021 01:47:12 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:52444
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233993AbhGWFrK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Jul 2021 01:47:10 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 5C98B3F34D
        for <linux-doc@vger.kernel.org>; Fri, 23 Jul 2021 06:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627021663;
        bh=ScM5eUXjBnVPe8LbBTYSW47mZlMEZMzsEaWNVZaNkWQ=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=jtwpKgCHgeeIwVDNX0/2tHKzGo3qN1ydck+/aEU3kBG7b4d1W9/f2NpamD2MeLH2f
         HOdZq8uvkaI29zJ8IvlmGblL4sZ0CTmrKnjcwbk6oKp4u61oqxWdB4idDx/3NTSqCy
         kFh31fua1tb64882x5MfyjA5ewOzUM6E0YUPLhCDWFzRBqyvHSzJsFkq9tei7ZP3hV
         M7X+CPm86aoiOHR3PyZnqpWwJnzQTuoYa2hTqQyZk/cSTxwl94G4QGhOXvTZM4kRmW
         jqGsnS/nhasHPRVvL2QUYOvsuRKIWfVCJYlPKgpM1PrcBmxGlYrZZgsvR6UEQF2TQ5
         AjqcsAa1K7QIA==
Received: by mail-ed1-f71.google.com with SMTP id c20-20020a0564021014b029039994f9cab9so164189edu.22
        for <linux-doc@vger.kernel.org>; Thu, 22 Jul 2021 23:27:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ScM5eUXjBnVPe8LbBTYSW47mZlMEZMzsEaWNVZaNkWQ=;
        b=qRDeSc7mxRbGhyLUe9/qCmy3JaB1PVv7tlSxECzuK5zgblmbOVNL2kUpJsrUu0DXZI
         /E8BmdLgSlppEX8ULNW65v4ZOPefYNQ/gh07QWTFEqdLVCg0NyLEuFxZKqbpGP5Y4UCb
         g/RNefsilEpBjbhDhJC4sbJlnAjD2nURxpZogXE1YzFiKdgNt0XyspQpbBGtUJbo6EVq
         yz5gBeGFfuuFUbIMmVfExXX6mR9hnNSU0eexZMiGGwbxjKYGv/GFkQwspAxPEjSvG4Ws
         V+xZOCv9zewHOuo/1ijhPiKUdvE+lGB8csP4Nfa/SmYcCZIgG5y8NVIeCRgwO7e3kgxf
         E0Kg==
X-Gm-Message-State: AOAM531j9a1ejWLqZccIKUAmy5bRG9CU0ujb9EuwY3eS6urrNvHOqW/V
        ggOAVosyTsD7/387avd/GUnVzoSv0OjyqORWXiWEVNkDRYxjcHm/kdPX2BNBs2EppmKQ4JoowxB
        NnQlb3tHjLjSWc8qbcOA6TaN98J7wzOBpiheT8A==
X-Received: by 2002:a17:906:e0e:: with SMTP id l14mr3313197eji.501.1627021662758;
        Thu, 22 Jul 2021 23:27:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZ+nyDEENcrVRLwr6YxB1sHYJA1zCxcGsDlpGPB37Ly4NJOfWs4Dn45abWgrRNkKKGjwgnGw==
X-Received: by 2002:a17:906:e0e:: with SMTP id l14mr3313181eji.501.1627021662625;
        Thu, 22 Jul 2021 23:27:42 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id u5sm13449844edv.64.2021.07.22.23.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 23:27:42 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Jean Delvare <jdelvare@suse.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Richard Weinberger <richard@nod.at>,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: (subset) [PATCH 00/15] Fix some DT binding references at next-20210722
Date:   Fri, 23 Jul 2021 08:27:18 +0200
Message-Id: <162702163038.6229.12663832282139727924.b4-ty@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1626947923.git.mchehab+huawei@kernel.org>
References: <cover.1626947923.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 22 Jul 2021 11:59:57 +0200, Mauro Carvalho Chehab wrote:
> Due to DT schema conversion to yaml, several references to dt-bindings got
> broken.
> 
> Update them.
> 
> Mauro Carvalho Chehab (15):
>   dt-bindings: mtd: update mtd-physmap.yaml reference
>   dt-bindings: firmware: update arm,scpi.yaml reference
>   dt-bindings: net: dsa: sja1105: update nxp,sja1105.yaml reference
>   MAINTAINERS: update mtd-physmap.yaml reference
>   MAINTAINERS: update arm,vic.yaml reference
>   MAINTAINERS: update aspeed,i2c.yaml reference
>   MAINTAINERS: update faraday,ftrtc010.yaml reference
>   MAINTAINERS: update fsl,fec.yaml reference
>   MAINTAINERS: update mtd-physmap.yaml reference
>   MAINTAINERS: update ti,am654-hbmc.yaml reference
>   MAINTAINERS: update ti,sci.yaml reference
>   MAINTAINERS: update gpio-zynq.yaml reference
>   MAINTAINERS: update arm,pl353-smc.yaml reference
>   MAINTAINERS: update intel,ixp46x-rng.yaml reference
>   MAINTAINERS: update nxp,imx8-jpeg.yaml reference
> 
> [...]

Applied, thanks!

[13/15] MAINTAINERS: update arm,pl353-smc.yaml reference
        commit: e460a86aab669e00c5952a7643665f3096fbfe27

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
