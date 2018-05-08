Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4DBAE7DE78
	for <lwn-linux-doc@archive.lwn.net>; Tue,  8 May 2018 00:40:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753636AbeEHAkc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 May 2018 20:40:32 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:54894 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753465AbeEHAkb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 May 2018 20:40:31 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w480cnES033943
        for <linux-doc@vger.kernel.org>; Mon, 7 May 2018 20:40:31 -0400
Received: from e06smtp12.uk.ibm.com (e06smtp12.uk.ibm.com [195.75.94.108])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2htx2xq3sr-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Mon, 07 May 2018 20:40:30 -0400
Received: from localhost
        by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <alastair@au1.ibm.com>;
        Tue, 8 May 2018 01:40:28 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
        by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Tue, 8 May 2018 01:40:24 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
        by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w480eN8n62193842
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 8 May 2018 00:40:23 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B7AB65203F;
        Tue,  8 May 2018 00:30:43 +0100 (BST)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
        by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 6620D52049;
        Tue,  8 May 2018 00:30:43 +0100 (BST)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ozlabs.au.ibm.com (Postfix) with ESMTPSA id B6073A0254;
        Tue,  8 May 2018 10:40:21 +1000 (AEST)
Subject: Re: [PATCH v2 3/7] powerpc: use task_pid_nr() for TID allocation
From:   "Alastair D'Silva" <alastair@au1.ibm.com>
To:     Frederic Barrat <fbarrat@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        mikey@neuling.org, vaibhav@linux.vnet.ibm.com,
        aneesh.kumar@linux.vnet.ibm.com, malat@debian.org,
        felix@linux.vnet.ibm.com, pombredanne@nexb.com,
        sukadev@linux.vnet.ibm.com, npiggin@gmail.com,
        gregkh@linuxfoundation.org, arnd@arndb.de,
        andrew.donnellan@au1.ibm.com, fbarrat@linux.vnet.ibm.com,
        corbet@lwn.net
Date:   Tue, 08 May 2018 10:40:21 +1000
In-Reply-To: <b8aa28c4-9171-cb7f-9a43-22f2f15657b0@linux.ibm.com>
References: <20180417020950.21446-1-alastair@au1.ibm.com>
         <20180418010810.30937-1-alastair@au1.ibm.com>
         <20180418010810.30937-4-alastair@au1.ibm.com>
         <b8aa28c4-9171-cb7f-9a43-22f2f15657b0@linux.ibm.com>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 (3.26.6-1.fc27) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 18050800-0008-0000-0000-000004F42474
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18050800-0009-0000-0000-00001E886232
Message-Id: <1525740021.7796.45.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-05-07_11:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805080004
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 2018-05-07 at 19:37 +0200, Frederic Barrat wrote:
> 
> Le 18/04/2018 à 03:08, Alastair D'Silva a écrit :
> > From: Alastair D'Silva <alastair@d-silva.org>
> > 
> > The current implementation of TID allocation, using a global IDR,
> > may
> > result in an errant process starving the system of available TIDs.
> > Instead, use task_pid_nr(), as mentioned by the original author.
> > The
> > scenario described which prevented it's use is not applicable, as
> > set_thread_tidr can only be called after the task struct has been
> > populated.
> 
> 
> Here is how I understand what's going to happen if 2 threads are
> using 
> the same TIDR value, which is possible with this patch (if unlikely):
> 
> 1. waking up the wrong thread is not really a problem, as threads
> have 
> to handle spurious wake up from the 'wait' instruction anyway, and
> must 
> be using some other condition to know when to loop around the 'wait' 
> instruction.
> 
> 2. missing the right thread: if the wrong thread is on a CPU, and a 
> wake_host_thread/as_notify is sent, the core will see a matching
> thread 
> and will accept the command. The (open)capi adapter won't send an 
> interrupt. The wrong thread is awaken, which is not a problem as 
> discussed above. As the right thread to notify is not running, no
> harm 
> is done either: as soon as the thread runs, it's supposed to check
> its 
> condition (which will be met) or call 'wait', but 'wait' immediately 
> returns when called the first time after a thread is scheduled.
> 
> So I believe we are ok. But I think it requires a huge comment with
> the 
> above (at the minimum) :-)
> 
> With a comment:
> Reviewed-by: Frederic Barrat <fbarrat@linux.vnet.ibm.com>
> 
>    Fred
> 

Good point, I'll add this in the next revision.


-- 
Alastair D'Silva
Open Source Developer
Linux Technology Centre, IBM Australiamob: 0423 762 819

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
