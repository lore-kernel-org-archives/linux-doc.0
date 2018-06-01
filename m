Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 157747DF8B
	for <lwn-linux-doc@archive.lwn.net>; Fri,  1 Jun 2018 14:49:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752996AbeFAOqL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 1 Jun 2018 10:46:11 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:53868 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752983AbeFAOqE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Jun 2018 10:46:04 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 1069C607BB; Fri,  1 Jun 2018 14:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1527864364;
        bh=Kh+HdeKtdTQsNKLEK1rMXPyaTftEfWcazLL2beBhMeQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=oB1DBUqwIpqh5K9a8zAsQzKwsRZVshoqy+F6y2XAZOHqp/PQujX+cLWGOA9U+YbEV
         RQV1a9ZpoeIi0VPnncfvYKUqPpjJy6dDETf2DGN7YjbGkOOPf8rcQqntCF7Vm290X+
         G51ifguScVNYJN3YilMkGWnF5VIGNIoHYHHs0Jfc=
Received: from [10.235.228.150] (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: okaya@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0766B60224;
        Fri,  1 Jun 2018 14:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1527864361;
        bh=Kh+HdeKtdTQsNKLEK1rMXPyaTftEfWcazLL2beBhMeQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=RkWx1H7jrOzhhLTf4UmGNqCdCQ8tSNW0dKRZiPUI3SC/5AgB1AA3WzXGOs9hA/ReD
         IcW1ijy/evEw4BG057HOflmaVgcV4S6zoJ/etOk+c6jCwHQFa2tezEoBt8cRck4+bL
         AlqCy8fF200o0fKxkIRssMuJDI+vgORPCk44+jgg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0766B60224
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=okaya@codeaurora.org
Subject: Re: [PATCH] PCI: move early dump functionality from x86 arch into the
 common code
To:     linux-pci@vger.kernel.org, timur@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
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
References: <1527654876-26716-1-git-send-email-okaya@codeaurora.org>
From:   Sinan Kaya <okaya@codeaurora.org>
Message-ID: <82d0852b-7c34-3fc2-85d8-c21b33aa8cf4@codeaurora.org>
Date:   Fri, 1 Jun 2018 10:45:58 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1527654876-26716-1-git-send-email-okaya@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 5/30/2018 12:34 AM, Sinan Kaya wrote:
> Move early dump functionality into common code so that it is available for
> all archtiectures. No need to carry arch specific reads around as the read
> hooks are already initialized by the time pci_setup_device() is getting
> called during scan.
> 
> Signed-off-by: Sinan Kaya <okaya@codeaurora.org>
> ---
>  Documentation/admin-guide/kernel-parameters.txt |  2 +-
>  arch/x86/include/asm/pci-direct.h               |  5 ---
>  arch/x86/kernel/setup.c                         |  5 ---
>  arch/x86/pci/common.c                           |  4 --
>  arch/x86/pci/early.c                            | 50 -------------------------
>  drivers/pci/pci.c                               |  4 ++
>  drivers/pci/pci.h                               |  2 +-
>  drivers/pci/probe.c                             | 19 ++++++++++
>  8 files changed, 25 insertions(+), 66 deletions(-)

Any feedback on the direction?

-- 
Sinan Kaya
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
