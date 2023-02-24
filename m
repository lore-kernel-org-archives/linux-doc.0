Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1CC2C61DA3
	for <linux-doc@archiver.kernel.org>; Fri, 24 Feb 2023 12:38:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbjBXMiu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 24 Feb 2023 07:38:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbjBXMit (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Feb 2023 07:38:49 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC6131589B
        for <linux-doc@vger.kernel.org>; Fri, 24 Feb 2023 04:38:41 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id q11so16943404plx.5
        for <linux-doc@vger.kernel.org>; Fri, 24 Feb 2023 04:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K7qH17OyGyM47GPzRwHNiOgr9TsgAnfi2ZEjhVFPdcg=;
        b=Mt68vRPDJBeoMxtMNOChw+A7exoz18+aUvT6JRwUTf7K6bXqvpMUHqiEycS//qFsU3
         HVdWLFrDh4zfTrJzhPu2zMFHFEunSFyBhQV0tGwm6ZEledQKfno2fjmw9IYGXTyIjVRl
         1Nm+zeM2tTD7pSA9lu3lTGMI/d0QVyfgoWpNFbINA93+xvMoUd/Fr7IjSV8s2fxuXsZJ
         Tjm0hW77pG/PzMT/AubtH3oi+nwOcYi3d7K3WO6T9YEpBRxLlbYtPPcMEZgxoCyM/r14
         WUWMf+wcebBgEmu8T37SAyyYhXWLxLMj668fZH+HRXchJEwKLXSaKdrFeM1lA0ZmPGTP
         XWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7qH17OyGyM47GPzRwHNiOgr9TsgAnfi2ZEjhVFPdcg=;
        b=Ex+5tOZuxHE1IUxfMFrFYHF8LQpqJ25XtaGZNFqw8pMlruC49VmEn+2oQTMfZ8IZBV
         UIKdFUHZ0pptUV0s6Uab/KF6+2ldlDRkZjWkcC0SRmGWMGbY2Ob/cDpxbVoXd6oCpma3
         hreVVgsRA592CcPIA9G05S55e3kCWT36ovjOVDD9GkdijvlDTXgu0pUQVhmLew8+g1wg
         M17bX4Awwh00g+u+FfPQ4JusQxbvX96THuD22HfrqW2HEaSmK6uKRt37K2l/fvtjllrr
         N3+j34QW2ZZg6SkCqZRN9rq53yKKn5x0y9gDNVJJ6LQHdPkJeg3fYGDxUpb+7lZ4DC7L
         hQvQ==
X-Gm-Message-State: AO0yUKXGXJRmu+2nWkdUybQjHGlbntRLyDAd1PjB27SCqbhqUFhAZJ8/
        EyhQFIMggW24Q51NyltheDwUsQ==
X-Google-Smtp-Source: AK7set9/IK46oIHdAjUgWq+wlPNf5E+YpHOahLJ9kH52yTNvgxOt21mZCyPmEi1etMRXaG2aNV/qhw==
X-Received: by 2002:a17:90b:3a87:b0:233:c301:32b0 with SMTP id om7-20020a17090b3a8700b00233c30132b0mr17950540pjb.10.1677242321176;
        Fri, 24 Feb 2023 04:38:41 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id e8-20020a170902744800b0019a593e45f1sm9363605plt.261.2023.02.24.04.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 04:38:40 -0800 (PST)
Date:   Fri, 24 Feb 2023 18:08:32 +0530
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     Andrew Jones <ajones@ventanamicro.com>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>,
        Anup Patel <apatel@ventanamicro.com>,
        Atish Patra <atishp@rivosinc.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH V2 20/21] MAINTAINERS: Add entry for drivers/acpi/riscv
Message-ID: <Y/ivyGVW/v6Nf5Nh@sunil-laptop>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
 <20230216182043.1946553-21-sunilvl@ventanamicro.com>
 <20230220201432.5lz7rvwqhfxa4fno@orel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230220201432.5lz7rvwqhfxa4fno@orel>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Feb 20, 2023 at 09:14:32PM +0100, Andrew Jones wrote:
> On Thu, Feb 16, 2023 at 11:50:42PM +0530, Sunil V L wrote:
> > ACPI defines few RISC-V specific tables which need
> > parsing code added in drivers/acpi/riscv. Add maintainer
> > entries for this newly created folder.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > ---
> >  MAINTAINERS | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 39ff1a717625..d47212194457 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -450,6 +450,13 @@ S:	Orphan
> >  F:	drivers/platform/x86/wmi.c
> >  F:	include/uapi/linux/wmi.h
> >  
> > +ACPI FOR RISC-V (ACPI/riscv)
> > +M:	Sunil V L <sunilvl@ventanamicro.com>
> > +L:	linux-acpi@vger.kernel.org
> > +L:	linux-riscv@lists.infradead.org
> > +S:	Maintained
> > +F:	drivers/acpi/riscv
> 
> This section should go under the "ACPI FOR ARM64 (ACPI/arm64)"
> section to be in alphabetical order and also in a more logical
> place. Also, shouldn't this section include
> arch/riscv/kernel/acpi.c and potentially other arch/riscv/ files?
> I see arm64 doesn't, but maybe it should too.
> 
Okay. Let me update.

Thanks,
Sunil
