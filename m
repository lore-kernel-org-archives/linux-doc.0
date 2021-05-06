Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 939ACC433ED
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 11:58:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6110161132
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 11:58:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231839AbhEFL7Z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 May 2021 07:59:25 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:32960 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231800AbhEFL7W (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 May 2021 07:59:22 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 146BXSdN019337;
        Thu, 6 May 2021 07:58:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=pp1; bh=Ph6UmKSSYCIcjs/9LlNOrzMoe9qRGxnLf5PY4mJD6RY=;
 b=NeHp1gWCRqtKRvWteKTZczyvTmA8hdUAj6FCDqWRIX54j7FRRAlRFTuMp9hveJFE/ygO
 TDCbFQ4yC7nlmcNaE8PiJRDJxGbqDVHapvnmXXsr4Ko6+C3hPqKaWwCn/6jKbmOsF642
 42vHYR9DleND/D+8E9NNIh+wJkPznKovXghFVBh3iDXQ6MF4Q1rtkN4hVk/qmL8OXoky
 defyu4HJIP1KyCa4dDRCTU2tNF6D6JQi5FbsRB74jJitWFmcjkCwCTxErGpkmyIvfx9e
 cVedhiXfvvd0ckp0GFOprvIAETxrzrk36MUApYgs2btHsw9SOAaKPB8ZYAuDW/+tiuRb pA== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 38ceaq3046-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 06 May 2021 07:58:02 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 146BYhpr026425;
        Thu, 6 May 2021 07:58:01 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
        by mx0b-001b2d01.pphosted.com with ESMTP id 38ceaq303m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 06 May 2021 07:58:01 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
        by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 146Bqp30028758;
        Thu, 6 May 2021 11:58:00 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
        by ppma03ams.nl.ibm.com with ESMTP id 38cfrqr08u-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 06 May 2021 11:57:59 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 146BvTG431916380
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 6 May 2021 11:57:29 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 651CDA4060;
        Thu,  6 May 2021 11:57:55 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B4BE9A405C;
        Thu,  6 May 2021 11:57:42 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.148.157])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Thu,  6 May 2021 11:57:42 +0000 (GMT)
Date:   Thu, 6 May 2021 14:57:40 +0300
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Constantine Shulyupin <constantine.shulyupin@gmail.com>
Cc:     linux-doc@vger.kernel.org,
        kernelnewbies <kernelnewbies@kernelnewbies.org>, aaptel@suse.com,
        aisheng.dong@nxp.com, alexandru.elisei@arm.com,
        alex.williamson@redhat.com, andreyknvl@google.com,
        anshuman.khandual@arm.com, aquini@redhat.com,
        Arnd Bergmann <arnd@arndb.de>, ast@kernel.org, axboe@kernel.dk,
        bernard@vivo.com, bobwxc@email.cn, bp@alien8.de,
        brijesh.singh@amd.com, broonie@kernel.org, catalin.marinas@arm.com,
        chris.packham@alliedtelesis.co.nz,
        Jonathan Corbet <corbet@lwn.net>, cw00.choi@samsung.com,
        daniel@iogearbox.net, davem@davemloft.net, davidgow@google.com,
        dhowells@redhat.com, dikshita@codeaurora.org, dlatypov@google.com,
        eesposit@redhat.com, eric.auger@redhat.com, erik@flodin.me,
        erik.rosen@metormote.com, federico.vaga@vaga.pv.it,
        festevam@gmail.com, georgi.djakov@linaro.org,
        gi-oh.kim@cloud.ionos.com, gi-oh.kim@ionos.com,
        gregkh@linuxfoundation.org, Gustavo.Pimentel@synopsys.com,
        haren@linux.ibm.com, hca@linux.ibm.com, hch@lst.de,
        hdegoede@redhat.com, heikki.krogerus@linux.intel.com,
        hengqi.chen@gmail.com, hverkuil-cisco@xs4all.nl, i@zenithal.me,
        jaegeuk@kernel.org, James.Bottomley@hansenpartnership.com,
        jamorris@linux.microsoft.com, jarkko@kernel.org, jgg@nvidia.com,
        jianyong.wu@arm.com, jonas@protocubo.io,
        Jonathan.Cameron@huawei.com, kabel@kernel.org,
        keescook@chromium.org, kuba@kernel.org, kubernat@cesnet.cz,
        linus.walleij@linaro.org, linux@leemhuis.info,
        linux@rasmusvillemoes.dk, Guenter Roeck <linux@roeck-us.net>,
        luzmaximilian@gmail.com, macro@orcam.me.uk, marcan@marcan.st,
        masahiroy@kernel.org, mathieu.poirier@linaro.org, maz@kernel.org,
        mchehab+huawei@kernel.org, mic@linux.microsoft.com,
        mkl@pengutronix.de, mpe@ellerman.id.au, mszeredi@redhat.com,
        natet@google.com, nicolas.dichtel@6wind.com,
        niklas.soderlund+renesas@ragnatech.se, npiggin@gmail.com,
        ogabbay@kernel.org, parav@nvidia.com, pbonzini@redhat.com,
        pcc@google.com, peterz@infradead.org, pmladek@suse.com,
        rafael.j.wysocki@intel.com, saeedm@nvidia.com,
        sakari.ailus@linux.intel.com, sbhat@linux.ibm.com,
        schnelle@linux.ibm.com, sean.j.christopherson@intel.com,
        sebastian.reichel@collabora.com, shy828301@gmail.com,
        siyanteng@loongson.cn, skhan@linuxfoundation.org, sozeri@habana.ai,
        srutherford@google.com, stanimir.varbanov@linaro.org,
        stephane.blondon@gmail.com, stern@rowland.harvard.edu,
        stfrench@microsoft.com, sumit.garg@linaro.org,
        tamar.mashiah@intel.com, tglx@linutronix.de,
        tom.zanussi@linux.intel.com, torvalds@linux-foundation.org,
        unixbhaskar@gmail.com, vbabka@suse.cz, vincenzo.frascino@arm.com,
        vkoul@kernel.org, vladyslavt@nvidia.com,
        wilken.gottwalt@posteo.net, willy@infradead.org, yangbo.lu@nxp.com,
        yangtiezhu@loongson.cn, yuchao0@huawei.com, yuzenghui@huawei.com
Subject: Re: Wikibook Linux kernel
Message-ID: <YJPZtGysyv4YZz6d@linux.ibm.com>
References: <CAE7jHC_r86KNb_+beU10Vq3DU9wGA3X=sHpDjH-QQNrDGU5taw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE7jHC_r86KNb_+beU10Vq3DU9wGA3X=sHpDjH-QQNrDGU5taw@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: H_epmqFVkH7gy9i-7xt_ZBzYiRTndiln
X-Proofpoint-ORIG-GUID: FY6bzJi1c3K66A1Pp0JzXfmeb0NsPleD
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-06_08:2021-05-06,2021-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105060080
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 06, 2021 at 01:58:35PM +0300, Constantine Shulyupin wrote:
> Dear Linux kernel documentation writers and readers:
> 
> Writing Linux documentation is a huge complex collaborative process.
> To make it better I invite you to contribute to
> https://en.wikibooks.org/wiki/The_Linux_Kernel .
> 
> Main benefits of the book:
> - Readers friendly architecture
> - Convenient common wikimedia format

I know people that would disagree with these points ;-)

> - Hosted on wikibooks.org
> - Updateable by everyone.

And this point also has dubious value. All in-tree documentation is
carefully reviewed. It might be outdated, yes, but at least at the time it
is written we know it is correct.

This is not necessarily a case with an open wiki.
 
> I've designed the front page matrix table of contents and composed
> draft articles with outline, links to kernel documentation, sources
> and other resources. Sometimes visitors of the book contribute to it.
> My vision is to have a complete updated wikibook about Linux kernel
> written by many experienced developers. Please vist page
> https://en.wikibooks.org/wiki/The_Linux_Kernel/About  for the book
> desripton.
> 
> Welcome to contribute to https://en.wikibooks.org/wiki/The_Linux_Kernel!

If you have ideas about how to organize and improve our documentation you
are welcome to contribute to Documentation/ in the kernel tree ;-)

-- 
Sincerely yours,
Mike.
