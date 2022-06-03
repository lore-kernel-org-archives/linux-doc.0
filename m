Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9B9DC433EF
	for <linux-doc@archiver.kernel.org>; Fri,  3 Jun 2022 15:05:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230480AbiFCPFN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Jun 2022 11:05:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245384AbiFCPFI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Jun 2022 11:05:08 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 445B06547
        for <linux-doc@vger.kernel.org>; Fri,  3 Jun 2022 08:05:07 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id j7so7544374pjn.4
        for <linux-doc@vger.kernel.org>; Fri, 03 Jun 2022 08:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:to:cc:references:subject
         :content-language:from:in-reply-to:content-transfer-encoding;
        bh=vcRBUDjj3j0p9SWw8/7XlpWH44YKraSqSFhdqfv8qo4=;
        b=XU6iwJLODCZDF1PhpcXAQhnLSAsMEeEmPF8mx6GRSCP/LKxlneNkjuYuinN8OWLWc8
         4WY5Z4wLIfDEBDTFawM2UyX5pvzmKl5lBpDlk+mLaw7OzYRi49Rey4qL+4oed1Oup31L
         a4MuyK6bwNyxRU3osUBeY/FX6d4JbQLZ8UpVSHq1LuhY+SRBVp6ueixfDkaz1rwVxqG2
         G+saB47lZgcVpJ6uMvW81gW5JiDSlbGX+5g9qA8SwYL6DMA+qGrA22ZgqhFrM2SsOUJF
         R33HiHfvux4aUjYT2rfFGtpzYp7AbztKvsbfH8N5mcM6iTkPCaFkFEaWPnCrKPTmI1uS
         9Jnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:to:cc
         :references:subject:content-language:from:in-reply-to
         :content-transfer-encoding;
        bh=vcRBUDjj3j0p9SWw8/7XlpWH44YKraSqSFhdqfv8qo4=;
        b=JUeEAvsX0KWjxFKBIxUUlWzoSXqoDISoFCUSuO4GZqs7KrIts9jCzPk4w7tcndTsH5
         km6aGJCxlgSVuwJ04wp9/lB1xiMiXaRIkrodzhYD66ahIh6zLBOVFZac7f5yCGFFwz2y
         ol/EGo5lzAVwC9uKVvFbp7KmyIhjGioBdU3B70y9NIeDE9Ox7CIt7P4CmSOy+VB4xIGW
         pWV/1ooOCjffAkxMEyQWjby9vHN/NqgOAVr8nj735FpvXn/4lJewuPA3O4QRz+Y3Rvfh
         01nlCQnuMbxVW6EeOQnRll1xe9LfcTBSnc1ofKKFxRS+nf+RH9CeeVuzWeaY8jDlvB4j
         fPvw==
X-Gm-Message-State: AOAM530Sx360ixCLCe+AbPsGPMJAEZO82oq26qpIe2+po++g/2Vu1i8A
        E9iNmqXiKnbN5Ndxf24LYCo=
X-Google-Smtp-Source: ABdhPJytYKa83X7aaMEBQRqvfbsHzncXte2JA3yA81s9jnvHUcQ2g0lfKcEgs2dB6sFaFD+dT+1wkA==
X-Received: by 2002:a17:90a:5d04:b0:1df:91d7:5563 with SMTP id s4-20020a17090a5d0400b001df91d75563mr46422211pji.95.1654268706702;
        Fri, 03 Jun 2022 08:05:06 -0700 (PDT)
Received: from [192.168.11.5] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id r72-20020a632b4b000000b003c14af5060fsm2496019pgr.39.2022.06.03.08.05.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jun 2022 08:05:06 -0700 (PDT)
Message-ID: <52a6ffc3-300f-289e-b523-bc1ea93459d1@gmail.com>
Date:   Sat, 4 Jun 2022 00:05:02 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
To:     Adam Turner <aaturnerpython@outlook.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <LO3P123MB26810D190462B6BBBF1305F6C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
Subject: Re: Sphinx pre v3 -- removing support
Content-Language: en-US
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <LO3P123MB26810D190462B6BBBF1305F6C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Adam,

Please find a couple of inline questions below from a casual user of
Sphinx via kernel documentation build tools.

On Fri, 3 Jun 2022 14:13:27 +0000,
Adam Turner wrote:
> Hi,
> 
> I was pointed in the direction of this mailing list by Jani Nikula in
> [1]_, who said:
> 
>> Thanks for the ping. I was heavily involved in the early days of
>> converting the kernel to use Sphinx, but I haven't closely followed
>> the recent developments. Basically I think I'd also be inclined to
>> push for much higher minimum Sphinx version requirements than what
>> the kernel currently has. The minimum at the moment is v1.7.9 
>> (or v2.4.4 for PDF). It's difficult to maintain support for a wide
>> range of Sphinx versions. Perhaps the best bet would be to mail the
>> kernel documentation list at linux-doc@vger.kernel.org and Cc 
>> Jonathan Corbet corbet@lwn.net to try to reach an understanding on
>> the recommended minimum version and version ranges that makes sense
>> for both parties to support. HTH.
> 
> This email is an attempt to do that. 
> 
> From Sphinx's perspective, we'd like to remove long-deprecated code.
> What is a good solution here for both sides? The intertial option is
> for us to delay the deprecation by another major version (removal is
> currently scheduled for Sphinx 6 (2023-05), and we are currently 
> releasing a major version every May.

So, can we assume that there won't be any backward-incompatible
behavior changes in Sphinx due to the removal of those long-deprecated
code?

Or do you mean that after the release of Sphinx 6, pre v3 Sphinx
will be removed in the PyPI repository?

These questions might be too obvious for you but I have no idea what
you mean by "removing support".

       Thanks, Akira

> 
> Jani reports that you still require Sphinx 1.7.9 -- I have no 
> investment in the documentation development of the kernel, but he
> rightly notes that is quite an old version -- released 3 years and 9
> months ago.
> 
> Please would you let me know if there is anything required on our
> (Sphinx's) end that would let us drop the "pre v3" support gracefully.
> 
> A
> 
> Thanks,
> Adam
> 
> _[1]: https://github.com/sphinx-doc/sphinx/pull/10471#discussion_r888962744
> 
