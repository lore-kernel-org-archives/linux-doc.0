Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C80EA7DE79
	for <lwn-linux-doc@archive.lwn.net>; Fri, 27 Apr 2018 22:51:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1759307AbeD0WvB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 27 Apr 2018 18:51:01 -0400
Received: from ms.lwn.net ([45.79.88.28]:55254 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1759215AbeD0WvA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 27 Apr 2018 18:51:00 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 0CA164B7;
        Fri, 27 Apr 2018 22:51:00 +0000 (UTC)
Date:   Fri, 27 Apr 2018 16:50:59 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Thymo van Beers <thymovanbeers@gmail.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] docs: kernel-parameters.txt: Fix whitespace
Message-ID: <20180427165059.3936a6e3@lwn.net>
In-Reply-To: <20180418185136.GA27678@thinkpad>
References: <20180418185136.GA27678@thinkpad>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 18 Apr 2018 20:51:39 +0200
Thymo van Beers <thymovanbeers@gmail.com> wrote:

> Some lines used spaces instead of tabs at line start.
> This can cause mangled lines in editors due to inconsistency.
> 
> Replace spaces for tabs where appropriate.

Applied, thanks.

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
