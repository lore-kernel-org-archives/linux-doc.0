Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47176C433F5
	for <linux-doc@archiver.kernel.org>; Mon, 10 Oct 2022 13:43:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbiJJNnz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 Oct 2022 09:43:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbiJJNny (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Oct 2022 09:43:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6D9C65258
        for <linux-doc@vger.kernel.org>; Mon, 10 Oct 2022 06:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665409433;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vAce1GTc/xVR4humhuRjKOZBURsP/bzwXLd8EnMO1IM=;
        b=SIPMWgA73wytnb9eqtTTEZlwTGve6f406Yq1sTtAsZn1DKgGWq26/BRoeN+D3DC611HH/p
        Uuwu1JveFoUxIuCuMVZ1Tvk2pSDsTKyID0dfQYYDUbmR9sAYN3dlvt4CgCdX7Be2TOEhL1
        hH095b5GYzklocDcjVXq6yaubluh5d8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-320-bdyjq_JnNYmBWs-VnBOx9g-1; Mon, 10 Oct 2022 09:43:50 -0400
X-MC-Unique: bdyjq_JnNYmBWs-VnBOx9g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A01493C11EA0;
        Mon, 10 Oct 2022 13:43:49 +0000 (UTC)
Received: from localhost (unknown [10.39.193.147])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 51697404CD91;
        Mon, 10 Oct 2022 13:43:49 +0000 (UTC)
From:   Cornelia Huck <cohuck@redhat.com>
To:     Bagas Sanjaya <bagasdotme@gmail.com>,
        Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Cc:     linux-doc@vger.kernel.org, corbet@lwn.net, mst@redhat.com,
        virtualization@lists.linux-foundation.org, jasowang@redhat.com,
        kernel@collabora.com
Subject: Re: [RESEND PATCH v5 1/1] docs: driver-api: virtio: virtio on Linux
In-Reply-To: <Y0QYTq7KW9C731s0@debian.me>
Organization: Red Hat GmbH
References: <20221010064359.1324353-1-ricardo.canuelo@collabora.com>
 <20221010064359.1324353-2-ricardo.canuelo@collabora.com>
 <Y0QYTq7KW9C731s0@debian.me>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date:   Mon, 10 Oct 2022 15:43:46 +0200
Message-ID: <877d17n699.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Oct 10 2022, Bagas Sanjaya <bagasdotme@gmail.com> wrote:

> On Mon, Oct 10, 2022 at 08:43:59AM +0200, Ricardo Ca=C3=B1uelo wrote:
>> +
>> +References
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +_`[1]` Virtio Spec v1.2:
>> +https://docs.oasis-open.org/virtio/virtio/v1.2/virtio-v1.2.html
>> +
>> +Check for later versions of the spec as well.
>> +
>
> The version checking should be made comment (not visible on the output):
>
> ---- >8 ----
> diff --git a/Documentation/driver-api/virtio/virtio.rst b/Documentation/d=
river-api/virtio/virtio.rst
> index 70b3aa6bcf5518..4f3abbec4e8b2c 100644
> --- a/Documentation/driver-api/virtio/virtio.rst
> +++ b/Documentation/driver-api/virtio/virtio.rst
> @@ -134,7 +134,7 @@ References
>  _`[1]` Virtio Spec v1.2:
>  https://docs.oasis-open.org/virtio/virtio/v1.2/virtio-v1.2.html
>=20=20
> -Check for later versions of the spec as well.
> +.. Check for later versions of the spec as well.
>=20=20
>  _`[2]` Virtqueues and virtio ring: How the data travels
>  https://www.redhat.com/en/blog/virtqueues-and-virtio-ring-how-data-trave=
ls
>
>> diff --git a/Documentation/driver-api/virtio/writing_virtio_drivers.rst =
b/Documentation/driver-api/virtio/writing_virtio_drivers.rst
>> new file mode 100644
>> index 000000000000..e14c58796d25
>> --- /dev/null
>> +++ b/Documentation/driver-api/virtio/writing_virtio_drivers.rst
>> <snipped>...
>> +References
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +_`[1]` Virtio Spec v1.2:
>> +https://docs.oasis-open.org/virtio/virtio/v1.2/virtio-v1.2.html
>> +
>> +Check for later versions of the spec as well.
>
> Same reply.

I don't think we should hide that in a comment -- unless you want to
update this file every time a new version of the virtio spec gets
released.

