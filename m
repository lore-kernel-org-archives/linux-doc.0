Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 314247D918
	for <lwn-linux-doc@archive.lwn.net>; Wed, 16 Oct 2019 16:32:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406216AbfJPQcH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 16 Oct 2019 12:32:07 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:32862 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405427AbfJPQcH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Oct 2019 12:32:07 -0400
Received: by mail-ed1-f66.google.com with SMTP id c4so21822155edl.0
        for <linux-doc@vger.kernel.org>; Wed, 16 Oct 2019 09:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=li50XsAB2VPn+/18ATYBNIxXsxb19ToHWwK0bY8hLFo=;
        b=EriZvZ61/49DnW9dz1N6YVkL3EQI5Lg969vC0qrzamzjwn6BZXK3mNc4zXESop9Ht8
         8CjEtCmCXmbrJcvEsIaAU4PbtYeSSh1vqiydCkR7uNOqvco0uLwmWDNiUqc58T+V/BVX
         zjwg4IrLhgbyuro1W0BPs5bCjB2isSWb676pC92EDjFaSKG30Zuw+1BdmwJJu+6y04yu
         7R1KsXWcYZK5Lp4CsSMcotyzL4pJOleBxBdHGW4asmvOliAE6Kqn+ecZ5W05gayLDD9d
         nNkhDX3nBZ8evYz4uk7Ikv23R+7+0wiHE/WJDnHEynPy/NHBOzzfeF9q3unVifwjicuU
         zGTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=li50XsAB2VPn+/18ATYBNIxXsxb19ToHWwK0bY8hLFo=;
        b=lh75wia+YzshGpfRl8Z0JeLxog+GlZh6FlotLosWJRnR2haGYdO0W4vRFoV+Zch0wV
         xVfihVZQzFgz1/isB7sdsCSe1RXjrOciGXS5fLYxnCHulAZx1Sz4568cCsDnS4Nm1Fwi
         5rKO46EUNqeuZ+q/xUBjVSLXBNcmHyISldpzNYwewnOmzta05LInmZ29o+7RvRlT5UBL
         Ge33Wz2PCv9FVn0dwms9CmfgYNsEOdyprDtNsnzjDRemQdKnytGV0OIvmjjBHsuaCU2I
         pqi02uLMVuizERsDHB1BmPbPwN8M4/foQvoyNZM9J4ZRgN3B736Dpmt/rL29vfFSGj26
         KIQg==
X-Gm-Message-State: APjAAAUoJFrJsVfD9lmwSj12p0KJ5CzLn+404H/sp1RPXn4wsvcuMunl
        1au2MVbkFNv5zlQbwFq4jhwO4KgDuJcTOOnWNI2+pg==
X-Google-Smtp-Source: APXvYqwxzVM4CYtWezB0pwXW5mwnwa3o7i3cBWeQj1ynMkvyu/Uz7CIBBn53oyJLn/r2ogqRCDiHREeACm67YSs9mBk=
X-Received: by 2002:a50:cbc2:: with SMTP id l2mr41075561edi.304.1571243524399;
 Wed, 16 Oct 2019 09:32:04 -0700 (PDT)
MIME-Version: 1.0
References: <20191014202135.429009-1-pasha.tatashin@soleen.com> <20191016151246.GA4261@linux.intel.com>
In-Reply-To: <20191016151246.GA4261@linux.intel.com>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Wed, 16 Oct 2019 12:31:53 -0400
Message-ID: <CA+CK2bB+q4HLnW4Yf+0yFPb0K6B-kMdP17jnh9NjYpLWj=yBgw@mail.gmail.com>
Subject: Re: [PATCH v2] tpm/tpm_ftpm_tee: add shutdown call back
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     James Morris <jmorris@namei.org>, Sasha Levin <sashal@kernel.org>,
        peterhuewe@gmx.de, jgg@ziepe.ca,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-integrity@vger.kernel.org, linux-kernel@microsoft.com,
        thiruan@microsoft.com, bryankel@microsoft.com,
        tee-dev@lists.linaro.org, ilias.apalodimas@linaro.org,
        sumit.garg@linaro.org, rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 16, 2019 at 11:12 AM Jarkko Sakkinen
<jarkko.sakkinen@linux.intel.com> wrote:
>
> On Mon, Oct 14, 2019 at 04:21:35PM -0400, Pavel Tatashin wrote:
> > add shutdown call back to close existing session with fTPM TA
> > to support kexec scenario.
>
> Sentences start in English with a capital letter :-)
>

OK

*
> > + * ftpm_tee_shutdown - shutdown the TPM device
>
> A function name has to have parentheses in kdoc. I know this not
> consistently done in the subsystem ATM but this is what is documented
> here:
>
> https://www.kernel.org/doc/Documentation/kernel-doc-nano-HOWTO.txt
>

OK.

A new version is sent out.

Pasha
