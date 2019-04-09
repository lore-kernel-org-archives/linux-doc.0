Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4A4467D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue,  9 Apr 2019 16:35:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726471AbfDIQfa (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 9 Apr 2019 12:35:30 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:34318 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726446AbfDIQfa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Apr 2019 12:35:30 -0400
Received: by mail-oi1-f195.google.com with SMTP id v10so14128177oib.1;
        Tue, 09 Apr 2019 09:35:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6ZdEm+nCT8GqpIePrQVMM/gBx9GNJtS18lIPrfCPPOg=;
        b=tO6F5pKY/PxqJR2ijua/sxRNF5weswWDhzYKFG4sVhxiPujDcicwa1sGES3Mbmlpjg
         ZdCQxzWYY4x8ixeLC1aNqQQjIxScs+4m2uCFqhcFH7xXR8Y56FdMyBKG0em3jeEeXGg+
         S3VbdJ1P43KqR6IYRL7mpEQDLkKSrqZyNDJaw8M1OfxmoBcbLc5t2nHkJZWgiOkZ43Fl
         qRnPgwhWHyXEbGCVMUF0RFiIJBndrvlkZNpIzA0gTCSEN1VVVSSmvsz3mKHaj2Yq6LpR
         c+/CohOyEsAYAhG4nhE8yvUXjpahz1bWIENIsjFsPG7nArDI/LSgZnEexMcL9eyHNEPh
         hbag==
X-Gm-Message-State: APjAAAV5aN2YLJQV3SgGyUahJiuRXv7Z9EOFkjxb8WGHxsfoZvtgjcQa
        ewk5ZW38R9DTo6gndRuDfk7BXEGzbJ7bDpGVJ0PcLg==
X-Google-Smtp-Source: APXvYqypp6hkyTgy573ENPphDlYvwABo/k7hJJjDXXMBnHEqn1tks7soNY8myyidxPs0sm1vGL/sKKRLfQT566R1Hp8=
X-Received: by 2002:aca:5c55:: with SMTP id q82mr20408814oib.95.1554827729558;
 Tue, 09 Apr 2019 09:35:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190329001135.15847-1-changbin.du@gmail.com> <CAJZ5v0gKX9E+U_9eKfTr7pWGH=jxMLz_Jr850-6BcbG3xBz5qg@mail.gmail.com>
 <CAJZ5v0jbCi3Jgn5YXPCP+zgs-O7z-9_3p3XZGvm40_6RDsJqkQ@mail.gmail.com>
 <20190403133613.13f3fd75@lwn.net> <CAHp75VdXffhc+2YcFNOr2XwauTt08Bw75ao2ia7cNvAqhJnUQQ@mail.gmail.com>
In-Reply-To: <CAHp75VdXffhc+2YcFNOr2XwauTt08Bw75ao2ia7cNvAqhJnUQQ@mail.gmail.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Tue, 9 Apr 2019 18:35:18 +0200
Message-ID: <CAJZ5v0hba3CPdTBNv0RC+rLY2EGBPHU0tbAcAYQNbc5XZZHx_A@mail.gmail.com>
Subject: Re: [PATCH v2 00/24] Include linux ACPI docs into Sphinx TOC tree
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Changbin Du <changbin.du@gmail.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 3, 2019 at 10:40 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Apr 3, 2019 at 10:38 PM Jonathan Corbet <corbet@lwn.net> wrote:
> > On Tue, 2 Apr 2019 10:25:23 +0200
>
>
> > Admin guide
> >         cppc_sysfs
>
> >         initrd_table_override
>
> > other:
> >         dsdt-override: find another home for those five lines
>
> This is similar to initrd_table_override for some particular case, and
> sounds like Admin guide, indeed.

Right, I would put this one into admin-guide.
