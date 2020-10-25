Return-Path: <SRS0=AsmQ=EA=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9696C5517A
	for <linux-doc@archiver.kernel.org>; Sun, 25 Oct 2020 22:11:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D6CC2231B
	for <linux-doc@archiver.kernel.org>; Sun, 25 Oct 2020 22:11:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore-com.20150623.gappssmtp.com header.i=@paul-moore-com.20150623.gappssmtp.com header.b="Q8CS6+Ms"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1419144AbgJYWLA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 25 Oct 2020 18:11:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391612AbgJYWK7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 25 Oct 2020 18:10:59 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F339DC0613CE
        for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2020 15:10:56 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id t20so7396121edr.11
        for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2020 15:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tdnZw76qVstn6+QH2BD9S0uoR0Bw/i7xKme9YhIoncY=;
        b=Q8CS6+MsaiGw4Zr5INAN2zzC4XW2DIX9J5VnnoeZXYKoa1PhBdB/bUmQCvSxGJLmfg
         H/j0bGj6u7MlgKCJsRyunKiLz+F3S+tJlHrHqbiavC7aDWs70sGVJefvtGBHmC0w+sja
         VIiif/8S3WteScdeBev9U7kMRxbHFDDupNnRz2oN2DG4C9PVkyxcKVL+FWdE1Tvm+hQa
         /Yd28N1I/goacLfTxkU3qDW1iunZTFcGrLrn7nvrHzIoZqx9gU7z+9oNY0awUi/8HOs0
         wOxe2zhqKYDgUnpbyttTr23ACyIRIJ6td49w4mTjwA7lb/ufVR4ntiWHvqJZhilPD1uW
         npuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tdnZw76qVstn6+QH2BD9S0uoR0Bw/i7xKme9YhIoncY=;
        b=ovV1oSbgcyWMP0jbtdm4Ci9151+sIEUk27nxrU9TFBAdb6WL1ZzchJRwKN0Wxkju84
         Cl4l+P3Ce4xmA0paRK34aabZ3uXgcKkdoDh1JPeWhGF+OS9o4NvXGf+x0zOfVuxGiXiz
         nFSTYcDLVi1i/4iw7kkmneWoVjr4OWhgioO5XrVZfGbyqraGoLQCTI2o8+HB06t7mDcs
         npm4+Z0qgLmKYdQyhKAYQlvhSQ58a7a4mj0U8Yu0uA2+fXZNeuiVJbiNI1uR/8vLBqIj
         eXRMHCGqZvoW5lZs43DACe9AeeZqAbx5uYzejRFbuUiCZ8aTAU+tJZ5kY+573DQZbKnJ
         f2fg==
X-Gm-Message-State: AOAM533dvMYFRrkj+/NzysZlfeJlAlHNMOuB07lT/ro3FFpfa2Sjlbno
        vD+Z5+Htfwc3yR9LzIloq+g+baBR5aQLftMB+ALq
X-Google-Smtp-Source: ABdhPJyLEBWv9F4YhwzynfMYVBexdD3GqbUxbBH+vngsdu+ZtVKMJPGPu3mdw4W34PdPX4g0n5METweLV5QzVVSUrKY=
X-Received: by 2002:aa7:d689:: with SMTP id d9mr13357034edr.128.1603663855471;
 Sun, 25 Oct 2020 15:10:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1603469755.git.mchehab+huawei@kernel.org> <8c04d5c5d0144019c2c38d7c3f31061d6b35d360.1603469755.git.mchehab+huawei@kernel.org>
In-Reply-To: <8c04d5c5d0144019c2c38d7c3f31061d6b35d360.1603469755.git.mchehab+huawei@kernel.org>
From:   Paul Moore <paul@paul-moore.com>
Date:   Sun, 25 Oct 2020 18:10:44 -0400
Message-ID: <CAHC9VhQ88cuU-0QdpYJyJZE3FU-3graP=N9n9eiG4Kj2tDbiBQ@mail.gmail.com>
Subject: Re: [PATCH v3 51/56] audit: fix a kernel-doc markup
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Eric Paris <eparis@redhat.com>, linux-audit@redhat.com,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Oct 23, 2020 at 12:33 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> typo:
>         kauditd_print_skb -> kauditd_printk_skb
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  kernel/audit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Looks good to me, nice catch.  Would you like me to pull this into the
audit tree or are you intending this to get pulled in as part of the
larger patchset somewhere else?

Acked-by: Paul Moore <paul@paul-moore.com>

> diff --git a/kernel/audit.c b/kernel/audit.c
> index 68cee3bc8cfe..0be42cac086b 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -523,7 +523,7 @@ static int auditd_set(struct pid *pid, u32 portid, struct net *net)
>  }
>
>  /**
> - * kauditd_print_skb - Print the audit record to the ring buffer
> + * kauditd_printk_skb - Print the audit record to the ring buffer
>   * @skb: audit record
>   *
>   * Whatever the reason, this packet may not make it to the auditd connection
> --
> 2.26.2

-- 
paul moore
www.paul-moore.com
