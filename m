Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E68B07DD31
	for <lwn-linux-doc@archive.lwn.net>; Tue, 20 Mar 2018 05:45:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751069AbeCTFpn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 20 Mar 2018 01:45:43 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:45332 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750888AbeCTFpl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Mar 2018 01:45:41 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.22/8.16.0.22) with SMTP id w2K5b8MT174845;
        Tue, 20 Mar 2018 05:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : subject
 : from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=corp-2017-10-26;
 bh=DtT2n7zw9n5/X8bKFMFJOpFpVVn6DF1PclqC2hahDq0=;
 b=bTIhbxs68BFxSqmT1scEJ58OWsLBDXseDbsYmqPyrk2CHbk/JW6A1LA6l3J9XrzHBXVU
 MHju9qlOwmcwtQZw+NTzG2WE97lFFiVRkvwXW2iceomZv5DIkyWoUJ1zTyWsVAsX7tr8
 9f0XC7wv5iZRJhjaNMsZsA5L2BJhotrZha2SDVP8R0Evvb/kMKFHYVR/rSUHXeQbGEXG
 Rnv2rff32QeuKLkLl4SljecaP6FI29KOM5lL2eBKlLdiSkbuwLNGCQHGzAyKnkOZLGuD
 aUbfSJFQmznbZQ7FIocGzEZT4YWRijg3P5M+mgaK1v2OjZUEDl/KIOCfqdglxF322JLW qA== 
Received: from userv0022.oracle.com (userv0022.oracle.com [156.151.31.74])
        by userp2130.oracle.com with ESMTP id 2gtv9kr0hx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 20 Mar 2018 05:44:47 +0000
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userv0022.oracle.com (8.14.4/8.14.4) with ESMTP id w2K5ilcm017485
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 20 Mar 2018 05:44:47 GMT
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id w2K5ig3H006064;
        Tue, 20 Mar 2018 05:44:43 GMT
Received: from asu.omang.mine.nu (/80.203.111.41)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 19 Mar 2018 22:44:41 -0700
Message-ID: <1521524675.3354.302.camel@oracle.com>
Subject: Re: [PATCH v4 1/1] runchecks: Generalize make C={1,2} to support
 multiple checkers
From:   Knut Omang <knut.omang@oracle.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        =?ISO-8859-1?Q?H=E5kon?= Bugge <haakon.bugge@oracle.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Gilles Muller <Gilles.Muller@lip6.fr>,
        Tom Saeger <tom.saeger@oracle.com>,
        Michal Marek <michal.lkml@markovi.net>,
        =?ISO-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Julia Lawall <Julia.Lawall@lip6.fr>,
        John Haxby <john.haxby@oracle.com>,
        =?ISO-8859-1?Q?=C5smund_=D8stvold?= <asmund.ostvold@oracle.com>,
        Matthew Wilcox <willy@infradead.org>,
        "Levin, Alexander (Sasha Levin)" <alexander.levin@verizon.com>,
        cocci@systeme.lip6.fr, Andrew Morton <akpm@linux-foundation.org>
Date:   Tue, 20 Mar 2018 06:44:35 +0100
In-Reply-To: <1517815200.3118.383.camel@oracle.com>
References: <cover.a7e2d48abd08947a9bb46ef5d18a8f33066cc40d.1516356501.git-series.knut.omang@oracle.com>
         <c271ba8f99393585d69db71f40db3c01c44769e4.1516356501.git-series.knut.omang@oracle.com>
         <1517812899.3118.372.camel@oracle.com>
         <CAK7LNAS8QG947WpFn6bCnNVLj=x7jbAyLKVRS429wP+1jYbOUA@mail.gmail.com>
         <1517815200.3118.383.camel@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.24.6 (3.24.6-1.fc26) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=8837 signatures=668693
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1711220000 definitions=main-1803200006
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 2018-02-05 at 08:20 +0100, Knut Omang wrote:
> On Mon, 2018-02-05 at 16:03 +0900, Masahiro Yamada wrote:

Hi Masahiro,

I know these are busy times but any hope of getting forward on this?
Anything more I can do to ease the process?

Thanks for your time,
Knut

> > 2018-02-05 15:41 GMT+09:00 Knut Omang <knut.omang@oracle.com>:
> > > On Fri, 2018-01-19 at 11:14 +0100, Knut Omang wrote:
> > >> Add scripts/runchecks which has generic support for running
> > >> checker tools in a convenient and user friendly way that
> > >> the author hopes can contribute to rein in issues detected
> > >> by these tools in a manageable and convenient way.
> > >>
> > >> scripts/runchecks provides the following basic functionality:
> > >>
> > >> * Makes it possible to selectively suppress output from individual
> > >>   checks on a per file or per subsystem basis.
> > >> * Unifies output and suppression input from different tools
> > >>   by providing a single unified syntax and presentation for the
> > >>   underlying tools in the style of "scripts/checkpatch.pl --show-types".
> > >> * Allows selective run of one, or more (or all) configured tools
> > >>   for each file.
> > >>
> > >> In the Makefile system, the sparse specific setup has been replaced
> > >> by setup for runchecks.
> > >
> > > Hi all,
> > >
> > > - Anything more I can/need to do to bring this forward?
> > > - Any quiet concerns?
> > >
> > > I realize it is a subsystem crossing change,
> > 
> > Is it?  Only Kbuild this is related to.
> 
> Ok, I see!
> 
> > > and a lot going on elsewhere,
> > > nevertheless I believe this is a time saver in the slightly longer run,
> > > as it allows automation of checking, even without a "perfect"
> > > code base to begin with.
> > >
> > 
> > Sorry for the delay.
> 
> I understand, no problem - just was afraid it was about to get lost 
> in between subsystems,
> 
> > I have not been able to find time to dive into the detail yet.
> > (Actually, I tried to do that for v2 or v3, where Python code was so dirty,
> > then consumed my time to figure out what the code was trying to do)
> 
> Hopefully v4 is cleaner from a Python code style point of view at least,
> but let me know if you have any particular part of the code in mind wrt 
> readability. Also hopefully the docs should be of help.
> 
> > I find my concern here:
> > https://lkml.org/lkml/2018/1/5/497
> 
> I believe I have addressed the issues there in v4.
> 
> > Anyway, I will take a look again when I find some time.
> > You do not need to take care of the detail until I request to do so.
> 
> Ok, thanks a lot for your time and the quick response now!
> 
> Best regards,
> Knut
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
