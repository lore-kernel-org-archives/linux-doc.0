Return-Path: <SRS0=pmrK=ZP=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F397C432C3
	for <linux-doc@archiver.kernel.org>; Sat, 23 Nov 2019 19:14:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F2B992068D
	for <linux-doc@archiver.kernel.org>; Sat, 23 Nov 2019 19:14:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=netronome-com.20150623.gappssmtp.com header.i=@netronome-com.20150623.gappssmtp.com header.b="wWOb0A/g"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbfKWTOP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 23 Nov 2019 14:14:15 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:35360 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbfKWTOP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 23 Nov 2019 14:14:15 -0500
Received: by mail-pf1-f195.google.com with SMTP id q13so5289056pff.2
        for <linux-doc@vger.kernel.org>; Sat, 23 Nov 2019 11:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=22ivoNBeHyPogdV069x9kCkXPo2r8doBNzJKz/A85OQ=;
        b=wWOb0A/gqLogGWKHrF7bTczcXfwYiB1JyTqTb34pz+xRYRhS5izMWqk16HsDCjNHfY
         L41lcXQbOHImsb9Y/f5H25QmF3gCgukexd7MiG1B2W19imkabzqgv7CuS5Q/BnjDbRJH
         nsMWu7l1w4jiKVenswny4N8fvpUDvV67/vkx4wEfBQr+oA6NlRWCZ8uuZDw4DdaARNuE
         O9Ko92QFOxWntdBaT1TG3H2/rEqbxyl1vpJ0nkZk15w3RtQeeQalrorkxVRsKDB+770M
         aPPBAJTU7XNda5/G3kz0qOd86u1Vj8yrKVNSH1pc7FHWvQa/v/3yuQUvGuFRXsrbv10i
         5JRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=22ivoNBeHyPogdV069x9kCkXPo2r8doBNzJKz/A85OQ=;
        b=PD2djCMZsXXO+DTmW9jOJZzwOCKwp4v/9JfOJt9hJT1eAi6r/GTiuyrEsW9NfbINiG
         Cqx3siD+rLFTar9YT/1jqiBaDGt+zh73tM+Y0xQhgz6VKTwaD1rXUuozKnGozhEF/XH4
         lFNIVhPL+r6sIau89Rh1yjTzSA81bHGO2/BOmbxSDdcAHgf+pGgJNV7EdwBNs4WB956K
         sMN/VSnwSR1+xAsmC9JtWH8oMTqzirhtu9PJiVmZtmDlfvupWgfqc7RVt7bHV55r5WQL
         yv+F7ktcz1Dsc3R11y79N4hb8vmVWP/ZRo2jyfLlUhVT63N5pcKHIszJ/uJJ0SoWBz5o
         tTQQ==
X-Gm-Message-State: APjAAAXL0JyaM9kfbEVapZAxq1spIAp5kKJJrENsqCI2gGDvMD1NvvMT
        gOXbVfvNkECQX/9+8aSl0Sgfuw==
X-Google-Smtp-Source: APXvYqxskLAiUluoLnaXCAGfk1CLUpX9f4H3yUCPS/07vbwUiY36bRuXHz+2mGcm3TAY/LpeIA44ug==
X-Received: by 2002:a65:4cc9:: with SMTP id n9mr23978036pgt.426.1574536454576;
        Sat, 23 Nov 2019 11:14:14 -0800 (PST)
Received: from cakuba.netronome.com (c-73-202-202-92.hsd1.ca.comcast.net. [73.202.202.92])
        by smtp.gmail.com with ESMTPSA id x2sm2581014pge.76.2019.11.23.11.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2019 11:14:14 -0800 (PST)
Date:   Sat, 23 Nov 2019 11:14:09 -0800
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Robert Schwebel <r.schwebel@pengutronix.de>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 0/5] docs: networking: nfc: convert from txt to rst
Message-ID: <20191123111409.75d7b2e4@cakuba.netronome.com>
In-Reply-To: <20191122074306.78179-1-r.schwebel@pengutronix.de>
References: <20191122074306.78179-1-r.schwebel@pengutronix.de>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 22 Nov 2019 08:43:01 +0100, Robert Schwebel wrote:
> Hi,
> 
> here is v2 of the series converting the NFC documentation from txt to
> rst. Thanks to Jonathan and Dave for the input.
> 
> Changes since (implicit) v1:
> 
> * replace code-block by more compact :: syntax
> 
> * really add the rst file to the index

Applied, thanks.

I have a question and potential follow up to ask for, though.

When the NFC doc gets rendered to HTML now, the "The NFC subsystem is
responsible for:" line is highlighted. I believe this always happens
when a list immediately follows an unindented line, in this case:

The NFC subsystem is responsible for:
	- NFC adapters management;
	- Polling for targets;
	- Low-level data exchange;

I've run into this writing my own docs recently, and I wonder what does
the highlight signify? My understanding is that the highlighting is
done because sphinx assumes the line proceeding the list is its
title/heading.

In most cases (like above) it's not really a heading so there should be
an empty line before the list.

Is this correct Jon?
