Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1159EC77B78
	for <linux-doc@archiver.kernel.org>; Wed, 26 Apr 2023 16:17:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240469AbjDZQRI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 26 Apr 2023 12:17:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234484AbjDZQRH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 26 Apr 2023 12:17:07 -0400
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F90910F6
        for <linux-doc@vger.kernel.org>; Wed, 26 Apr 2023 09:17:05 -0700 (PDT)
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-63b79d8043eso37880448b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 26 Apr 2023 09:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682525825; x=1685117825;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UOhh7PBmE0FMhbaVbxSvnruTMoKtaFfjJSq6v0FhcXc=;
        b=MZ4nIIJTkzZdwLItB22MSQr876/ZCmOOTnCjOwMN3HdZZA2MBx0RasO5pEQ/Q/JWWd
         O3NitjTxiGvQdKCYmxRC9XFU68PNDyZBtslpXPysgDBVMUdXdMfgMmoIUzjdawjlEr2g
         qQFD2+bVu0nt4/Epppg59t1qLnYmXXAr8GqBCfXhZzFq8LVA8mzxpKkEYaGvTFX1WCdU
         u3Wgn6jcO4GlrBPeARgIe9BCGjk6FGCL2HNwRCAyyqtvc8xdH59S7McTdKDHbUBYZqmr
         Of+AcOL8IdXTBWVqOuVHuVeVNYqF9OcM9V9oG7yyhc/7SVtGpJ56+FscccIyl3JvKrJi
         bV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682525825; x=1685117825;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UOhh7PBmE0FMhbaVbxSvnruTMoKtaFfjJSq6v0FhcXc=;
        b=ZSBTDLQsoKDjdoZeEQpg3slVqUOABaA+BOqnc/0rCVXtDE4UJzEaqANMWd9HR/anlG
         qbel0GhrDSMFl1PVqjWo4OB2geziuSTcAthLh0aGmhqAmwspM66JANnFO7SicFv9ZJwV
         +fdnbp/wt0H2oz2ZeK5oMww1xxDmhaJiEySCymzHfXguzhi8oUOlYXXv+/zUrsRAm3wE
         UUeMx1JvjN1x671iVMKNpSJQbZYh3s843V2am/XDYDGanFRFQV7qCkEHpES7tvh5ybGV
         a/hqb/RSoVgIVJjzMGwG9RzPscB4ltxw0UnYdNkAq5iXMYhEgEH39xieuER8gLpov4/H
         6hqw==
X-Gm-Message-State: AC+VfDzS+f+z9F/KtSHEKdw/2gFVmQmdG2L6mUSyGjJ37vSGFp+F92eL
        FeHxPE68anENPzeG1bnclyB8XxLos7Q=
X-Google-Smtp-Source: ACHHUZ5zn0kzUvAs53+qiE6+jt0LA2gWUhXUpDVyfL4k7W+HpTWTIOUbsKs80mJX/Z8nN4M4KKiZuVcHeL8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:44c9:b0:63d:24ea:4172 with SMTP id
 cv9-20020a056a0044c900b0063d24ea4172mr1075870pfb.1.1682525825009; Wed, 26 Apr
 2023 09:17:05 -0700 (PDT)
Date:   Wed, 26 Apr 2023 09:17:03 -0700
In-Reply-To: <7502e1af0615c08167076ff452fc69ebf316c730.camel@linux.ibm.com>
Mime-Version: 1.0
References: <20230327141816.2648615-1-carlos.bilbao@amd.com>
 <ZEfrjtgGgm1lpadq@google.com> <DM8PR11MB575046B6DAA17B41FFED8080E7659@DM8PR11MB5750.namprd11.prod.outlook.com>
 <7502e1af0615c08167076ff452fc69ebf316c730.camel@linux.ibm.com>
Message-ID: <ZElOfzn37kmesy7e@google.com>
Subject: Re: [PATCH] docs: security: Confidential computing intro and threat model
From:   Sean Christopherson <seanjc@google.com>
To:     James Bottomley <jejb@linux.ibm.com>
Cc:     Elena Reshetova <elena.reshetova@intel.com>,
        Carlos Bilbao <carlos.bilbao@amd.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "ardb@kernel.org" <ardb@kernel.org>,
        "kraxel@redhat.com" <kraxel@redhat.com>,
        "dovmurik@linux.ibm.com" <dovmurik@linux.ibm.com>,
        "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
        "Dhaval.Giani@amd.com" <Dhaval.Giani@amd.com>,
        "michael.day@amd.com" <michael.day@amd.com>,
        "pavankumar.paluri@amd.com" <pavankumar.paluri@amd.com>,
        "David.Kaplan@amd.com" <David.Kaplan@amd.com>,
        "Reshma.Lal@amd.com" <Reshma.Lal@amd.com>,
        "Jeremy.Powell@amd.com" <Jeremy.Powell@amd.com>,
        "sathyanarayanan.kuppuswamy@linux.intel.com" 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        "alexander.shishkin@linux.intel.com" 
        <alexander.shishkin@linux.intel.com>,
        "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "dgilbert@redhat.com" <dgilbert@redhat.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "dinechin@redhat.com" <dinechin@redhat.com>,
        "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
        "berrange@redhat.com" <berrange@redhat.com>,
        "mst@redhat.com" <mst@redhat.com>, "tytso@mit.edu" <tytso@mit.edu>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "joro@8bytes.org" <joro@8bytes.org>,
        "leon@kernel.org" <leon@kernel.org>,
        "richard.weinberger@gmail.com" <richard.weinberger@gmail.com>,
        "lukas@wunner.de" <lukas@wunner.de>,
        "cdupontd@redhat.com" <cdupontd@redhat.com>,
        "jasowang@redhat.com" <jasowang@redhat.com>,
        "sameo@rivosinc.com" <sameo@rivosinc.com>,
        "bp@alien8.de" <bp@alien8.de>,
        "security@kernel.org" <security@kernel.org>,
        Andrew Bresticker <abrestic@rivosinc.com>,
        Rajnesh Kanwal <rkanwal@rivosinc.com>,
        Dylan Reid <dylan@rivosinc.com>,
        Ravi Sahita <ravi@rivosinc.com>
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 26, 2023, James Bottomley wrote:
> On Wed, 2023-04-26 at 13:32 +0000, Reshetova, Elena wrote:
> > > On Mon, Mar 27, 2023, Carlos Bilbao wrote:
> [...]
> > > > +provide stronger security guarantees to their clients (usually
> > > > referred to +as tenants) by excluding all the CSP's
> > > > infrastructure and SW out of the +tenant's Trusted Computing Base
> > > > (TCB).
> > > 
> > > This is inaccurate, the provider may still have software and/or
> > > hardware in the TCB.
> > 
> > Well, this is the end goal where we want to be,

If by "we" you mean Intel and AMD, then yes, that is probably a true statement.
But those goals have nothing to do with security.

> > the practical deployment can differ of course. We can rephrase that it
> > "allows to exclude all the CSP's infrastructure and SW out of tenant's
> > TCB." 
> 
> That's getting even more inaccurate.  To run  in a Cloud with CoCo you
> usually have to insert some provided code, like OVMF and, for AMD, the
> SVSM.  These are often customized by the CSP to suit the cloud
> infrastructure, so you're running their code.  The goal, I think, is to
> make sure you only run code you trust (some of which may come from the
> CSP) in your TCB, which is very different from the statement above.

Yes.  And taking things a step further, if we were to ask security concious users
what they would choose to have in their TCB: (a) closed-source firmware written by
a hardware vendor, or (b) open-source software that is provided by CSPs, I am
betting the overwhelming majority would choose (b).
