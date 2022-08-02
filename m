Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49673C19F28
	for <linux-doc@archiver.kernel.org>; Tue,  2 Aug 2022 15:56:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237206AbiHBP4v (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 2 Aug 2022 11:56:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235146AbiHBP4v (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Aug 2022 11:56:51 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C8FC30B
        for <linux-doc@vger.kernel.org>; Tue,  2 Aug 2022 08:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=2YTEddQgV3eve/kjK7FvWj0CYDE8kF529gnIudt05K8=; b=durJ8rzTa5TjusG/D0VqOozZ73
        0TBxrRR8NanWNRXemQHlc2AgiYZb0Q+sdFUDzIdsoULMtTQvZewla/ipoGW8tCDVptb9rPxndT9hJ
        /WkOQiwQ9qH/ucJzkCSVBcBx1J4KZkw4sUmAVHsstE/ihi5+HmnbepmyM1ASsmGytCYotSz7T/CR4
        zwEKEB9pGa82SctZmbEQwO+kCWpRCszUZdPjZ4AyOqobn6Cep4YlFzq4spg+bVzquTU0aLGRTGHh/
        vQfmZFDs9DS4zxnj9bCTaPJsh7iVnhi12RifV0ZhtEIzqTXvXHCnmNFM5gr1zJaepfhsVT8su8ClV
        d00mF7kg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1oIuGG-008Tko-1l; Tue, 02 Aug 2022 15:56:48 +0000
Date:   Tue, 2 Aug 2022 16:56:48 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
Cc:     linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org, mst@redhat.com,
        jasowang@redhat.com, kernel@collabora.com
Subject: Re: [PATCH] docs: driver-api: virtio: virtio on Linux
Message-ID: <YulJQKL22sB31lfU@casper.infradead.org>
References: <20220802124222.3563378-1-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220802124222.3563378-1-ricardo.canuelo@collabora.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Aug 02, 2022 at 02:42:22PM +0200, Ricardo Cañuelo wrote:
> +In this case, when the interrupt arrives :c:func:`vp_interrupt` will be
> +called and it will ultimately lead to a call to
> +:c:func:`vring_interrupt`, which ends up calling the virtqueue callback
> +function::

You don't need to use :c:func:`foo`.  You can just write foo() and the
tooling will convert it into :c:func:`foo` for you.

