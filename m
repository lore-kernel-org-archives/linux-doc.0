Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E976EEB64DB
	for <linux-doc@archiver.kernel.org>; Thu, 15 Jun 2023 10:21:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343697AbjFOKVw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Jun 2023 06:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243836AbjFOKVw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Jun 2023 06:21:52 -0400
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 32E16123
        for <linux-doc@vger.kernel.org>; Thu, 15 Jun 2023 03:21:49 -0700 (PDT)
Received: from loongson.cn (unknown [10.20.42.35])
        by gateway (Coremail) with SMTP id _____8Bx4Og85opk8YUFAA--.9909S3;
        Thu, 15 Jun 2023 18:21:48 +0800 (CST)
Received: from [10.20.42.35] (unknown [10.20.42.35])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8DxbMo85opkBNwbAA--.5003S3;
        Thu, 15 Jun 2023 18:21:48 +0800 (CST)
Subject: Re: [PATCH 04/10] docs: Add atomic operations to the driver basic API
 documentation
To:     zybsyzlz@163.com
Cc:     "Paul E. McKenney" <paulmck@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Akira Yokosawa <akiyks@gmail.com>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org
References: <20230615094848.24975-1-zhuyinbo@loongson.cn>
 <20230615094848.24975-4-zhuyinbo@loongson.cn>
From:   zhuyinbo <zhuyinbo@loongson.cn>
Message-ID: <5d869418-ab92-8078-8e4e-b5f70770405d@loongson.cn>
Date:   Thu, 15 Jun 2023 18:21:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20230615094848.24975-4-zhuyinbo@loongson.cn>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxbMo85opkBNwbAA--.5003S3
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
        ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
        nUUI43ZEXa7xR_UUUUUUUUU==
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Sorry to bother you. This is an incorrect send, please ignore it.


ÔÚ 2023/6/15 ÏÂÎç5:48, Yinbo Zhu Ð´µÀ:
> From: "Paul E. McKenney" <paulmck@kernel.org>
> 
> Add the include/linux/atomic/atomic-arch-fallback.h file to the
> driver-api/basics.rst in order to provide documentation for the Linux
> kernel's atomic operations.
> 
> Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Akira Yokosawa <akiyks@gmail.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Boqun Feng <boqun.feng@gmail.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: <linux-doc@vger.kernel.org>
> ---
>   Documentation/driver-api/basics.rst | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/driver-api/basics.rst b/Documentation/driver-api/basics.rst
> index 4b4d8e28d3be..0ae07f0d8601 100644
> --- a/Documentation/driver-api/basics.rst
> +++ b/Documentation/driver-api/basics.rst
> @@ -87,6 +87,9 @@ Atomics
>   .. kernel-doc:: arch/x86/include/asm/atomic.h
>      :internal:
>   
> +.. kernel-doc:: include/linux/atomic/atomic-arch-fallback.h
> +   :internal:
> +
>   Kernel objects manipulation
>   ---------------------------
>   
> 

