Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F903C4321E
	for <linux-doc@archiver.kernel.org>; Thu,  1 Dec 2022 11:38:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230162AbiLALic (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Dec 2022 06:38:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbiLALib (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Dec 2022 06:38:31 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3374229CAD
        for <linux-doc@vger.kernel.org>; Thu,  1 Dec 2022 03:38:28 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id gu23so3489158ejb.10
        for <linux-doc@vger.kernel.org>; Thu, 01 Dec 2022 03:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RmSe80HfKK7FckDSEcPQpoVUBo07goAUQO5ufP8u+m8=;
        b=gto4jEQ8rmQKpmOUaItlz1cLcGWBm97vuDDJShfFQGtq6ux/d2J517vmppUvppK1Hd
         qvD18tM9yHEh/h1ZhFLK6Hfi8r+63OeBX3sow55Iqwy7WBBNrel9LaXpIXMbAxYiGQXj
         fLGvSq7YHKE0xhVwtfXZZAN0oREYSqDD7SgKt7k5Hu3EtzTdr6KdWwO6YhPc3hNSp8Bv
         BXByjyqfZOc2CnjvFEZfcTTknnXZNt9MdxG4YdLNwwy24fCTMGmBnMiW9Ewe/fLq/KMa
         AcPP4jMk7ZklXk+7taX/4TfxhkP3gLEYAE1dt5P6pophujeaDdKEI6w1LEE7Fo2Z1PKu
         3Qxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RmSe80HfKK7FckDSEcPQpoVUBo07goAUQO5ufP8u+m8=;
        b=jUeFLh9dQwjFOMz1lUO4wgSjYoleOPID8p7T8N1/4WnF253Z92+MayYNMtx85pi2/A
         nZ75+ZxwqkC3kftGMYhqIvbjEOxc/VzNAQ+QXS47rjl/kGyAsBSLzDd1tQ+pgKZDSDmb
         ocxvhvzjtbLfuO45S6YadQAkdHzxrwXctuFvThXhSutBhOtgYWXm0JI7RJdtlyOj3BgJ
         bFRfs6wOU7hbsN9umTJKx3pj6xQd4gOcnr5BU4EUVsX+jLA6yR9ersV7W4iwThfa7zpn
         pEBpoBKuXvbjw6z2youkhLzFMQryRcLu9HlJ/qyklGTJ6120PmL16cVPyVCEW+SEkxu0
         sWQw==
X-Gm-Message-State: ANoB5pnDzA8MM8617cCrP8z1mZezFf/q7S7ZiPBspLk0n62pS72K6utg
        3LVJxrLgvaPc1EtFFIVIyvb7FQ==
X-Google-Smtp-Source: AA0mqf7txX1rh2Brl7EAEXMEplhAfLo8/oa9Ruzkyri1NSVBhprWiTA/sHJhLhSoiGiC8woxCpicMQ==
X-Received: by 2002:a17:906:3109:b0:7a0:b505:cae5 with SMTP id 9-20020a170906310900b007a0b505cae5mr56576723ejx.648.1669894705512;
        Thu, 01 Dec 2022 03:38:25 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id o3-20020a170906768300b007b27fc3a1ffsm1670182ejm.121.2022.12.01.03.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 03:38:25 -0800 (PST)
Date:   Thu, 1 Dec 2022 12:38:24 +0100
From:   Andrew Jones <ajones@ventanamicro.com>
To:     Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc:     Conor Dooley <conor@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org,
        Conor Dooley <conor.dooley@microchip.com>,
        aou@eecs.berkeley.edu, corbet@lwn.net, guoren@kernel.org,
        paul.walmsley@sifive.com, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v1 2/3] RISC-V: resort all extensions in consistent orders
Message-ID: <20221201113824.hcjijn3z45g2vohv@kamzik>
References: <20221130234125.2722364-1-conor@kernel.org>
 <20221130234125.2722364-3-conor@kernel.org>
 <20221201090041.525op4sateq5wq4y@kamzik>
 <46873028.fMDQidcC6G@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46873028.fMDQidcC6G@diego>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 01, 2022 at 11:47:04AM +0100, Heiko Stübner wrote:
> Am Donnerstag, 1. Dezember 2022, 10:00:41 CET schrieb Andrew Jones:
> > On Wed, Nov 30, 2022 at 11:41:25PM +0000, Conor Dooley wrote:
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > > 
> > > Ordering between each and every list of extensions is wildly
> > > inconsistent. Per discussion on the lists pick the following policy:
> > > 
> > > - The array defining order in /proc/cpuinfo follows a narrow
> > >   interpretation of the ISA specifications, described in a comment
> > >   immediately presiding it.
> > > 
> > > - All other lists of extensions are sorted alphabetically.
> > > 
> > > This will hopefully allow for easier review & future additions, and
> > > reduce conflicts between patchsets as the number of extensions grows.
> > > 
> > > Link: https://lore.kernel.org/all/20221129144742.2935581-2-conor.dooley@microchip.com/
> > > Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > ---
> > > I could not decide between adding an alphabetical comment to each
> > > alphabetical site or not. I did it anyway. Scream if you hate it!
> > > 
> > > I also moved a static branch thingy in this version, but that should not
> > > matter, right? riightt?
> > 
> > riiighttt. And it goes away with [1] anyway.
> > 
> > [1] https://lore.kernel.org/all/20221006070818.3616-1-jszhang@kernel.org/
> 
> I'm not sure what became of that series since mid october, though noting
> that tightly coupling the patching to extensions alone might cause issues [2]
> which some of the "features" like fast-unaligned access, that are not directly
> bound to a isa-extension but to an implementation detail
> 
> [2] https://lore.kernel.org/all/1991071.yIU609i1g2@phil/

Jisheng said he'd send a refresh soon. Hopefully your comments will be
taken into consideration. It seems like we need both the concepts of
cpufeatures and extensions. Where many times a cpufeature directly maps
to an extension, but not always. Or, we could shoehorn the non-extension
cpufeatures into the extension framework by calling them "derived
extensions" or something.

> 
> 
> > 
> > > ---
> > >  arch/riscv/include/asm/hwcap.h | 12 +++++++-----
> > >  arch/riscv/kernel/cpu.c        |  4 ++--
> > >  arch/riscv/kernel/cpufeature.c |  6 ++++--
> > >  3 files changed, 13 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> > > index b22525290073..ce522aad641a 100644
> > > --- a/arch/riscv/include/asm/hwcap.h
> > > +++ b/arch/riscv/include/asm/hwcap.h
> > > @@ -51,14 +51,15 @@ extern unsigned long elf_hwcap;
> > >   * RISCV_ISA_EXT_MAX. 0-25 range is reserved for single letter
> > >   * extensions while all the multi-letter extensions should define the next
> > >   * available logical extension id.
> > > + * Entries are sorted alphabetically.
> > >   */
> > >  enum riscv_isa_ext_id {
> > >  	RISCV_ISA_EXT_SSCOFPMF = RISCV_ISA_EXT_BASE,
> > > +	RISCV_ISA_EXT_SSTC,
> > > +	RISCV_ISA_EXT_SVINVAL,
> > >  	RISCV_ISA_EXT_SVPBMT,
> > >  	RISCV_ISA_EXT_ZICBOM,
> > >  	RISCV_ISA_EXT_ZIHINTPAUSE,
> > > -	RISCV_ISA_EXT_SSTC,
> > > -	RISCV_ISA_EXT_SVINVAL,
> > >  	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
> > >  };
> > 
> > Unrelated to this patch, but every time I look at this enum I want to post
> > the diff below, but I haven't bothered, because this enum also goes away
> > with [1].
> > 
> > @@ -59,8 +59,9 @@ enum riscv_isa_ext_id {
> >         RISCV_ISA_EXT_ZIHINTPAUSE,
> >         RISCV_ISA_EXT_SSTC,
> >         RISCV_ISA_EXT_SVINVAL,
> > -       RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
> > +       RISCV_ISA_EXT_ID_MAX
> >  };
> > +static_assert(RISCV_ISA_EXT_ID_MAX <= RISCV_ISA_EXT_MAX);
> 
> that sounds like a very reasonable idea ... what's keeping you? :-)

Posted :-)

Thanks,
drew
