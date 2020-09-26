Return-Path: <SRS0=ljnh=DD=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B309EC2D0A8
	for <linux-doc@archiver.kernel.org>; Sat, 26 Sep 2020 14:44:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 82B202184D
	for <linux-doc@archiver.kernel.org>; Sat, 26 Sep 2020 14:44:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725208AbgIZOo5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 26 Sep 2020 10:44:57 -0400
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131]:56315 "EHLO
        out30-131.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729356AbgIZOo4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 26 Sep 2020 10:44:56 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04420;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0UA7ntYq_1601131484;
Received: from IT-FVFX43SYHV2H.lan(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0UA7ntYq_1601131484)
          by smtp.aliyun-inc.com(127.0.0.1);
          Sat, 26 Sep 2020 22:44:45 +0800
Subject: Re: [PATCH V4] doc: zh_CN: add translatation for btrfs
From:   Alex Shi <alex.shi@linux.alibaba.com>
To:     Wang Qing <wangqing@vivo.com>, Harry Wei <harryxiyou@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Wang Wenhu <wenhu.wang@vivo.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Chucheng Luo <luochucheng@vivo.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1601018642-31711-1-git-send-email-wangqing@vivo.com>
 <f0febb25-29a1-02d4-223a-65e2c6a9db5e@linux.alibaba.com>
Message-ID: <f12d8844-ce72-bf96-e615-0cfe7852d7a9@linux.alibaba.com>
Date:   Sat, 26 Sep 2020 22:42:22 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f0febb25-29a1-02d4-223a-65e2c6a9db5e@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



在 2020/9/25 下午4:19, Alex Shi 写道:
> Reviewed-by: Alex Shi <alex.shi@linux.alibaba.com>

Sorry, this patch still has format issue and can not be applied.
I would take back the reviewed-by.

Thanks
Alex
> 
> 在 2020/9/25 下午3:22, Wang Qing 写道:
>> Translate Documentation/filesystems/btrfs.rst into Chinese.
>>
>> Signed-off-by: Wang Qing <wangqing@vivo.com>
>> ---
>>  .../translations/zh_CN/filesystems/btrfs.rst       | 37 ++++++++++++++++++++++
>>  .../translations/zh_CN/filesystems/index.rst       |  1 +
>>  2 files changed, 38 insertions(+)
>>  create mode 100644 Documentation/translations/zh_CN/filesystems/btrfs.rst
>>
>> diff --git a/Documentation/translations/zh_CN/filesystems/btrfs.rst b/Documentation/translations/zh_CN/filesystems/btrfs.rst
>> new file mode 100644
>> index 0000000..8b8cca2
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/filesystems/btrfs.rst
>> @@ -0,0 +1,37 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +.. include:: ../disclaimer-zh_CN.rst
>> +
>> +:Original: :ref:`Documentation/filesystems/ext3.rst <ext3_index>`
>> +
>> +translated by 王擎 Wang Qing<wangqing@vivo.com>
>> +
>> +=====
>> +BTRFS
>> +=====
>> +
>> +Btrfs是一个写时复制更新的文件系统，它注重容错、修复和易于管理。
>> +Btrfs由多家公司联合开发，并获得GPL许可，免费开放给所有人。
>> +
>> +Btrfs的主要功能包括：
>> +
>> +    *扩展大小的文件存储（文件最大支持2^64）
>> +    *填充方式使小文件更节省空间
>> +    *索引目录的方式更节省空间
>> +    *动态的索引节点分配方式
>> +    *可写快照的特性
>> +    *支持子卷（独立的内部根文件系统）
>> +    *对象级别的镜像克隆
>> +    *基于数据和元数据的校验和（支持多种算法）
>> +    *支持压缩
>> +    *內建多种磁盘阵列算法，支持多种设备
>> +    *支持离线的文件系统检查
>> +    *高效的增量备份和文件系统镜像
>> +    *在线文件系统碎片整理
>> +
>> +更多有关信息，请参阅Wiki
>> +
>> +  https://btrfs.wiki.kernel.org
>> +
>> +维护信息包含管理任务、常见问题、用例、挂载选项、变更日志、
>> +特性、手册、源码仓、联系人等。
>> diff --git a/Documentation/translations/zh_CN/filesystems/index.rst b/Documentation/translations/zh_CN/filesystems/index.rst
>> index 186501d..47e86397
>> --- a/Documentation/translations/zh_CN/filesystems/index.rst
>> +++ b/Documentation/translations/zh_CN/filesystems/index.rst
>> @@ -25,4 +25,5 @@ Linux Kernel中的文件系统
>>  
>>     virtiofs
>>     debugfs
>> +   btrfs
>>  
>>
