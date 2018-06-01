Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9F9037D072
	for <lwn-linux-doc@archive.lwn.net>; Fri,  1 Jun 2018 18:53:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752360AbeFASxM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 1 Jun 2018 14:53:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:60106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751835AbeFASxL (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 1 Jun 2018 14:53:11 -0400
Received: from localhost (unknown [104.133.8.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0FA7520880;
        Fri,  1 Jun 2018 18:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1527879191;
        bh=EFfd+zF0BYm6KTWnLKmMJiIlaxM2HxQcFhzAtgQyFDE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i1PL+NhmHVv2ANhR7KEgJrQoFANikejc9Uq+b18jzKLOaHD47oXT2RuuAdJfcNIMF
         /yWVOiEmgWNtvroSUDpbb9s98ESGuc2eQyf+36sZo9QzLzyR7A+og+uveTmzGT4n8C
         wvXGXDcnFkYFi3m76BBF9erJPFjgqQUDKlkJo3a4=
Date:   Fri, 1 Jun 2018 13:53:10 -0500
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Sinan Kaya <okaya@codeaurora.org>
Cc:     linux-pci@vger.kernel.org, timur@codeaurora.org,
        Kate Stewart <kstewart@linuxfoundation.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Petr Tesarik <ptesarik@suse.cz>, Ram Pai <linuxram@us.ibm.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Christoffer Dall <cdall@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        David Rientjes <rientjes@google.com>,
        Thymo van Beers <thymovanbeers@gmail.com>,
        Borislav Petkov <bp@suse.de>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        linux-arm-msm@vger.kernel.org,
        Frederic Weisbecker <frederic@kernel.org>,
        Mikulas Patocka <mpatocka@redhat.com>,
        Andy Lutomirski <luto@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        Juergen Gross <jgross@suse.com>,
        Dou Liyang <douly.fnst@cn.fujitsu.com>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        open list <linux-kernel@vger.kernel.org>,
        Philippe Ombredanne <pombredanne@nexb.com>
Subject: Re: [PATCH V2] PCI: move early dump functionality from x86 arch into
 the common code
Message-ID: <20180601185310.GA175802@bhelgaas-glaptop.roam.corp.google.com>
References: <1527878854-21419-1-git-send-email-okaya@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1527878854-21419-1-git-send-email-okaya@codeaurora.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 01, 2018 at 02:47:28PM -0400, Sinan Kaya wrote:
> Move early dump functionality into common code so that it is available for
> all archtiectures. No need to carry arch specific reads around as the read
> hooks are already initialized by the time pci_setup_device() is getting
> called during scan.

> +static void early_dump_pci_device(struct pci_dev *pdev)
> +{
> +	u32 value[256 / 4];
> +	int i;
> +
> +	if (!pci_early_dump)
> +		return;
> +
> +	pci_info(pdev, "pci 0000:%02x:%02x.%d config space:\n",
> +		 pdev->bus->number, PCI_SLOT(pdev->devfn),
> +		 PCI_FUNC(pdev->devfn));

I'm still missing something -- why go to the trouble of pdev->bus->number,
PCI_SLOT(), etc?  Isn't the output going to look like this?

  pci 0000:00:00.0: pci 0000:00:00.0 config space:

In other words, wouldn't the following be enough?

  pci_info(pdev, "config space:\n");

> +
> +	for (i = 0; i < 256; i += 4)
> +		pci_read_config_dword(pdev, i, &value[i / 4]);
> +
> +	print_hex_dump(KERN_INFO, "", DUMP_PREFIX_OFFSET, 16, 1, value,
> +		       256, false);
> +}
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
