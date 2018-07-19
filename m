Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8988E7D085
	for <lwn-linux-doc@archive.lwn.net>; Thu, 19 Jul 2018 19:04:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732728AbeGSTsf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 19 Jul 2018 15:48:35 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:47806 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727401AbeGSTsf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Jul 2018 15:48:35 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.22/8.16.0.22) with SMTP id w6JIrtdY093810;
        Thu, 19 Jul 2018 19:04:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=3Jko5YfTGv6QolgRq6Fq5j1iVi6SlfB9doAfV+2KLFI=;
 b=wVQHRZEY9Ajfn1WB4JiQSy21xUx59bjifUJxSre9pEiZGuBMYQE6YwXVvwbOlq6nYLrs
 Z9tXW1iYY+Ud73Ua141wfNPDAJuvrvmkF1qXjd4aCivjy2faeXZ1wEeIeTzFvKDTF13w
 U1fS0wkpe7wiCulXZ0yrFrdcJzofHvuIHZ069XbX5npGe8hv9JxQbLutHXvId9glBu8L
 2rbGbhtrzDdvg7ad7pkg0yEYO0SbFVlNHguIoRCnuRdnUzKzKU54hCy+y91dtRchceRP
 /QDSH4EzZVkyVeodT23igdJcE5Z0hNBzmEJVEUp5ROL4xfP/bghfG4lk+JxfQPM1SiiB IQ== 
Received: from aserv0022.oracle.com (aserv0022.oracle.com [141.146.126.234])
        by aserp2130.oracle.com with ESMTP id 2k7a3tbwvk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 19 Jul 2018 19:04:03 +0000
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserv0022.oracle.com (8.14.4/8.14.4) with ESMTP id w6JJ43Z7008005
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 19 Jul 2018 19:04:03 GMT
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id w6JJ42hR031223;
        Thu, 19 Jul 2018 19:04:02 GMT
Received: from localhost (/67.169.218.210)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 19 Jul 2018 12:04:01 -0700
Date:   Thu, 19 Jul 2018 12:04:00 -0700
From:   "Darrick J. Wong" <darrick.wong@oracle.com>
To:     "Theodore Y. Ts'o" <tytso@mit.edu>
Cc:     linux-doc@vger.kernel.org, linux-ext4@vger.kernel.org
Subject: Re: Sphinx version dependencies?
Message-ID: <20180719190400.GB4800@magnolia>
References: <20180719181556.GA21435@thunk.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180719181556.GA21435@thunk.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=8959 signatures=668706
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1806210000 definitions=main-1807190198
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 19, 2018 at 02:15:56PM -0400, Theodore Y. Ts'o wrote:
> Darrick has sent in patches to convert the ext4 documentation to use
> rst and to be built as part of the full kernel documentation thanks.
> In addition to that, he's imported the on-disk documentation from the
> ext4 wiki into the kernel sources, so hopefully we can keep it more up
> to date.
> 
> When I was experimenting with this, I had to actually build the kernel
> docs using Sphinx for the first time.  I'm using Debian testing, so at
> first I blindly followed the instructions by
> ./scripts/sphinx-pre-install:
> 
> Detected OS: Debian GNU/Linux unstable (sid).
> 	/usr/local/bin/virtualenv sphinx_1.4
> 	. sphinx_1.4/bin/activate
> 	pip install -r Documentation/sphinx/requirements.txt
> 
> But when I did that, Sphinx had heartburn over the ext4.rst file.
> 
>     ./include/linux/spi/spi.h:373: ERROR: Unexpected indentation.
>     /usr/projects/linux/ext4/Documentation/filesystems/ext4/ext4.rst:139: ERROR: Malformed table.
>     Column span alignment problem in table line 5.

Hmmm, apparently it's choking on the table heading borders not matching
the text:

====== ===========
Foo    Bar
====== ===========        <-- need to extend to EOL
Blah   Blah blah blah blah
====== ===========

Though weirdly while I /can/ get this error to reproduce with the
virtualenv 1.4.9 release, I can't get it to reproduce with the 1.3.6 or
1.6.7 ubuntu packages.  Maybe it's a python3 thing, maybe not?  Seems
pretty fragile to me.

Anyway, I'll fix ext4.rst and resubmit that part to get this moving.

--D

>     ...
> 
> After consulting with Darrick, it appears the problem is that Sphinx8
> 1.4.9 was the problem.  This is the version that
> Documentation/sphinx/requirements.txt calls for.  He did his rst
> conversion work using Ubuntu 18.04's Sphinx 1.6.7.
> 
> As it turns out Debian testing/unstable already has Sphinx 1.7.5 in
> its repository, so if I simply install Sphinx 1.7.5, it works fine.
> That's what I've done for now.
> 
> So that leaves me with some questions:
> 
> * Is there a reason why scripts/sphinx-pre-install suggested using a
>   Python virtual environment and installing Sphinx 1.4.9 instead of
>   using the distro's pre-packaged Sphinx for Debian unstable/testing?
> 
> * Why does Documentation/sphinx/requirements.txt asking for such an
>   old version of Sphinx?
>  
> * Is it a requirement that *.rst files that are checked into the
>   kernel repo have to work with Sphinx 1.4.9?  Or is it sufficient
>   that it works with Sphinx 1.6.7 and 1.7.5 (which are the prepackaged
>   Debian and Ubuntu versions).  And it looks like Fedora 28 has Sphinx
>   1.7.2 if I'm not mistaken.   How many versions of Sphinx are various
>   automated build/test systems using?
> 
> Thanks,
> 
> 						- Ted
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
