Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A09E7C77B73
	for <linux-doc@archiver.kernel.org>; Thu, 27 Apr 2023 13:28:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243468AbjD0N2s (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Apr 2023 09:28:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243489AbjD0N2s (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Apr 2023 09:28:48 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D58F2E48;
        Thu, 27 Apr 2023 06:28:41 -0700 (PDT)
Received: from loongson.cn (unknown [112.20.110.102])
        by gateway (Coremail) with SMTP id _____8AxnOqFeEpkzqEBAA--.2678S3;
        Thu, 27 Apr 2023 21:28:37 +0800 (CST)
Received: from [192.168.100.131] (unknown [112.20.110.102])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8BxWbKDeEpk8Mo+AA--.19586S3;
        Thu, 27 Apr 2023 21:28:36 +0800 (CST)
Message-ID: <ffa08a81-3a66-d4b9-99ee-a0d0f349ad85@loongson.cn>
Date:   Thu, 27 Apr 2023 21:28:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 2/2] docs: zh_CN/devicetree: sync usage-model fix
To:     Baruch Siach <baruch@tkos.co.il>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Alex Shi <alexs@kernel.org>, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <9e137548c4e76e0d8deef6d49460cb37897934ca.1682333574.git.baruch@tkos.co.il>
 <b39560250cb58f8cdcfe95791ce5af7455c6e8e3.1682333574.git.baruch@tkos.co.il>
Content-Language: en-US
From:   Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <b39560250cb58f8cdcfe95791ce5af7455c6e8e3.1682333574.git.baruch@tkos.co.il>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxWbKDeEpk8Mo+AA--.19586S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7Cr1xXFW5Kw1xCrWxJFWrXwb_yoW8XF13pF
        9agrWfKF4fKF129w1vgr18Zr1xAF4xCw4fKF1UKwsYg3Z5JrWrtryUtFZ8KF92qrWrKayU
        trWYkryxGF12vF7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bxxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I2
        62IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4
        CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvj
        eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487MxAIw2
        8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
        x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrw
        CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI
        42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
        80aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7_MaUUUUU
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 4/24/23 18:52, Baruch Siach 写道:
> Sync compatibly string fix from the English document.
>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Reviewed-by: Yanteng Si <siyanteng@loongson.cn>


Thanks,

Yanteng

> ---
> v2:
>
>    New separate patch for translation
> ---
>   Documentation/translations/zh_CN/devicetree/usage-model.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/translations/zh_CN/devicetree/usage-model.rst b/Documentation/translations/zh_CN/devicetree/usage-model.rst
> index c6aee82c7e6e..19ba4ae0cd81 100644
> --- a/Documentation/translations/zh_CN/devicetree/usage-model.rst
> +++ b/Documentation/translations/zh_CN/devicetree/usage-model.rst
> @@ -325,6 +325,6 @@ Primecell设备。然而，棘手的一点是，AMBA总线上的所有设备并
>   
>   当使用DT时，这给of_platform_populate()带来了问题，因为它必须决定是否将
>   每个节点注册为platform_device或amba_device。不幸的是，这使设备创建模型
> -变得有点复杂，但解决方案原来并不是太具有侵略性。如果一个节点与“arm,amba-primecell”
> +变得有点复杂，但解决方案原来并不是太具有侵略性。如果一个节点与“arm,primecell”
>   兼容，那么of_platform_populate()将把它注册为amba_device而不是
>   platform_device。

