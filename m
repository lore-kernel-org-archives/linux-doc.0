Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC588C433DB
	for <linux-doc@archiver.kernel.org>; Mon, 29 Mar 2021 13:15:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7008C6195C
	for <linux-doc@archiver.kernel.org>; Mon, 29 Mar 2021 13:15:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbhC2NO2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 29 Mar 2021 09:14:28 -0400
Received: from [43.250.32.171] ([43.250.32.171]:53370 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S229515AbhC2NOT (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 29 Mar 2021 09:14:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=nPZBRO64r975JmZhjOD5beu/cE8yXAW1VIj4B
        FrY16M=; b=hKuO+ig3qCrDmuCWrwdk0pFEm8E+njhIKw7mWWhbC0E/rcwfic9Wf
        3Rd+q864XYgbQeSqlYyvnsg1sB2Z3zZ6iN1isVE/RCF/QrKWDRh5SAu92xWILXYo
        nwbISEhENDQMTE7Z931CPFTdmwxXvzNU3uU1dNGUEUn/rj9bG4SxqQ=
Received: from mipc (unknown [120.238.248.129])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgDHOdCV0mFgeqVAAA--.14491S2;
        Mon, 29 Mar 2021 21:13:59 +0800 (CST)
Date:   Mon, 29 Mar 2021 21:13:57 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     yanteng si <siyanteng01@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        Puyu Wang <realpuyuwang@gmail.com>
Subject: Re: [PATCH v2 3/8] docs/zh_CN: add cpu-freq cpufreq-stats.rst
 translation
Message-ID: <20210329131357.GA5608@mipc>
References: <20210329025144.9776-1-siyanteng@loongson.cn>
 <20210329025144.9776-4-siyanteng@loongson.cn>
 <20210329062342.GB8845@mipc>
 <CAEensMxBMjT1D31-dbQ2Y14Rp61=-vuxmoej2-Xyyw6w1K7Dnw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEensMxBMjT1D31-dbQ2Y14Rp61=-vuxmoej2-Xyyw6w1K7Dnw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgDHOdCV0mFgeqVAAA--.14491S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
        VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUU5K7k0a2IF6F4UM7kC6x804xWl1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
        x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8
        JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
        0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        74AGY7Cv6cx26F4UJr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YV
        CY1x02628vn2kIc2xKxwCY02Avz4vE14v_Xr4l42xK82IYc2Ij64vIr41l42xK82IY6x8E
        rcxFaVAv8VWxJr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
        18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vI
        r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
        1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
        x4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UzWlkUUUUU=
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 29, 2021 at 08:19:23PM +0800, yanteng si wrote:
> Hi~
> 
> Do you mind if I add the following?
> 
> +:校译:
> +
> + 吴想成 Wu XiangCheng <bobwxc@email.cn>

Ah, thank you very much.

I really appreciate your willingness to do so. It's really an honor, 
but I have only done some minor work. :) Just put it on hold. 
Many people will review your works continually. If someone modify your 
translation later, add them.

Sincerely,
Wu X.C.

