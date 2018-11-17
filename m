Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0546F7D08E
	for <lwn-linux-doc@archive.lwn.net>; Sat, 17 Nov 2018 08:02:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725980AbeKQSSe (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 17 Nov 2018 13:18:34 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:46890 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725853AbeKQSSe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 17 Nov 2018 13:18:34 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wAH7x6AZ008157
        for <linux-doc@vger.kernel.org>; Sat, 17 Nov 2018 03:02:41 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2ntctncbbd-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Sat, 17 Nov 2018 03:02:41 -0500
Received: from localhost
        by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.ibm.com>;
        Sat, 17 Nov 2018 08:02:39 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
        by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Sat, 17 Nov 2018 08:02:36 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id wAH82ZXi61538402
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sat, 17 Nov 2018 08:02:35 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 80693A4057;
        Sat, 17 Nov 2018 08:02:35 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 549A5A404D;
        Sat, 17 Nov 2018 08:02:32 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.204.243])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Sat, 17 Nov 2018 08:02:31 +0000 (GMT)
Date:   Sat, 17 Nov 2018 00:02:28 -0800
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Roman Gushchin <guroan@gmail.com>
Cc:     Tejun Heo <tj@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
        cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-team@fb.com, Roman Gushchin <guro@fb.com>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 7/7] cgroup: document cgroup v2 freezer interface
References: <20181117003830.15344-1-guro@fb.com>
 <20181117003830.15344-8-guro@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181117003830.15344-8-guro@fb.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 18111708-0012-0000-0000-000002CBD7DA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18111708-0013-0000-0000-00002100F5F2
Message-Id: <20181117080227.GA22672@rapoport-lnx>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-11-16_12:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1811170077
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Fri, Nov 16, 2018 at 04:38:30PM -0800, Roman Gushchin wrote:
> Describe cgroup v2 freezer interface in the cgroup v2 admin guide.
> 
> Signed-off-by: Roman Gushchin <guro@fb.com>
> Cc: Tejun Heo <tj@kernel.org>
> Cc: linux-doc@vger.kernel.org
> Cc: kernel-team@fb.com
> ---
>  Documentation/admin-guide/cgroup-v2.rst | 26 +++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
> index 184193bcb262..a065c0bed88c 100644
> --- a/Documentation/admin-guide/cgroup-v2.rst
> +++ b/Documentation/admin-guide/cgroup-v2.rst
> @@ -862,6 +862,8 @@ All cgroup core files are prefixed with "cgroup."
>  	  populated
>  		1 if the cgroup or its descendants contains any live
>  		processes; otherwise, 0.
> +	  frozen
> +		1 if the cgroup is frozen; otherwise, 0.
> 
>    cgroup.max.descendants
>  	A read-write single value files.  The default is "max".
> @@ -895,6 +897,30 @@ All cgroup core files are prefixed with "cgroup."
>  		A dying cgroup can consume system resources not exceeding
>  		limits, which were active at the moment of cgroup deletion.
> 
> +  cgroup.freeze
> +	A read-write single value file which exists on non-root cgroups.
> +	Allowed values are "0" and "1". The default is "0".
> +
> +	Writing "1" to the file causes freezing of the cgroup and all
> +	descendant cgroups. This means that all belonging processes will
> +	be stopped and will not run until the cgroup will be explicitly
> +	unfrozen. Freezing of the cgroup may take some time; when the process

"when the process is complete" sounds somewhat ambiguous, it's unclear
whether freezing is complete or the process that's being frozen is
complete.

Maybe "when this action is completed"?

> +	is complete, the "frozen" value in the cgroup.events control file
> +	will be updated and the corresponding notification will be issued.

Can you please clarify how exactly cgroup.events would be updated?

> +	Cgroup can be frozen either by its own settings, either by settings

      ^ A cgroup ... and maybe there are more "a" and "the" that should be
fixed, it's hard for me to tell.

Also, I believe "either ..., or ..." sounds better than "either ...,
either ..."

> +	of any ancestor cgroups. If any of ancestor cgroups is frozen, the
> +	cgroup will remain frozen.
> +
> +	Processes in the frozen cgroup can be killed by a fatal signal.
> +	They also can enter and leave a frozen cgroup: either by an explicit
> +	move by a user, either if freezing of the cgroup races with fork().

ditto

> +	If a cgroup is moved to a frozen cgroup, it stops. If a process is

            ^ process?

> +	moving out of a frozen cgroup, it becomes running.

       ^ moved

> +	Frozen status of a cgroup doesn't affect any cgroup tree operations:
> +	it's possible to delete a frozen (and empty) cgroup, as well as
> +	create new sub-cgroups.

Maybe it's also worth adding that freezing a process has no effect on its
memory consumption, at least directly.

>  Controllers
>  ===========
> -- 
> 2.17.2
> 

-- 
Sincerely yours,
Mike.

