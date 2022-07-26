Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57C75C19F21
	for <linux-doc@archiver.kernel.org>; Tue, 26 Jul 2022 15:06:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239515AbiGZPGc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 Jul 2022 11:06:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239502AbiGZPGb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Jul 2022 11:06:31 -0400
Received: from email.cn (m218-153.88.com [110.43.218.153])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABE6210FEC
        for <linux-doc@vger.kernel.org>; Tue, 26 Jul 2022 08:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=/ZqJi1toepBVp5SIIKaOCT58f3wKbnuv+0u7o
        Rzhf7w=; b=k/9JBDTQ1b1avrr/X5RGAXIOnJtWOedj+8NIKggdMmAK5Re9w1YGC
        NwLqmarfdr82vTwJFd1X2XJpiyqFfN6RklnvCf6vfbwzGYdj9RUPOnJddX15pkzl
        af65fcfh7CcbM+ePNxMXGV2j4jQhaUnKH2ys1vctslgY53ZndnpvSo=
Received: from bobwxc.mipc (unknown [120.242.71.147])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgAnzxPYAuBiewBiAA--.45525S2;
        Tue, 26 Jul 2022 23:06:02 +0800 (CST)
Date:   Tue, 26 Jul 2022 23:06:00 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        zhoubinbin@loongson.cn, yizhou.tang@shopee.com,
        wanjiabing@vivo.com, leoyang.li@nxp.com, src.res@email.cn
Subject: Re: [PATCH 8/8] Docs/zh_CN: Update the translation of sched-stats to
 5.19-rc8
Message-ID: <YuAC2JmisthCIb7U@bobwxc.mipc>
References: <cover.1658740151.git.siyanteng@loongson.cn>
 <d46c5dfb2b6a138ba418b04f41f5bd73ebd7248d.1658740151.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d46c5dfb2b6a138ba418b04f41f5bd73ebd7248d.1658740151.git.siyanteng@loongson.cn>
X-CM-TRANSID: GiKnCgAnzxPYAuBiewBiAA--.45525S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CryxKr1fZFWxWw4xuFyUZFb_yoW8ZrW8pr
        9rWr4xGr18AF90kwn2gw15GFW8GF47Aw4Utr1DZa4Yqr93tF4IgFyjkF98XFW2grWrZF9I
        qa9Yga47u3yjyrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUymb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2
        xKxwCY02Avz4vE14v_XrWl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1U
        JwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
        vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
        x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26c
        xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
        wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07U2Ap5UUUUU=
X-Originating-IP: [120.242.71.147]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jul 25, 2022 at 05:24:47PM +0800, Yanteng Si wrote:
> Update to commit 6c757e9f55f0 ("docs/scheduler:
> fix unit error")
> 
> ddb21d27a6a5 ("docs/scheduler: Change unit of
> cpu_time and rq_time to nanoseconds")
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

Thanks,
	Wu

> ---
>  .../translations/zh_CN/scheduler/sched-stats.rst          | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/translations/zh_CN/scheduler/sched-stats.rst b/Documentation/translations/zh_CN/scheduler/sched-stats.rst
> index 1c68c3d1c283..c5e0be663837 100644
> --- a/Documentation/translations/zh_CN/scheduler/sched-stats.rst
> +++ b/Documentation/translations/zh_CN/scheduler/sched-stats.rst
> @@ -57,8 +57,8 @@ cpu<N> 1 2 3 4 5 6 7 8 9
>  
>  接下来的三个统计数据描述了调度延迟：
>  
> -     7) 本处理器运行任务的总时间，单位是jiffies
> -     8) 本处理器任务等待运行的时间，单位是jiffies
> +     7) 本处理器运行任务的总时间，单位是纳秒
> +     8) 本处理器任务等待运行的时间，单位是纳秒
>       9) 本CPU运行了#个时间片
>  
>  域统计数据
> @@ -146,8 +146,8 @@ domain<N> <cpumask> 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23
>  schedstats还添加了一个新的/proc/<pid>/schedstat文件，来提供一些进程级的
>  相同信息。这个文件中，有三个字段与该进程相关：
>  
> -     1) 在CPU上运行花费的时间
> -     2) 在运行队列上等待的时间
> +     1) 在CPU上运行花费的时间(单位是纳秒)
> +     2) 在运行队列上等待的时间(单位是纳秒)
>       3) 在CPU上运行了#个时间片
>  
>  可以很容易地编写一个程序，利用这些额外的字段来报告一个特定的进程或一组进程在
> -- 
> 2.31.1

