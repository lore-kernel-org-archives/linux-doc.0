Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 26C327DD31
	for <lwn-linux-doc@archive.lwn.net>; Thu, 19 Apr 2018 04:10:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752743AbeDSEKC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 19 Apr 2018 00:10:02 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:33065 "EHLO huawei.com"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751092AbeDSEKB (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 19 Apr 2018 00:10:01 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 85C0373E35AEA;
        Thu, 19 Apr 2018 12:09:56 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.361.1; Thu, 19 Apr 2018
 12:09:51 +0800
Subject: Re: [PATCH v11 0/4] set VSESR_EL2 by user space and support
 NOTIFY_SEI notification
To:     James Morse <james.morse@arm.com>
CC:     <rkrcmar@redhat.com>, <corbet@lwn.net>,
        <christoffer.dall@linaro.org>, <marc.zyngier@arm.com>,
        <linux@armlinux.org.uk>, <catalin.marinas@arm.com>,
        <rjw@rjwysocki.net>, <bp@alien8.de>, <lenb@kernel.org>,
        <kvm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <kvmarm@lists.cs.columbia.edu>, <linux-acpi@vger.kernel.org>,
        <devel@acpica.org>, <huangshaoyu@huawei.com>,
        <zhengxiang9@huawei.com>
References: <1523309796-36423-1-git-send-email-gengdongjiu@huawei.com>
 <d94439b6-9b9a-9bd0-ddec-3bb63ede9461@arm.com>
 <5161fb31-e5bb-872c-3e12-d7d38326aaca@huawei.com>
 <eb65baf4-abb0-570f-f3af-61f505c9de10@arm.com>
From:   gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <ebfea154-eceb-b2d2-d038-f27687d2bc01@huawei.com>
Date:   Thu, 19 Apr 2018 12:09:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <eb65baf4-abb0-570f-f3af-61f505c9de10@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

James,

> 
>> I do not know when it is merge-window. About the apply version, it does not have limited.
> 
> 'git fetch' Linus' tree and look at the tags. 'v4.16' lost its '-rc' suffixes,
> and there isn't a 'v4.17-rc1' yet, so we are still in the merge window.
> 
> Linus sends a message to LKML. eg:
> https://lkml.org/lkml/2018/4/1/175
> 
> net-next closes shortly before the merge window, and re-opens afterwards. There
> is a handy web page:
> http://vger.kernel.org/~davem/net-next.html

 Thanks for this information, got it.

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
