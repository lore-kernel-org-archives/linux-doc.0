Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE525C19F28
	for <linux-doc@archiver.kernel.org>; Wed,  3 Aug 2022 08:10:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233103AbiHCIK3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 3 Aug 2022 04:10:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232447AbiHCIK2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Aug 2022 04:10:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4C322101FC
        for <linux-doc@vger.kernel.org>; Wed,  3 Aug 2022 01:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659514225;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZFeFt7/Q6YyFCUhtAPK93QqSOTH5I5qZoSCr2HzCN+4=;
        b=hMgk4XMCMlSAm9ghQZavvQx0vkfTbR0R4TGcF4wdBFnqONva6grm9YQuFNNzZhQEQPhxEV
        plcd4O11SuPSjb6zvlcsGaPsgCVBAcRVM5s6Huy9FofVNzLSv07t82ty0Q/Q8ebFAaw3Dw
        f/vKV9Tnrhq0dhcOKhVAeE2dhNtCqIE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-178-lpc0aCF5MumlR01nZTgtzQ-1; Wed, 03 Aug 2022 04:10:24 -0400
X-MC-Unique: lpc0aCF5MumlR01nZTgtzQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B947811E87;
        Wed,  3 Aug 2022 08:10:24 +0000 (UTC)
Received: from localhost (unknown [10.39.193.21])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EEAF90A00;
        Wed,  3 Aug 2022 08:10:24 +0000 (UTC)
From:   Cornelia Huck <cohuck@redhat.com>
To:     Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
        linux-doc@vger.kernel.org
Cc:     mst@redhat.com, kernel@collabora.com,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH] docs: driver-api: virtio: virtio on Linux
In-Reply-To: <87tu6trcrs.fsf@rcn-XPS-13-9305.i-did-not-set--mail-host-address--so-tickle-me>
Organization: Red Hat GmbH
References: <20220802124222.3563378-1-ricardo.canuelo@collabora.com>
 <87pmhi8wsg.fsf@redhat.com>
 <87tu6trcrs.fsf@rcn-XPS-13-9305.i-did-not-set--mail-host-address--so-tickle-me>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date:   Wed, 03 Aug 2022 10:10:22 +0200
Message-ID: <87mtcl928h.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 03 2022, Ricardo Ca=C3=B1uelo <ricardo.canuelo@collabora.com> w=
rote:

>> v1.2 is out now :)
>>
>> (I think it would be better to refer to the base spec directory?)
>
> Do you mean this? https://docs.oasis-open.org/virtio/virtio/
> Or should I link the source repo instead?
> https://github.com/oasis-tcs/virtio-spec

Hm... this should refer to the OASIS site, but the base directory
listing is a bit ugly. Maybe refer to v1.2, and add a note that there
might be later versions available?

