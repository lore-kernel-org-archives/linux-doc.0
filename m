Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5AC137D0DA
	for <lwn-linux-doc@archive.lwn.net>; Wed, 21 Mar 2018 15:18:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752474AbeCUPSV (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 21 Mar 2018 11:18:21 -0400
Received: from ms.lwn.net ([45.79.88.28]:50018 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752385AbeCUPSV (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 21 Mar 2018 11:18:21 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id B17EF536;
        Wed, 21 Mar 2018 15:18:20 +0000 (UTC)
Date:   Wed, 21 Mar 2018 09:18:19 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Eric Engestrom <eric.engestrom@imgtec.com>
Cc:     <linux-kernel@vger.kernel.org>, Jiri Kosina <trivial@kernel.org>,
        <linux-doc@vger.kernel.org>
Subject: Re: [trivial PATCH] Documentation/sparse: fix typo
Message-ID: <20180321091819.3d519a2c@lwn.net>
In-Reply-To: <20180313111128.5803-1-eric.engestrom@imgtec.com>
References: <20180313111128.5803-1-eric.engestrom@imgtec.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 13 Mar 2018 11:10:58 +0000
Eric Engestrom <eric.engestrom@imgtec.com> wrote:

>  If the function enters and exits without the lock held, acquiring and
>  releasing the lock inside the function in a balanced way, no
> -annotation is needed.  The tree annotations above are for cases where
> +annotation is needed.  The three annotations above are for cases where
>  sparse would otherwise report a context imbalance.

Applied to the docs tree, thanks.

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
