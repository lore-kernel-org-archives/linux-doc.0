Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B2A6A7D08A
	for <lwn-linux-doc@archive.lwn.net>; Thu,  1 Nov 2018 07:09:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727716AbeKAQKy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 1 Nov 2018 12:10:54 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:36886 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727744AbeKAQKx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Nov 2018 12:10:53 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wA173YR5120746
        for <linux-doc@vger.kernel.org>; Thu, 1 Nov 2018 03:09:07 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2nfua53ask-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Thu, 01 Nov 2018 03:09:07 -0400
Received: from localhost
        by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.ibm.com>;
        Thu, 1 Nov 2018 07:09:05 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
        by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Thu, 1 Nov 2018 07:09:00 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id wA1790Gh59703406
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 1 Nov 2018 07:09:00 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id EBA0B4C040;
        Thu,  1 Nov 2018 07:08:59 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id BB6454C04A;
        Thu,  1 Nov 2018 07:08:58 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.8.68])
        by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Thu,  1 Nov 2018 07:08:58 +0000 (GMT)
Date:   Thu, 1 Nov 2018 09:08:57 +0200
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Daniel Colascione <dancol@google.com>
Cc:     linux-kernel@vger.kernel.org, timmurray@google.com,
        joelaf@google.com, surenb@google.com,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <guro@fb.com>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        "Dennis Zhou (Facebook)" <dennisszhou@gmail.com>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Prashant Dhamdhere <pdhamdhe@redhat.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Michael Kerrisk <mtk.manpages@gmail.com>
Subject: Re: [PATCH] Document /proc/pid PID reuse behavior
References: <20181031150625.147369-1-dancol@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181031150625.147369-1-dancol@google.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 18110107-0020-0000-0000-000002DDFA68
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18110107-0021-0000-0000-0000212D54F5
Message-Id: <20181101070856.GB8866@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-11-01_04:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1811010062
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 31, 2018 at 03:06:22PM +0000, Daniel Colascione wrote:
> State explicitly that holding a /proc/pid file descriptor open does
> not reserve the PID. Also note that in the event of PID reuse, these
> open file descriptors refer to the old, now-dead process, and not the
> new one that happens to be named the same numeric PID.

Signed-off is missing.

> ---
>  Documentation/filesystems/proc.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/filesystems/proc.txt b/Documentation/filesystems/proc.txt
> index 12a5e6e693b6..567f66a8a23c 100644
> --- a/Documentation/filesystems/proc.txt
> +++ b/Documentation/filesystems/proc.txt
> @@ -214,6 +214,14 @@ asynchronous manner and the value may not be very precise. To see a precise
>  snapshot of a moment, you can see /proc/<pid>/smaps file and scan page table.
>  It's slow but very precise.
> 
> +Note that an open a file descriptor to /proc/<pid> or to any of its
> +contained files or subdirectories does not prevent <pid> being reused
> +for some other process in the event that <pid> exits. Operations on
> +open /proc/<pid> file descriptors corresponding to dead processes
> +never act on any new process that the kernel may, through chance, have
> +also assigned the process ID <pid>. Instead, operations on these FDs
> +usually fail with ESRCH.
> +

I'd put this text in the beginning of the section, just before table 1-1.
Otherwise looks good.

It maybe also useful to update 'man 5 proc' (1) as well

[1] https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/tree/man5/proc.5

>  Table 1-2: Contents of the status files (as of 4.8)
>  ..............................................................................
>   Field                       Content
> -- 
> 2.19.1.568.g152ad8e336-goog
> 

-- 
Sincerely yours,
Mike.

