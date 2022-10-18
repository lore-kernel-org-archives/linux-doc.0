Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3092C43219
	for <linux-doc@archiver.kernel.org>; Tue, 18 Oct 2022 11:47:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbiJRLro (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 18 Oct 2022 07:47:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbiJRLrn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Oct 2022 07:47:43 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C7FB1BBE0A
        for <linux-doc@vger.kernel.org>; Tue, 18 Oct 2022 04:47:41 -0700 (PDT)
Received: from loongson.cn (unknown [10.90.50.23])
        by gateway (Coremail) with SMTP id _____8CxKdhckk5jEWcAAA--.490S3;
        Tue, 18 Oct 2022 19:47:40 +0800 (CST)
Received: from [10.90.50.23] (unknown [10.90.50.23])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Dx_eFbkk5jSKkAAA--.2752S3;
        Tue, 18 Oct 2022 19:47:39 +0800 (CST)
Message-ID: <9210a23b-b9cb-24dc-bb5d-6f45caf8d193@loongson.cn>
Date:   Tue, 18 Oct 2022 19:47:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 1/2] Documentation: LoongArch: Document the syscall ABI
To:     Xi Ruoyao <xry111@xry111.site>
Cc:     WANG Xuerui <git@xen0n.name>, Huacai Chen <chenhuacai@kernel.org>,
        Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        loongarch@lists.linux.dev
References: <20221018100457.3440691-1-kernel@xen0n.name>
 <20221018100457.3440691-2-kernel@xen0n.name>
 <3df303d1b0196a62217f6d034c0375855d77e04b.camel@xry111.site>
Content-Language: en-US
From:   Qi Hu <huqi@loongson.cn>
In-Reply-To: <3df303d1b0196a62217f6d034c0375855d77e04b.camel@xry111.site>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8Dx_eFbkk5jSKkAAA--.2752S3
X-CM-SenderInfo: pkxtxqxorr0wxvrqhubq/1tbiAQADCWNNReEbvwABsk
X-Coremail-Antispam: 1Uk129KBjvdXoW7XrW8Cw15urWUGF4xury5XFb_yoW3XFX_ur
        s7Ar1fJws3Jw4aga1qqrZxGrZxGa90kFyYka45Jr43W34DXa4xAw4Skry7CF43G3yIq39x
        AryYgryxA347ujkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
        xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY
        x7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
        AFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
        6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7
        xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS
        0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0V
        AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1l
        Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42
        xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
        GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI4
        8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4U
        MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
        8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j1WlkUUUUU=
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 2022/10/18 18:12, Xi Ruoyao wrote:
> On Tue, 2022-10-18 at 18:04 +0800, WANG Xuerui wrote:
>
> /* snip */
>
>
>> +The system call number is placed in the register ``a7``.
>> +Parameters, if present, are placed from ``a0`` through ``a6`` as needed,
>> +as if calling a function with the respective arguments.
>> +Upon return, ``a0`` contains the return value, and ``t0-t8`` should be
>> +considered clobbered; all other registers are preserved.
> Hmm, are a1-a7 guaranteed to be preserved?
>
Yes, you can find the relevant code here: [1] [2].

Thanks.


[1]: 
https://github.com/torvalds/linux/blob/master/arch/loongarch/kernel/entry.S#L43-L50

[2]: 
https://github.com/torvalds/linux/blob/master/arch/loongarch/kernel/entry.S#L68

