Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AB4BC7DD31
	for <lwn-linux-doc@archive.lwn.net>; Mon, 26 Mar 2018 14:41:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751926AbeCZOlE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 26 Mar 2018 10:41:04 -0400
Received: from ms.lwn.net ([45.79.88.28]:54522 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751868AbeCZOlE (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 26 Mar 2018 10:41:04 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id B26542C7;
        Mon, 26 Mar 2018 14:41:03 +0000 (UTC)
Date:   Mon, 26 Mar 2018 08:41:02 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Pali =?UTF-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Masaki Ota <masaki.ota@jp.alps.com>,
        linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: alps - Update documentation for trackstick v3
 format
Message-ID: <20180326084102.333dc4ef@lwn.net>
In-Reply-To: <20180321200336.32035-1-pali.rohar@gmail.com>
References: <20180321200336.32035-1-pali.rohar@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 21 Mar 2018 21:03:36 +0100
Pali Rohár <pali.rohar@gmail.com> wrote:

> Bits for M, R and L buttons are already processed in alps. Other newly
> documented bits not yet.
> 
> Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
> ---
> This is based on information which Masaki Ota provided to us.

In the absence of screams of agony I'll assume that the change is
correct.  Applied to the docs tree, thanks.

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
