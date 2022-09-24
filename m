Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E17B4C07E9D
	for <linux-doc@archiver.kernel.org>; Sat, 24 Sep 2022 13:32:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbiIXNcf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 24 Sep 2022 09:32:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbiIXNce (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 24 Sep 2022 09:32:34 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 574D22D1D3
        for <linux-doc@vger.kernel.org>; Sat, 24 Sep 2022 06:32:32 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id c11so3804129wrp.11
        for <linux-doc@vger.kernel.org>; Sat, 24 Sep 2022 06:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=nBsZVijM5eiCuqb5YsIQ2vD+F2CUPE6DaEHJkgR4cyU=;
        b=WFqo/hBxBwnaf4aTWMRm9X0+8RUN9/tApa78N4AJPHU+7qe1vdxSN1mpqsjVuu2ahy
         dGEIbXlwNrJ3uS/fy+OquZmoKGGCicJci3wRK9upFZ9cF18/tGyBjhsQIM7Bk9/lO5rg
         gcuE15fFf+a83ESdUIWzKa4f+FRN2gaQJH3/xVuVBuuhRR8xaBWp+lYghTVLPPQNJMmx
         IlUzGOoJ6I7HqS1vvyvWjfbmWt7MUDlM2idwS1NXBnq+QV0rrgF2gpSIJMMKlmxliuxB
         ecguEoj8QbL5bZbMuTSBuu/7Sc/c1YabUKEHW7UOFxAAX8GT1cxXqCHdM9PE/qSncqXb
         YB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=nBsZVijM5eiCuqb5YsIQ2vD+F2CUPE6DaEHJkgR4cyU=;
        b=GfHEw46wzzOLgDXj8+K8eUHUc46XamdAdtdoyhC3pcGTcVxm4Dx73DVA5h4AuShiXd
         pDKFJU0EGbb2GdY/tlvXs+tVSNbxsW0WoMYwGudNB9bv3dPI7I0D1e2urZXQsko+GWy4
         62NR060ZrqWNNYvWfd19aDD/DqGTunsuC+zANdEkJs9SKYsqvwzZKFtkEYED2HTeqgeK
         dZ6YSsgj792YW3YPk7bAiLpJZT6Ozd91JuQtyiXWS01yL70Hq1TaV3Ox9dF6/cY2qiRL
         43Kfpl1M2YZ/Or/qS70fKarTRNVEZkRkv4zOiLPqgCttWtqolgG2NE+PMLpHkJn7ulB1
         lCRw==
X-Gm-Message-State: ACrzQf05RveDjQJuUM9Cyhm16TKQa+z9upUfwZFrzBeSzoFYlsDX0UBV
        iU3o7J6axagWFekY92bS3IOvdzX226fY1Q==
X-Google-Smtp-Source: AMsMyM51g3+YpjLjLmRlO1kt9fqT/IXNL4P7YWqk8DytqkPsWv8xLwJHGDa18bpZ4Du6s7y03mXjUA==
X-Received: by 2002:adf:fc87:0:b0:228:7e07:73c with SMTP id g7-20020adffc87000000b002287e07073cmr7999007wrr.162.1664026350893;
        Sat, 24 Sep 2022 06:32:30 -0700 (PDT)
Received: from [192.168.0.33] (89-159-1-53.rev.numericable.fr. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id q1-20020a1c4301000000b003b4bd18a23bsm5208533wma.12.2022.09.24.06.32.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Sep 2022 06:32:30 -0700 (PDT)
Message-ID: <fa0bb78c-c0c3-bea5-45b1-460b0754e369@smile.fr>
Date:   Sat, 24 Sep 2022 15:32:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH RESEND] Documentation: kprobetrace: Improve readability
Content-Language: en-US
To:     Steven Rostedt <rostedt@goodmis.org>, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Masami Hiramatsu <mhiramat@kernel.org>,
        Bagas Sanjaya <bagasdotme@gmail.com>
References: <20220915153358.813993-1-yoann.congal@smile.fr>
 <87r104tr6o.fsf@meer.lwn.net>
 <81cae8f1-67e9-37ba-4bfd-566c877944ca@gmail.com>
 <20220921224725.618283bc@gandalf.local.home>
From:   Yoann Congal <yoann.congal@smile.fr>
In-Reply-To: <20220921224725.618283bc@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 9/21/22 22:20, Jonathan Corbet wrote:
> - This patch almost certainly should be split up.  At a minimum, I 
> would put the pure markup changes in one, and more substantive 
> changes in the other.  While you're at it, please consider whether 
> the document *really* needs all that ``literal text`` or not.


On 9/22/22 04:47, Steven Rostedt wrote:>>> Yoann Congal 
<yoann.congal@smile.fr> writes:
>>>> Improve readability of kprobetrace documentation by adding 
>>>> markup (mainly code snippets), fixing some typos and splitting 
>>>> some paragraphs.
>>>> 
>>>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr> --- 
>>>> Documentation/trace/kprobetrace.rst | 128 
>>>> ++++++++++++++-------------- 1 file changed, 66 insertions(+), 
>>>> 62 deletions(-)
> No. This file belongs to the tracing maintainers (I'll need to update
> the MAINTAINERS file, thanks Jon for letting me know).
> And yes, there's too much markup added to it.
> 
> NACK on that.
> 
> But there are some other clean ups in that patch that I have no 
> problem with.

Hi,

I'll send a v2 splitted and a lot less markup added (CC'ing the tracing 
maintainers). I guess I got a bit carried away once I started...

Steven, without adding any markup where there was not previously, how do 
you feel about changing the '...'/"..." by ``...`` where applicable?

Thanks!

-- 
Yoann
