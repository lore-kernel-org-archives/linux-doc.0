Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 635A8C54EE9
	for <linux-doc@archiver.kernel.org>; Wed, 28 Sep 2022 12:02:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233768AbiI1MCX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Sep 2022 08:02:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233775AbiI1MCO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Sep 2022 08:02:14 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41F566D9F2;
        Wed, 28 Sep 2022 05:02:07 -0700 (PDT)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1odVlL-0005C5-OC; Wed, 28 Sep 2022 14:02:03 +0200
Message-ID: <ef8bd881-50aa-f317-981a-ef7e57a10b1b@leemhuis.info>
Date:   Wed, 28 Sep 2022 14:02:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Content-Language: en-US, de-DE
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, corbet@lwn.net,
        konstantin@linuxfoundation.org, krzysztof.kozlowski@linaro.org,
        linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
References: <20220928003006.230103-1-bryan.odonoghue@linaro.org>
 <9df735b7-2963-9fca-aa7e-6ae993e8b948@leemhuis.info>
 <9a321c25-32ba-6ea0-67a0-07617a1131b2@linaro.org>
From:   Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [PATCH] Documentation/process: Add text to indicate supporters
 should be mailed
In-Reply-To: <9a321c25-32ba-6ea0-67a0-07617a1131b2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1664366527;50ef800d;
X-HE-SMSGID: 1odVlL-0005C5-OC
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 28.09.22 13:48, Bryan O'Donoghue wrote:
> On 28/09/2022 05:34, Thorsten Leemhuis wrote:
>> On 28.09.22 02:30, Bryan O'Donoghue wrote:
>>> Recently when submitting a yaml change I found that I had omitted the
>>> maintainer whose tree the change needed to go through.
>>>
>>> The reason for that is the path in MAINTAINERS is marked as Supported
>>> not
>>> Maintained. Reading MAINTAINERS we see quote:
>>>
>>>             Supported:   Someone is actually paid to look after this.
>>>             Maintained:  Someone actually looks after it.
>>>
>>> The current submitting-patches.rst only says to mail maintainers
>>> though not
>>> supporters. When we run scripts/get_maintainer.pl anybody who is
>>> denoted a
>>> paid maintainer will appear as a supporter.
>>>
>>> Let's add some text to the submitting-patches.rst to indicate that
>>> supporters should similarly be mailed so that you can't do as I did and
>>> mail every maintainer get_maintainer.pl tells you to, without actually
>>> mailing the one supporter you need to.
> [...]
>> Which leads to two other question: Are there any other places that might
>> benefit from such a clarification? Or would it be even make sense to
>> change the format of MAINTAINERS to avoid the problem in the first
>> place? Maybe something like "Maintained(v)" (Someone volunteered to look
>> after it in spare hours.) and "Maintained(p)" (Someone is actually paid
>> to look after this.). Ahh, no, that doesn't look good. But you get the
>> idea.
> 
> We could update get_maintainer to print out something else
> such as

I really like the idea of just changing get_maintainer, but also...

> scripts/get_maintainer.pl
> Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> 
> Andy Gross <agross@kernel.org> (maintainer:ARM/QUALCOMM SUPPORT)
> Bjorn Andersson <bjorn.andersson@linaro.org> (maintainer:ARM/QUALCOMM
> SUPPORT)
> Konrad Dybcio <konrad.dybcio@somainline.org> (reviewer:ARM/QUALCOMM
> SUPPORT)
> Lee Jones <lee@kernel.org> (maintainer-supporter:MULTIFUNCTION DEVICES
> (MFD))
> 
> or say
> 
> scripts/get_maintainer.pl
> Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> Andy Gross <agross@kernel.org> (maintainer:ARM/QUALCOMM SUPPORT)
> Bjorn Andersson <bjorn.andersson@linaro.org> (maintainer:ARM/QUALCOMM
> SUPPORT)
> Konrad Dybcio <konrad.dybcio@somainline.org> (reviewer:ARM/QUALCOMM
> SUPPORT)
> Lee Jones <lee@kernel.org> (supporting-maintainer:MULTIFUNCTION DEVICES
> (MFD))
> 
> it would be less churn but, I still think we would need to update the
> documentation to be very explicit that "supporting-maintainer or
> maintainer" needs to be emailed with your patch so that sufficiently
> talented idiots such as myself, know who to mail.
> 
> Although thinking about it we would be introducing yet another term
> "supporting-maintainer" to which people would say "what is that"

...agree with this.

> Feels a little less confusing to me to leave supporter as-is and just
> document expectations for patch submission better.

Hmm, how about this:

scripts/get_maintainer.pl
Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
Lee Jones <lee@kernel.org> (maintainer[supported]:MULTIFUNCTION DEVICES
(MFD))
Andy Gross <agross@kernel.org> (maintainer[volunteer]:ARM/QUALCOMM SUPPORT)
Bjorn Andersson <bjorn.andersson@linaro.org>
(maintainer[volunteer]:ARM/QUALCOMM SUPPORT)
Konrad Dybcio <konrad.dybcio@somainline.org> (reviewer:ARM/QUALCOMM SUPPORT)

Not totally sure about this myself. And there is a risk that any such
change might break scripts that rely on the current approach used by
scripts/get_maintainer.pl :-/

Ciao, Thorsten
