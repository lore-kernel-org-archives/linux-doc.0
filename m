Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E9C4C19F2A
	for <linux-doc@archiver.kernel.org>; Thu, 11 Aug 2022 13:19:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235020AbiHKNT1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 11 Aug 2022 09:19:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234050AbiHKNT0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 Aug 2022 09:19:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D9AB481680
        for <linux-doc@vger.kernel.org>; Thu, 11 Aug 2022 06:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660223964;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=p0uKFDfXP8UK2kv9F4U2RkkSlS76ekQt9UIZaGMUKKM=;
        b=Uafey8io5mM7CDaXm4CAF5bY4+Nhbsx4+0sbBmgpnjpDEouZIEXj5JaudBeFqJt0xLndbk
        MgjGBkH/6OkecBI6AHZmB5q/eppM0XJ6Mk48dcs1SOBlenMx9a01FGsb6z6imJ9Tc35QD3
        hAIw/Apf0HmekzFknqngKt4YpKWtUbM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-jASUlZ3DM8WAWgojT95a5Q-1; Thu, 11 Aug 2022 09:19:23 -0400
X-MC-Unique: jASUlZ3DM8WAWgojT95a5Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E7BA3C01DA8;
        Thu, 11 Aug 2022 13:19:23 +0000 (UTC)
Received: from localhost (unknown [10.39.193.95])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id C70132166B26;
        Thu, 11 Aug 2022 13:19:22 +0000 (UTC)
From:   Cornelia Huck <cohuck@redhat.com>
To:     Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
        linux-doc@vger.kernel.org
Cc:     virtualization@lists.linux-foundation.org, mst@redhat.com,
        jasowang@redhat.com, kernel@collabora.com, bagasdotme@gmail.com
Subject: Re: [PATCH v4 1/2] virtio: kerneldocs fixes and enhancements
In-Reply-To: <20220810094004.1250-2-ricardo.canuelo@collabora.com>
Organization: Red Hat GmbH
References: <20220810094004.1250-1-ricardo.canuelo@collabora.com>
 <20220810094004.1250-2-ricardo.canuelo@collabora.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date:   Thu, 11 Aug 2022 15:19:21 +0200
Message-ID: <87fsi2dijq.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 10 2022, Ricardo Ca=C3=B1uelo <ricardo.canuelo@collabora.com> w=
rote:

> Fix variable names in some kerneldocs, naming in others.
> Add kerneldocs for struct vring_desc and vring_interrupt.
>
> Signed-off-by: Ricardo Ca=C3=B1uelo <ricardo.canuelo@collabora.com>
> ---
>  drivers/virtio/virtio_ring.c     |  8 ++++++++
>  include/linux/virtio.h           |  6 +++---
>  include/linux/virtio_config.h    |  6 +++---
>  include/uapi/linux/virtio_ring.h | 16 +++++++++++-----
>  4 files changed, 25 insertions(+), 11 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

