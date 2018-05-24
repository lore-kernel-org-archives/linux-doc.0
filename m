Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C4E537DF8B
	for <lwn-linux-doc@archive.lwn.net>; Thu, 24 May 2018 02:25:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S935558AbeEXCXd (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 23 May 2018 22:23:33 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:46744 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935294AbeEXCX1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 May 2018 22:23:27 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id B48CF60D81; Thu, 24 May 2018 02:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1527128606;
        bh=6Qvifh6Kk6f1hnuOapP/wg/yjBTQdvsVf0yQ4DkncRA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Nr8M1EkvtCt9csRFCMGP4R+IQbSXXaT/QICTJXF9QgfqCDSslnVNpHH9nGTs9iuOO
         X48mIojwT2SBhPoeHFdCFYxZg9wIqWpt89WutuuBRlGkklO7bxH/7I3IpbSAZUM5HB
         eFgq/MjURtIL4yedbIye3kWLIOred1nkJt0ODSXM=
Received: from [10.79.40.88] (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AB119601E8;
        Thu, 24 May 2018 02:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1527128605;
        bh=6Qvifh6Kk6f1hnuOapP/wg/yjBTQdvsVf0yQ4DkncRA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=QTFF8P4fBYkokjQ7lTqA40vIJHHmveKuD342C3jnG3ok/3ZZjco5qRrszUMjiPAbb
         M/mNTFb2zYKJEUN75gNCNASavep9VYcmBoxNXGq8bsJnvSZmv8r8T2GU8mDhWkvXqV
         RpzzG9+w3imIn8hVs2uBwqJWsx6Wx+dLZiYXtcMA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AB119601E8
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v6 4/5] arm64: dts: sdm845: Add serial console support
To:     Doug Anderson <dianders@chromium.org>
Cc:     Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, Evan Green <evgreen@chromium.org>,
        acourbot@chromium.org, Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <1522429700-13083-1-git-send-email-kramasub@codeaurora.org>
 <1522429700-13083-5-git-send-email-kramasub@codeaurora.org>
 <ebe4515d-a26f-a825-0353-666b0b5ad9f5@codeaurora.org>
 <CAD=FV=WwVjMKDoL29fqdzSmi5SRQOxk_mV2=7br8HUK_hUc+XQ@mail.gmail.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <ae894880-33e8-dc12-e69c-218db6d7b251@codeaurora.org>
Date:   Thu, 24 May 2018 07:53:19 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=WwVjMKDoL29fqdzSmi5SRQOxk_mV2=7br8HUK_hUc+XQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 05/23/2018 08:43 PM, Doug Anderson wrote:
> Rajendra,
> 
> On Tue, May 22, 2018 at 11:30 PM, Rajendra Nayak <rnayak@codeaurora.org> wrote:
>>
>>
>> On 03/30/2018 10:38 PM, Karthikeyan Ramasubramanian wrote:
>>> From: Rajendra Nayak <rnayak@codeaurora.org>
>>>
>>> Add the qup uart node and geni se instance needed to
>>> support the serial console on the MTP.
>>>
>>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>>> Signed-off-by: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
>>> ---
>>
>> Andy, is it possible to pull this one in for 4.18?
>> Sorry, I only realized we somehow missed this after looking at your pull request.
>>
>> This is the only patch that prevents linux-next from booting up my sdm845 MTP
>> to a minimal console shell.
> 
> It was in Andy's tree but then got dropped.  Unfortunately the clock
> bindings didn't land early enough so it's a bit difficult to land any
> device tree changes that use the clock bindings until the next kernel
> revision...

ah, okay, did not realize that. Thanks for clarifying.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
