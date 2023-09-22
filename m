Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E7DCD4F49
	for <linux-doc@archiver.kernel.org>; Fri, 22 Sep 2023 11:19:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233664AbjIVLTt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 22 Sep 2023 07:19:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233714AbjIVLTp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 22 Sep 2023 07:19:45 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2972CD6;
        Fri, 22 Sep 2023 04:19:37 -0700 (PDT)
Received: from localhost (unknown [195.89.33.213])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id DEA262D6;
        Fri, 22 Sep 2023 11:19:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net DEA262D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1695381576; bh=xMxQCuvu/EF9gCh3Abac5iNmIbQ1N5KTCo/o0QsTH58=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=kv9HOJHOJyybM3wkK1+gj8MT45croXL4xrwnQTSlxqtvNP10NGHlrEFvv0ReMJ2Gw
         /jtXTgptLg2G4/BUpiIqXQ8mWm/h+meI8rv5JMBwP/eHUDM4SJPjzeBcyVFXfczdF0
         CjrjwjJpcNVcA/g9l6s5TQP2Isu0jbJ9TGBWjaCCj8w7UYjUZuTLdhqqtzRPqX0hL4
         5gwmaCPfZ+kB/PpzKdXD+0o/q6gC8di4uKpT9E6AEXvN0a3DOHEPfbUOlM5YDMf6bu
         yBEx1EPCqtpChPQzboxDlxTRHavHlfGCWYM8yAagswDmAzjdjnKGegWBtqotzwPuy+
         kbJDnTWXjiv4g==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Wang Jinchao <wangjinchao@xfusion.com>,
        David Hildenbrand <david@redhat.com>,
        Oscar Salvador <osalvador@suse.de>, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     xulei <stone.xulei@xfusion.com>
Subject: Re: [PATCH] memory-hotplug.rst: fix wrong /sys/device/ path
In-Reply-To: <ZQz1NUATBMOb3RT+@fedora>
References: <ZQz1NUATBMOb3RT+@fedora>
Date:   Fri, 22 Sep 2023 05:19:34 -0600
Message-ID: <87lecy78vt.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wang Jinchao <wangjinchao@xfusion.com> writes:

> Actually, it should be /sys/devices/
>
> Signed-off-by: Wang Jinchao <wangjinchao@xfusion.com>
> ---
>  Documentation/admin-guide/mm/memory-hotplug.rst | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied, thanks.

jon
