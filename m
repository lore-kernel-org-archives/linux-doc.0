Return-Path: <SRS0=PdnY=D6=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9A25C4363A
	for <linux-doc@archiver.kernel.org>; Fri, 23 Oct 2020 13:38:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 784CE2192A
	for <linux-doc@archiver.kernel.org>; Fri, 23 Oct 2020 13:38:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PfdBGxLV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S372068AbgJWNil (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Oct 2020 09:38:41 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:41670 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S371982AbgJWNik (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Oct 2020 09:38:40 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09NDYJeI087810;
        Fri, 23 Oct 2020 13:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=f68vJI26CdskCy/ucIn4jhkM8wmlpjwl4MW/M1mNHhg=;
 b=PfdBGxLVfz4qeCvoJmnJEqhZdQbNZ1LH0KcIGHn1uWllnU0bExSIMwArZ086J/bcI0W/
 npbxmjzJIXAymSYSw4RZGVPRw67Xw55VB709eHh7kQqajaNOa3OcdyEw0CXukKX+gEoR
 9l3An1MhlDJtG6SnH4BISnKpCZw8L5/jiN5sXX/lqToCvdGdRA3VSIb5immyNSYw8Hmz
 hiefXPzRYqCbkt9ORvymaTfBnr4oJ3Vgk6xEUxJnOQCs9/nek1LRZ1t+eWjfHvZWl90I
 1gj0dj1JEg5ZmPDBOhgbKaLDNS3DAGm3FRMav1auuVyhqeydK5wgRrj4J23ZzPsiOb9R KA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 34ak16uh2s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 23 Oct 2020 13:38:11 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09NDZlV4073341;
        Fri, 23 Oct 2020 13:38:11 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 348ah20hea-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 23 Oct 2020 13:38:11 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 09NDc2iq013614;
        Fri, 23 Oct 2020 13:38:03 GMT
Received: from [10.74.86.114] (/10.74.86.114)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 23 Oct 2020 06:38:02 -0700
Subject: Re: [PATCH v2 0/5] xen: event handling cleanup
To:     Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
        linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-doc@vger.kernel.org
Cc:     Stefano Stabellini <sstabellini@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>
References: <20201022094907.28560-1-jgross@suse.com>
From:   boris.ostrovsky@oracle.com
Organization: Oracle Corporation
Message-ID: <71ea84e2-31d8-328d-fce6-fafb2010a229@oracle.com>
Date:   Fri, 23 Oct 2020 09:37:59 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <20201022094907.28560-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9782 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010230095
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9782 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0
 priorityscore=1501 clxscore=1011 malwarescore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010230095
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 10/22/20 5:49 AM, Juergen Gross wrote:
> Do some cleanups in Xen event handling code.
>
> Changes in V2:
> - addressed comments
>
> Juergen Gross (5):
>   xen: remove no longer used functions
>   xen/events: make struct irq_info private to events_base.c
>   xen/events: only register debug interrupt for 2-level events
>   xen/events: unmask a fifo event channel only if it was masked
>   Documentation: add xen.fifo_events kernel parameter description
>
>  .../admin-guide/kernel-parameters.txt         |  7 ++
>  arch/x86/xen/smp.c                            | 19 ++--
>  arch/x86/xen/xen-ops.h                        |  2 +
>  drivers/xen/events/events_2l.c                |  7 +-
>  drivers/xen/events/events_base.c              | 94 +++++++++++++------
>  drivers/xen/events/events_fifo.c              |  9 +-
>  drivers/xen/events/events_internal.h          | 70 ++------------
>  include/xen/events.h                          |  8 --
>  8 files changed, 102 insertions(+), 114 deletions(-)
>

Applied to for-linus-5.10b.


-boris

