Return-Path: <SRS0=bpCa=C3=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE53FC43463
	for <linux-doc@archiver.kernel.org>; Fri, 18 Sep 2020 03:44:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B2AFB21D7F
	for <linux-doc@archiver.kernel.org>; Fri, 18 Sep 2020 03:44:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbgIRDoF convert rfc822-to-8bit (ORCPT
        <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Sep 2020 23:44:05 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:40466 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726420AbgIRDoF (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 17 Sep 2020 23:44:05 -0400
X-Greylist: delayed 919 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 23:44:04 EDT
Received: from dggeme760-chm.china.huawei.com (unknown [172.30.72.54])
        by Forcepoint Email with ESMTP id 29FEAA366C31858E46A6;
        Fri, 18 Sep 2020 11:28:39 +0800 (CST)
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggeme760-chm.china.huawei.com (10.3.19.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Fri, 18 Sep 2020 11:28:38 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.1913.007;
 Fri, 18 Sep 2020 11:28:38 +0800
From:   "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To:     "tiantao (H)" <tiantao6@hisilicon.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "keescook@chromium.org" <keescook@chromium.org>,
        "anton@enomsg.org" <anton@enomsg.org>,
        "ccross@android.com" <ccross@android.com>,
        "tony.luck@intel.com" <tony.luck@intel.com>,
        "paulmck@kernel.org" <paulmck@kernel.org>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "bp@suse.de" <bp@suse.de>,
        "mchehab+huawei@kernel.org" <mchehab+huawei@kernel.org>,
        "pawan.kumar.gupta@linux.intel.com" 
        <pawan.kumar.gupta@linux.intel.com>,
        "rdunlap@infradead.org" <rdunlap@infradead.org>,
        "mike.kravetz@oracle.com" <mike.kravetz@oracle.com>,
        "oneukum@suse.com" <oneukum@suse.com>,
        "gpiccoli@canonical.com" <gpiccoli@canonical.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
CC:     Linuxarm <linuxarm@huawei.com>
Subject: RE: [PATCH] Documentation: arm64 supports cma
Thread-Topic: [PATCH] Documentation: arm64 supports cma
Thread-Index: AQHWjWplVrE+Ci8vAk+SKjBjOwg7mqltueLQ
Date:   Fri, 18 Sep 2020 03:28:38 +0000
Message-ID: <ba0827edbdb54d4da445107afa80f3de@hisilicon.com>
References: <1600398953-55893-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1600398953-55893-1-git-send-email-tiantao6@hisilicon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.203.98]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



> -----Original Message-----
> From: Tian Tao [mailto:tiantao6@hisilicon.com]
> Sent: Friday, September 18, 2020 3:16 PM
> To: corbet@lwn.net; keescook@chromium.org; anton@enomsg.org;
> ccross@android.com; tony.luck@intel.com; paulmck@kernel.org;
> tglx@linutronix.de; akpm@linux-foundation.org; bp@suse.de;
> mchehab+huawei@kernel.org; pawan.kumar.gupta@linux.intel.com;
> rdunlap@infradead.org; mike.kravetz@oracle.com; oneukum@suse.com;
> gpiccoli@canonical.com; linux-doc@vger.kernel.org
> Cc: Linuxarm <linuxarm@huawei.com>
> Subject: [PATCH] Documentation: arm64 supports cma
> 
> arm64 also supports cma, updated documentation.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt
> b/Documentation/admin-guide/kernel-parameters.txt
> index 7ebe3be..38a1602 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -591,7 +591,7 @@
>  			some critical bits.
> 
>  	cma=nn[MG]@[start[MG][-end[MG]]]
> -			[ARM,X86,KNL]
> +			[ARM,ARM64,X86,KNL]

Yes. It supports ARM64. On the other hand, it also supports other architectures like
MIPS
S390
MICROBLAZE
...
So I am not sure if it is a completely correct fix.

CMA only depends on MMU. It probably doesn't depend on arch too much.

Is it better to just move to [KNL]?

>  			Sets the size of kernel global memory area for
>  			contiguous memory allocations and optionally the
>  			placement constraint by the physical address range of
> --
> 2.7.4

Thanks
Barry

