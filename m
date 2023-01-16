Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2589C54EBE
	for <linux-doc@archiver.kernel.org>; Mon, 16 Jan 2023 23:25:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235454AbjAPXZj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 16 Jan 2023 18:25:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235515AbjAPXZH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 Jan 2023 18:25:07 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B74C422DF6;
        Mon, 16 Jan 2023 15:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=Xr9BAdNTpgJq5wQzXIQaXKmEjS8lAiRm6EwMutgj0P8=; b=UJWyHOFdfC4ZKIJKCOa4p+a766
        FvYRJm9WvP+X/xvEPN36y7nIDrfEMP37NcpYDTtm2dMkp5qDttiHl+R6n5gu2UgEg8eQpky6DMZhv
        yd3t2Vvo0vuaI40JPphN1LczL4byWUbwG8A5JphTuFqjy3NjSVANGKcoVUL3e+/as9FQAsWFjqtZ3
        /6FO1A+jbmoRyDD37oBkg5D0erDZZcorkG9Zc4kOK4SoEWeZwwO0m1hZP7HR5YMg84DYAJLXUclaw
        C0x++g3q/4ONkIiq3rPWOM2O5Vgl2Vnq623f4V833/gNxGSaKAABg/sZZ+cqA0VNY6kF9ds0eOeI4
        mcW1JkeQ==;
Received: from [2601:1c2:d80:3110::9307]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1pHYgO-00CF2M-8b; Mon, 16 Jan 2023 23:14:28 +0000
Message-ID: <626d1d61-9f00-4b4e-631f-6652a4520393@infradead.org>
Date:   Mon, 16 Jan 2023 15:14:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] Documentation: Avoid duplicate Kconfig inclusion
Content-Language: en-US
To:     Peter Foley <pefoley2@pefoley.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20230114-doc-v2-1-853a8434ac95@pefoley.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230114-doc-v2-1-853a8434ac95@pefoley.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 1/16/23 14:58, Peter Foley wrote:
> Documentation/Kconfig is already included from top-level, avoid
> including it again from lib/Kconfig.debug.
> 
> Signed-off-by: Peter Foley <pefoley2@pefoley.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> Changes in v2:
> - Add a top-level Documentation entry instead of nesting under Kernel hacking
> - Link to v1: https://lore.kernel.org/r/20230114-doc-v1-1-efec2689e423@pefoley.com
> ---
>  Documentation/Kconfig | 10 ++++++++--
>  lib/Kconfig.debug     |  2 --
>  2 files changed, 8 insertions(+), 4 deletions(-)


-- 
~Randy
