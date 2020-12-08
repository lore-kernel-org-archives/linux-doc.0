Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DFECC433FE
	for <linux-doc@archiver.kernel.org>; Tue,  8 Dec 2020 17:59:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 352A123B44
	for <linux-doc@archiver.kernel.org>; Tue,  8 Dec 2020 17:59:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728914AbgLHR70 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Dec 2020 12:59:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbgLHR70 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Dec 2020 12:59:26 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44034C061749;
        Tue,  8 Dec 2020 09:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=xpPrMtRvHw9uqYWab0h0BufwacaQTlL6o1POPE2Agm0=; b=ujqn2sNEqBW65hdKJbVwhyiG1I
        q4h6IPSVJMUPyS8qmJfMk3lQTvdUQ/axMqLnNICqsLCh3A0jm7G1ifHG9cR3Fnsh0HhGPojPvl39k
        VEoEAIS6jB/Ik5kgCUOspdU6i/lw2M5sWEvMVtApWv4YoTC/HjtWgLGR/T7UP/Z5x9swPOVQSnCOd
        a+DFbupqke6wOcA6HjN+2ufyF2MqIkGP4Ic6ZhPUpaR5lDQyWUgKCtjp1wSLWZPOyDicUUYPwel6B
        0kjRicsFxiqa7Rqrhr3nGXAB2PfMNCXELi13TMqybrAjLsIQr0JG9/IXRhxNOrWJn1DfcfSv+aOJm
        x18Tfs8g==;
Received: from [2601:1c0:6280:3f0::1494]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kmhG3-0007v4-7W; Tue, 08 Dec 2020 17:58:39 +0000
Subject: Re: [PATCH] Update documentation to reflect what
 TAINT_CPU_OUT_OF_SPEC means nowadays
To:     Jonathan Corbet <corbet@lwn.net>,
        Mathieu Chouquet-Stringer <me@mathieu.digital>
Cc:     Borislav Petkov <bp@alien8.de>, Stephen Kitt <steve@sk2.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        "Guilherme G. Piccoli" <gpiccoli@canonical.com>,
        Eric Biggers <ebiggers@google.com>,
        Qais Yousef <qais.yousef@arm.com>,
        Naoki Hayama <naoki.hayama@lineo.co.jp>,
        Yue Hu <huyue2@yulong.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20201202153244.709752-1-me@mathieu.digital>
 <20201208105439.23e2349b@lwn.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <1254edd7-25ee-b73d-da2c-194d38ba7890@infradead.org>
Date:   Tue, 8 Dec 2020 09:58:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201208105439.23e2349b@lwn.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 12/8/20 9:54 AM, Jonathan Corbet wrote:
> On Wed,  2 Dec 2020 16:32:43 +0100
> Mathieu Chouquet-Stringer <me@mathieu.digital> wrote:
> 
>> 	Hello Jonathan,
>>
>> Here's a patch updating the meaning of TAINT_CPU_OUT_OF_SPEC after
>> Borislav introduced changes in a7e1f67ed29f and upcoming patches in tip.
>>
>> TAINT_CPU_OUT_OF_SPEC now means a bit more what it implies as the
>> flag isn't set just because of a CPU misconfiguration or mismatch.
>> Historically it was for SMP kernel oops on an officially SMP incapable
>> processor but now it also covers CPUs whose MSRs have been incorrectly
>> poked at from userspace, drivers being used on non supported
>> architectures, broken firmware, mismatched CPUs, ...
>>
>> Update documentation and script to reflect that.
>>
>> Signed-off-by: Mathieu Chouquet-Stringer <me@mathieu.digital>
> 
> Hearing no objection, I've applied this.


Hm, I was glad to read this new info since my old testing laptop
now tells me that it needs a microcode update.  :(


-- 
~Randy

