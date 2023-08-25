Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AA0CC3DA6F
	for <linux-doc@archiver.kernel.org>; Fri, 25 Aug 2023 07:48:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240451AbjHYHsV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 25 Aug 2023 03:48:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243205AbjHYHsN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Aug 2023 03:48:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9472F1FD9;
        Fri, 25 Aug 2023 00:48:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2D3C064C2C;
        Fri, 25 Aug 2023 07:48:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76A03C433C7;
        Fri, 25 Aug 2023 07:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692949690;
        bh=8KBY+xkGvs+tWbhG1+DEDUTktwV/kRaCdyImzo401Pc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rgQ0UuHfPuRZ2Kzkboe38fZNoYRF7+ZRGBa1kfQO0C7Nisx4td34BH1D8iafciMGN
         MZC5N0SO8dWeIW/VG9x5D2t6EHxerKkjqaezxx7STXbo/1Uqp2YDq7QnhS+ahiL6hN
         gUuec67GQAZZggxfpOC9jcms13xu6irn7WZfjk2LRwRXT90uBh6SoxN9i9wuwTRzIn
         zQSd4cuOiOcdONbDhPALWKEJ8fHunLFYQdPPmjsPmmOk2BlkP1dpKw/DU40QmCTpMQ
         X/psgf5LxQMeSsqBoGCGisM2SYrr5VsWTuq+GWzQtbIBXnijuHnHe+e4Gu/UxD/P6k
         WxLxGDWE0PNTw==
Date:   Fri, 25 Aug 2023 09:48:06 +0200
From:   Christian Brauner <brauner@kernel.org>
To:     "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fork: Fix kernel-doc
Message-ID: <20230825-einhorn-deplatziert-5414bacd3cd0@brauner>
References: <20230824193644.3029141-1-willy@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230824193644.3029141-1-willy@infradead.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 24, 2023 at 08:36:44PM +0100, Matthew Wilcox wrote:
> Fix the various warnings from kernel-doc in kernel/fork.c
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---

Looks good to me,
Reviewed-by: Christian Brauner <brauner@kernel.org>
