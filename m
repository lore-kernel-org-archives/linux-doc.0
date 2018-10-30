Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 61E7C7D08E
	for <lwn-linux-doc@archive.lwn.net>; Tue, 30 Oct 2018 19:26:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725805AbeJaEVM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 31 Oct 2018 00:21:12 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:41694 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725812AbeJaEVM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 31 Oct 2018 00:21:12 -0400
Received: by mail-oi1-f193.google.com with SMTP id i10-v6so11496108oik.8;
        Tue, 30 Oct 2018 12:26:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0F25qEu9ENN4hCPJlHy7Eh7LqGoyUq4MHpKeMwqKM/0=;
        b=b2HTmnaUri3OttJldxucp0iee5z3nrURFwzIXiC4JVXrM9vNhD0G9GiP6FdbqtRpXW
         uraprGaDjNuYnM6csbWa9vnZjUAwyC1atjLqr4Rdxltg6RKLNrWcuh/jodWbjdTu/QUn
         qjnj7HGQmUND85CNFVUMe2sCdIS1927DKgTdVAbjICJct8LUtvlm5kf0mYxsyCuJKb/h
         ESuZrSvELfPdUI0ZNsXtl3oDkPhT4B0RthMb0xTS55Q7Ckgp8LjmD+lWw7EFT0CkurDn
         hzbBPKlkZfMs1NfdwyGEfAybY8f6fvcANCycgrXXcg3fksgDoShZU7a9CbHqDhYAqWjk
         tlWA==
X-Gm-Message-State: AGRZ1gIia/avMu29kMPz30wwt4kil+ixcpojm32I9uafimSuYjNbdwoK
        b5Cd1Uzyr2izoIJ/8CJNOw==
X-Google-Smtp-Source: AJdET5euoCWzLKw/NM4WS8rBVZsxKwXK+XU2/KBajbH9yIYAmwa9hEGR15f0O3i3gc8w6GT7DWtuFw==
X-Received: by 2002:aca:cd4f:: with SMTP id d76-v6mr24663oig.120.1540927584837;
        Tue, 30 Oct 2018 12:26:24 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j83-v6sm648004oif.2.2018.10.30.12.26.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Oct 2018 12:26:24 -0700 (PDT)
Date:   Tue, 30 Oct 2018 14:26:23 -0500
From:   Rob Herring <robh@kernel.org>
To:     Boris Brezillon <boris.brezillon@bootlin.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Przemyslaw Sroka <psroka@cadence.com>,
        Arkadiusz Golec <agolec@cadence.com>,
        Alan Douglas <adouglas@cadence.com>,
        Bartosz Folta <bfolta@cadence.com>,
        Damian Kos <dkos@cadence.com>,
        Alicja Jurasik-Urbaniak <alicja@cadence.com>,
        Cyprian Wronka <cwronka@cadence.com>,
        Suresh Punnoose <sureshp@cadence.com>,
        Rafal Ciepiela <rafalc@cadence.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH v10 4/9] dt-bindings: i3c: Document core bindings
Message-ID: <20181030192623.GA19687@bogus>
References: <20181026144333.12276-1-boris.brezillon@bootlin.com>
 <20181026144333.12276-5-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181026144333.12276-5-boris.brezillon@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 26 Oct 2018 16:43:28 +0200, Boris Brezillon wrote:
> A new I3C subsystem has been added and a generic description has been
> created to represent the I3C bus and the devices connected on it.
> 
> Document this generic representation.
> 
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
> Changes in v10:
> - Fix mistakes in the example (reported by Rob)
> 
> Changes in v9:
> - Rework the way we encode the I2C vs I3C device in the reg property
>   so that we don't need the funky macros to define and I3C or I2C dev
> - Drop Rob's Reviewed-by
> 
> Changes in v8:
> - None
> 
> Changes in v7:
> - None
> 
> Changes in v6:
> - None
> 
> Changes in v5:
> - Add Rob's R-b
> 
> Changes in v4:
> - Clarify the fact that static address == I3C address and dynamic
>   address == I3C address
> - Use i2c-scl-hz in the example
> 
> Changes in v3:
> - Rename {i2c,i3c}-scl-frequency DT prop into {i2c,i3c}-scl-hz
> - Rework the way we expose the provisional ID and LVR information
> - Rename dynamic-address into assigned-address
> - Enforce the I3C master node name
> 
> Changes in v2:
> - Define how to describe I3C devices in the DT and when it should be
>   used. Note that the parsing of I3C devices is not yet implemented in
>   the framework. Will be added when someone really needs it.
> ---
>  Documentation/devicetree/bindings/i3c/i3c.txt | 139 ++++++++++++++++++
>  1 file changed, 139 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/i3c.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
