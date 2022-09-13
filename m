Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B56D0C54EE9
	for <linux-doc@archiver.kernel.org>; Tue, 13 Sep 2022 09:38:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231178AbiIMJiy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Sep 2022 05:38:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbiIMJix (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Sep 2022 05:38:53 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D42C5E55A;
        Tue, 13 Sep 2022 02:38:52 -0700 (PDT)
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.57])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MRdZv3xDhzNmB2;
        Tue, 13 Sep 2022 17:34:15 +0800 (CST)
Received: from dggpeml500010.china.huawei.com (7.185.36.155) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 13 Sep 2022 17:38:50 +0800
Received: from [10.67.111.232] (10.67.111.232) by
 dggpeml500010.china.huawei.com (7.185.36.155) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 13 Sep 2022 17:38:49 +0800
Message-ID: <7e615e37-ba5f-4e50-17c6-8f742a366808@huawei.com>
Date:   Tue, 13 Sep 2022 17:38:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH -next] Documentation/hw-vuln: Update spectre doc
To:     <corbet@lwn.net>, <bp@suse.de>, <keescook@chromium.org>,
        <aarcange@redhat.com>, <daniel.sneddon@linux.intel.com>,
        <longman@redhat.com>, <lukas.bulwahn@gmail.com>,
        <peterz@infradead.org>, <kim.phillips@amd.com>
CC:     <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20220830123614.23007-1-linyujun809@huawei.com>
From:   "linyujun (C)" <linyujun809@huawei.com>
In-Reply-To: <20220830123614.23007-1-linyujun809@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.111.232]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500010.china.huawei.com (7.185.36.155)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

kindly ping

On 2022/8/30 20:36, Lin Yujun writed:
> commit 7c693f54c873691 ("x86/speculation: Add spectre_v2=ibrs
> option to support Kernel IBRS") adds the "ibrs " option  in
> Documentation/admin-guide/kernel-parameters.txt but omits it to
> Documentation/admin-guide/hw-vuln/spectre.rst, add it.
>
> Signed-off-by: Lin Yujun <linyujun809@huawei.com>
> ---
>   Documentation/admin-guide/hw-vuln/spectre.rst | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/admin-guide/hw-vuln/spectre.rst b/Documentation/admin-guide/hw-vuln/spectre.rst
> index 2ce2a38cdd55..c4dcdb3d0d45 100644
> --- a/Documentation/admin-guide/hw-vuln/spectre.rst
> +++ b/Documentation/admin-guide/hw-vuln/spectre.rst
> @@ -613,6 +613,7 @@ kernel command line.
>                   eibrs                   enhanced IBRS
>                   eibrs,retpoline         enhanced IBRS + Retpolines
>                   eibrs,lfence            enhanced IBRS + LFENCE
> +                ibrs                    use IBRS to protect kernel
>   
>   		Not specifying this option is equivalent to
>   		spectre_v2=auto.
