Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D7F127D048
	for <lwn-linux-doc@archive.lwn.net>; Mon, 18 Jun 2018 21:50:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S934880AbeFRVuK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 18 Jun 2018 17:50:10 -0400
Received: from ale.deltatee.com ([207.54.116.67]:44692 "EHLO ale.deltatee.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933073AbeFRVuJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 18 Jun 2018 17:50:09 -0400
Received: from guinness.priv.deltatee.com ([172.16.1.162])
        by ale.deltatee.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <logang@deltatee.com>)
        id 1fV224-0002q1-Kt; Mon, 18 Jun 2018 15:49:53 -0600
To:     Alex Williamson <alex.williamson@redhat.com>
Cc:     linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-doc@vger.kernel.org, Stephen Bates <sbates@raithlin.com>,
        Christoph Hellwig <hch@lst.de>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20180618193636.16210-1-logang@deltatee.com>
 <20180618193636.16210-2-logang@deltatee.com>
 <20180618154430.1af3d42f@t450s.home>
From:   Logan Gunthorpe <logang@deltatee.com>
Message-ID: <c2053508-0880-5b7b-fd2f-260d260f33f9@deltatee.com>
Date:   Mon, 18 Jun 2018 15:49:49 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180618154430.1af3d42f@t450s.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: christian.koenig@amd.com, benh@kernel.crashing.org, jglisse@redhat.com, dan.j.williams@intel.com, frederic@kernel.org, kai.heng.feng@canonical.com, marc.zyngier@arm.com, paulmck@linux.vnet.ibm.com, tglx@linutronix.de, mingo@kernel.org, corbet@lwn.net, bhelgaas@google.com, hch@lst.de, sbates@raithlin.com, linux-doc@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, alex.williamson@redhat.com
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [PATCH v3 1/3] PCI: Make specifying PCI devices in kernel
 parameters reusable
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/18/2018 3:44 PM, Alex Williamson wrote:
>> + *
>> + * The second format matches devices using IDs in the configuration
>> + * space which may match multiple devices in the system. A value of 0
>> + * for any field will match all devices.
> 
> I realize this is not a change in behavior, but since we're spelling it
> out in a proper comment rather than burying it in the implementation,
> using 0 as a wildcard is rather questionable behavior.  It always
> surprises me when I read this because pci_match_one_device() uses
> PCI_ANY_ID (~0) as a wildcard and as a result of struct pci_device_id
> using __u32 for these fields, we actually need to specify ffffffff on
> the commandline to get a wildcard match for dynamic ids.  The latter is
> tedious to use, but I think it's more correct, and the use of a __u32 is
> probably attributed to the fact that 0xffff is only reserved for vendor
> ID, the spec doesn't seem to reserve any entries from the vendor's
> device ID range.
> 
> There's probably really no path to resolve these, but acknowledging the
> difference in this comment block might be helpful in the future.

Ok, I'll add a note in the comment.
>> +		ret = pci_dev_str_match(dev, p, &p);
>> +		if (ret == 1) {
>> +			*resize = true;
>> +			if (align_order == -1)
>> +				align = PAGE_SIZE;
>> +			else
>> +				align = 1 << align_order;
>> +			break;
>> +		} else if (ret < 0) {
>> +			pr_info("PCI: Can't parse resource_alignment parameter: pci:%s\n",
> 
> 
> The "pci:" prefix on %s doesn't make sense now, it was used above when
> the pointer was already advanced past this token, now I believe it would
> lead to "pci:pci:xxxx:yyyy" or "pci:xx:yy.z".  Thanks,

Yup, nice catch. I'll fix it for v4.

Logan
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
