Return-Path: <SRS0=mvKV=4T=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98892C3F2CD
	for <linux-doc@archiver.kernel.org>; Mon,  2 Mar 2020 20:04:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7918021556
	for <linux-doc@archiver.kernel.org>; Mon,  2 Mar 2020 20:04:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725911AbgCBUEZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 2 Mar 2020 15:04:25 -0500
Received: from ms.lwn.net ([45.79.88.28]:58456 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725781AbgCBUEY (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 2 Mar 2020 15:04:24 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 64DF3823;
        Mon,  2 Mar 2020 20:04:24 +0000 (UTC)
Date:   Mon, 2 Mar 2020 13:04:23 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     lxsameer@gnu.org
Cc:     rdunlap@infradead.org, linux-doc@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH v4 1/2] Documentation: Converted the `kobject.txt` to
 rst format
Message-ID: <20200302130423.1b0ed8b9@lwn.net>
In-Reply-To: <20200225222125.61874-1-lxsameer@gnu.org>
References: <20200225222125.61874-1-lxsameer@gnu.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 25 Feb 2020 22:21:24 +0000
lxsameer@gnu.org wrote:

> Reviewed and converted the `kobject.txt` format to rst in place.
> 
> Signed-off-by: Sameer Rahmani <lxsameer@gnu.org>

Both patches applied, thanks.

jon
