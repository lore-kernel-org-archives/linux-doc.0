Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B5E477D0DA
	for <lwn-linux-doc@archive.lwn.net>; Mon, 19 Mar 2018 15:21:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933042AbeCSPVO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 19 Mar 2018 11:21:14 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:60064 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933034AbeCSPVJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Mar 2018 11:21:09 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.22/8.16.0.22) with SMTP id w2JFCxad059626;
        Mon, 19 Mar 2018 15:19:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2017-10-26;
 bh=49kIbFTiRo+yxw75mbqaRoFhkWLySa7MlihvqQtfG6E=;
 b=tfUdP7NiYXhBzsvZQ/ls/FSYnh5NzmPTQUK1b4iczmwOdahJfV7weVcgMhkmtfNirLUN
 irseFvqAUyyNtG6pL7ZFZ6zGxDASDHozE64D1fLYYLfOxLIp5jiM7WK9WXaN26VDsz1k
 HnGHoyJ92DjfJJ3e4aZBWTnekujOKiklGlaSPNpLTntiNFt92WF6/C2FYWcq6wzDFr1g
 ZgNicb7lYTtxpWqtQqHumN5/2mVbT6sNevp7hAZQrGwwGD/ee3xyDbsdYMmy2fDcJ8Kb
 Dkwp2kNWAWygl6xd3aHbOIkbSXu7qMzylNeD2SizJ61E3mQ/csN2K1tFsGKMbCJZxbgv bQ== 
Received: from userv0022.oracle.com (userv0022.oracle.com [156.151.31.74])
        by aserp2120.oracle.com with ESMTP id 2gtfn6r15p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 19 Mar 2018 15:19:35 +0000
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userv0022.oracle.com (8.14.4/8.14.4) with ESMTP id w2JFJVhd010687
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 19 Mar 2018 15:19:32 GMT
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id w2JFJQdk018833;
        Mon, 19 Mar 2018 15:19:26 GMT
Received: from [192.168.1.16] (/24.9.64.241)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 19 Mar 2018 08:19:25 -0700
Subject: Re: [PATCH v12 00/11] Application Data Integrity feature introduced
 by SPARC M7
To:     David Miller <davem@davemloft.net>
Cc:     dave.hansen@linux.intel.com, aarcange@redhat.com,
        akpm@linux-foundation.org, allen.pais@oracle.com,
        aneesh.kumar@linux.vnet.ibm.com, anthony.yznaga@oracle.com,
        arnd@arndb.de, benh@kernel.crashing.org, bob.picco@oracle.com,
        bsingharora@gmail.com, corbet@lwn.net, dan.j.williams@intel.com,
        dave.jiang@intel.com, david.j.aldridge@oracle.com,
        dwindsor@gmail.com, ebiederm@xmission.com,
        elena.reshetova@intel.com, gregkh@linuxfoundation.org,
        hannes@cmpxchg.org, henry.willard@oracle.com, hpa@zytor.com,
        hughd@google.com, imbrenda@linux.vnet.ibm.com, jack@suse.cz,
        jag.raman@oracle.com, jane.chu@oracle.com, jglisse@redhat.com,
        jroedel@suse.de, khalid@gonehiking.org,
        khandual@linux.vnet.ibm.com, kirill.shutemov@linux.intel.com,
        kstewart@linuxfoundation.org, ktkhai@virtuozzo.com,
        liam.merwick@oracle.com, linux-arch@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
        linuxram@us.ibm.com, linux@roeck-us.net, me@tobin.cc,
        mgorman@suse.de, mgorman@techsingularity.net, mhocko@suse.com,
        mike.kravetz@oracle.com, minchan@kernel.org, mingo@kernel.org
References: <cover.1519227112.git.khalid.aziz@oracle.com>
 <20180318.110857.1660518649370410007.davem@davemloft.net>
From:   Khalid Aziz <khalid.aziz@oracle.com>
Organization: Oracle Corp
Message-ID: <b9507686-6c3f-7fb1-b305-c1817f86a884@oracle.com>
Date:   Mon, 19 Mar 2018 09:19:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20180318.110857.1660518649370410007.davem@davemloft.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=8836 signatures=668693
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=832
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1711220000 definitions=main-1803190149
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 03/18/2018 09:08 AM, David Miller wrote:
> In uapi/asm/auxvec.h you conditionalize the ADI aux vectors on
> CONFIG_SPARC64.
> 
> That's not correct, you should never control user facing definitions
> based upon kernel configuration.
> 
> Also, both 32-bit and 64-bit applications running on ADI capable
> machines want to compile against and use this informaiton.
> 
> So please remove these CPP checks.
> 

Hi Dave,

That makes sense. I will send a patch to remove these.

Thanks,
Khalid
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
