Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 915B37D043
	for <lwn-linux-doc@archive.lwn.net>; Mon, 14 May 2018 19:38:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751962AbeENTim (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 14 May 2018 15:38:42 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:33892 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751855AbeENTim (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 May 2018 15:38:42 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w4EJSikT126409
        for <linux-doc@vger.kernel.org>; Mon, 14 May 2018 15:38:41 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2hyfnsjnrc-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Mon, 14 May 2018 15:38:41 -0400
Received: from localhost
        by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Mon, 14 May 2018 15:38:40 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
        by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Mon, 14 May 2018 15:38:36 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com [9.57.199.108])
        by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w4EJcapQ56623140;
        Mon, 14 May 2018 19:38:36 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 00E5CB2058;
        Mon, 14 May 2018 16:40:34 -0400 (EDT)
Received: from paulmck-ThinkPad-W541 (unknown [9.70.82.108])
        by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP id BD64DB2046;
        Mon, 14 May 2018 16:40:33 -0400 (EDT)
Received: by paulmck-ThinkPad-W541 (Postfix, from userid 1000)
        id 507FA16C36B0; Mon, 14 May 2018 12:40:07 -0700 (PDT)
Date:   Mon, 14 May 2018 12:40:07 -0700
From:   "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>
Subject: Re: [PATCH 10/18] rcu: rcupdate.h: get rid of Sphinx warnings at
 rcu_pointer_handoff()
Reply-To: paulmck@linux.vnet.ibm.com
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
 <a87d742e81124ddfeaa5b83daf10c91758c1b025.1525684985.git.mchehab+samsung@kernel.org>
 <20180507142322.GW26088@linux.vnet.ibm.com>
 <20180509085533.54951174@vento.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180509085533.54951174@vento.lan>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 18051419-0056-0000-0000-0000044E2F9C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009025; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000260; SDB=6.01032305; UDB=6.00527737; IPR=6.00811437;
 MB=3.00021111; MTD=3.00000008; XFM=3.00000015; UTC=2018-05-14 19:38:39
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18051419-0057-0000-0000-000008924335
Message-Id: <20180514194007.GH26088@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-05-14_04:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805140196
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 09, 2018 at 08:55:33AM -0300, Mauro Carvalho Chehab wrote:
> Em Mon, 7 May 2018 07:23:22 -0700
> "Paul E. McKenney" <paulmck@linux.vnet.ibm.com> escreveu:
> 
> > On Mon, May 07, 2018 at 06:35:46AM -0300, Mauro Carvalho Chehab wrote:
> > > The code example at rcupdate.h currently produce lots of warnings:
> > > 
> > > 	./include/linux/rcupdate.h:572: WARNING: Unexpected indentation.
> > > 	./include/linux/rcupdate.h:576: WARNING: Unexpected indentation.
> > > 	./include/linux/rcupdate.h:580: WARNING: Block quote ends without a blank line; unexpected unindent.
> > > 	./include/linux/rcupdate.h:582: WARNING: Block quote ends without a blank line; unexpected unindent.
> > > 	./include/linux/rcupdate.h:582: WARNING: Inline literal start-string without end-string.
> > > 
> > > Change it to a code-block.
> > > 
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>  
> > 
> > Acked-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> > 
> > If you don't tell me otherwise, I will assume that you are pushing this.
> > If you would rather that I take it, please let me know!
> 
> Hi Paul,
> 
> Feel free to merge it via your tree. It seems that Jon prefers to have
> code changes merged via the usual maintainers.

I have queued it for v4.19, thank you!

							Thanx, Paul

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
