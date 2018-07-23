Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CACEA7D071
	for <lwn-linux-doc@archive.lwn.net>; Mon, 23 Jul 2018 15:33:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388251AbeGWQfG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 23 Jul 2018 12:35:06 -0400
Received: from ms.lwn.net ([45.79.88.28]:34840 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387995AbeGWQfF (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 23 Jul 2018 12:35:05 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id D89439B0;
        Mon, 23 Jul 2018 15:33:19 +0000 (UTC)
Date:   Mon, 23 Jul 2018 09:33:18 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Siddaraju DH <siddarajudh@gmail.com>
Cc:     john.stultz@linaro.org, tglx@linutronix.de,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] timekeeping.txt: Correct maxCount of n-bit binary
 counter
Message-ID: <20180723093318.136fd72b@lwn.net>
In-Reply-To: <20180719163651.19360-1-siddarajudh@gmail.com>
References: <20180719163651.19360-1-siddarajudh@gmail.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 19 Jul 2018 22:06:51 +0530
Siddaraju DH <siddarajudh@gmail.com> wrote:

> A n-bit binary counter can count a maximum of 2^n events and the count
> value ranges from 0 to (2^n)-1
> 
> Signed-off-by: Siddaraju DH <siddarajudh@gmail.com>

Applied, thanks.

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
