Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 446FD7DE78
	for <lwn-linux-doc@archive.lwn.net>; Tue,  8 May 2018 03:54:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754336AbeEHDyk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 May 2018 23:54:40 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:49082 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1754280AbeEHDyk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 May 2018 23:54:40 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w483s5lE083317
        for <linux-doc@vger.kernel.org>; Mon, 7 May 2018 23:54:40 -0400
Received: from e06smtp13.uk.ibm.com (e06smtp13.uk.ibm.com [195.75.94.109])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2htyt6rxpm-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Mon, 07 May 2018 23:54:39 -0400
Received: from localhost
        by e06smtp13.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <alastair@au1.ibm.com>;
        Tue, 8 May 2018 04:54:37 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
        by e06smtp13.uk.ibm.com (192.168.101.143) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Tue, 8 May 2018 04:54:35 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w483sYLl5571020;
        Tue, 8 May 2018 03:54:34 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id CBF1452041;
        Tue,  8 May 2018 03:44:54 +0100 (BST)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 7799352045;
        Tue,  8 May 2018 03:44:54 +0100 (BST)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 4D472A0254;
        Tue,  8 May 2018 13:54:31 +1000 (AEST)
Subject: Re: [PATCH v2 6/7] ocxl: Add an IOCTL so userspace knows what CPU
 features are available
From:   "Alastair D'Silva" <alastair@au1.ibm.com>
To:     Nicholas Piggin <npiggin@gmail.com>
Cc:     Frederic Barrat <fbarrat@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, mikey@neuling.org,
        vaibhav@linux.vnet.ibm.com, aneesh.kumar@linux.vnet.ibm.com,
        malat@debian.org, felix@linux.vnet.ibm.com, pombredanne@nexb.com,
        sukadev@linux.vnet.ibm.com, gregkh@linuxfoundation.org,
        arnd@arndb.de, andrew.donnellan@au1.ibm.com,
        fbarrat@linux.vnet.ibm.com, corbet@lwn.net
Date:   Tue, 08 May 2018 13:54:31 +1000
In-Reply-To: <20180508135019.3e08d57a@roar.ozlabs.ibm.com>
References: <20180417020950.21446-1-alastair@au1.ibm.com>
         <20180418010810.30937-1-alastair@au1.ibm.com>
         <20180418010810.30937-7-alastair@au1.ibm.com>
         <eec7dceb-0b25-8644-7f32-3700c3c4ed46@linux.ibm.com>
         <1525740115.7796.46.camel@au1.ibm.com>
         <20180508135019.3e08d57a@roar.ozlabs.ibm.com>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 (3.26.6-1.fc27) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 18050803-0012-0000-0000-000005D3CDFE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18050803-0013-0000-0000-00001950DB2A
Message-Id: <1525751671.7796.49.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-05-08_01:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805080038
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 2018-05-08 at 13:50 +1000, Nicholas Piggin wrote:
> On Tue, 08 May 2018 10:41:55 +1000
> "Alastair D'Silva" <alastair@au1.ibm.com> wrote:
> 
> > On Mon, 2018-05-07 at 20:14 +0200, Frederic Barrat wrote:
> > > 
> > > Le 18/04/2018 à 03:08, Alastair D'Silva a écrit :  
> > > > From: Alastair D'Silva <alastair@d-silva.org>
> > > > 
> > > > In order for a userspace AFU driver to call the Power9 specific
> > > > OCXL_IOCTL_ENABLE_P9_WAIT, it needs to verify that it can
> > > > actually
> > > > make that call.
> > > > 
> > > > Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> > > > ---
> > > >   Documentation/accelerators/ocxl.rst |  1 -
> > > >   drivers/misc/ocxl/file.c            | 25
> > > > +++++++++++++++++++++++++
> > > >   include/uapi/misc/ocxl.h            |  4 ++++
> > > >   3 files changed, 29 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/Documentation/accelerators/ocxl.rst
> > > > b/Documentation/accelerators/ocxl.rst
> > > > index ddcc58d01cfb..7904adcc07fd 100644
> > > > --- a/Documentation/accelerators/ocxl.rst
> > > > +++ b/Documentation/accelerators/ocxl.rst
> > > > @@ -157,7 +157,6 @@ OCXL_IOCTL_GET_METADATA:
> > > >     Obtains configuration information from the card, such at
> > > > the
> > > > size of
> > > >     MMIO areas, the AFU version, and the PASID for the current
> > > > context.
> > > > 
> > > > -  
> > > 
> > > 
> > > Intended?
> > > 
> > > Other than that,
> > > Acked-by: Frederic Barrat <fbarrat@linux.vnet.ibm.com>
> > >   
> > 
> > Nope, I'll fix that, thanks.
> > 
> 
> Just to be clear, this is for OCXL features. I would just make that
> explicit in the title (s/CPU/OCXL).
> 
> Thanks,
> Nick
> 

OK, sounds reasonable.

-- 
Alastair D'Silva
Open Source Developer
Linux Technology Centre, IBM Australia
mob: 0423 762 819

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
