Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C92007E279
	for <lwn-linux-doc@archive.lwn.net>; Mon, 23 Apr 2018 21:06:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932253AbeDWVGm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 23 Apr 2018 17:06:42 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:39808 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932157AbeDWVGl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 23 Apr 2018 17:06:41 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w3NL1Vi0137973
        for <linux-doc@vger.kernel.org>; Mon, 23 Apr 2018 17:06:41 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2hhjh6451a-1
        (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Mon, 23 Apr 2018 17:06:41 -0400
Received: from localhost
        by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <bryantly@linux.vnet.ibm.com>;
        Mon, 23 Apr 2018 15:06:40 -0600
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
        by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Mon, 23 Apr 2018 15:06:34 -0600
Received: from b03ledav003.gho.boulder.ibm.com (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
        by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w3NL6W5812845382;
        Mon, 23 Apr 2018 14:06:34 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 5D1796A03C;
        Mon, 23 Apr 2018 15:06:34 -0600 (MDT)
Received: from bryants-mbp-4.rchland.ibm.com (unknown [9.10.79.118])
        by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id 857846A03D;
        Mon, 23 Apr 2018 15:06:33 -0600 (MDT)
Subject: Re: [PATCH v1 1/1] misc: IBM Virtual Management Channel Driver
To:     Greg KH <gregkh@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc:     benh@kernel.crashing.org, mpe@ellerman.id.au, arnd@arndb.de,
        corbet@lwn.net, seroyer@linux.vnet.ibm.com,
        mrochs@linux.vnet.ibm.com, adreznec@linux.vnet.ibm.com,
        fbarrat@linux.vnet.ibm.com, davem@davemloft.net,
        linus.walleij@linaro.org, akpm@linux-foundation.org,
        mikey@neuling.org, pombredanne@nexb.com,
        tlfalcon@linux.vnet.ibm.com, msuchanek@suse.de,
        linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <1524494812-60150-1-git-send-email-bryantly@linux.vnet.ibm.com>
 <1524494812-60150-2-git-send-email-bryantly@linux.vnet.ibm.com>
 <c07b14b7-8f34-2ba5-536f-85896ff21661@infradead.org>
 <20180423195310.GA10693@kroah.com>
From:   "Bryant G. Ly" <bryantly@linux.vnet.ibm.com>
Date:   Mon, 23 Apr 2018 16:06:32 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
 Gecko/20100101 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180423195310.GA10693@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18042321-0016-0000-0000-00000895A3AE
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008908; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000257; SDB=6.01022259; UDB=6.00521756; IPR=6.00801493;
 MB=3.00020734; MTD=3.00000008; XFM=3.00000015; UTC=2018-04-23 21:06:38
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18042321-0017-0000-0000-00003E61EC86
Message-Id: <07085611-6f6f-f3ac-41aa-272519304859@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-04-23_07:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1804230209
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/23/18 2:53 PM, Greg KH wrote:

> On Mon, Apr 23, 2018 at 11:38:18AM -0700, Randy Dunlap wrote:
>> On 04/23/18 07:46, Bryant G. Ly wrote:
>>> This driver is a logical device which provides an
>>> interface between the hypervisor and a management
>>> partition.
>>>
>>> This driver is to be used for the POWER Virtual
>>> Management Channel Virtual Adapter on the PowerVM
>>> platform. It provides both request/response and
>>> async message support through the /dev/ibmvmc node.
>>>
>>> Signed-off-by: Bryant G. Ly <bryantly@linux.vnet.ibm.com>
>>> Reviewed-by: Steven Royer <seroyer@linux.vnet.ibm.com>
>>> Reviewed-by: Adam Reznechek <adreznec@linux.vnet.ibm.com>
>>> Tested-by: Taylor Jakobson <tjakobs@us.ibm.com>
>>> Tested-by: Brad Warrum <bwarrum@us.ibm.com>
>>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>> Cc: Arnd Bergmann <arnd@arndb.de>
>>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>>> ---
>>>  Documentation/ioctl/ioctl-number.txt  |    1 +
>>>  Documentation/misc-devices/ibmvmc.txt |  161 +++
>>>  MAINTAINERS                           |    6 +
>>>  arch/powerpc/include/asm/hvcall.h     |    1 +
>>>  drivers/misc/Kconfig                  |   14 +
>>>  drivers/misc/Makefile                 |    1 +
>>>  drivers/misc/ibmvmc.c                 | 2415 +++++++++++++++++++++++++++++++++
>>>  drivers/misc/ibmvmc.h                 |  209 +++
>>>  8 files changed, 2808 insertions(+)
>>>  create mode 100644 Documentation/misc-devices/ibmvmc.txt
>>>  create mode 100644 drivers/misc/ibmvmc.c
>>>  create mode 100644 drivers/misc/ibmvmc.h
>>> diff --git a/Documentation/misc-devices/ibmvmc.txt b/Documentation/misc-devices/ibmvmc.txt
>>> new file mode 100644
>>> index 0000000..bae1064
>>> --- /dev/null
>>> +++ b/Documentation/misc-devices/ibmvmc.txt
> Aren't we doing new documentation in .rst format instead of .txt?
>
> thanks,
>
> greg k-h
>
I will convert to .rst and fix the comments from Randy in the next version.

Thanks, 

Bryant

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
