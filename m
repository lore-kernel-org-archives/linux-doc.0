Return-Path: <SRS0=AYPK=57=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B0AC2BA19
	for <linux-doc@archiver.kernel.org>; Wed, 15 Apr 2020 14:52:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2B602076D
	for <linux-doc@archiver.kernel.org>; Wed, 15 Apr 2020 14:52:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dn8PTVf1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S371052AbgDOOwd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Apr 2020 10:52:33 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:57892 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S371018AbgDOOwb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Apr 2020 10:52:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586962350;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1kDbnhqGtMqjG8lQXCk80CQmsrtdvPEc5fw6ACqAyhw=;
        b=Dn8PTVf1PdpyUimikVhZIsB3zzwOACppvBP1j74VYhWqiQowTd4ESJxTpvQa+xn2I6hZbG
        43DeI76+d6O+ogWbWvEAqTKGGv77nwgCwX02eN5WKJ/aH9IKr0Ckd+2Dq9vy+nWcGFrHIx
        Avj6AFJi7CQe/nGW+nfdbaOsKOFoNyY=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-Jwh09L-MP16lBZBhWrPwNQ-1; Wed, 15 Apr 2020 10:52:28 -0400
X-MC-Unique: Jwh09L-MP16lBZBhWrPwNQ-1
Received: by mail-ot1-f70.google.com with SMTP id g43so55599otg.16
        for <linux-doc@vger.kernel.org>; Wed, 15 Apr 2020 07:52:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1kDbnhqGtMqjG8lQXCk80CQmsrtdvPEc5fw6ACqAyhw=;
        b=KagOf3bRG2tIvjL9FFyEI9O5RByvgma1un1wgtLMPnU8LJzSRpOTJzjHUtvmyEJ8JI
         1UVD/BUKZFnqlMMnb0iNrRQca/6qXG0QP+cWexirU3UdKi+Wpt5Fd6LZtYv9QLS24GTw
         nFBBbAwjVbXe6EOEgtXb9SoTpF7jQkiYuzxUYXhkWbb5VlxZDZyEATu2Khv/LTCASldk
         NnPTPyZHC6EAqY7M+DDT4nIuUIORwpXC0auMHBjo7oWMzV14/grAhOqBKOPasi8hNo/S
         9YgcCmPtg3kE2T21L9E9SXC/mORVv0waZtkgrgHU1M6GRwrBPwxITSdH78Zn5WKvgjME
         6oBw==
X-Gm-Message-State: AGi0Pua9ca10R+Z5h/yxn1mHnMf6hu0CnZ+A+QVF8mHZcQmhTKn11eL0
        y5wZyQNm5q2I2UgdKiUq2EihMY9PtdzcGTcLc2b/8vo1Fk1TLK/+GdmAkVRTNopnYJi7YCEeNyT
        q0B9amTrRkA733OGHnXba9jimkiEGNmF8VSg2
X-Received: by 2002:a9d:de2:: with SMTP id 89mr2906542ots.95.1586962347556;
        Wed, 15 Apr 2020 07:52:27 -0700 (PDT)
X-Google-Smtp-Source: APiQypLmVmCktd00qieZfjc3BOKQ5/p1IiZjFTHz+lHTkbXBFkFLjMuioL0TxwltuaXwGoF4kLCbcx9/6KoorQ3tcig=
X-Received: by 2002:a9d:de2:: with SMTP id 89mr2906526ots.95.1586962347345;
 Wed, 15 Apr 2020 07:52:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1586960617.git.mchehab+huawei@kernel.org> <e146506222bf13e8ef7008ac8b4547172c2faad8.1586960617.git.mchehab+huawei@kernel.org>
In-Reply-To: <e146506222bf13e8ef7008ac8b4547172c2faad8.1586960617.git.mchehab+huawei@kernel.org>
From:   Andreas Gruenbacher <agruenba@redhat.com>
Date:   Wed, 15 Apr 2020 16:52:16 +0200
Message-ID: <CAHc6FU7AKuXMtyYduqd5POOmi6nOLbi6_usmS_Jk3eJ-bK568w@mail.gmail.com>
Subject: Re: [PATCH 18/34] docs: filesystems: convert gfs2-glocks.txt to ReST
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bob Peterson <rpeterso@redhat.com>,
        cluster-devel <cluster-devel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Mauro,

I've pushed this to for-next.

Thanks,
Andreas

