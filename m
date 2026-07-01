Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC43B343893;
	Wed,  1 Jul 2026 14:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915601; cv=none; b=o+TXk9qHOTJy5c8l+dlccqKkiiHVwuLg58dC13w3h4TZj2ItjRvblKiVqLWXY97qmy7WKRg67r78NYAAoYHrdkNy/pDwF9z423YqJ8QJE9a5z15sVztkLpRQQH14ipJmDOmcdNHxMQLI8jPfUKfffO207ok/ZYrZO9ogOqRLU9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915601; c=relaxed/simple;
	bh=5rFC2bGnQGUSGFNimQ+4RaFlMzTLjZ4J1Bzl65X8pPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iQKXLiZMkHPO4dXPgbR02uAToOuOnBZsuU9pi833quSOJVf1VdbMSyIZXFGqtx67Lfg85E5wRSysqRtDHR9pcspofc49pZ2cizi7SAYw0hFxT2gK5z2uznvSVTYEQXDovF3TKJzSiAUPzk62uqQHTAnOh1nmZiU9fV1P1SACJz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=IO8QzG2S; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="IO8QzG2S"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661AIUaW609537;
	Wed, 1 Jul 2026 14:19:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=yquTGvhrY9vqcWDUb
	XzwkxUcvROJDYnVjYHFb6fauu0=; b=IO8QzG2SpTrtdGPsODY3Xqy3I+B+SeOI9
	4VVaTzoEBH3vO2Ziq8he46crFd2KqS6arxAicphgLS63AVE/AkgxapGeVVRgaM4J
	KPKKQmbZiQaRLFlyzLuOY6kVHWNhKY/lDyIwEgkfODjg1zKDgIzBfU149VJzQ8kI
	dlRdf5Tq+L6iDUzhJo4JJxmhDzY9AKMnBuLdMt3GJdKMbej6HxuOJQPAdGx7598X
	3/CQIJ6QM0hbfzzfiYk7v2YZRXbWXr82oT/dpDDSURZWOuyjdjcXiH9FLxGpDhvD
	67vBWUJ2z0CqTbup3OLDtYmshxd3q+Lbj3IX5XT1N/EoKCMRawn6Q==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f26pe50a0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:19:38 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 661EJbDv010071;
	Wed, 1 Jul 2026 14:19:37 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f2uhyfd97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 14:19:37 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 661EJXrO29164078
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jul 2026 14:19:33 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F0B920049;
	Wed,  1 Jul 2026 14:19:33 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A539920040;
	Wed,  1 Jul 2026 14:19:20 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.67.14.28])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jul 2026 14:19:20 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        yury.norov@gmail.com, kprateek.nayak@amd.com, iii@linux.ibm.com,
        corbet@lwn.net
Cc: sshegde@linux.ibm.com, tglx@kernel.org, gregkh@linuxfoundation.org,
        pbonzini@redhat.com, seanjc@google.com, vschneid@redhat.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        maddy@linux.ibm.com, srikar@linux.ibm.com, hdanton@sina.com,
        chleroy@kernel.org, vineeth@bitbyteword.org, frederic@kernel.org,
        arighi@nvidia.com, pauld@redhat.com, christian.loehle@arm.com,
        tj@kernel.org, tommaso.cucinotta@gmail.com, maz@kernel.org,
        rafael@kernel.org, rdunlap@infradead.org, kernellwp@gmail.com,
        linux-doc@vger.kernel.org
Subject: [PATCH v6 10/23] sched/debug: Add migration stats due to non preferred CPUs
Date: Wed,  1 Jul 2026 19:46:41 +0530
Message-ID: <20260701141654.500125-11-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701141654.500125-1-sshegde@linux.ibm.com>
References: <20260701141654.500125-1-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: JzIWF3PXm9U8KQwVZvjwcbtfeQFPduse
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE1MCBTYWx0ZWRfX5BA3mgGd75mW
 bSx9XV0rXE+JA6GGpYwST54Ds7cVr7dzOEQcCqVwaINLOAvYd71Hi/ktvSeJYQgOCr5Z97nhYf5
 tfNN5PCzV1qF4hQP59oxoRMsH4NpifU=
X-Authority-Analysis: v=2.4 cv=edsNubEH c=1 sm=1 tr=0 ts=6a4521fb cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=reV6gSKdhkwKWsx3P_QA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE1MCBTYWx0ZWRfX6Vvo9BaXhmGB
 iYVm+GLpRTz2pyQyhG7kysM8UxzOcsvYWKiw39geR4DFRn7PTgR/viM+MPOjofCfI32AxK2IDn9
 t5dsgOiiZQCRlHqJbGWcb0Q7F/LDLYhXvRCKuCFP7IvFRKjeMOKgC6gJE7rXcS9wBWWK8i0Cd6W
 UJ0wK+kF8oSsPgQS5aPUL7b7haUGpOag10njBvfEpJNnpjk2rE7NNQ95CtkNdWSd2oXDD9r64Hz
 mfnSoIRBf/b9nJA6Rq3L23fRfYa6hudYYPLl2llMsWYwLVX4aJ7rXA63o4Gul/taBMHmoXQIynJ
 jVvK4OUfdatD6phGRakDe9iptnIHwopXz0ZxxjfrMGBbVM5Au47nkNy4cXJpop5KBBvntNcdgJh
 UmBBBFV4EeOTivGg8VbvD93tYcEDqrMRcqHZmmWb5IV+l1hkqhEHder2vLsNnwCo9EiQNKKAcL1
 GlXVG9Nod96aUTxqpdw==
X-Proofpoint-ORIG-GUID: Ou7pV8CBfav8729r7y0TCIzGYGtyDLuv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010150

Add a new stat,
- nr_migrations_cpu_non_preferred: number of migrations happened since
  a CPU was marked as non preferred due to high steal time.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 include/linux/sched.h | 1 +
 kernel/sched/core.c   | 4 +++-
 kernel/sched/debug.c  | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 968b18a7f470..37849d2f1dbd 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -554,6 +554,7 @@ struct sched_statistics {
 	u64				nr_failed_migrations_running;
 	u64				nr_failed_migrations_hot;
 	u64				nr_forced_migrations;
+	u64				nr_migrations_cpu_non_preferred;
 
 	u64				nr_wakeups;
 	u64				nr_wakeups_sync;
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 56905bac9525..0dffa3a722f2 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -11348,8 +11348,10 @@ static int sched_non_preferred_cpu_push_stop(void *arg)
 
 	context_unsafe_alias(rq);
 
-	if (task_rq(p) == rq && task_on_rq_queued(p))
+	if (task_rq(p) == rq && task_on_rq_queued(p)) {
 		rq = __migrate_task(rq, &rf, p, cpu);
+		schedstat_inc(p->stats.nr_migrations_cpu_non_preferred);
+	}
 
 	rq_unlock(rq, &rf);
 	raw_spin_unlock_irq(&p->pi_lock);
diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 72236db67983..5ebb2055e6d5 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1446,6 +1446,7 @@ void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
 		P_SCHEDSTAT(nr_failed_migrations_running);
 		P_SCHEDSTAT(nr_failed_migrations_hot);
 		P_SCHEDSTAT(nr_forced_migrations);
+		P_SCHEDSTAT(nr_migrations_cpu_non_preferred);
 		P_SCHEDSTAT(nr_wakeups);
 		P_SCHEDSTAT(nr_wakeups_sync);
 		P_SCHEDSTAT(nr_wakeups_migrate);
-- 
2.47.3

