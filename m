Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B333C4742C
	for <linux-doc@archiver.kernel.org>; Mon, 16 Nov 2020 11:40:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B44B221F8
	for <linux-doc@archiver.kernel.org>; Mon, 16 Nov 2020 11:40:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gR9q2WW2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728870AbgKPKZn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 16 Nov 2020 05:25:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49093 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727192AbgKPKZm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 Nov 2020 05:25:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1605522341;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZA15SaFrBdZ2JrxZ5s9K6WG+0cMi5R5aaYTeZR61cdw=;
        b=gR9q2WW2bjSsKntpC5cYnwBuoqxe94xj8/Y65hphGWL0x4rWXYKrSy3clB9SMK0ka/M7Fr
        lo/n9y89LTPTZKHSLuRC8LhyDZLvagD/J2uI7Qkj1WRofh2iA180hX7vqPUNzFwCR0+4ub
        Kskh+sFyqLEO8FYXWCwrBOS5FMrBnR0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-bry8kwMbMdeZdadrODdmLg-1; Mon, 16 Nov 2020 05:25:37 -0500
X-MC-Unique: bry8kwMbMdeZdadrODdmLg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79A00809DD3;
        Mon, 16 Nov 2020 10:25:35 +0000 (UTC)
Received: from gondolin (ovpn-113-142.ams2.redhat.com [10.36.113.142])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BE61B5B4BB;
        Mon, 16 Nov 2020 10:25:32 +0000 (UTC)
Date:   Mon, 16 Nov 2020 11:25:30 +0100
From:   Cornelia Huck <cohuck@redhat.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Alexander Egorenkov <egorenar@linux.ibm.com>,
        Alexandra Winter <wintera@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Julian Wiedmann <jwi@linux.ibm.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Vineeth Vijayan <vneethv@linux.ibm.com>,
        linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v4 04/27] s390: fix kernel-doc markups
Message-ID: <20201116112530.7fdf2020.cohuck@redhat.com>
In-Reply-To: <4a9df42dfb68aed6b4a4882f6dccabf00ce932cd.1605521731.git.mchehab+huawei@kernel.org>
References: <cover.1605521731.git.mchehab+huawei@kernel.org>
        <4a9df42dfb68aed6b4a4882f6dccabf00ce932cd.1605521731.git.mchehab+huawei@kernel.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 16 Nov 2020 11:18:00 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> fix one typo:
> 	ccw driver -> ccw_driver
> 
> and one function rename.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  arch/s390/include/asm/ccwdev.h | 2 +-
>  arch/s390/include/asm/cio.h    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

