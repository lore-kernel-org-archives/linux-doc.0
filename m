Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DCEA27D57F
	for <lwn-linux-doc@archive.lwn.net>; Thu, 27 Sep 2018 20:39:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727530AbeI1C7D (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 27 Sep 2018 22:59:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:45262 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727295AbeI1C7D (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 27 Sep 2018 22:59:03 -0400
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4755921712;
        Thu, 27 Sep 2018 20:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1538080737;
        bh=i2DBqlCtCOaQ5XkZkSYwE/IujQn9YGBFT3Esxu2iC+U=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=s0I5o72P8Vm7Ahrpi5uZw6H+AZhHhAOwd+j5KPjtV7FVxjwsMBTzC2GnyjSr9Zi71
         pOd5WJNayPTLFBHbneHcWvg73IP7KPJvWBrS/OCkm0Ah5z7PHRSQoRZ0sFLiRPmkkd
         tQif7O16lx8fu8cOgzi+mdPdslgWsdBTfCATmOlI=
Received: by mail-qt1-f178.google.com with SMTP id z14-v6so4348870qtn.2;
        Thu, 27 Sep 2018 13:38:57 -0700 (PDT)
X-Gm-Message-State: ABuFfojJUruyxd+HmLtZhRt4Vd40q4x9ozMT1s2zQnsF4ZTgvzDbVNom
        r2017FWXne9fZuXyXsW7bsE815Ek43ynjEiUpQ==
X-Google-Smtp-Source: ACcGV63ebic0D+NJWKC3us72jqbp2UaZUMhjlXRR9rSyAr7ZO1y0Zhbri4EvDfZxyeT4yBxk20TCxJmJJsl3+5X5F+g=
X-Received: by 2002:aed:2905:: with SMTP id s5-v6mr6850435qtd.101.1538080736373;
 Thu, 27 Sep 2018 13:38:56 -0700 (PDT)
MIME-Version: 1.0
References: <20180927194910.18464-1-nicoleotsuka@gmail.com> <20180927194910.18464-2-nicoleotsuka@gmail.com>
In-Reply-To: <20180927194910.18464-2-nicoleotsuka@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 27 Sep 2018 15:38:44 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLcuJyjHFzW7-p4HAZq3g5tGAo0wT8f5ZT_KYWV5X5+5A@mail.gmail.com>
Message-ID: <CAL_JsqLcuJyjHFzW7-p4HAZq3g5tGAo0wT8f5ZT_KYWV5X5+5A@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: hwmon: Add ina3221 documentation
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "Andrew F. Davis" <afd@ti.com>,
        Linux HWMON List <linux-hwmon@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 27, 2018 at 2:49 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> Texas Instruments INA3221 is a triple-channel shunt and bus
> voltage monitor. This patch adds a DT binding doc for it.
>
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
> Changelog
> v5->v6:
>  * Removed status property as no need to explicitly list it.
>  * Combined all examples into a complete one.

Sorry, I meant combine the parent and child nodes into one. Showing 3
children is perfectly fine as the device has 3 channels.

Rob
