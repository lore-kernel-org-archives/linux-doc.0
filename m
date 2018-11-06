Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 10E997D089
	for <lwn-linux-doc@archive.lwn.net>; Tue,  6 Nov 2018 06:01:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729878AbeKFPZB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 6 Nov 2018 10:25:01 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:34830 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729326AbeKFPZA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Nov 2018 10:25:00 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wA65xI8a076047
        for <linux-doc@vger.kernel.org>; Tue, 6 Nov 2018 01:01:27 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2nk0kk1381-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Tue, 06 Nov 2018 01:01:26 -0500
Received: from localhost
        by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.ibm.com>;
        Tue, 6 Nov 2018 06:01:22 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
        by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Tue, 6 Nov 2018 06:01:17 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id wA661HO761669434
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 6 Nov 2018 06:01:17 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id ECBF94203F;
        Tue,  6 Nov 2018 06:01:16 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9E1B042047;
        Tue,  6 Nov 2018 06:01:15 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.207.135])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Tue,  6 Nov 2018 06:01:15 +0000 (GMT)
Date:   Tue, 6 Nov 2018 08:01:13 +0200
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Daniel Colascione <dancol@google.com>
Cc:     linux-kernel@vger.kernel.org, timmurray@google.com,
        joelaf@google.com, surenb@google.com,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <guro@fb.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        "Dennis Zhou (Facebook)" <dennisszhou@gmail.com>,
        Prashant Dhamdhere <pdhamdhe@redhat.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2] Document /proc/pid PID reuse behavior
References: <20181031150625.147369-1-dancol@google.com>
 <20181105132205.138695-1-dancol@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181105132205.138695-1-dancol@google.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 18110606-0028-0000-0000-000003137CB3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18110606-0029-0000-0000-000023CFC2D7
Message-Id: <20181106060113.GA4499@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-11-06_02:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1811060052
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Nov 05, 2018 at 01:22:05PM +0000, Daniel Colascione wrote:
> State explicitly that holding a /proc/pid file descriptor open does
> not reserve the PID. Also note that in the event of PID reuse, these
> open file descriptors refer to the old, now-dead process, and not the
> new one that happens to be named the same numeric PID.
> 
> Signed-off-by: Daniel Colascione <dancol@google.com>

Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>

> ---
>  Documentation/filesystems/proc.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> Moved paragraphed to start of /proc/pid section; added signed-off-by.
> 
> diff --git a/Documentation/filesystems/proc.txt b/Documentation/filesystems/proc.txt
> index 12a5e6e693b6..0b14460f721d 100644
> --- a/Documentation/filesystems/proc.txt
> +++ b/Documentation/filesystems/proc.txt
> @@ -125,6 +125,13 @@ process running on the system, which is named after the process ID (PID).
>  The link  self  points  to  the  process reading the file system. Each process
>  subdirectory has the entries listed in Table 1-1.
>  
> +Note that an open a file descriptor to /proc/<pid> or to any of its
> +contained files or subdirectories does not prevent <pid> being reused
> +for some other process in the event that <pid> exits. Operations on
> +open /proc/<pid> file descriptors corresponding to dead processes
> +never act on any new process that the kernel may, through chance, have
> +also assigned the process ID <pid>. Instead, operations on these FDs
> +usually fail with ESRCH.
>  
>  Table 1-1: Process specific entries in /proc
>  ..............................................................................
> -- 
> 2.19.1.930.g4563a0d9d0-goog
> 

-- 
Sincerely yours,
Mike.

