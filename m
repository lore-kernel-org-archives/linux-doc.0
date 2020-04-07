Return-Path: <SRS0=OmAX=5X=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AB1AC2D0EC
	for <linux-doc@archiver.kernel.org>; Tue,  7 Apr 2020 19:44:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 28B1820730
	for <linux-doc@archiver.kernel.org>; Tue,  7 Apr 2020 19:44:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbgDGToP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 7 Apr 2020 15:44:15 -0400
Received: from ms.lwn.net ([45.79.88.28]:40656 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726339AbgDGToP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 7 Apr 2020 15:44:15 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 305E460C;
        Tue,  7 Apr 2020 19:44:15 +0000 (UTC)
Date:   Tue, 7 Apr 2020 13:44:14 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     "Joakim =?UTF-8?B?TMO2bm5lZ3Jlbg==?=" <joakimlonnegren@gmail.com>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: driver-api/usb/writing_usb_driver.rst
 Updates documentation links
Message-ID: <20200407134414.77b1c34b@lwn.net>
In-Reply-To: <20200312201354.285839-1-joakimlonnegren@gmail.om>
References: <20200312201354.285839-1-joakimlonnegren@gmail.om>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 12 Mar 2020 17:13:55 -0300
"Joakim Lönnegren" <joakimlonnegren@gmail.com> wrote:

> In writing_usb_driver.rst:
> Remove link to https://www.qbik.ch/usb/devices/ since it seems to be inactive since 2013
> Update link to linux-usb mailing list archive
> 
> Signed-off-by: Joakim Lönnegren <joakimlonnegren@gmail.com>

Applied, thanks; sorry for the delay.

jon
