Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C25C433F5
	for <linux-doc@archiver.kernel.org>; Thu,  2 Dec 2021 17:46:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355721AbhLBRuE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 2 Dec 2021 12:50:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46693 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1348220AbhLBRuE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 Dec 2021 12:50:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638467201;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=s/ssuxzyNcKCrVX4u0TMNP5uZFbfqJerS3VLo4rK8Bk=;
        b=O5PxMf12JDNpPlMSn/NYnZnewSaSjOuTRVAp1Am8SvxQ+nYolxsqtB41R1lmytY8v7vN1b
        UYLUQ2t2jY5DjO3T6u6xloqwk87iNRvpNOiHlfPwNB5bdM0ZedNEIbBprfnCTCTtDmzQuq
        v5ayxE7baI12/cKv46TyiWFf12wnbv0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-uUNE3tCmNG-7HfIPpd2fXw-1; Thu, 02 Dec 2021 12:46:38 -0500
X-MC-Unique: uUNE3tCmNG-7HfIPpd2fXw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F3FE18C8C03;
        Thu,  2 Dec 2021 17:46:36 +0000 (UTC)
Received: from localhost (unknown [10.39.192.13])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 349E3197FC;
        Thu,  2 Dec 2021 17:46:35 +0000 (UTC)
From:   Cornelia Huck <cohuck@redhat.com>
To:     Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Cc:     Alex Williamson <alex.williamson@redhat.com>, kvm@vger.kernel.org,
        Kirti Wankhede <kwankhede@nvidia.com>,
        Max Gurtovoy <mgurtovoy@nvidia.com>,
        Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
        Yishai Hadas <yishaih@nvidia.com>
Subject: Re: [PATCH RFC v2] vfio: Documentation for the migration region
In-Reply-To: <20211202174125.GR4670@nvidia.com>
Organization: Red Hat GmbH
References: <0-v2-45a95932a4c6+37-vfio_mig_doc_jgg@nvidia.com>
 <20211130102611.71394253.alex.williamson@redhat.com>
 <20211130185910.GD4670@nvidia.com>
 <20211130153541.131c9729.alex.williamson@redhat.com>
 <20211201031407.GG4670@nvidia.com> <20211201130314.69ed679c@omen>
 <20211201232502.GO4670@nvidia.com> <87tufrgcnz.fsf@redhat.com>
 <20211202174125.GR4670@nvidia.com>
User-Agent: Notmuch/0.33.1 (https://notmuchmail.org)
Date:   Thu, 02 Dec 2021 18:46:33 +0100
Message-ID: <87o85yhpc6.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 02 2021, Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Thu, Dec 02, 2021 at 06:05:36PM +0100, Cornelia Huck wrote:
>> On Wed, Dec 01 2021, Jason Gunthorpe <jgg@nvidia.com> wrote:
>> 
>> > On Wed, Dec 01, 2021 at 01:03:14PM -0700, Alex Williamson wrote:
>> >> But if this document is suggesting the mlx5/QEMU interpretation is the
>> >> only valid interpretations for driver authors, those clarifications
>> >> should be pushed back into the uAPI header.
>> >
>> > Can we go the other way and move more of the uAPI header text here?
>> 
>> Where should a userspace author look when they try to implement support
>> for vfio migration? I think we need to answer that question first.
>> 
>> Maybe we should separate "these are the rules that an implementation
>> must obey" from "here's a more verbose description of how things work,
>> and how you can arrive at a working implementation". The former would go
>> into the header, while the latter can go into this document. (The
>> generated documentation can be linked from the header file.)
>
> I think the usual kernel expectation now is to find userspace
> information either in man pages or in the Documentation/ html pages?
>
> The uapi header is fine to be a terse summary of what the ioctl does
> and some important points, but I wouldn't try to write a spec for
> anything complicated in a header file.

I was thinking less of a complete spec, more of "these are the fields
with some basic rules, consult $LINK for more information".

