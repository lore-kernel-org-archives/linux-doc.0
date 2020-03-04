Return-Path: <SRS0=BeNN=4V=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C3BBC3F2CE
	for <linux-doc@archiver.kernel.org>; Wed,  4 Mar 2020 16:44:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D6F6C2166E
	for <linux-doc@archiver.kernel.org>; Wed,  4 Mar 2020 16:44:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lca.pw header.i=@lca.pw header.b="leSmdPEc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbgCDQon (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 4 Mar 2020 11:44:43 -0500
Received: from mail-qt1-f195.google.com ([209.85.160.195]:45701 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729573AbgCDQok (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 Mar 2020 11:44:40 -0500
Received: by mail-qt1-f195.google.com with SMTP id a4so1820154qto.12
        for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2020 08:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sWZM/vSQvIFpCrYKTig+vbD3wjvs5x43S2+zwby2k3U=;
        b=leSmdPEcmXCsX0SRY8aBKe7RtZn9+fqdyHoIP0b0Gt8CdeO1CR8LF1Vb7Y0KkDpL1/
         6chh9AI9QJpWFeAblYhSVkpvoau9e86BglG4kQnIkcoEj9jWMO43VOOULpePB8aXSLsl
         4tJUh3fONAR9pgv0G1ymR3fb7R8k7O3JAJOTrscs6h0mpvF+B/tAknITU5M+LUWiQhFA
         NlfrmGqRZZHr+F7a8G8nIdtIp8oGfNeMk1CESkXYEwnHWJcX8XnrpwxhAQpAXc45dltq
         +ebaajvroqVZBuB+W4NlY4HDbgiUzTDPtvDucR8fpO+/GBnc8Z/fOc4Ief1b98O9eu6E
         HYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sWZM/vSQvIFpCrYKTig+vbD3wjvs5x43S2+zwby2k3U=;
        b=UEhOA66lG12K2+C9dwb/sq3+ciQDNA9CqcKUzbEbJGeFfZseuN/8lxL5hUTjrhEORV
         DiuVzjbmZxzk0L8qV3slsmsH1aGaGUp8QhNf2Q9TaRW6jlRCxf0bm2Z5zyHk7TXkyEyc
         hQRZbEsZUiGk/KydFO6apoakuezcbDJidrB0Uf7jvraFBrABswqmuor83XJmJDUpYgnl
         anfa1xEAV4OUB9Lb8mnDCUjYZk9WcZDGq2S9CMwmbmPLDWZ+MaIVvnePjpzhvTtnodP1
         Puuyoihe8D4wLYSZ33lcwoT21qvNpsIFM+DZNdCbbUffJSlaWNPJFEFvRA1YGS8MHmL+
         8lvQ==
X-Gm-Message-State: ANhLgQ2UpEmWIbgjThtvx2KCBXX9uEbZ2so7RFOLd7jydf/r41L/w2oe
        kT8OWwxhOVBht6HAX6ppGpmnApTuFT4=
X-Google-Smtp-Source: ADFU+vtWlIZcq34v4lHPCUPfQYwlcxo+6OQSapW+EnDAJnGtypgBnBYwPnuihUNsjw1JDkIkaiD9YA==
X-Received: by 2002:ac8:3778:: with SMTP id p53mr3155337qtb.158.1583340279528;
        Wed, 04 Mar 2020 08:44:39 -0800 (PST)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id m26sm2024089qtf.63.2020.03.04.08.44.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Mar 2020 08:44:38 -0800 (PST)
Message-ID: <1583340277.7365.153.camel@lca.pw>
Subject: Re: [PATCH 2/3] kcsan: Update Documentation/dev-tools/kcsan.rst
From:   Qian Cai <cai@lca.pw>
To:     Marco Elver <elver@google.com>
Cc:     paulmck@kernel.org, andreyknvl@google.com, glider@google.com,
        dvyukov@google.com, kasan-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org
Date:   Wed, 04 Mar 2020 11:44:37 -0500
In-Reply-To: <20200304162541.46663-2-elver@google.com>
References: <20200304162541.46663-1-elver@google.com>
         <20200304162541.46663-2-elver@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 2020-03-04 at 17:25 +0100, 'Marco Elver' via kasan-dev wrote:
>  Selective analysis
>  ~~~~~~~~~~~~~~~~~~
> @@ -111,8 +107,8 @@ the below options are available:
>  
>  * Disabling data race detection for entire functions can be accomplished by
>    using the function attribute ``__no_kcsan`` (or ``__no_kcsan_or_inline`` for
> -  ``__always_inline`` functions). To dynamically control for which functions
> -  data races are reported, see the `debugfs`_ blacklist/whitelist feature.
> +  ``__always_inline`` functions). To dynamically limit for which functions to
> +  generate reports, see the `DebugFS interface`_ blacklist/whitelist feature.

As mentioned in [1], do it worth mentioning "using __no_kcsan_or_inline for
inline functions as well when CONFIG_OPTIMIZE_INLINING=y" ?

[1] https://lore.kernel.org/lkml/E9162CDC-BBC5-4D69-87FB-C93AB8B3D581@lca.pw/
