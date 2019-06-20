Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,URIBL_SBL,
	URIBL_SBL_A autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1F11B7D2EF
	for <lwn-linux-doc@archive.lwn.net>; Thu, 20 Jun 2019 20:09:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726225AbfFTUJj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 20 Jun 2019 16:09:39 -0400
Received: from ms.lwn.net ([45.79.88.28]:47614 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726114AbfFTUJj (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 20 Jun 2019 16:09:39 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 07FB72BA;
        Thu, 20 Jun 2019 20:09:38 +0000 (UTC)
Date:   Thu, 20 Jun 2019 14:09:37 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Stephen Kitt <steve@sk2.org>
Cc:     federico.vaga@vaga.pv.it, linux-doc@vger.kernel.org,
        keescook@chromium.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: stop suggesting strlcpy
Message-ID: <20190620140937.16c12e94@lwn.net>
In-Reply-To: <20190613162548.19792-1-steve@sk2.org>
References: <20190613162548.19792-1-steve@sk2.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 13 Jun 2019 18:25:48 +0200
Stephen Kitt <steve@sk2.org> wrote:

> Since strlcpy is deprecated, the documentation shouldn't suggest using
> it. This patch fixes the examples to use strscpy instead. It also uses
> sizeof instead of underlying constants as far as possible, to simplify
> future changes to the corresponding data structures.
> 
> Signed-off-by: Stephen Kitt <steve@sk2.org>

Applied, thanks.

jon
