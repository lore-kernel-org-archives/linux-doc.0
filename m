Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA642C433FE
	for <linux-doc@archiver.kernel.org>; Tue, 11 Oct 2022 07:58:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbiJKH6F (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 11 Oct 2022 03:58:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbiJKH6F (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Oct 2022 03:58:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6A35402EE
        for <linux-doc@vger.kernel.org>; Tue, 11 Oct 2022 00:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665475082;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=y5IMc410YeVnl3Sqez6F7ezBcpM1qVzhXkGhzsygGr4=;
        b=TsDK03+DCO1R8t4wQt6oel2C9njKtloBIFm066f9EKsLJALjU4+cyjCIRFFeygiWlpx6Iq
        8h0/aYgi0SJ14KVE39ywt6KorKd+dN9qvIHiW0FpgaU2EB5Y7Md5WlRk8NgGhjn+5/zBX3
        VdfU4CQXCUheJqGatLAA13CPLWsMnTo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-erze4i6pP1GBdBKQbyaorQ-1; Tue, 11 Oct 2022 03:57:59 -0400
X-MC-Unique: erze4i6pP1GBdBKQbyaorQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F44F882825;
        Tue, 11 Oct 2022 07:57:59 +0000 (UTC)
Received: from localhost (unknown [10.39.193.75])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id B08A11402BD9;
        Tue, 11 Oct 2022 07:57:58 +0000 (UTC)
From:   Cornelia Huck <cohuck@redhat.com>
To:     Bagas Sanjaya <bagasdotme@gmail.com>,
        "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
        linux-doc@vger.kernel.org, corbet@lwn.net,
        virtualization@lists.linux-foundation.org, jasowang@redhat.com,
        kernel@collabora.com
Subject: Re: [RESEND PATCH v5 1/1] docs: driver-api: virtio: virtio on Linux
In-Reply-To: <9732990d-f362-fd38-4855-48f226da94a8@gmail.com>
Organization: Red Hat GmbH
References: <20221010064359.1324353-1-ricardo.canuelo@collabora.com>
 <20221010064359.1324353-2-ricardo.canuelo@collabora.com>
 <Y0QYTq7KW9C731s0@debian.me> <877d17n699.fsf@redhat.com>
 <20221010130951-mutt-send-email-mst@kernel.org>
 <8735buetuu.fsf@redhat.com>
 <9732990d-f362-fd38-4855-48f226da94a8@gmail.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date:   Tue, 11 Oct 2022 09:57:57 +0200
Message-ID: <87zge2dc6y.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 11 2022, Bagas Sanjaya <bagasdotme@gmail.com> wrote:

> On 10/11/22 13:51, Cornelia Huck wrote:
>> On Mon, Oct 10 2022, "Michael S. Tsirkin" <mst@redhat.com> wrote:
>>=20
>>> On Mon, Oct 10, 2022 at 03:43:46PM +0200, Cornelia Huck wrote:
>>>> On Mon, Oct 10 2022, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>>>>
>>>>> On Mon, Oct 10, 2022 at 08:43:59AM +0200, Ricardo Ca=C3=B1uelo wrote:
>>>>>> +
>>>>>> +References
>>>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>>> +
>>>>>> +_`[1]` Virtio Spec v1.2:
>>>>>> +https://docs.oasis-open.org/virtio/virtio/v1.2/virtio-v1.2.html
>>>>>> +
>>>>>> +Check for later versions of the spec as well.
>>>>>> +
>>>>>
>>>>> The version checking should be made comment (not visible on the outpu=
t):
>>>>>
>>>>> ---- >8 ----
>>>>> diff --git a/Documentation/driver-api/virtio/virtio.rst b/Documentati=
on/driver-api/virtio/virtio.rst
>>>>> index 70b3aa6bcf5518..4f3abbec4e8b2c 100644
>>>>> --- a/Documentation/driver-api/virtio/virtio.rst
>>>>> +++ b/Documentation/driver-api/virtio/virtio.rst
>>>>> @@ -134,7 +134,7 @@ References
>>>>>  _`[1]` Virtio Spec v1.2:
>>>>>  https://docs.oasis-open.org/virtio/virtio/v1.2/virtio-v1.2.html
>>>>>=20=20
>>>>> -Check for later versions of the spec as well.
>>>>> +.. Check for later versions of the spec as well.
>>>>>=20=20
>>>>>  _`[2]` Virtqueues and virtio ring: How the data travels
>>>>>  https://www.redhat.com/en/blog/virtqueues-and-virtio-ring-how-data-t=
ravels
>>>>>
>>>>>> diff --git a/Documentation/driver-api/virtio/writing_virtio_drivers.=
rst b/Documentation/driver-api/virtio/writing_virtio_drivers.rst
>>>>>> new file mode 100644
>>>>>> index 000000000000..e14c58796d25
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/driver-api/virtio/writing_virtio_drivers.rst
>>>>>> <snipped>...
>>>>>> +References
>>>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>>> +
>>>>>> +_`[1]` Virtio Spec v1.2:
>>>>>> +https://docs.oasis-open.org/virtio/virtio/v1.2/virtio-v1.2.html
>>>>>> +
>>>>>> +Check for later versions of the spec as well.
>>>>>
>>>>> Same reply.
>>>>
>>>> I don't think we should hide that in a comment -- unless you want to
>>>> update this file every time a new version of the virtio spec gets
>>>> released.
>>>
>>> What do you suggest? Just http://docs.oasis-open.org/virtio/virtio/ ?
>>=20
>> That one is ugly, as it is just a directory listing... my preference is
>> to link to the latest version at the time of writing, and mentioning
>> that there may be later versions available, i.e. what the patch does
>> right now.
>>=20
>
> IMO, we can link to current spec version and update it as newer version
> becomes public; without adding "check for later version" comment note.

Is it really that important to update? Unless the virtio innards change
radically, looking at an older version is likely to be sufficient.

["We should update it" is likely to become "Oh, we should have updated
it some time ago" IME :)]

