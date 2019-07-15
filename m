Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 254417D90D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 15 Jul 2019 09:05:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729452AbfGOJFb (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 15 Jul 2019 05:05:31 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36272 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729392AbfGOJFb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Jul 2019 05:05:31 -0400
Received: by mail-wm1-f65.google.com with SMTP id g67so10231479wme.1
        for <linux-doc@vger.kernel.org>; Mon, 15 Jul 2019 02:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8SLvEjlc2V+wc5LKlamSyc/9J8fFrZb5bFr+zK982d4=;
        b=d+ZvYjGynHD9tSfzVAKbAcZULlShG6N4IRlXHCxfyVJsE4wjkuBc5ND3Eo423McfSm
         8dDaYEXQOx0TkPg/gNHXm7pQ0TFO6quYcWh0nquLLKH4aeSTax0jFwQIZSgyOI8KiGTU
         CLt2VOqpPVEBIfOIWv5XmnV1sbNH00d3TUj2x4o5EENBqzJU+fI/Rm60Xx+pMN6W09SL
         UJuh/TxSI7zowyPLEkgE2gIqyWA0TbV5wxNAb4mypuu4x9rroBT4yEzNwIqF8q6d6DzH
         RtCfYXIjSgUBkh/Z/6ExuG5YFGEp+mGe7ppl9NdSD8DxkKN3+nG+XF6DConq5KneVX8N
         KHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8SLvEjlc2V+wc5LKlamSyc/9J8fFrZb5bFr+zK982d4=;
        b=XeWWVoBkSaX2azRsm7R7FLtWYLnEp38oBrJyDCoPoHYNbsMNyqNpgwoDcXO/R3cF5N
         VwA9J4+4x1QZoa0tox+O6Sa+zxZ1CWeLuhzP9HAr/PfwcKCKQpbxWvraHfyz67dKJi4Z
         sXm/0+Q8uj89gyjTTgkyojnhhFsHg+qrVtfudLpjMIUXtAFqi5q7GZtDCaJ7q1YlQ/jM
         9ekLpkbAIf/24YOqW27DK+j2/dctZrm+9PK1y1wE53R5YUaow/A8b1vVbSjRRxjAxPZD
         EMZe9UWmq8m8C9gLvhG69ElF2ZgDzQM0MchKTZvpunKwj+5QbSQ5ZQOPWJtk8dD37n1I
         CpMA==
X-Gm-Message-State: APjAAAWSb2av0mtzhsGQEfLI9Oj6Tv8Ux1SqnscuXM4T84yZ7ILsnSBC
        RRc2TsQ+TqugjCwrK+1JwN4d6A==
X-Google-Smtp-Source: APXvYqyooRiz3HOcEtyY+t7rwNaEQOf/QOzmw3jGwyslAKtIuZo3iNQObhOO8wgzh7ofVUfTua5ohQ==
X-Received: by 2002:a1c:4b0b:: with SMTP id y11mr24746359wma.25.1563181529488;
        Mon, 15 Jul 2019 02:05:29 -0700 (PDT)
Received: from apalos (athedsl-428434.home.otenet.gr. [79.131.225.144])
        by smtp.gmail.com with ESMTPSA id j17sm17672728wrb.35.2019.07.15.02.05.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Jul 2019 02:05:28 -0700 (PDT)
Date:   Mon, 15 Jul 2019 12:05:25 +0300
From:   Ilias Apalodimas <ilias.apalodimas@linaro.org>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     Sasha Levin <sashal@kernel.org>, peterhuewe@gmx.de, jgg@ziepe.ca,
        corbet@lwn.net, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-kernel@microsoft.com, thiruan@microsoft.com,
        bryankel@microsoft.com, tee-dev@lists.linaro.org,
        sumit.garg@linaro.org, rdunlap@infradead.org
Subject: Re: [PATCH v8 0/2] fTPM: firmware TPM running in TEE
Message-ID: <20190715090525.GA28477@apalos>
References: <20190705204746.27543-1-sashal@kernel.org>
 <20190711200858.xydm3wujikufxjcw@linux.intel.com>
 <20190711201059.GA18260@apalos>
 <20190712033758.vnwrmdxvz2kplt65@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190712033758.vnwrmdxvz2kplt65@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jul 12, 2019 at 06:37:58AM +0300, Jarkko Sakkinen wrote:
> On Thu, Jul 11, 2019 at 11:10:59PM +0300, Ilias Apalodimas wrote:
> > Will report back any issues when we start using it on real hardware
> > rather than QEMU
> > 
> > Thanks
> > /Ilias
> 
> That would awesome. PR is far away so there is time to add more
> tested-by's. Thanks.
> 

I tested the basic fucntionality on QEMU and with the code only built as a
module. You can add my tested-by on this if you want

> /Jarkko
