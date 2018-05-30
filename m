Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 69F0E7D09E
	for <lwn-linux-doc@archive.lwn.net>; Wed, 30 May 2018 04:36:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S934418AbeE3EgV (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 30 May 2018 00:36:21 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:49516 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750737AbeE3EgT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 May 2018 00:36:19 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id E01C66084F; Wed, 30 May 2018 04:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1527654978;
        bh=pxgy8JhEY8s/dkhK+dyqiRUApwriUPbUB5KeaR4bL+o=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=QWuvf4JbKXT3ZQFlrSrNb85orqdc7uJQFEWJE9daZ2ixJw1WyjH2nXtj1rOxGU5wL
         sZTUn3XLTHQjNZH6k0u8wKQclylkvKN4tYa4VR3YsxjSk5CPyPUzb7xdgwEJod2lw6
         bpwldBI46ZHACn4FFT7ZZnfBcv/AbyqrfuquEoe8=
Received: from [10.47.50.40] (unknown [156.39.10.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: okaya@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1087960452;
        Wed, 30 May 2018 04:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1527654977;
        bh=pxgy8JhEY8s/dkhK+dyqiRUApwriUPbUB5KeaR4bL+o=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=l+v5dhI6sCoPxXHzPlyAkRLHWWbPRC0KhaP/xbqW1VyYb8yV7gNXODstEfAUY7QYj
         4ZA17EioL2JQeaxVjqTiF5x9ZkG+oj2qwX2eTXmQSZDboO95dvGzTVGS1+daOQvWgk
         uXfU+u0lzTV2cMeap6JNSELCyjcrguPq7kGGe6qc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1087960452
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
Message-ID: <dc9133a4-7085-e663-172a-87601ee8775d@codeaurora.org>
Date:   Tue, 29 May 2018 21:36:15 -0700
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

On 5/29/2018 9:34 PM, Sinan Kaya wrote:
> -int early_pci_allowed(void)
> -{
> -	return (pci_probe & (PCI_PROBE_CONF1|PCI_PROBE_NOEARLY)) ==
> -			PCI_PROBE_CONF1;
> -}

I should have kept this. I'll wait for more feedback before posting the
next rev. 

-- 
Sinan Kaya
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
