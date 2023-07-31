Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA2DC001DE
	for <linux-doc@archiver.kernel.org>; Mon, 31 Jul 2023 15:57:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231449AbjGaP47 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 31 Jul 2023 11:56:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233083AbjGaP4f (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 31 Jul 2023 11:56:35 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6645819AB;
        Mon, 31 Jul 2023 08:56:30 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 3E56C2B0;
        Mon, 31 Jul 2023 15:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3E56C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1690818989; bh=170VgdjyfqLYYynBIfUDZpuFnGNn32j6gmkZ22Ep7Hg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=fm46Fr+urb/tVaTP9PSofOV0EvGoO+WKdS42Cq2Ri5DJ/z9gxDw/hLanGwSlpMHJ9
         9GTQmM3C9qicj9Y+eLIR9pUWZqkJ8GKc4e9/pkHfJ7UwGifaVLTDCdn7q/JXLnBAxe
         jSIFIRWDeVtp0dVorBUuK7OcItFcljl34lv3wqiCPe2Cq+ypwOggLPa208J4q6oVfI
         SbePxHLnRr9Vz0KC9Rpsp61rjX5acSulajoeWT7ZnohiDK+c935X0B4hmpo/1i1PLj
         nfjLvDS6hNUCEV7EkBjMvkZwTdyMeQCNBHf5MylGXcBkCTYLXH0nhbugUh7INpmYFF
         cqZU+jRe3tT/w==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Docs: kernel-parameters: sort the LEGEND list
In-Reply-To: <20230725174247.32393-1-rdunlap@infradead.org>
References: <20230725174247.32393-1-rdunlap@infradead.org>
Date:   Mon, 31 Jul 2023 09:56:28 -0600
Message-ID: <87jzugdqhf.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Randy Dunlap <rdunlap@infradead.org> writes:

> Sort the list of kernel build options and hardware support options.
> Add a comment that the list should be kept sorted instead of having
> new options inserted willy nilly.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> ---
>  Documentation/admin-guide/kernel-parameters.rst |   23 +++++++-------
>  1 file changed, 12 insertions(+), 11 deletions(-)

Applied, thanks.

jon
