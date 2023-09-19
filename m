Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A92C5CE79A8
	for <linux-doc@archiver.kernel.org>; Tue, 19 Sep 2023 21:04:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233279AbjISVEl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 Sep 2023 17:04:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233321AbjISVEk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Sep 2023 17:04:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01976C0
        for <linux-doc@vger.kernel.org>; Tue, 19 Sep 2023 14:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695157428;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=SQ2jSb2HniT/9ZxZOqq4fZsdcqlotGNawe8KlI6XEwk=;
        b=XFHm+BMdBuTp1/oAXJImb6ZCU2++Siq4Ftw5gYjF1AjDhPvoWHHMf+GzQB/qoyxMBWfSiM
        EupZ/BMWmlb/Zm+dnG5nmtgWajN0OJxaIVDh1UEjH4Ew/BB7PeJY1xAHQ9eGNFHy/spUBT
        mphBk5G072XvefbSnssU6ZfktCFskW4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-eIRUBykjMwCw6pvVHAiSTw-1; Tue, 19 Sep 2023 17:03:42 -0400
X-MC-Unique: eIRUBykjMwCw6pvVHAiSTw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 31963185A790;
        Tue, 19 Sep 2023 21:03:42 +0000 (UTC)
Received: from rh (unknown [10.64.138.2])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id D042C492C37;
        Tue, 19 Sep 2023 21:03:41 +0000 (UTC)
Received: from localhost ([::1] helo=rh)
        by rh with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.96)
        (envelope-from <dchinner@redhat.com>)
        id 1qihsg-001H19-1L;
        Wed, 20 Sep 2023 07:03:38 +1000
Date:   Wed, 20 Sep 2023 07:03:36 +1000
From:   Dave Chinner <dchinner@redhat.com>
To:     Charles Han <hanchunchao@inspur.com>
Cc:     corbet@lwn.net, djwong@kernel.org, allison.henderson@oracle.com,
        bhelgaas@google.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org
Subject: Re: [PATCH] Documentation: xfs: Remove repeated word in comments
Message-ID: <ZQoMqI/QGPWEpkEi@rh>
References: <20230918071905.296081-1-hanchunchao@inspur.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918071905.296081-1-hanchunchao@inspur.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

[cc linux-xfs@vger.kernel.org]

Hi Charles,

For future reference, can you CC the XFS list on XFS documentation
changes please?  That's much preferable to sending patches to random
developers and hoping they notice it....

On Mon, Sep 18, 2023 at 03:19:05PM +0800, Charles Han wrote:
> Remove the repeated word "the" in comments.
> 
> Signed-off-by: Charles Han <hanchunchao@inspur.com>
> ---
>  Documentation/filesystems/xfs-online-fsck-design.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/filesystems/xfs-online-fsck-design.rst b/Documentation/filesystems/xfs-online-fsck-design.rst
> index 1625d1131093..a0678101a7d0 100644
> --- a/Documentation/filesystems/xfs-online-fsck-design.rst
> +++ b/Documentation/filesystems/xfs-online-fsck-design.rst
> @@ -1585,7 +1585,7 @@ The transaction sequence looks like this:
>  2. The second transaction contains a physical update to the free space btrees
>     of AG 3 to release the former BMBT block and a second physical update to the
>     free space btrees of AG 7 to release the unmapped file space.
> -   Observe that the the physical updates are resequenced in the correct order
> +   Observe that the physical updates are resequenced in the correct order

Change looks fine, though.

Reviewed: Dave Chinner <dchinner@redhat.com>

-- 
Dave Chinner
dchinner@redhat.com

