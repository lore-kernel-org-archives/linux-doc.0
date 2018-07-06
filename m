Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BEB847D048
	for <lwn-linux-doc@archive.lwn.net>; Fri,  6 Jul 2018 14:41:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932925AbeGFOlP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 6 Jul 2018 10:41:15 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:46752 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S932714AbeGFOlN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 6 Jul 2018 10:41:13 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w66Ed5f6111042
        for <linux-doc@vger.kernel.org>; Fri, 6 Jul 2018 10:41:12 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2k28q7mr3k-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Fri, 06 Jul 2018 10:41:12 -0400
Received: from localhost
        by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Fri, 6 Jul 2018 10:41:12 -0400
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
        by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Fri, 6 Jul 2018 10:41:06 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com [9.57.199.108])
        by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w66Ef62G62193716
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 6 Jul 2018 14:41:06 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 731B6B2065;
        Fri,  6 Jul 2018 10:40:45 -0400 (EDT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 5C624B2067;
        Fri,  6 Jul 2018 10:40:45 -0400 (EDT)
Received: from paulmck-ThinkPad-W541 (unknown [9.70.82.159])
        by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
        Fri,  6 Jul 2018 10:40:45 -0400 (EDT)
Received: by paulmck-ThinkPad-W541 (Postfix, from userid 1000)
        id 85C9B16CA5DB; Fri,  6 Jul 2018 07:43:21 -0700 (PDT)
Date:   Fri, 6 Jul 2018 07:43:21 -0700
From:   "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Andrea Parri <andrea.parri@amarulasolutions.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Ingo Molnar <mingo@redhat.com>,
        Will Deacon <will.deacon@arm.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Boqun Feng <boqun.feng@gmail.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Jade Alglave <j.alglave@ucl.ac.uk>,
        Luc Maranget <luc.maranget@inria.fr>,
        Akira Yokosawa <akiyks@gmail.com>,
        Daniel Lustig <dlustig@nvidia.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 0/3] sched/locking/doc: Miscellaneous fixes
Reply-To: paulmck@linux.vnet.ibm.com
References: <1530182480-13205-1-git-send-email-andrea.parri@amarulasolutions.com>
 <20180705222812.GA4582@andrea>
 <20180706103611.GL2494@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180706103611.GL2494@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 18070614-0064-0000-0000-00000326351C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009319; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01057419; UDB=6.00542519; IPR=6.00835339;
 MB=3.00022027; MTD=3.00000008; XFM=3.00000015; UTC=2018-07-06 14:41:10
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18070614-0065-0000-0000-000039D79A4B
Message-Id: <20180706144321.GE3593@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-07-06_04:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1806210000 definitions=main-1807060161
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jul 06, 2018 at 12:36:11PM +0200, Peter Zijlstra wrote:
> On Fri, Jul 06, 2018 at 12:28:12AM +0200, Andrea Parri wrote:
> > What is the plan for this series?
> > 
> > We are currently discussing locking changes that might affect 2/3, but
> > I'd still consider this patch and the overall series as an improvement
> > over the current status (1/3 is a fix to the code) and I'd really like
> > future changes to be based on this series...
> > 
> > I expected this series to go via "-rcu -> tip -> ..."; 2/3 had Peter's
> > Ack, but 1/3 and 3/3 are missing any comments (or tags): please let me
> > know if any action on the series is required from me (the series still
> > applies on the latest "dev" branch of -rcu).
> 
> You can add my ack:
> 
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> 
> to the others as well, they look like a definite improvement. I'm fine
> with these going through Paul's tree, Ingo?

I have pulled them in and will submit them to the upcoming merge window,
thank you all!  If someone else would prefer to take them, just let
me know.

							Thanx, Paul

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
