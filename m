Return-Path: <SRS0=VNB8=6S=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2088CC3A5A9
	for <linux-doc@archiver.kernel.org>; Mon,  4 May 2020 09:21:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE9B2206B9
	for <linux-doc@archiver.kernel.org>; Mon,  4 May 2020 09:21:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="dQ4UhHIP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728192AbgEDJVJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 4 May 2020 05:21:09 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:37831 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726467AbgEDJVJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 4 May 2020 05:21:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588584068; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=z3mUepLM3WsniLD5TRfWqfHrgRQVjA/uOj1ZMRdcoTI=; b=dQ4UhHIPNtMYPS0mJvXN1SVHl+wQHnGDnWt4Bzo61WC+F8/t2RVxnUnVOfOMHIYooR0kJA24
 ftx/Ss5CC1/ILkooc7Yl2gPTpv5vK2LLAnw3brB0VhEQR1Dd7NPX0PmFEpwIkORVlINjaNKq
 0zSwQQwJIAAsJq/Y//yGh7Zv04k=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyIzNjUxMiIsICJsaW51eC1kb2NAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eafde84.7f2b80940998-smtp-out-n04;
 Mon, 04 May 2020 09:21:08 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 55185C44788; Mon,  4 May 2020 09:21:07 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi [88.114.240.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7D2F6C433F2;
        Mon,  4 May 2020 09:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7D2F6C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kvalo@codeaurora.org
From:   Kalle Valo <kvalo@codeaurora.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Stanislav Yakovlev <stas.yakovlev@gmail.com>,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH 25/37] docs: networking: device drivers: convert intel/ipw2200.txt to ReST
References: <cover.1588344146.git.mchehab+huawei@kernel.org>
        <b7428138935499bec38daf284f222d13c6f4f6b0.1588344146.git.mchehab+huawei@kernel.org>
Date:   Mon, 04 May 2020 12:21:02 +0300
In-Reply-To: <b7428138935499bec38daf284f222d13c6f4f6b0.1588344146.git.mchehab+huawei@kernel.org>
        (Mauro Carvalho Chehab's message of "Fri, 1 May 2020 16:44:47 +0200")
Message-ID: <87h7wwdpj5.fsf@kamboji.qca.qualcomm.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> - add SPDX header;
> - adjust titles and chapters, adding proper markups;
> - comment out text-only TOC from html/pdf output;
> - use copyright symbol;
> - use :field: markup;
> - mark code blocks and literals as such;
> - mark tables as such;
> - adjust identation, whitespaces and blank lines where needed;
> - add to networking/index.rst.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Kalle Valo <kvalo@codeaurora.org>

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
