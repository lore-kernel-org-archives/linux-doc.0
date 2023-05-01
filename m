Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5094DC77B73
	for <linux-doc@archiver.kernel.org>; Mon,  1 May 2023 10:13:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232186AbjEAKNd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 May 2023 06:13:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232346AbjEAKNa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 May 2023 06:13:30 -0400
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B04FAE48;
        Mon,  1 May 2023 03:13:27 -0700 (PDT)
Received: from tarshish (unknown [10.0.8.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.tkos.co.il (Postfix) with ESMTPS id DF5E544107A;
        Mon,  1 May 2023 13:07:46 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
        s=default; t=1682935667;
        bh=lBDuhWFz9Iz/MjO48vbRYlkXP29mWmSE7y0cCQfGvKo=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=f+KV128Ph6+s2kbD3By+tCmPQqjsZC76nKJ+AaBMsXsEGwOSylzA2mlLFV2DM2Xyr
         gFheZ6aBzG8bkJdFY5LRROEv4unrKBu+rXm3KJie53D3nCqEGYUB9Drfeox+xZWXQW
         c7p/lAoKfbpdNqU8L7EbvflWq42bsg86lDzdwCvvsQE7GjsCYe+jSaANUMzXIXmy9R
         F45+dmS9I7I56V6OMdxl+h2XAywNemLqEtB1YyeeG8hssQV5nZS/J5yJca2IjQbboG
         mOkO36tP+f+VwLpFCZyKiSo4ys7MQk12j56rJPO0egyMR6iiYozpi4hO6LB1CgXUA5
         k5KBRtLjnzT3w==
References: <9e137548c4e76e0d8deef6d49460cb37897934ca.1682333574.git.baruch@tkos.co.il>
 <878regbbr7.fsf@tarshish>
 <9569ef0d-0d94-3ff9-468b-152fe949e7b5@linaro.org>
User-agent: mu4e 1.9.21; emacs 28.2
From:   Baruch Siach <baruch@tkos.co.il>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] docs: dt: fix documented Primecell compatible
 string
Date:   Mon, 01 May 2023 13:01:04 +0300
In-reply-to: <9569ef0d-0d94-3ff9-468b-152fe949e7b5@linaro.org>
Message-ID: <878re8741n.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Krzysztof,

On Mon, May 01 2023, Krzysztof Kozlowski wrote:
> On 25/04/2023 10:31, Baruch Siach wrote:
>> On Mon, Apr 24 2023, Baruch Siach wrote:
>>> Only arm,primecell is documented as compatible string for Primecell
>>> peripherals. Current code agrees with that.
>> 
>> Once again my patches do not show up in patchwork. But they do show in
>> lore:
>> 
>>   https://lore.kernel.org/linux-devicetree/9e137548c4e76e0d8deef6d49460cb37897934ca.1682333574.git.baruch@tkos.co.il/
>
> You used subject prefix which targets Doc subsystem, but did not Cc Doc
> maintainers (get_maintainers do not print them). If you target Rob's
> Patchwork, probably you need to fix subject prefix. There is no "dt" prefix.

Thanks for the tip.

All previous commits touching Documentation/devicetree/usage-model.rst
use 'docs' for subject prefix, including one from Rob. I followed this
example.

As for patchwork, I believe you refer to this one

  http://patchwork.ozlabs.org/project/devicetree-bindings/list/

Not all patches on the list use dt-bindings for subject prefix. For
example

  http://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230317053415.2254616-2-frowand.list@gmail.com/

The DT submitting-patches document
(Documentation/devicetree/bindings/submitting-patches.rst) mentions the
dt-bindings subject prefix rule. But this patch does not touch binding
documentation.

Is there anything I should do differently to get this patch applied?

Thanks,
baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
