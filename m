Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BFB587E22E
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 May 2018 14:22:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752719AbeEGOWF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 May 2018 10:22:05 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:57040 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752498AbeEGOWC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 May 2018 10:22:02 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w47EK73R067640
        for <linux-doc@vger.kernel.org>; Mon, 7 May 2018 10:22:02 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2htr7mrvsv-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Mon, 07 May 2018 10:22:02 -0400
Received: from localhost
        by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Mon, 7 May 2018 10:22:00 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
        by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        Mon, 7 May 2018 10:21:57 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com [9.57.199.108])
        by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w47ELuR652035656;
        Mon, 7 May 2018 14:21:56 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3AEA8B2046;
        Mon,  7 May 2018 11:23:56 -0400 (EDT)
Received: from paulmck-ThinkPad-W541 (unknown [9.70.82.108])
        by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP id 02EC3B204D;
        Mon,  7 May 2018 11:23:56 -0400 (EDT)
Received: by paulmck-ThinkPad-W541 (Postfix, from userid 1000)
        id 46C6016C0EFD; Mon,  7 May 2018 07:23:22 -0700 (PDT)
Date:   Mon, 7 May 2018 07:23:22 -0700
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a87d742e81124ddfeaa5b83daf10c91758c1b025.1525684985.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 18050714-0040-0000-0000-00000427CAEE
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008986; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000258; SDB=6.01028842; UDB=6.00525668; IPR=6.00807975;
 MB=3.00020971; MTD=3.00000008; XFM=3.00000015; UTC=2018-05-07 14:22:00
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18050714-0041-0000-0000-0000082DD707
Message-Id: <20180507142322.GW26088@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-05-07_06:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805070147
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 07, 2018 at 06:35:46AM -0300, Mauro Carvalho Chehab wrote:
> The code example at rcupdate.h currently produce lots of warnings:
> 
> 	./include/linux/rcupdate.h:572: WARNING: Unexpected indentation.
> 	./include/linux/rcupdate.h:576: WARNING: Unexpected indentation.
> 	./include/linux/rcupdate.h:580: WARNING: Block quote ends without a blank line; unexpected unindent.
> 	./include/linux/rcupdate.h:582: WARNING: Block quote ends without a blank line; unexpected unindent.
> 	./include/linux/rcupdate.h:582: WARNING: Inline literal start-string without end-string.
> 
> Change it to a code-block.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Acked-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

If you don't tell me otherwise, I will assume that you are pushing this.
If you would rather that I take it, please let me know!

							Thanx, Paul

> ---
>  include/linux/rcupdate.h | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/rcupdate.h b/include/linux/rcupdate.h
> index 36360d07f25b..c890d10978fa 100644
> --- a/include/linux/rcupdate.h
> +++ b/include/linux/rcupdate.h
> @@ -568,8 +568,8 @@ static inline void rcu_preempt_sleep_check(void) { }
>   * This is simply an identity function, but it documents where a pointer
>   * is handed off from RCU to some other synchronization mechanism, for
>   * example, reference counting or locking.  In C11, it would map to
> - * kill_dependency().  It could be used as follows:
> - * ``
> + * kill_dependency().  It could be used as follows::
> + *
>   *	rcu_read_lock();
>   *	p = rcu_dereference(gp);
>   *	long_lived = is_long_lived(p);
> @@ -580,7 +580,6 @@ static inline void rcu_preempt_sleep_check(void) { }
>   *			p = rcu_pointer_handoff(p);
>   *	}
>   *	rcu_read_unlock();
> - *``
>   */
>  #define rcu_pointer_handoff(p) (p)
> 
> -- 
> 2.17.0
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
