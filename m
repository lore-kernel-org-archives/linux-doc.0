Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 78F157D57F
	for <lwn-linux-doc@archive.lwn.net>; Sun, 23 Sep 2018 00:36:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbeIWGb2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 23 Sep 2018 02:31:28 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:47460 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725908AbeIWGb1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 23 Sep 2018 02:31:27 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w8N0Zqkj002288
        for <linux-doc@vger.kernel.org>; Sat, 22 Sep 2018 20:35:58 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2mnm0sk3ut-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Sat, 22 Sep 2018 20:35:57 -0400
Received: from localhost
        by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Sat, 22 Sep 2018 20:35:57 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
        by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Sat, 22 Sep 2018 20:35:54 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com [9.57.199.108])
        by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id w8N0ZrGo21299276
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sun, 23 Sep 2018 00:35:53 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9C873B205F;
        Sat, 22 Sep 2018 20:34:17 -0400 (EDT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 7BE25B2066;
        Sat, 22 Sep 2018 20:34:17 -0400 (EDT)
Received: from paulmck-ThinkPad-W541 (unknown [9.85.180.236])
        by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
        Sat, 22 Sep 2018 20:34:17 -0400 (EDT)
Received: by paulmck-ThinkPad-W541 (Postfix, from userid 1000)
        id 9E0CC16C197D; Sat, 22 Sep 2018 17:35:52 -0700 (PDT)
Date:   Sat, 22 Sep 2018 17:35:52 -0700
From:   "Paul E. McKenney" <paulmck@linux.ibm.com>
To:     "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc:     linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH RFC 1/3] rcu: tree: Remove unused externs
Reply-To: paulmck@linux.ibm.com
References: <20180922234127.94970-1-joel@joelfernandes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180922234127.94970-1-joel@joelfernandes.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
x-cbid: 18092300-0060-0000-0000-000002B498EE
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009754; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01092245; UDB=6.00564421; IPR=6.00872269;
 MB=3.00023459; MTD=3.00000008; XFM=3.00000015; UTC=2018-09-23 00:35:56
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18092300-0061-0000-0000-0000469A81B0
Message-Id: <20180923003552.GI4222@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-09-22_16:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1809230005
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Sep 22, 2018 at 07:41:25PM -0400, Joel Fernandes (Google) wrote:
> These aren't used anymore. Remove them.
> 
> Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>

Good catch, queued and pushed with subject/commit-log edits,
thank you!

							Thanx, Paul

> ---
>  kernel/rcu/tree.h | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/kernel/rcu/tree.h b/kernel/rcu/tree.h
> index 703e19ff532d..57a937ac51c2 100644
> --- a/kernel/rcu/tree.h
> +++ b/kernel/rcu/tree.h
> @@ -398,17 +398,6 @@ static const char *tp_rcu_varname __used __tracepoint_string = rcu_name;
>  #define RCU_NAME rcu_name
>  #endif /* #else #ifdef CONFIG_TRACING */
>  
> -/*
> - * RCU implementation internal declarations:
> - */
> -extern struct rcu_state rcu_sched_state;
> -
> -extern struct rcu_state rcu_bh_state;
> -
> -#ifdef CONFIG_PREEMPT_RCU
> -extern struct rcu_state rcu_preempt_state;
> -#endif /* #ifdef CONFIG_PREEMPT_RCU */
> -
>  int rcu_dynticks_snap(struct rcu_data *rdp);
>  
>  #ifdef CONFIG_RCU_BOOST
> -- 
> 2.19.0.444.g18242da7ef-goog
> 

