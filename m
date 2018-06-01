Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D4AB17D062
	for <lwn-linux-doc@archive.lwn.net>; Fri,  1 Jun 2018 15:25:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752212AbeFAPYD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 1 Jun 2018 11:24:03 -0400
Received: from mail-qt0-f193.google.com ([209.85.216.193]:37554 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752036AbeFAPYB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Jun 2018 11:24:01 -0400
Received: by mail-qt0-f193.google.com with SMTP id q13-v6so32611228qtp.4;
        Fri, 01 Jun 2018 08:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=vS8egDxYU5+rWW0oq8T08Emnh0rpISeyAImtWHxM+MQ=;
        b=O4ZGrJh5dfVPZpY9z0hLqSluCzvNsOzXRiWzyW0M85ZZCTehOEZndltNTwBLYFr8zQ
         LoUfQR2qlH7bpVOWCEciFouMRzD7CZCC8vfRZXRtmtmbYFqhVM89/+aTZUj+siIuJ0Yp
         bvTD0mdIpH3SCQTNXczLnfwiaYbUcvCs6jvzM+F4EhD7oNP5R9aakDALsjkL/EJxPpSz
         vUoj39BASpG5voO6uJOGPfI7iC0hKs0O30JcQNqCEGnbN8V49tTvlGAOnb1PP491v0DU
         GqqQvh39+8bl6YpYPtfED6VSi9EXZss9znFNi0yG6ZRHKYQvvaPbGR2yuswlq5qt+XZR
         JUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=vS8egDxYU5+rWW0oq8T08Emnh0rpISeyAImtWHxM+MQ=;
        b=qAgQpPSapguv5ym7w7Zjr/FVh9PZ5Y4eUK/GAye89sNzy1SRxzbbWvCFrikMC8kQo0
         S0ZtEwrzoKrzXxTrVqLe35FkvONEa2ToKNmmyt5kJNQoShIFwa29ikV1lusCMf1FdQtZ
         QcQN351P8d85Pj5waC363H9iD1sXCoPIGfRcW/yS8tpIlnc67Hpzad2Xa15ml17YNQxn
         DTjpvmhfhJLRnbbNafHxItJcjwwAG2rRRkJ8sRl9fWJIHhdY/HDJ4ClQexDG4ngsIJAi
         gC3ejFCnNT+eEbuH8RxaJHH6tf3q+N7m7nZtzlTX4ZWRhHVfd/f18m1Db3HM67KsannN
         gISw==
X-Gm-Message-State: APt69E2hfEHSgBlFd/40CoWjAFt7uHwINqfrEknlt7m0e14WCAwvkuD0
        RceulOAwdEc+H4NlyNsRF1IP+wG0kkNq+GN8hLs=
X-Google-Smtp-Source: ADUXVKISEHuqbmk8NWy9y9CAxfuErAwx2TExguqvDUk9Y5Yrmevr5TuGLd1OKp9WbbxWEJPjFTtbWxOHp1H4o6CZ7uM=
X-Received: by 2002:a0c:b2ca:: with SMTP id d10-v6mr5948653qvf.16.1527866640592;
 Fri, 01 Jun 2018 08:24:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:98f9:0:0:0:0:0 with HTTP; Fri, 1 Jun 2018 08:24:00 -0700 (PDT)
In-Reply-To: <53e4d6c3-ee19-fd04-4ba3-862d04558689@codeaurora.org>
References: <1527654876-26716-1-git-send-email-okaya@codeaurora.org>
 <CAHp75Vc3YKAR1P_F0fwD+ueGub4gVUjP0=wv4Egf_fTSVkSUjw@mail.gmail.com> <53e4d6c3-ee19-fd04-4ba3-862d04558689@codeaurora.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 1 Jun 2018 18:24:00 +0300
Message-ID: <CAHp75VdTyvQOqnSm67Uo5heP1otE98BbquM0TjSAorEzTgUwHQ@mail.gmail.com>
Subject: Re: [PATCH] PCI: move early dump functionality from x86 arch into the
 common code
To:     Sinan Kaya <okaya@codeaurora.org>
Cc:     linux-pci@vger.kernel.org, Timur Tabi <timur@codeaurora.org>,
        linux-arm-msm@vger.kernel.org,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Christoffer Dall <cdall@linaro.org>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Thymo van Beers <thymovanbeers@gmail.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Rientjes <rientjes@google.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Juergen Gross <jgross@suse.com>, Borislav Petkov <bp@suse.de>,
        Mikulas Patocka <mpatocka@redhat.com>,
        Petr Tesarik <ptesarik@suse.cz>,
        Andy Lutomirski <luto@kernel.org>,
        Dou Liyang <douly.fnst@cn.fujitsu.com>,
        Ram Pai <linuxram@us.ibm.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 1, 2018 at 6:06 PM, Sinan Kaya <okaya@codeaurora.org> wrote:
> On 6/1/2018 11:02 AM, Andy Shevchenko wrote:
>> On Wed, May 30, 2018 at 7:34 AM, Sinan Kaya <okaya@codeaurora.org> wrote:
>>> Move early dump functionality into common code so that it is available for
>>> all archtiectures. No need to carry arch specific reads around as the read
>>> hooks are already initialized by the time pci_setup_device() is getting
>>> called during scan.
>>
>>>  /* If set, the PCIe ATS capability will not be used. */
>>>  static bool pcie_ats_disabled;
>>>
>>> +bool pci_early_dump;
>>> +
>>
>> I didn't check above these, but maybe a good idea to add one line
>> comment what is this about?
>
> This was discussed here:
>
> https://www.spinics.net/lists/linux-pci/msg72859.html

I understand what is it. What I'm pointing is the variable in the
source without any comment. In the context you have in diff previous
one has a comment.


-- 
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
