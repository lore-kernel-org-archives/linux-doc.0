Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 31C637DD31
	for <lwn-linux-doc@archive.lwn.net>; Wed, 28 Mar 2018 20:47:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752883AbeC1UrY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 28 Mar 2018 16:47:24 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:41208 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752738AbeC1UrX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Mar 2018 16:47:23 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w2SKkJ91136842
        for <linux-doc@vger.kernel.org>; Wed, 28 Mar 2018 16:47:23 -0400
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2h0j47gn4q-1
        (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Wed, 28 Mar 2018 16:47:22 -0400
Received: from localhost
        by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <bauerman@linux.vnet.ibm.com>;
        Wed, 28 Mar 2018 14:47:22 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
        by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Wed, 28 Mar 2018 14:47:17 -0600
Received: from b03ledav005.gho.boulder.ibm.com (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
        by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w2SKlG2E13566460;
        Wed, 28 Mar 2018 13:47:16 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 966C4BE038;
        Wed, 28 Mar 2018 14:47:16 -0600 (MDT)
Received: from morokweng.localdomain (unknown [9.85.167.176])
        by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS id 18CFFBE03B;
        Wed, 28 Mar 2018 14:47:10 -0600 (MDT)
References: <1519264541-7621-1-git-send-email-linuxram@us.ibm.com> <1519264541-7621-8-git-send-email-linuxram@us.ibm.com> <dc5ee0c8-afe3-78aa-001d-7b49b398337b@intel.com>
User-agent: mu4e 1.0; emacs 25.3.1
From:   Thiago Jung Bauermann <bauerman@linux.vnet.ibm.com>
To:     Dave Hansen <dave.hansen@intel.com>
Cc:     Ram Pai <linuxram@us.ibm.com>, shuahkh@osg.samsung.com,
        linux-kselftest@vger.kernel.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, x86@kernel.org,
        linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, mingo@redhat.com,
        akpm@linux-foundation.org, benh@kernel.crashing.org,
        paulus@samba.org, khandual@linux.vnet.ibm.com,
        aneesh.kumar@linux.vnet.ibm.com, bsingharora@gmail.com,
        hbabu@us.ibm.com, mhocko@kernel.org, ebiederm@xmission.com,
        arnd@arndb.de
Subject: Re: [PATCH v12 07/22] selftests/vm: fixed bugs in pkey_disable_clear()
In-reply-to: <dc5ee0c8-afe3-78aa-001d-7b49b398337b@intel.com>
Date:   Wed, 28 Mar 2018 17:47:04 -0300
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 18032820-0028-0000-0000-0000095D5E44
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008760; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000255; SDB=6.01009784; UDB=6.00514431; IPR=6.00789066;
 MB=3.00020296; MTD=3.00000008; XFM=3.00000015; UTC=2018-03-28 20:47:21
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18032820-0029-0000-0000-00003A268C07
Message-Id: <87muys3p2v.fsf@morokweng.localdomain>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:,, definitions=2018-03-28_07:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803280212
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Dave Hansen <dave.hansen@intel.com> writes:

> On 02/21/2018 05:55 PM, Ram Pai wrote:
>> --- a/tools/testing/selftests/vm/protection_keys.c
>> +++ b/tools/testing/selftests/vm/protection_keys.c
>> @@ -461,7 +461,7 @@ void pkey_disable_clear(int pkey, int flags)
>>  			pkey, pkey, pkey_rights);
>>  	pkey_assert(pkey_rights >= 0);
>>
>> -	pkey_rights |= flags;
>> +	pkey_rights &= ~flags;
>>
>>  	ret = pkey_set(pkey, pkey_rights, 0);
>>  	/* pkey_reg and flags have the same format */
>> @@ -475,7 +475,7 @@ void pkey_disable_clear(int pkey, int flags)
>>  	dprintf1("%s(%d) pkey_reg: 0x%016lx\n", __func__,
>>  			pkey, rdpkey_reg());
>>  	if (flags)
>> -		assert(rdpkey_reg() > orig_pkey_reg);
>> +		assert(rdpkey_reg() < orig_pkey_reg);
>>  }
>>
>>  void pkey_write_allow(int pkey)
>
> This seems so horribly wrong that I wonder how it worked in the first
> place.  Any idea?

The code simply wasn't used. pkey_disable_clear() is called by
pkey_write_allow() and pkey_access_allow(), but before this patch series
nothing called either of these functions.


--
Thiago Jung Bauermann
IBM Linux Technology Center

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
