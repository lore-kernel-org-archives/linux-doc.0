Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 259D0C77B7C
	for <linux-doc@archiver.kernel.org>; Tue,  9 May 2023 08:38:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbjEIIix (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 9 May 2023 04:38:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjEIIiw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 May 2023 04:38:52 -0400
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B7C559C1;
        Tue,  9 May 2023 01:38:51 -0700 (PDT)
Received: from tarshish (unknown [10.0.8.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.tkos.co.il (Postfix) with ESMTPS id B31F1440072;
        Tue,  9 May 2023 11:38:45 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
        s=default; t=1683621525;
        bh=xZCRBXw62veUWVQ/etNLT4zA9e5k4cFBlq7fF7QYfKE=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=bWjjk2+GXvtYByzAwnO5tOy2vca7SkWyBu0hLT7aTnMExbvRTkwGTGDD6WRJmceXV
         mUAjEHJ3dFAk/rqcO3fugINDUHpZGiWiBVxM4/gwlpUQONx6rjRVV/1yfakcd+rXHj
         sZFwPoC59ZDfuoXm55aNfPPMgOVYzBGSoBY+k3y4ZNU443Em9iNzRBYLLUkhEm7U+S
         GQRWPbbXpPQOQUgjzBCk20Uo2h2YV6KIS6k+Qk0QOzMvQNvkLwYNDDWvAKxIQ3zkmf
         E0ByrhM79Mzl/00EMF17mNK/WhYZoVkbKAP1s9+7zy+9UWzHFAxm2VZXzxgz++h4uu
         b2hP3BMqHy5Xg==
References: <9e137548c4e76e0d8deef6d49460cb37897934ca.1682333574.git.baruch@tkos.co.il>
 <878regbbr7.fsf@tarshish>
 <9569ef0d-0d94-3ff9-468b-152fe949e7b5@linaro.org>
 <878re8741n.fsf@tarshish>
 <03806421-73ac-0d82-f1cb-e54c2e8f27e9@linaro.org>
User-agent: mu4e 1.9.21; emacs 28.2
From:   Baruch Siach <baruch@tkos.co.il>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] docs: dt: fix documented Primecell compatible
 string
Date:   Tue, 09 May 2023 11:36:18 +0300
In-reply-to: <03806421-73ac-0d82-f1cb-e54c2e8f27e9@linaro.org>
Message-ID: <87o7mt6grr.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Krzysztof,

On Mon, May 01 2023, Krzysztof Kozlowski wrote:
> On 01/05/2023 12:01, Baruch Siach wrote:
>> On Mon, May 01 2023, Krzysztof Kozlowski wrote:
>>> On 25/04/2023 10:31, Baruch Siach wrote:
>>>> On Mon, Apr 24 2023, Baruch Siach wrote:
>>>>> Only arm,primecell is documented as compatible string for Primecell
>>>>> peripherals. Current code agrees with that.
>>>>
>>>> Once again my patches do not show up in patchwork. But they do show in
>>>> lore:
>>>>
>>>>   https://lore.kernel.org/linux-devicetree/9e137548c4e76e0d8deef6d49460cb37897934ca.1682333574.git.baruch@tkos.co.il/
>>>
>>> You used subject prefix which targets Doc subsystem, but did not Cc Doc
>>> maintainers (get_maintainers do not print them). If you target Rob's
>>> Patchwork, probably you need to fix subject prefix. There is no "dt" prefix.
>> 
>> Thanks for the tip.
>> 
>> All previous commits touching Documentation/devicetree/usage-model.rst
>> use 'docs' for subject prefix, including one from Rob. I followed this
>> example.
>
> Hm, I see Rob and others indeed used "dt:". I guess Rob's filters might
> need some updates?

With the merge window behind us, is there anything more I need to do to
get these trivial patches applied?

Thanks,
baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
