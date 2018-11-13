Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5B0F87D08A
	for <lwn-linux-doc@archive.lwn.net>; Tue, 13 Nov 2018 22:35:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbeKNIfv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 14 Nov 2018 03:35:51 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:44686 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbeKNIfv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Nov 2018 03:35:51 -0500
Received: by mail-ed1-f66.google.com with SMTP id n19-v6so11932668edq.11
        for <linux-doc@vger.kernel.org>; Tue, 13 Nov 2018 14:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eiuGy56YjSeBl2R6VQNnLDXN3B+e/UKb3wQeFWnwDjU=;
        b=SznPCrXcAg3Bb1h6++IdhwALQoBUqLwMkH7QhZH1y74L3K0uQDuewa7+xoKiDFbJjJ
         lKK5xg0gZ2UVwiBjOw+/cED5CZ0GY+pvx6AA1JGbmXQn/jMXFhNP0CUDjJpxLYs3J6u2
         AKEDGtlLex6+SAIaSVANuXYXvvRwpHBv0O0qwCuTx7Dh/3oCxVF06iscWNOYHEJqQHVN
         HNbV7pvEdrT+qPcvPRZR6d23SjnDYVjxs+ZbqTQoKqBP+MMoNsyAvk9JwilA9VczPTx+
         /62SxtWdLs5MMbs21uwLLsbUT3biUfTYLMgs5fcreqmz+cktyWoTsTRKz598NmCSCDf6
         laSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eiuGy56YjSeBl2R6VQNnLDXN3B+e/UKb3wQeFWnwDjU=;
        b=rcozl+GIu/upM2UD3ffDwHHhca9qvKSUwbQxFiiVo24Q1T+d+e2EGvQHUXCdt3lqsD
         QapcP+916gKaJZi9QJDCrYEj29mV1pVP40+STjeJX9TOOBwwKTvcWCvgVh/WUF5SDMRp
         vEDB2IL+DACgR5eO3JTdFclidanMAsn6uPQcO2ovtSpKPOG0iVHMEw8Kh4iQ4SBWzeko
         qOVDzH78Gf58kAVXGcA1PYmQad+2bK0fwzB3jsqvkirz4kcrSNUyo/ykP+J6JDbOUuA/
         8ZNRD3XvCxRjaHM03QKHQ8aW6fp3zM8e8FovCa4guat9HK039kKTsLHc+ai4uTqRWlTB
         2Cng==
X-Gm-Message-State: AGRZ1gLkl6NEaxj4l1iFRRYUcpIqspwtNGxh0WgtKHAu4FYEIsp3bUOx
        KNSxdyzmwDDQIlCFTTdYhl2ED/TguH8eowDV3p4drQ==
X-Google-Smtp-Source: AJdET5fGmuhJaIK75HRtmn7YJcD7vesp0Jn0Zr1jp1HsGP3O2/0HtH5Cq2bcHtOi6LgY3iOkqygAxfBhbPq4ZJf1Bjs=
X-Received: by 2002:a50:983a:: with SMTP id g55mr7055080edb.143.1542148532994;
 Tue, 13 Nov 2018 14:35:32 -0800 (PST)
MIME-Version: 1.0
References: <CAG48ez0ZprqUYGZFxcrY6U3Dnwt77q1NJXzzpsn1XNkRuXVppw@mail.gmail.com>
 <d43da6ad1a3c164aa03e0f22f065591a@natalenko.name> <20181113175930.3g65rlhbaimstq7g@soleen.tm1wkky2jk1uhgkn0ivaxijq1c.bx.internal.cloudapp.net>
 <CAG48ez29kArZTU=MgsVxWbuTZZ+sCrxeQ3FkDKpmQnj_MZ5hTg@mail.gmail.com>
In-Reply-To: <CAG48ez29kArZTU=MgsVxWbuTZZ+sCrxeQ3FkDKpmQnj_MZ5hTg@mail.gmail.com>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Tue, 13 Nov 2018 14:35:21 -0800
Message-ID: <CA+CK2bDPeEsFwGAQf7f=YQ+s6aUTm-ApgFd2RR5JQQr-pi-aqg@mail.gmail.com>
Subject: Re: [PATCH V3] KSM: allow dedup all tasks memory
To:     Jann Horn <jannh@google.com>
Cc:     Oleksandr Natalenko <oleksandr@natalenko.name>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        Timofey Titovets <timofey.titovets@synesis.ru>,
        Matthew Wilcox <willy@infradead.org>, daniel@gruss.cc
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> Wait, what? Can you name specific ones? Nowadays, enabling KSM for
> untrusted VMs seems like a terrible idea to me, security-wise.

Of course it is not used to share data among different
customers/tenants, as far as I know it is used by Oracle Cloud to
merge the same pages in clear containers.

https://medium.com/cri-o/intel-clear-containers-and-cri-o-70824fb51811
One performance enhancing feature is the use of KSM, a recent KVM
optimized for memory sharing and boot speed. Another is the use of an
optimized Clear Containers mini-OS.

Pasha
