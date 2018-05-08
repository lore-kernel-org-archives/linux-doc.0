Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 93B6A7DE78
	for <lwn-linux-doc@archive.lwn.net>; Tue,  8 May 2018 03:13:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753861AbeEHDNr (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 May 2018 23:13:47 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:49508 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753912AbeEHDNr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 May 2018 23:13:47 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w483Bnrb014629
        for <linux-doc@vger.kernel.org>; Mon, 7 May 2018 23:13:46 -0400
Received: from e06smtp13.uk.ibm.com (e06smtp13.uk.ibm.com [195.75.94.109])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2htw754y2v-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Mon, 07 May 2018 23:13:46 -0400
Received: from localhost
        by e06smtp13.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <alastair@au1.ibm.com>;
        Tue, 8 May 2018 04:13:43 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
        by e06smtp13.uk.ibm.com (192.168.101.143) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Tue, 8 May 2018 04:13:40 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w483Dddr13369600;
        Tue, 8 May 2018 03:13:39 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 184A052041;
        Tue,  8 May 2018 03:04:00 +0100 (BST)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id BA5AE5203F;
        Tue,  8 May 2018 03:03:59 +0100 (BST)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 3AB6CA0254;
        Tue,  8 May 2018 13:13:38 +1000 (AEST)
Subject: Re: [PATCH v2 1/7] powerpc: Add TIDR CPU feature for Power9
From:   "Alastair D'Silva" <alastair@au1.ibm.com>
To:     Frederic Barrat <fbarrat@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org
Cc:     mikey@neuling.org, arnd@arndb.de, linux-doc@vger.kernel.org,
        malat@debian.org, gregkh@linuxfoundation.org, corbet@lwn.net,
        vaibhav@linux.vnet.ibm.com, npiggin@gmail.com,
        linux-kernel@vger.kernel.org, fbarrat@linux.vnet.ibm.com,
        aneesh.kumar@linux.vnet.ibm.com, andrew.donnellan@au1.ibm.com,
        pombredanne@nexb.com, felix@linux.vnet.ibm.com,
        sukadev@linux.vnet.ibm.com
Date:   Tue, 08 May 2018 13:13:37 +1000
In-Reply-To: <2f95cc6f-9843-e2b9-6fca-2f4153317a5f@linux.ibm.com>
References: <20180417020950.21446-1-alastair@au1.ibm.com>
         <20180418010810.30937-1-alastair@au1.ibm.com>
         <20180418010810.30937-2-alastair@au1.ibm.com>
         <2f95cc6f-9843-e2b9-6fca-2f4153317a5f@linux.ibm.com>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 (3.26.6-1.fc27) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 18050803-0012-0000-0000-000005D3CC1E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18050803-0013-0000-0000-00001950D915
Message-Id: <1525749217.7796.48.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-05-08_01:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805080030
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 2018-05-07 at 19:17 +0200, Frederic Barrat wrote:
> 
> Le 18/04/2018 à 03:08, Alastair D'Silva a écrit :
> > From: Alastair D'Silva <alastair@d-silva.org>
> > 
> > This patch adds a CPU feature bit to show whether the CPU has
> > the TIDR register available, enabling as_notify/wait in userspace.
> > 
> > Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> > ---
> >   arch/powerpc/include/asm/cputable.h | 3 ++-
> >   arch/powerpc/kernel/dt_cpu_ftrs.c   | 1 +
> >   2 files changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/powerpc/include/asm/cputable.h
> > b/arch/powerpc/include/asm/cputable.h
> > index 4e332f3531c5..54c4cbbe57b4 100644
> > --- a/arch/powerpc/include/asm/cputable.h
> > +++ b/arch/powerpc/include/asm/cputable.h
> > @@ -215,6 +215,7 @@ static inline void cpu_feature_keys_init(void)
> > { }
> >   #define CPU_FTR_P9_TM_HV_ASSIST		LONG_ASM_CONST(0x0
> > 000100000000000)
> >   #define CPU_FTR_P9_TM_XER_SO_BUG	LONG_ASM_CONST(0x00002000
> > 00000000)
> >   #define CPU_FTR_P9_TLBIE_BUG		LONG_ASM_CONST(0x0000
> > 400000000000)
> > +#define CPU_FTR_P9_TIDR			LONG_ASM_CONST(0x00
> > 00800000000000)
> > 
> >   #ifndef __ASSEMBLY__
> > 
> > @@ -462,7 +463,7 @@ static inline void cpu_feature_keys_init(void)
> > { }
> >   	    CPU_FTR_CFAR | CPU_FTR_HVMODE | CPU_FTR_VMX_COPY | \
> >   	    CPU_FTR_DBELL | CPU_FTR_HAS_PPR | CPU_FTR_ARCH_207S |
> > \
> >   	    CPU_FTR_TM_COMP | CPU_FTR_ARCH_300 | CPU_FTR_PKEY | \
> > -	    CPU_FTR_P9_TLBIE_BUG)
> > +	    CPU_FTR_P9_TLBIE_BUG | CPU_FTR_P9_TIDR)
> >   #define CPU_FTRS_POWER9_DD1 ((CPU_FTRS_POWER9 |
> > CPU_FTR_POWER9_DD1) & \
> >   			     (~CPU_FTR_SAO))
> >   #define CPU_FTRS_POWER9_DD2_0 CPU_FTRS_POWER9
> > diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c
> > b/arch/powerpc/kernel/dt_cpu_ftrs.c
> > index 11a3a4fed3fb..10f8b7f55637 100644
> > --- a/arch/powerpc/kernel/dt_cpu_ftrs.c
> > +++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
> > @@ -722,6 +722,7 @@ static __init void cpufeatures_cpu_quirks(void)
> >   	if ((version & 0xffff0000) == 0x004e0000) {
> >   		cur_cpu_spec->cpu_features &= ~(CPU_FTR_DAWR);
> >   		cur_cpu_spec->cpu_features |=
> > CPU_FTR_P9_TLBIE_BUG; > +		cur_cpu_spec->cpu_features 
> > |= CPU_FTR_P9_TIDR;
> 
> 
> Isn't it redundant with adding the flag to CPU_FTRS_POWER9?
> 
>    Fred
> 

No, cpu_features is populated from device tree, not from
CPU_FTRS_POWER9. Since TIDR will not be explicitly requested in the
device tree, we need to handle it in quirks.

-- 
Alastair D'Silva
Open Source Developer
Linux Technology Centre, IBM Australia
mob: 0423 762 819

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
