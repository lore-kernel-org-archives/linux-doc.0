Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A4EA17E868
	for <lwn-linux-doc@archive.lwn.net>; Mon,  9 Apr 2018 16:17:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753317AbeDIQRq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 9 Apr 2018 12:17:46 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:57438 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752970AbeDIQRb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Apr 2018 12:17:31 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w39GGLR4145536
        for <linux-doc@vger.kernel.org>; Mon, 9 Apr 2018 12:17:31 -0400
Received: from e06smtp14.uk.ibm.com (e06smtp14.uk.ibm.com [195.75.94.110])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2h8b13hr09-1
        (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Mon, 09 Apr 2018 12:17:30 -0400
Received: from localhost
        by e06smtp14.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <ldufour@linux.vnet.ibm.com>;
        Mon, 9 Apr 2018 17:17:27 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
        by e06smtp14.uk.ibm.com (192.168.101.144) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Mon, 9 Apr 2018 17:17:20 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w39GHK4S9371974;
        Mon, 9 Apr 2018 16:17:20 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 14BC442042;
        Mon,  9 Apr 2018 17:09:05 +0100 (BST)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 7BDB042049;
        Mon,  9 Apr 2018 17:09:01 +0100 (BST)
Received: from [9.145.186.179] (unknown [9.145.186.179])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Mon,  9 Apr 2018 17:09:01 +0100 (BST)
Subject: Re: [PATCH 0/3] move __HAVE_ARCH_PTE_SPECIAL in Kconfig
To:     Vineet Gupta <Vineet.Gupta1@synopsys.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "x86@kernel.org" <x86@kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-snps-arc@lists.infradead.org" 
        <linux-snps-arc@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
        "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
        "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
        Jerome Glisse <jglisse@redhat.com>,
        "mhocko@kernel.org" <mhocko@kernel.org>,
        "aneesh.kumar@linux.vnet.ibm.com" <aneesh.kumar@linux.vnet.ibm.com>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
        "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
        "paulus@samba.org" <paulus@samba.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S . Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        Palmer Dabbelt <palmer@sifive.com>,
        Albert Ou <albert@sifive.com>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>
References: <1523282229-20731-1-git-send-email-ldufour@linux.vnet.ibm.com>
 <17b19aac-fed7-23a2-013c-43ca867152e9@synopsys.com>
From:   Laurent Dufour <ldufour@linux.vnet.ibm.com>
Date:   Mon, 9 Apr 2018 18:17:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <17b19aac-fed7-23a2-013c-43ca867152e9@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18040916-0044-0000-0000-000005452C35
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18040916-0045-0000-0000-000028855870
Message-Id: <21c34965-ec30-4d7f-aeaf-cb3da9758a0e@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-04-09_07:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1804090168
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 09/04/2018 18:03, Vineet Gupta wrote:
> On 04/09/2018 06:57 AM, Laurent Dufour wrote:
>> The per architecture __HAVE_ARCH_PTE_SPECIAL is defined statically in the
>> per architecture header files. This doesn't allow to make other
>> configuration dependent on it.
> 
> So I understand this series has more "readability" value and I'm fine with this
> change but I wonder if you really would want to make something depend on it or
> make this de-configurable. PTE special is really a fundamental construct - e.g.
> it is used for anon mapped pages where zero page has been wired up etc...

I don't want it to be de-configurable. This is almost like
ARCH_SUPPORTS_MEMORY_FAILURE, ARCH_USES_HIGH_VMA_FLAGS, ARCH_HAS_HMM...

These values are selected by per architecture Kconfig files and are not exposed
through the configuration menu.

Concerning making something depend on it, I will probably make
CONFIG_SPECULATIVE_PAGE_FAULT introduced by the SPF series dependent on it.
For details, please see https://lkml.org/lkml/2018/3/13/1143

Thanks,
Laurent.

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
