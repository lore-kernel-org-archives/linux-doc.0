Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7D9EC4338F
	for <linux-doc@archiver.kernel.org>; Wed,  4 Aug 2021 21:28:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D91D60EFD
	for <linux-doc@archiver.kernel.org>; Wed,  4 Aug 2021 21:28:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231272AbhHDV24 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 4 Aug 2021 17:28:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbhHDV24 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 Aug 2021 17:28:56 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BD81C061799
        for <linux-doc@vger.kernel.org>; Wed,  4 Aug 2021 14:28:43 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id a20so4582205plm.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Aug 2021 14:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YwkwRJ9mLbXh7zqk7lDDyX/7/SuI/tJpL52Sp9LmiBc=;
        b=OE/AvtRMkBeyoJUtymm5FvWO/YBLRc0dy9KBzpwRW/ToEUPpaWRmMC/JvfVXySz4+b
         rywpJFZqj1Um7P1D3RLIp6VBJp6QKPoETT80bBQyKdCGtdWj2HwxF36cxC7GBBPzNvgP
         ehZHkhCKoiVj9o0YHWD3PK8sMo8Uh7Fqr8kmVz4FKdK3n6/pMk6qmdXWjdKuTb3iD39u
         RBTAgcWCfQpNPILQjyeMYAiaBZUDO0mnKg4sRctkx5hk68aL2guyJ0GTlMkmKu3yLYGi
         nvWxG11kdhoIWEwlz664vRRDWHXvX4S/ZJfPdivV589vP3whFMYgwH/JCwHwZ4ufyaPH
         /yAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YwkwRJ9mLbXh7zqk7lDDyX/7/SuI/tJpL52Sp9LmiBc=;
        b=mi6tYEDhm4klN2zYzGPBFzDcYxlIGdFZotZ1srvAZ9Yq7C+N7JX90UuEsyQdE0C6dC
         x3REl3RSSWrvWEwK/7Izz1DwjYaOmHqLmSpWCq6jiqzeGzwuEg6z8/ABDM+d7AvupZF1
         p2d9SJJJPVsRVzc6Aaf/ry664nMC7Sjn2h9L2vmWiF/1F4+tk1LbPQ1xKOdbWCLJqPT+
         n9CwFHQlmUHMc0kKyFP5/CNfISgAs7U8clDW13z97+7+nQbPD4S34qxYr8hFT9dvuXcw
         +1SHS6b27LUzM3eLUVFu5A9J+FusElUra4tmMjtO2jkw3FXjivRhxM7SfjOjDlzrYEt/
         aPuA==
X-Gm-Message-State: AOAM533gGFzYqHiK01eF7vfm2zNIGxaLGGswE3FRhM4T/v0jO2TekKMD
        oz5IULzskD0O8IADl+3iTLttK+gnTe8+uqBhwThp1A==
X-Google-Smtp-Source: ABdhPJzFVq7U9xJpmnszWMfMg7W/Q7UwjVYxw+m5FvMfbR7Rr8H+p1C6DFfux6NGIeUPdKskM9JDCoFFLzrXds0FDEs=
X-Received: by 2002:a17:90b:11cd:: with SMTP id gv13mr2974447pjb.149.1628112523029;
 Wed, 04 Aug 2021 14:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210804174322.2898409-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <YQrqhYEL64CSLRTy@kroah.com> <CAPcyv4iEEDCz5719d0vNi=zi=6oN5vctcVfY5P=WQ9j_Zpz6eA@mail.gmail.com>
 <YQsBfAVPomaC97Rm@casper.infradead.org>
In-Reply-To: <YQsBfAVPomaC97Rm@casper.infradead.org>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Wed, 4 Aug 2021 14:28:32 -0700
Message-ID: <CAPcyv4gSsL5hk=CSk=9duqCN3VDS_T2LaYRL+_zK9VOkO8NB+A@mail.gmail.com>
Subject: Re: [PATCH v1] driver: base: Add driver filter support
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andi Kleen <ak@linux.intel.com>,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 4, 2021 at 2:07 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Wed, Aug 04, 2021 at 01:11:27PM -0700, Dan Williams wrote:
> > On Wed, Aug 4, 2021 at 12:29 PM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > > Why not just make distros that want to support this type of platform,
> > > also provide these tiny kernel images?  Why are you pushing this work on
> > > the kernel community instead?
> >
> > In fact, these questions are where I started when first encountering
> > this proposal. Andi has addressed the single kernel image constraint,
> > but I want to pick up on this "pushing work to the kernel community"
> > contention. The small list of vetted drivers that a TDX guest needs
> > will be built-in and maintained in the kernel by the protected guest
> > developer community, so no "pushing work" there. However, given that
> > any driver disable mechanism needs to touch the driver core I
> > advocated to go ahead and make this a general purpose capability to
> > pick up where this [1] conversation left off. I.e. a general facility
> > for the corner cases that modprobe and kernel config policy can not
> > reach. Corner cases like VMM attacking the VM, or broken hardware with
> > a built-in driver that can't be unbound after the fact.
>
> I don't understand how this defends against a hypervisor attacking a
> guest.  If the hardware exists, the hypervisor can access it, regardless
> of whether the driver is default-disabled by configuration.

The "hardware" in this case is virtual devices presented by the VMM to
the VM. So if a driver misbehaves in a useful way for an attacker to
exploit, they can stimulate that behavior with a custom crafted
virtual device, and that driver will autoload unaware of the threat
without this filter for vetted drivers.
