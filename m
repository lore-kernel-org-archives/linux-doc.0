Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8545A7E22E
	for <lwn-linux-doc@archive.lwn.net>; Thu, 12 Apr 2018 02:20:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751845AbeDLCUd (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 11 Apr 2018 22:20:33 -0400
Received: from mga07.intel.com ([134.134.136.100]:43375 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751777AbeDLCUc (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 11 Apr 2018 22:20:32 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Apr 2018 19:20:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,439,1517904000"; 
   d="scan'208";a="36573332"
Received: from ifreitas-mobl.amr.corp.intel.com (HELO [10.254.104.117]) ([10.254.104.117])
  by fmsmga002.fm.intel.com with ESMTP; 11 Apr 2018 19:20:29 -0700
Subject: Re: [PATCH v3 05/10] ARM: dts: aspeed: peci: Add PECI node
To:     Joel Stanley <joel@jms.id.au>
Cc:     Alan Cox <alan@linux.intel.com>, Andrew Jeffery <andrew@aj.id.au>,
        Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Fengguang Wu <fengguang.wu@intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Haiyue Wang <haiyue.wang@linux.intel.com>,
        James Feist <james.feist@linux.intel.com>,
        Jason M Biils <jason.m.bills@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Julia Cartwright <juliac@eso.teric.us>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Milton Miller II <miltonm@us.ibm.com>,
        Pavel Machek <pavel@ucw.cz>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stef van Os <stef.van.os@prodrive-technologies.com>,
        Sumeet R Pawnikar <sumeet.r.pawnikar@intel.com>,
        Vernon Mauery <vernon.mauery@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org, devicetree <devicetree@vger.kernel.org>,
        linux-hwmon@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <20180410183212.16787-1-jae.hyun.yoo@linux.intel.com>
 <20180410183212.16787-6-jae.hyun.yoo@linux.intel.com>
 <CACPK8Xf7ta43K=POx8J6bAdjvX=wCzy-+HWqHsm+RstQxeetCQ@mail.gmail.com>
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <64dae4bb-8049-a09d-d0bb-18f6ec52ea63@linux.intel.com>
Date:   Wed, 11 Apr 2018 19:20:28 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xf7ta43K=POx8J6bAdjvX=wCzy-+HWqHsm+RstQxeetCQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/11/2018 4:52 AM, Joel Stanley wrote:
> On 11 April 2018 at 04:02, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>> This commit adds PECI bus/adapter node of AST24xx/AST25xx into
>> aspeed-g4 and aspeed-g5.
>>
> 
> The patches to the device trees get merged by the ASPEED maintainer
> (me). Once you have the bindings reviewed you can send the patches to
> me and the linux-aspeed list (I've got a pending patch to maintainers
> that will ensure get_maintainers.pl does the right thing as far as
> email addresses go).
> 
> I'd suggest dropping it from your series and re-sending once the
> bindings and driver are reviewed.
> 
> Cheers,
> 
> Joel
> 

Do you mean that bindings and driver of ASPEED peci adapter driver 
including documents?

Thanks,
-Jae
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
