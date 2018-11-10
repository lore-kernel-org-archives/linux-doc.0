Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 544527D089
	for <lwn-linux-doc@archive.lwn.net>; Sat, 10 Nov 2018 00:38:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728188AbeKJKVo (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 10 Nov 2018 05:21:44 -0500
Received: from terminus.zytor.com ([198.137.202.136]:52767 "EHLO
        mail.zytor.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728082AbeKJKVo (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 10 Nov 2018 05:21:44 -0500
Received: from hanvin-mobl2.amr.corp.intel.com ([192.55.54.40])
        (authenticated bits=0)
        by mail.zytor.com (8.15.2/8.15.2) with ESMTPSA id wAA0cJnf2580330
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
        Fri, 9 Nov 2018 16:38:21 -0800
Subject: Re: PLEASE REVERT URGENTLY: Re: [PATCH v5 2/3] x86/boot: add acpi
 rsdp address to setup_header
From:   "H. Peter Anvin" <hpa@zytor.com>
To:     Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
        xen-devel@lists.xenproject.org, x86@kernel.org,
        linux-doc@vger.kernel.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, corbet@lwn.net,
        boris.ostrovsky@oracle.com
References: <20181010061456.22238-1-jgross@suse.com>
 <20181010061456.22238-3-jgross@suse.com>
 <f7c78ee7-b548-7f04-24da-7321b6c64c97@zytor.com>
Message-ID: <7cede814-a441-05b6-10aa-5713da8ad843@zytor.com>
Date:   Fri, 9 Nov 2018 16:38:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <f7c78ee7-b548-7f04-24da-7321b6c64c97@zytor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

One more aspect on this patchset: when CONFIG_ACPI_TABLE_UPGRADE was
inroduced, it was seen as a security problem and disabled by default
(unlike for device tree, where feeding entries from the boot loader is
standard operating procedure.)

Thus functionally makes that possible to bypass that prohibition. Are we
giving up that battle, or should this also be conditionalized and
default to off (presumably with Xen requiring it)?

	-hpa
