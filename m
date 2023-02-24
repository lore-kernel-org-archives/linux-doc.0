Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0ABDC61DA4
	for <linux-doc@archiver.kernel.org>; Fri, 24 Feb 2023 14:45:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbjBXOpV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 24 Feb 2023 09:45:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230034AbjBXOpF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Feb 2023 09:45:05 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3F803B66D
        for <linux-doc@vger.kernel.org>; Fri, 24 Feb 2023 06:45:04 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id s5so16890715plg.0
        for <linux-doc@vger.kernel.org>; Fri, 24 Feb 2023 06:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=coTtLh17Jcp/i0fKluv9ugDwM4AesfTvM9iAIYJCq2A=;
        b=f3JP3IfXZFoWmGVI+4aC5ZR6KytWd3/IEHl8NQy66xo+fh0HIm6MxedamJlxa8lmAl
         fPZCJigIQoFapyXsf34PLbN35QvacCathImrfrvcSwCQu3H/mXdgGvsKKvIDS7GxJcSI
         K4hISq8h9SDFlloVloSQcmKNkcY3+ahaPqbJwxZNGSgsfIqmdjIGe9ovGg8Py222kmjl
         zyvSr5nhPsrS30yHyQgAGQ2XxxjJy8kB1k2F4U86BXsVCd3c4kUCL0G4lrFkSklq3c25
         OyvtfK3ObB4PhLcCUuu+YrSO5foxebwWaxQ3UrcvkXuH8tl7RDskoyYWD/uNdmXFNdWG
         fp4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=coTtLh17Jcp/i0fKluv9ugDwM4AesfTvM9iAIYJCq2A=;
        b=AgdvEBDQ2705oU14JvY+qcFO4O/hObcHC3ajD2Vn0vtFL5Hmgw6eiVCz+u/VVf2JIK
         W6O4iYp9i5exY3WRp+rMD9plLbRwiTRTo6F9xD5x1ttmLRUej5y/Sb0HWXLQS7XErQFf
         /y0Vye99Wm1d6qwFFDEIcCYzzUnl1YVegoPG4vLyMi8q13wm4jdk5NTIEkNV9odCxWnv
         5BXlnqF6rg2x/Nd3d3HILc77UBjrKztJSPDPt5V/1Em7o6umdQDPXCb9M/DHewF6MPqC
         5vJkWvCBcFPEisy+ZXR4QY9ihOaTE/4LBGj/n0uKBfuYbyvF92f00U5PUdrA1ruFsCeN
         x6ig==
X-Gm-Message-State: AO0yUKVPWEye4nh4uSmYGJHVRfxZAJlTvLD7uuKNu6JlbDrWegS8W6N0
        YvdZyUjVYD7wgGGG/SWrwtF91w==
X-Google-Smtp-Source: AK7set/Iyjj7TrMe766Iwdl0u/OZcVJHX4ug1aHv9t/gLxoHo1hy6D3fQY4QTXwCFZqVNjl7iJMV7g==
X-Received: by 2002:a17:90b:38c7:b0:234:a88e:d67e with SMTP id nn7-20020a17090b38c700b00234a88ed67emr17691751pjb.34.1677249904318;
        Fri, 24 Feb 2023 06:45:04 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id b12-20020a170902b60c00b0019472226769sm9103967pls.251.2023.02.24.06.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 06:45:04 -0800 (PST)
Date:   Fri, 24 Feb 2023 20:14:54 +0530
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
Subject: Re: [PATCH V2 18/21] RISC-V: Add ACPI initialization in setup_arch()
Message-ID: <Y/jNZg5k1UZ26i1X@sunil-laptop>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
 <20230216182043.1946553-19-sunilvl@ventanamicro.com>
 <20230220200743.rev3djzbaa2jcmg6@orel>
 <Y/ivRjQbIna7M4R2@sunil-laptop>
 <20230224130712.c42ob66ux5xhffbm@orel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230224130712.c42ob66ux5xhffbm@orel>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Feb 24, 2023 at 02:07:12PM +0100, Andrew Jones wrote:
> On Fri, Feb 24, 2023 at 06:06:22PM +0530, Sunil V L wrote:
> > On Mon, Feb 20, 2023 at 09:07:43PM +0100, Andrew Jones wrote:
> > > On Thu, Feb 16, 2023 at 11:50:40PM +0530, Sunil V L wrote:
> ...
> > > > +	fadt = (struct acpi_table_fadt *)table;
> > > > +
> > > > +	if (!(fadt->flags & ACPI_FADT_HW_REDUCED)) {
> > > 
> > > Do we also need to check for ACPI version 5.0+ when checking for HW
> > > reduced?
> > > 
> > We need to add version check of FADT once spec is released. Will
> > update it at that time.
> > 
> 
> I was thinking we need the version check already just for the flag.
> The spec has a footnote that says
> 
> "The description of HW_REDUCED_ACPI provided here applies to ACPI
>  specifications 5.0 and later"
> 
> It doesn't really matter in practice since no RISC-V machines can
> boot with ACPI less than a version that support the new RISC-V
> tables... But I'd rather we either document that fact, or just do
> the check.
> 
Okay Let me add the current FADT version of 6.5 which for sure
supports HW_REDUCED flag. When the spec gets released, we can update with
actual revision we need for RISC-V.

Thanks,
Sunil
