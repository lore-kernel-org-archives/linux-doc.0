Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5E0557E688
	for <lwn-linux-doc@archive.lwn.net>; Tue,  6 Mar 2018 21:08:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753971AbeCFVIU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 6 Mar 2018 16:08:20 -0500
Received: from mga01.intel.com ([192.55.52.88]:17149 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753928AbeCFVIR (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Mar 2018 16:08:17 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Mar 2018 13:08:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,433,1515484800"; 
   d="scan'208";a="206015644"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143]) ([10.7.153.143])
  by orsmga005.jf.intel.com with ESMTP; 06 Mar 2018 13:08:16 -0800
Subject: Re: [PATCH v2 6/8] [PATCH 6/8] Documentation: hwmon: Add a document
 for PECI hwmon client driver
To:     Randy Dunlap <rdunlap@infradead.org>, joel@jms.id.au,
        andrew@aj.id.au, arnd@arndb.de, gregkh@linuxfoundation.org,
        jdelvare@suse.com, linux@roeck-us.net, benh@kernel.crashing.org,
        andrew@lunn.ch
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
References: <20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
 <20180221161606.32247-7-jae.hyun.yoo@linux.intel.com>
 <0e3750a0-d45b-368d-f5cb-d2cca6797ecb@infradead.org>
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <27a5a530-6083-89fb-3258-bc29fb71d30f@linux.intel.com>
Date:   Tue, 6 Mar 2018 13:08:16 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <0e3750a0-d45b-368d-f5cb-d2cca6797ecb@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Randy,

On 3/6/2018 12:28 PM, Randy Dunlap wrote:
> Hi,
> 
> On 02/21/2018 08:16 AM, Jae Hyun Yoo wrote:
> 
>> +temp<n>_label		Provides DDR DIMM temperature if this label indicates
>> +			'DIMM #'.
>> +temp<n>_input		Provides current temperature of the DDR DIMM.
>> +
>> +Note:
>> +	DIMM temperature group will be appeared when the client CPU's BIOS
> 
> 	                       will appear when
> 

I'll fix this description as you suggested. Thanks a lot!

Jae

>> +	completes memory training and testing.
>>
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
