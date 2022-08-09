Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F1AC19F2D
	for <linux-doc@archiver.kernel.org>; Tue,  9 Aug 2022 14:28:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbiHIO2r (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 9 Aug 2022 10:28:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbiHIO2r (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Aug 2022 10:28:47 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 76532B1DF
        for <linux-doc@vger.kernel.org>; Tue,  9 Aug 2022 07:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660055325;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QoOWzRRd0gXzzd5MjvJGUJ8tTQa3lBXK43u6AGIzVrM=;
        b=M8nIlK1YwzimVzR2NMIRYO1NMrME9+T88ET+BxgFFWRG3DEV3sqBJEJqT5Vuy1BrGEkjd5
        3qe1kVG9mguAhP6zhInV0tLJEePZn0Dxr834gyynwpucza8QQYBBXBZyivxwbeK7kvici7
        HiqspwcXyhgVFoQ1UfjMWs7WbgK/cik=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-IknCk1rBNTiMBIW7bg8vmQ-1; Tue, 09 Aug 2022 10:28:42 -0400
X-MC-Unique: IknCk1rBNTiMBIW7bg8vmQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0539F802D1C;
        Tue,  9 Aug 2022 14:28:42 +0000 (UTC)
Received: from localhost (unknown [10.39.193.230])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id A66EEC15BA1;
        Tue,  9 Aug 2022 14:28:41 +0000 (UTC)
From:   Cornelia Huck <cohuck@redhat.com>
To:     Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
        linux-doc@vger.kernel.org
Cc:     virtualization@lists.linux-foundation.org, mst@redhat.com,
        jasowang@redhat.com, kernel@collabora.com, bagasdotme@gmail.com
Subject: Re: [PATCH v2 2/2] docs: driver-api: virtio: virtio on Linux
In-Reply-To: <87iln1r2hv.fsf@rcn-XPS-13-9305.i-did-not-set--mail-host-address--so-tickle-me>
Organization: Red Hat GmbH
References: <20220804105914.3707389-1-ricardo.canuelo@collabora.com>
 <20220804105914.3707389-3-ricardo.canuelo@collabora.com>
 <87bksuetk5.fsf@redhat.com>
 <87iln1r2hv.fsf@rcn-XPS-13-9305.i-did-not-set--mail-host-address--so-tickle-me>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date:   Tue, 09 Aug 2022 16:28:40 +0200
Message-ID: <87wnbhcwyv.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Aug 09 2022, Ricardo Ca=C3=B1uelo <ricardo.canuelo@collabora.com> w=
rote:

> How about this as an introduction?
>
>     Virtio is an open standard that defines a protocol to communicate
>     drivers and devices of different types, see Chapter 5 ("Device

"...that defines a protocol for communication between drivers and
devices of different device types, see..."

>     Types") of the virtio spec `[1]`_. Originally developed as a
>     standard for paravirtualized devices implemented by a hypervisor, it
>     can be used to interface any compliant device (real or emulated)
>     with a driver.
>
>     For illustrative purposes, this document will focus on the common
>     case of a Linux kernel running in a virtual machine and using
>     paravirtualized devices provided by the hypervisor, which exposes
>     them as virtio devices via standard mechanisms such as PCI.

Sounds good to me.

(...)

> Ok, I'll simplify the intro to this:
>
>     This document serves as a basic guideline for driver programmers
>     that need to hack a new virtio driver or understand the essentials
>     of the existing ones. See :ref:`Virtio on Linux <virtio>` for a
>     general overview of virtio.

Ok.

