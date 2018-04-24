Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CB3D27DD31
	for <lwn-linux-doc@archive.lwn.net>; Tue, 24 Apr 2018 21:12:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751150AbeDXVMn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 24 Apr 2018 17:12:43 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:37542 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751061AbeDXVMl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Apr 2018 17:12:41 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w3OLCDPq015246
        for <linux-doc@vger.kernel.org>; Tue, 24 Apr 2018 17:12:41 -0400
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2hj9ra6j0p-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Tue, 24 Apr 2018 17:12:41 -0400
Received: from localhost
        by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <sukadev@linux.ibm.com>;
        Tue, 24 Apr 2018 15:12:39 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
        by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Tue, 24 Apr 2018 15:12:35 -0600
Received: from b03ledav002.gho.boulder.ibm.com (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
        by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w3OLCX1E10617160;
        Tue, 24 Apr 2018 14:12:33 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D89CB136043;
        Tue, 24 Apr 2018 15:12:33 -0600 (MDT)
Received: from suka-w540.localdomain (unknown [9.70.94.25])
        by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id AA11613603A;
        Tue, 24 Apr 2018 15:12:33 -0600 (MDT)
Received: by suka-w540.localdomain (Postfix, from userid 1000)
        id 13AD6229284; Tue, 24 Apr 2018 14:12:32 -0700 (PDT)
Date:   Tue, 24 Apr 2018 14:12:32 -0700
From:   Sukadev Bhattiprolu <sukadev@linux.ibm.com>
To:     Andrew Donnellan <andrew.donnellan@au1.ibm.com>
Cc:     "Alastair D'Silva" <alastair@au1.ibm.com>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, mikey@neuling.org,
        vaibhav@linux.vnet.ibm.com, aneesh.kumar@linux.vnet.ibm.com,
        malat@debian.org, felix@linux.vnet.ibm.com, pombredanne@nexb.com,
        sukadev@linux.vnet.ibm.com, npiggin@gmail.com,
        gregkh@linuxfoundation.org, arnd@arndb.de,
        fbarrat@linux.vnet.ibm.com, corbet@lwn.net,
        "Alastair D'Silva" <alastair@d-silva.org>,
        Christophe Lombard <clombard@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 3/7] powerpc: use task_pid_nr() for TID allocation
References: <20180417020950.21446-1-alastair@au1.ibm.com>
 <20180418010810.30937-1-alastair@au1.ibm.com>
 <20180418010810.30937-4-alastair@au1.ibm.com>
 <b088d063-058a-2557-812c-6d5659f9d67b@au1.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b088d063-058a-2557-812c-6d5659f9d67b@au1.ibm.com>
X-Operating-System: Linux 2.0.32 on an i486
User-Agent: Mutt/1.7.1 (2016-10-04)
X-TM-AS-GCONF: 00
x-cbid: 18042421-0028-0000-0000-0000097EEB58
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008915; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000257; SDB=6.01022740; UDB=6.00522045; IPR=6.00801975;
 MB=3.00020756; MTD=3.00000008; XFM=3.00000015; UTC=2018-04-24 21:12:38
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18042421-0029-0000-0000-00003A83EF87
Message-Id: <20180424211231.GA25392@us.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-04-24_05:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1804240200
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Andrew Donnellan [andrew.donnellan@au1.ibm.com] wrote:
> [+ Sukadev, Christophe]
> 
> On 18/04/18 11:08, Alastair D'Silva wrote:
> > From: Alastair D'Silva <alastair@d-silva.org>
> > 
> > The current implementation of TID allocation, using a global IDR, may
> > result in an errant process starving the system of available TIDs.
> > Instead, use task_pid_nr(), as mentioned by the original author. The
> > scenario described which prevented it's use is not applicable, as
> > set_thread_tidr can only be called after the task struct has been
> > populated.
> > 
> > Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> 
> So it's too late in the evening for me to completely get my head around
> what's going on here enough to give my Reviewed-by:, but my current thinking
> is:
> 
> - In the first version of the patch to add TIDR support
> (https://patchwork.ozlabs.org/patch/799494/), it was originally proposed to
> call assign_thread_id() (as it was then called) from copy_thread()
> 
> - The comment block documents the reason why we can't use task_pid_nr() but
> assumes that we're trying to assign a TIDR from within copy_thread()
> 
> - The final patch that was accepted
> (https://patchwork.ozlabs.org/patch/835552/,
> ec233ede4c8654894610ea54f4dae7adc954ac62) instead sets the TIDR to 0 from
> copy_thread(), so the original reasoning regarding not using task_pid_nr()
> within copy_thread() is no longer applicable.
> 
> Sukadev: does this sound right?

Yes. Like with PIDR, was trying to assign TIDR initially to all threads.
But since only a subset of threads need/use TIDR, we can assign the
value later (when set_thread_tidr() is called). So we should be able to
use task_pid_nr() then.

Sukadev

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
