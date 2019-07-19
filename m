Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id F26387D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri, 19 Jul 2019 02:01:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726045AbfGSCBd (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 18 Jul 2019 22:01:33 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2681 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726042AbfGSCBd (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 18 Jul 2019 22:01:33 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id EEFA8E4162363BA56F5F;
        Fri, 19 Jul 2019 10:01:30 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 19 Jul
 2019 10:01:26 +0800
Subject: Re: [PATCH v2 2/2] f2fs: Support case-insensitive file name lookups
To:     Daniel Rosenberg <drosen@google.com>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        <linux-f2fs-devel@lists.sourceforge.net>
CC:     <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-fsdevel@vger.kernel.org>, <kernel-team@android.com>
References: <20190717031408.114104-1-drosen@google.com>
 <20190717031408.114104-3-drosen@google.com>
 <cbaf59d4-0bd3-6980-4750-fbab14941bdb@huawei.com>
 <4ef17922-d1e9-1b83-9e89-d332ea6fb7ae@google.com>
From:   Chao Yu <yuchao0@huawei.com>
Message-ID: <8f1c8f28-9afa-94b0-05b2-12df71db201c@huawei.com>
Date:   Fri, 19 Jul 2019 10:01:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <4ef17922-d1e9-1b83-9e89-d332ea6fb7ae@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2019/7/19 5:31, Daniel Rosenberg wrote:
> 
> On 7/17/19 3:11 AM, Chao Yu wrote:
>> We need to add one more entry f2fs_fsflags_map[] to map F2FS_CASEFOLD_FL to
>> FS_CASEFOLD_FL correctly and adapt F2FS_GETTABLE_FS_FL/F2FS_SETTABLE_FS_FL as well.
> 
> I don't see FS_CASEFOLD_FL. It would make sense for it to exist, but unless it's in some recent patch I don't think that's currently in the kernel. Or are you suggesting adding it in this patch?

Yeah, I think we can use a separated patch to propose uplifting the flag to a
common one in fs.h, and then adjust
f2fs_fsflags_map/F2FS_GETTABLE_FS_FL/F2FS_SETTABLE_FS_FL mapping. Otherwise we
will fail to set CASEFOLD flag to inode.

Thanks,

> 
> .
> 
